---
name: research-pipeline
description: "Research Discovery Pipeline: Orchestrates research-architect → hypothesis-tournament → scientific-peer-reviewer to explore a research topic, rank focus areas by importance, and get peer review feedback."
allowedTools:
  - Task
  - Read
  - Write
  - Glob
  - Grep
  - WebSearch
  - WebFetch
disallowedTools:
  - Bash
  - Edit
  - NotebookEdit
permissionMode: auto
hooks:
  PostToolUse:
    - matcher: "Task"
      hooks:
        - type: command
          command: ".claude/skills/research-pipeline/hooks/log-stage-completion.sh"
---

# Research Discovery Pipeline

This skill orchestrates a three-stage research exploration pipeline with controlled permissions and validation at each stage.

## Pipeline Architecture

```
┌─────────────────────┐     ┌──────────────────────┐     ┌─────────────────────────┐
│  research-architect │────▶│ hypothesis-tournament │═══▶│ scientific-peer-reviewer │
│  (opus, plan mode)  │     │   (haiku, isolated)  │     │   (sonnet, refinement)   │
│  WebSearch enabled  │     │   No external access  │     │   WebSearch + Write      │
└─────────────────────┘     └──────────────────────┘     └─────────────────────────┘
         │                            │                     ║ (offline handoff)
         ▼                            ▼                     ▼
   research-summary.md         ranked-focus-areas.md ═══▶ peer-review.md
                                (input to reviewer)        (refined ranking +
                                                            recommendations)
```

**Key:** `═══▶` indicates offline/sequential handoff. Ranking must complete before review begins.

## Stage Configurations

### Stage 1: Research Exploration

**Agent:** `research-architect`
**Model:** `opus` (deep analysis)
**Mode:** `plan` (exploration, no modifications)

**Allowed Tools:**
- `WebSearch`, `WebFetch` - literature exploration
- `Read`, `Glob`, `Grep` - codebase/document analysis
- `Task` - spawn sub-agents if needed

**Disallowed Tools:**
- `Bash`, `Edit`, `Write` - no system modifications

**Task prompt:**
```
Analyze the following research area and produce:

1. **Executive Summary**: 2-3 paragraph overview of the research landscape
2. **Focus Areas**: 3-7 distinct focus areas, each with:
   - Title and scope definition
   - Key research questions (2-4)
   - Current state of knowledge
   - Identified gaps, limitations, or contradictions
   - Relevant papers/authors discovered
3. **Initial Ranking**: Preliminary priority (High/Medium/Low) for each focus area based on:
   - Research impact potential
   - Feasibility
   - Novelty

Research topic: {user's input}

Use WebSearch to find recent publications (2023-2026) and seminal works.
Output in structured markdown format for downstream processing.
```

**Validation:** Check that 3-7 focus areas are generated with required fields.

---

### Stage 2: Importance Ranking

**Agent:** `hypothesis-tournament`
**Model:** `haiku` (fast, many comparisons)
**Mode:** `bypassPermissions` (automated processing)

**Allowed Tools:**
- `Read` - access previous stage output
- `Write` - store rankings

**Disallowed Tools:**
- `WebSearch`, `WebFetch`, `Bash`, `Task` - isolated evaluation

**Task prompt:**
```
Run an Elo-based tournament to rank focus areas by research importance.

**Ranking Criteria** (pairwise comparisons):
| Criterion | Weight | Description |
|-----------|--------|-------------|
| Gap Severity | 0.30 | How critical is the missing knowledge? |
| Improvement Potential | 0.30 | How much could solving this advance the field? |
| Feasibility | 0.20 | How achievable is meaningful progress? |
| Novelty | 0.20 | How unexplored is this direction? |

**Process:**
1. Extract all focus areas from input
2. Initialize Elo at 1500 for each
3. Run all n(n-1)/2 pairwise comparisons
4. Apply K-factor: 32 (decisive), 24 (moderate), 16 (marginal)
5. Produce final rankings

**Input:**
{contents of research-summary.md}

**Required Output Format:**
- Tournament summary table with Elo scores
- Detailed comparison log
- Tier classification (Pursue/Refine/Defer/Eliminate)
```

**Validation:** Verify Elo calculations and all comparisons completed.

---

### Stage 3: Peer Review & Refinement

**Agent:** `scientific-peer-reviewer`
**Model:** `sonnet` (balanced depth/speed)
**Mode:** `plan` (advisory, produces recommendations)

**Input Handoff:** Receives `ranked-focus-areas.md` as offline input after Stage 2 completes. The ranking is final from the tournament; reviewer works within this scope.

**Allowed Tools:**
- `Read` - access all previous outputs
- `Write` - produce refined ranking and recommendations
- `WebSearch`, `WebFetch` - validate claims, find supporting evidence, discover recent developments

**Disallowed Tools:**
- `Edit`, `Bash`, `Task` - no system modifications or spawning

**Scope Constraint:** The reviewer MUST stay within the focus areas identified in the ranking. Do NOT introduce entirely new research directions. Refinements, re-ordering, and recommendations must relate to the existing focus areas.

