# Hypothesis Tournament Memory

## Key Patterns from Tournament 1 (Tactile Robotics Focus Areas)

### Effective Discrimination Criteria
- **Gap Severity (0.30) + Improvement Potential (0.30)** are the primary decision drivers
- These two criteria account for 60% of verdict weight; they dominate outcome
- Feasibility (0.20) creates interesting friction—high-feasibility items can't overcome low importance
- Novelty (0.20) is tiebreaker; rarely decisive alone unless gap severity is equal

### Domain-Specific Insights (Robotics/Perception)
- **Foundation models/representations** almost always beat domain-specific applications (Foundation > Application)
- **Safety/anomaly detection** ranks consistently high across all pairings (~1530-1540 Elo range)
- **Terrain classification** exemplifies "solved problem" penalty—no amount of feasibility recovers when improvement ceiling is clear
- **Frontier/generative methods** (diffusion) beat incremental architectural choices despite lower feasibility
- **Architecture selections** (transformers, attention) rank below problem-solving directions; risk is incremental contribution

### Close Call Patterns
- H7 vs H6 (diffusion vs. anomaly): Safety-critical usually wins, but frontier novelty can edge ahead if improvement potential is sufficiently higher
- H3 vs H6 (capability vs. safety): These almost always tie—capability wins if deployment timeline is distant, safety if near
- Strategy vs. tactic: Strategy (foundations, frameworks) consistently beats tactics (architectural tweaks) unless tactic unlocks entirely new capability class

### Evaluation Mistakes to Avoid
1. **Conflating "solved" with "unimportant"**: Terrain is solved (HAPTR) so it scores ~1400. Correct approach.
2. **Overweighting feasibility for immature fields**: H1 (foundation models) is hard but essential; H4 (transformers) is easy but incremental. Don't swap based on feasibility.
3. **Novelty creep**: Novelty should only break ties, not override gap severity. H7 isn't #1 despite high novelty because H1 has larger gap.
4. **Single-application focus**: H4 suffers because it's legged-specific; H3 wins because vision-tactile applies across manipulation domains.

### Elo Thresholds (This Domain)
- **1550+**: Foundational infrastructure or frontier breakthroughs (rare)
- **1520-1550**: High-priority research with clear gaps; essential for capability
- **1470-1520**: Good problems; likely needed but not blocking
- **1420-1470**: Incremental or narrow-scope work; lower priority
- **<1420**: Solved problems or commoditized approaches; defer or eliminate

### Red Flags for Low Rankings
- "Build on prior work" (incremental delta from thesis) → risk 1400-1450 range
- "Specific to one robot/domain" → automatic penalty vs. cross-domain directions
- "Proven approach, continue optimization" → feasibility is high but improvement ceiling visible
- "Architectural innovation" when algorithms are more novel → loses to algorithm-level contributions

### Green Flags for High Rankings
- "Addresses foundational gap applicable across multiple downstream tasks" → 1550+
- "Frontier research enabling new capability class" → 1530-1550 (even if feasibility moderate)
- "Non-negotiable for safety/deployment" → holds 1500+ despite narrow scope
- "Generalizes across sensors, platforms, domains" → consistently outperforms single-domain variants

## Tournament 2 Results (Foundation Models vs Diffusion Models)

### Key Decision Points
- H1 (Foundation Models) dominated 7-0, reaching 1580 Elo—highest score possible in tournament
- H7 (Diffusion Models) achieved 6-1 record with 1552 Elo—strong frontier contender
- Gap severity drove H1 rankings; improvement potential drove H7
- Feasibility penalty on H7 (-3.5-4.0 per comparison) never overcame novelty advantage (gap of +3.0-3.5)

### Pattern Validation
- "Foundation > Application" held in H1 vs H3 (moderate win, not decisive)
- "Frontier > Incremental" held in H7 vs H4/H6 (decisive wins despite lower feasibility)
- "Cross-domain > Single-domain" held in H3 vs H6 (decisive)
- "Unsolved > Solved" held in H5/H1/H7 vs H6 (all won decisively)

### What Changed from Tournament 1
- Diffusion models (H7) ranked higher than expected—frontier novelty + high improvement potential overcame feasibility concerns
- Anomaly detection (H5) ranked lower than expected—essential but not gap-critical, depends on timelines
- Terrain classification (H6) ranked exactly as expected—solved domain, low novelty penalty justified

### Ranking Stability & Sensitivity
- Top 3 (H1, H7, H3) robust across ±10% weight variations
- H5 vs H2 could flip with feasibility weighting (deployment-first scenarios)
- H4 and H6 remain consistently low—strong consensus across all weight configurations

## Pre-Tournament Checklist (Validated)
- [x] Confirm evaluation criteria weights (0.30/0.30/0.20/0.20 validated for research prioritization)
- [x] Identify "solved problem" baselines early—terrain at 1408, transforms all comparisons
- [x] Distinguish between architectural innovation and algorithmic innovation—H4 vs H1/H7 clear separation
- [x] Map out domain-specificity—H6 penalty significant, H3 advantage substantial
- [x] Feasibility assessment—mature methods (H2) still lower than frontier (H7); technique < direction

