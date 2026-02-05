# Hypothesis Tournament Memory

## Key Patterns from First Tournament (Tactile Robotics Focus Areas)

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
2. **Overweighting feasibility for immature fields**: H1 (foundation models) is hard but essential; H5 (transformers) is easy but incremental. Don't swap based on feasibility.
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

## Next Tournament Preparation

### Pre-Tournament Checklist
- [ ] Confirm evaluation criteria weights (0.30/0.30/0.20/0.20 was appropriate for this domain)
- [ ] Identify "solved problem" baselines early—these are ranking anchors
- [ ] Distinguish between architectural innovation and algorithmic innovation
- [ ] Map out domain-specificity: Is this cross-domain or single-application?
- [ ] Feasibility assessment: Mature methods exist? Or greenfield challenge?

### Comparison Shortcuts (Reduce from 21 to fewer if needed)
1. If entry is "solved baseline," can immediately assign ~1420-1450; skip comparisons
2. If entry is "architectural variant of standard method," can assign ~1450-1480
3. Frontier novelty almost always beats incremental optimization—use this to skip transitive comparisons
4. Safety/robustness almost always beats pure capability—true for robotics, may vary for other domains

### Common Verdict Patterns
- Foundation > Application: 95% of cases
- Safety > Capability: 70% of cases
- Frontier > Incremental: 90% of cases
- Cross-domain > Single-domain: 85% of cases
- Unsolved problem > Solved problem: 100% of cases

## Domain-Agnostic Principles

### Weighting Tradeoffs
- If user prioritizes **practical deployment**: boost Feasibility weight to 0.30, drop Novelty to 0.10
- If user prioritizes **academic impact**: boost Novelty weight to 0.30, drop Feasibility to 0.10
- If user prioritizes **safety/risk**: add Safety dimension (0.20), reweight others proportionally
- If user prioritizes **speed-to-insight**: boost Feasibility (0.35), drop Improvement Potential to 0.15

### When to Reject/Recalibrate Tournament
- If final rankings show **>3 entries within 20 Elo points**, granularity is too fine; consolidate tiers
- If final rankings show **all entries >1520 Elo**, criteria were too generous; recalibrate baselines
- If final rankings show **>2 entries <1400 Elo**, may be too harsh on narrowly-scoped work; depends on domain
- If rankings **don't match intuition after all comparisons**, check for systematic bias in a particular criterion

## Success Metrics for Future Tournaments
- Ability to defend every ranking decision via comparison chain (H1 > H7 because... [show comparisons])
- Sensitivity analysis: changing one weight by ±10% should shift rankings modestly, not drastically
- Coherence check: can identify "natural tiers" (Pursue/Refine/Defer) with clean boundaries
- Actionability: top-ranked items should have clear next-step research directions