**Task prompt:**
```
Review and refine the ranked research focus areas. You receive the tournament ranking as offline input.

**Your Role:**
You are a scientific peer reviewer with web access. Validate the ranking against current literature and propose improvements while staying STRICTLY within the scope of the provided focus areas.

**Review & Refinement Process:**

1. □ **Validate Ranking** - Use WebSearch to verify:
   - Are the Elo scores justified by current research landscape?
   - Has recent work (2024-2026) shifted priorities?
   - Are there overlooked papers that would change rankings?

2. □ **Assess Each Focus Area** against 7 dimensions:
   - Methodological soundness
   - Logical consistency
   - Alignment with established knowledge
   - Assumption validity
   - Constraint recognition
   - Explanatory power
   - Novelty assessment

3. □ **Propose Ranking Adjustments** (if warranted):
   - Suggest re-ordering with justification from literature
   - Identify focus areas that should merge or split
   - Argue for promoting/demoting specific areas based on evidence

4. □ **Add Recommendations** for each tier:
   - **Pursue tier**: Concrete next steps, key papers to read, potential collaborators
   - **Refine tier**: What's missing, what experiments would clarify value
   - **Defer tier**: Conditions under which to revisit
   - **Eliminate tier**: Why to avoid, alternative framings

5. □ **Produce Refined Output:**
   - Updated ranking table with reviewer adjustments
   - Justification for any changes (with citations)
   - Risk assessment for top 3 areas

**Severity Classification for Issues:**
- Critical: Would invalidate the ranking approach
- Major: Requires revision before proceeding
- Minor: Note for consideration

**Inputs:**
- Ranked Focus Areas: {ranked-focus-areas.md}
- Original Summary: {research-summary.md}

**Output:** Write refined ranking and recommendations to `peer-review.md`

⚠️ CONSTRAINT: Do NOT introduce new focus areas outside the original scope. All refinements must relate to the existing ranking.
```

**Validation:** Ensure all 7 dimensions evaluated, ranking adjustments justified with evidence, recommendations provided per tier.

---

## Pipeline Hooks

### Pre-Stage Validation
```bash
# .claude/skills/research-pipeline/hooks/validate-stage-input.sh
#!/bin/bash
STAGE=$1
INPUT_FILE=$2

case $STAGE in
  "ranking")
    # Verify research-summary.md has focus areas
    grep -q "## Focus Area" "$INPUT_FILE" || exit 1
    ;;
  "review")
    # Verify rankings exist
    grep -q "Elo Score" "$INPUT_FILE" || exit 1
    ;;
esac
```

### Post-Stage Logging
```bash
# .claude/skills/research-pipeline/hooks/log-stage-completion.sh
#!/bin/bash
STAGE=$1
TIMESTAMP=$(date -Iseconds)
echo "$TIMESTAMP | Stage: $STAGE | Status: Complete" >> .claude/skills/research-pipeline/memory/pipeline.log
```

---

## Execution Modes

### Standard Mode (default)
Sequential execution with human checkpoints between stages.

### Fast Mode (`--fast`)
Skip checkpoints, run all stages automatically.
```
/research-pipeline --fast "haptic perception"
```

### Interactive Mode (`--interactive`)
Pause after each stage for user refinement.
```
/research-pipeline --interactive "multi-modal fusion"
```

### Parallel Exploration (`--parallel`)
Run multiple research-architect instances on sub-topics simultaneously.
```
/research-pipeline --parallel "tactile sensing" --subtopics 3
```

---

## Output Artifacts

| File | Location | Contents |
|------|----------|----------|
| `research-summary.md` | scratchpad | Stage 1 output |
| `ranked-focus-areas.md` | scratchpad | Stage 2 output |
| `peer-review.md` | scratchpad | Stage 3 output |
| `final-report.md` | `research-output/` | Compiled results |
| `pipeline.log` | `memory/` | Execution trace |

---

## Final Report Template

```markdown
# Research Pipeline: {topic}
Generated: {date}

## Executive Summary
{from Stage 1, refined by Stage 3 feedback}

## Ranked Focus Areas

| Rank | Focus Area | Elo | Tier | Reviewer Verdict |
|------|------------|-----|------|------------------|
| 1 | ... | 1687 | Pursue | Strong Foundation |
| 2 | ... | 1623 | Pursue | Promising |

## Critical Findings
{Stage 3 critical/major issues}

## Recommended Research Agenda
1. **Immediate** (0-3 months): {top tier actions}
2. **Short-term** (3-6 months): {refinement areas}
3. **Exploratory** (6+ months): {high-risk/high-reward}

## Methodology Notes
{Caveats, limitations, areas needing more information}

---
Pipeline: research-architect → hypothesis-tournament → scientific-peer-reviewer
Models: opus → haiku → sonnet
```

---

## Usage

```bash
# Basic usage
/research-pipeline "haptic perception for deformable object manipulation"

# With options
/research-pipeline --fast --output ./my-research/ "sim-to-real transfer"

# Interactive refinement
/research-pipeline --interactive "attention mechanisms in robotics"
```