## Comparison Shortcuts (Applied Successfully)
1. If entry is "solved baseline," assign ~1420-1450 and use as anchor → H6 at 1408 confirmed
2. If entry is "architectural variant of standard method," assign ~1450-1480 → H4 at 1436 confirmed
3. Frontier novelty beats incremental optimization—90%+ prediction rate → H7 vs H4/H5 confirmed
4. Safety/robustness beats pure capability—70%+ prediction rate → H5 vs H3 marginal (context-dependent)

## Common Verdict Patterns (Tournament 2)
- Foundation > Application: H1 > H3 (confirmed, moderate vs. decisive depends on gap criticality)
- Safety > Capability: H5 > H3 (contradicted—capability edged out safety; gap severity drove verdict)
- Frontier > Incremental: H7 > H4/H6 (confirmed 100% in 3 comparisons)
- Cross-domain > Single-domain: H3 > H6, H2 > H6 (confirmed 100%)
- Unsolved problem > Solved problem: H1/H3/H5/H7 > H6 (confirmed 100% in 6 comparisons)

## Domain-Agnostic Principles (Validated)

### Weighting Tradeoffs
- **Default (Academic):** Gap 0.30, Improvement 0.30, Feasibility 0.20, Novelty 0.20 → H1, H7, H3 ranked #1, #2, #3
- **Deployment-focused:** Gap 0.30, Improvement 0.25, Feasibility 0.30, Novelty 0.15 → H1 still #1, H5 rises to compete with H3/H7
- **Safety-critical:** Add Safety 0.15, reweight others proportionally → H5 rises to 1530, H3 stays ~1530, H7 falls to 1520
- **Academic impact:** Improvement 0.35, Novelty 0.20, others lower → H7 rises slightly, H2 falls, H1 unchanged

### When Rankings Show Instability
- **>3 entries within 20 Elo points:** Not present in this tournament (largest Tier 1 gap is 48 points H1-H7)
- **All entries >1520:** Would indicate too-generous criteria; this tournament shows natural spread (1408-1580)
- **>2 entries <1400:** Single entry (H6) at 1408; appropriate for solved, narrow-scope work

## Success Metrics Met
- [x] Defend every ranking decision via comparison chain (H1 > H7 because gap severity 9.5 vs 8.5, improvement 9.5 vs 9.5, feasibility 6.5 vs 5.5)
- [x] Sensitivity analysis: ±10% weights shift rankings modestly (H5/H2 could swap; H1/H7/H3 stable)
- [x] Natural tiers identified: Pursue (1550+), Refine (1500-1550), Defer (1420-1500), Eliminate (<1420)
- [x] Actionability: clear next-step research directions for each focus area

## Lessons for Future Tournaments

### Calibration Insights
- "Solved problem" baseline of ~1400-1420 is appropriate for single-domain, high-accuracy (>90%) work
- "Frontier research" baseline of ~1550+ requires *new capability class* (not just novel architecture)
- "Supporting technique" (H2) at 1476 suggests ~1450-1500 is correct for mature methods with marginal novelty
- "Essential but narrow" (H5) at 1516 shows gap criticality > domain breadth if stakes are high enough

### Red Flags Revisited
- H4 (architecture) at 1436: Every architectural extension must avoid "that's just a configuration" penalty
- H6 (solved) at 1408: Thesis contributions shine when positioned as solved baselines for validation, not extensions
- H2 (technique) at 1476: Techniques rank above solved domains but below new research directions

### Green Flags Revisited
- H1 (foundation) at 1580: Undefeated record; addresses genuine upstream gap with multi-domain applicability
- H7 (frontier) at 1552: Novel capability class overcomes feasibility concerns; attracts investment despite risk
- H3 (cross-domain) at 1532: Broad applicability + proven architecture (MAL) = strong mid-tier ranking

## Memory Pruning Notes
- Previous patterns on "transformers beat LSTMs" did NOT apply here (H4 ranked low despite architectural superiority)
- Reason: thesis already validated HAPTR; further transformer work is incremental relative to unsolved gaps
- Learning: Architecture wins only if it unlocks *new capability*, not just efficiency

## Next Tournament Preparation

### Key Questions to Ask First
1. Is the foundational gap (representation, safety, technique) addressed by existing work?
2. Does the proposed direction enable *new capability classes* or optimize existing ones?
3. How many downstream applications depend on this direction?
4. What is the feasibility gap vs. frontier status gap?

### Quick Assignment Without Full Tournament
- Solved problem (thesis-proven): ~1400-1420 range
- Incremental architecture: ~1430-1480 range
- Mature technique: ~1470-1500 range
- High-priority research: ~1500-1530 range
- Frontier breakthrough: ~1540-1600 range

Use full tournament only when tiers overlap or uncertainty exists within same Elo range.
