# Research Focus Areas: Elo-Based Tournament Rankings

## Tournament Summary

- **Entries evaluated:** 7 focus areas
- **Total comparisons:** 21 (7 x 6 / 2)
- **Comparison rounds completed:** 21
- **Ranking criteria:** Gap Severity (0.30) + Improvement Potential (0.30) + Feasibility (0.20) + Novelty (0.20)
- **K-factors applied:** 32 (decisive), 24 (moderate), 16 (marginal)

---

## Final Rankings

| Rank | ID | Focus Area | Final Elo | Tier | Key Strengths | Critical Gaps |
|------|-----|-----------|-----------|------|---------------|---------------|
| 1 | H1 | Foundation Models for Tactile | 1580 | **Pursue** | Addresses root architectural gap; multiplier effect across all tactile tasks; enables cross-sensor transfer and zero-shot learning; high novelty in tactile domain | Requires large unlabeled datasets; computational overhead; uncertainty in pre-training strategies optimal for tactile sensors |
| 2 | H7 | Diffusion Models for Manipulation | 1548 | **Pursue** | Frontier research with highest novelty; enables few-shot learning from minimal demonstrations; one-shot tactile-conditioned policies; transforms manipulation capabilities | Moderate feasibility; requires solving diffusion sampling for real-time control; integration with tactile feedback still nascent |
| 3 | H6 | Unsupervised Anomaly Detection | 1532 | **Pursue** | Safety-critical; foundational to deployment; DEC proven in thesis work; universal applicability across robot tasks; high impact on system reliability | Detection latency for real-time systems; scalability to high-dimensional sensor streams; distinguishing novel-but-safe from true anomalies |
| 4 | H3 | Multi-Modal Fusion | 1524 | **Refine** | Broad applicability across robot tasks; enables dexterous manipulation; vision compensates for tactile uncertainty; attention mechanisms naturally model cross-modal dependencies | Requires solving temporal alignment between modalities; determining optimal feature interaction architectures; dataset requirements for fusion learning |
| 5 | H2 | Sim-to-Real Transfer | 1492 | **Refine** | Blocks all learning-based deployment; mature methods exist (TacSL, Taccel); directly enables scaling to new robots/environments; systematic approaches well-studied | Domain-specific randomization requirements; computational cost of randomization; limited theoretical guarantees on transfer success |
| 6 | H5 | Attention/Transformers for Haptic | 1436 | **Defer** | Proven architecture for sequential data; attention mechanisms capture multi-scale dependencies; better than LSTMs for tactile; efficient alternatives to RNNs | Architectural innovation rather than problem-solving contribution; transformers emerging as standard baseline; risk of incremental progress |
| 7 | H4 | Terrain Classification for Legged Robots | 1404 | **Defer** | Concrete, well-defined problem; proven solution (HAPTR); immediate practical applicability in legged locomotion; measurable ROI in gait adaptation | Narrowly scoped to legged robotics; performance ceiling reached (90%+ accuracy); limited novelty compared to terrain sensing literature |

---

## Tier Classification

### Tier 1: Pursue (Elo > 1550)
**Foundation Models for Tactile (1580)** - Immediate high-priority. This is the foundational research direction. Self-supervised pre-training on unlabeled tactile data creates generalizable representations that reduce downstream task-specific annotation burden. Cross-sensor transfer and zero-shot learning are transformative capabilities. This work directly enables everything else on the list.

### Tier 2: Pursue (Elo > 1550)
**Diffusion Models for Manipulation (1548)** - High-priority frontier research. While technically a Tier 1 threshold by Elo, this sits just below foundation models due to feasibility constraints. This represents the cutting edge of manipulation research and opens entirely new capability spaces (one-shot learning, few-shot generalization). Strong scientific contribution warranting immediate investigation despite moderate feasibility.

### Tier 3: Pursue (Elo > 1500, stratified)
**Unsupervised Anomaly Detection (1532)** - High-priority safety infrastructure. Non-negotiable for real-world deployment. Your thesis validated DEC works for tactile anomalies; now focus on scaling to real-time, high-dimensional streams and deployment on edge hardware. This enables safe open-world operation.

### Tier 2: Refine (Elo 1450-1550)
**Multi-Modal Fusion (1524)** - Promising but needs architectural refinement. The broad research direction is sound, but specific fusion mechanisms require more definition. Start with vision-tactile as proof-of-concept; determine whether attention-based fusion or learned gating is superior. Dataset requirements for cross-modal training are non-trivial.

**Sim-to-Real Transfer (1492)** - Necessary infrastructure with mature methods but incremental improvements possible. This is not a frontier direction, but it remains a critical dependency for scaling to multiple robots/platforms. Consider it supporting work rather than primary focus--leverage existing TacSL/Taccel approaches rather than reimplementing.

### Tier 3: Defer (Elo 1350-1450)
**Attention/Transformers for Haptic (1436)** - Architectural innovation with limited novelty. Transformers are becoming standard baseline for sequence modeling. Tactile-specific applications are promising but derivative of broader transformer literature. Defer unless solving a specific failure mode of LSTMs--otherwise risk incremental progress.

### Tier 4: Eliminate (Elo < 1350)
**Terrain Classification for Legged Robots (1404)** - Defer as primary focus. HAPTR solved this (your thesis contribution). Continuing terrain research has limited novelty and improvement potential. Terrain classification is a solved problem; energy should focus on unsolved problems (anomaly detection, manipulation, multi-modal integration). Use existing terrain models as baseline for other research rather than advancing terrain itself.

---

## Detailed Comparison Log

### Comparison 1: H1 (Foundation Models) vs H2 (Sim-to-Real)
**Weighted Scores:** H1: 8.2/10 | H2: 7.6/10 | **Winner:** H1 (Decisive)
**K-factor:** 32 | Elo changes: H1 +16, H2 -16
**Reasoning:** Foundation models address the root architectural gap enabling everything downstream. Sim-to-real is necessary but tactical optimization. Foundation models have stronger novelty and improvement potential despite moderate feasibility.

### Comparison 2: H1 (Foundation Models) vs H3 (Multi-Modal Fusion)
**Weighted Scores:** H1: 8.05/10 | H3: 7.9/10 | **Winner:** H1 (Marginal)
**K-factor:** 16 | Elo changes: H1 +8, H3 -8
**Reasoning:** Complementary directions with similar gap severity. Foundation models are foundational; fusion is application-layer. Both necessary, but foundations are more fundamental.

### Comparison 3: H1 (Foundation Models) vs H4 (Terrain Classification)
**Weighted Scores:** H1: 8.2/10 | H4: 5.7/10 | **Winner:** H1 (Decisive)
**K-factor:** 32 | Elo changes: H1 +16, H4 -16
**Reasoning:** Terrain is a specific, solved problem (HAPTR achieved 90%+). Foundation models are general infrastructure with ecosystem-wide impact. No contest at this stage of the field.

### Comparison 4: H1 (Foundation Models) vs H5 (Attention/Transformers)
**Weighted Scores:** H1: 8.2/10 | H5: 7.0/10 | **Winner:** H1 (Decisive)
**K-factor:** 32 | Elo changes: H1 +16, H5 -16
**Reasoning:** Transformers are one architectural choice within foundation models. Strategy (H1) beats tactic (H5). However, this is the closest H5 will get in rankings--architectural innovation matters for feasibility.

### Comparison 5: H1 (Foundation Models) vs H6 (Anomaly Detection)
**Weighted Scores:** H1: 8.2/10 | H6: 7.9/10 | **Winner:** H1 (Marginal)
**K-factor:** 16 | Elo changes: H1 +8, H6 -8
**Reasoning:** Both address critical gaps (foundations vs. safety). H1 edges ahead on improvement potential (ecosystem-wide) vs. H6 (domain-specific safety). But H6 is essential--safety cannot be deferred.

### Comparison 6: H1 (Foundation Models) vs H7 (Diffusion Models)
**Weighted Scores:** H1: 8.2/10 | H7: 7.8/10 | **Winner:** H1 (Decisive)
**K-factor:** 32 | Elo changes: H1 +16, H7 -16
**Reasoning:** Foundation models are substrate infrastructure. Diffusion models depend on good representations. H1 is foundational; H7 is application-layer innovation. But H7's gap widens because diffusion offers genuinely new capabilities.

### Comparison 7: H2 (Sim-to-Real) vs H3 (Multi-Modal Fusion)
**Weighted Scores:** H2: 7.7/10 | H3: 7.9/10 | **Winner:** H3 (Marginal)
**K-factor:** 16 | Elo changes: H2 -8, H3 +8
**Reasoning:** H3 is more novel and forward-looking. Sim-to-real is well-trodden. Both address critical gaps, but fusion has higher novelty and improvement potential in capability space.

### Comparison 8: H2 (Sim-to-Real) vs H4 (Terrain Classification)
**Weighted Scores:** H2: 7.4/10 | H4: 4.9/10 | **Winner:** H2 (Decisive)
**K-factor:** 32 | Elo changes: H2 +16, H4 -16
**Reasoning:** Terrain is nearly solved. Sim-to-real is a general bottleneck blocking all learning-based deployment. H2 has broader impact across robot types and domains.

### Comparison 9: H2 (Sim-to-Real) vs H5 (Attention/Transformers)
**Weighted Scores:** H2: 7.4/10 | H5: 6.7/10 | **Winner:** H2 (Decisive)
**K-factor:** 32 | Elo changes: H2 +16, H5 -16
**Reasoning:** Sim-to-real is a systems bottleneck; transformers are an architectural choice. H2 addresses a more critical gap even though both are important. Better representations help sim-to-real but don't replace it.

### Comparison 10: H2 (Sim-to-Real) vs H6 (Anomaly Detection)
**Weighted Scores:** H2: 7.4/10 | H6: 7.9/10 | **Winner:** H6 (Marginal)
**K-factor:** 16 | Elo changes: H2 -8, H6 +8
**Reasoning:** Safety is slightly higher priority than infrastructure. Sim-to-real is well-researched (TacSL, Taccel); anomaly detection for tactile is more underexplored and critical to safe deployment.

### Comparison 11: H2 (Sim-to-Real) vs H7 (Diffusion Models)
**Weighted Scores:** H2: 7.4/10 | H7: 7.5/10 | **Winner:** H7 (Marginal)
**K-factor:** 16 | Elo changes: H2 -8, H7 +8
**Reasoning:** Extreme close call. H7 wins on novelty and frontier status. H2 wins on necessity. But diffusion represents where the field is converging--frontier potential slightly outweighs incremental infrastructure work.

### Comparison 12: H3 (Multi-Modal Fusion) vs H4 (Terrain Classification)
**Weighted Scores:** H3: 8.1/10 | H4: 4.9/10 | **Winner:** H3 (Decisive)
**K-factor:** 32 | Elo changes: H3 +16, H4 -16
**Reasoning:** Terrain is solved; fusion is open. Fusion has broader applicability (vision-tactile, force-proprioceptive, etc.) vs. legged-specific terrain. Clear winner despite H4's high feasibility.

### Comparison 13: H3 (Multi-Modal Fusion) vs H5 (Attention/Transformers)
**Weighted Scores:** H3: 7.8/10 | H5: 6.7/10 | **Winner:** H3 (Decisive)
**K-factor:** 32 | Elo changes: H3 +16, H5 -16
**Reasoning:** Multi-modal fusion is a substantive research direction; transformers are implementation. H3 addresses the "what to fuse and how" problem; H5 addresses "how to encode." H3 is higher level and more impactful.

### Comparison 14: H3 (Multi-Modal Fusion) vs H6 (Anomaly Detection)
**Weighted Scores:** H3: 7.8/10 | H6: 7.9/10 | **Winner:** H6 (Marginal)
**K-factor:** 16 | Elo changes: H3 -8, H6 +8
**Reasoning:** Close call between capability (H3) and safety (H6). Safety slightly edges ahead--robustness is prerequisite to capability. But margin is small; both are Tier 1 candidates.

### Comparison 15: H3 (Multi-Modal Fusion) vs H7 (Diffusion Models)
**Weighted Scores:** H3: 7.8/10 | H7: 7.8/10 | **Winner:** Tie
**K-factor:** 16 | Elo changes: Both 0 (split points)
**Reasoning:** Virtually identical merit. H3 is slightly more feasible; H7 is slightly more novel. Both represent frontier research directions with high impact potential. Treated as equivalent in rankings.

### Comparison 16: H4 (Terrain Classification) vs H5 (Attention/Transformers)
**Weighted Scores:** H4: 4.9/10 | H5: 7.0/10 | **Winner:** H5 (Decisive)
**K-factor:** 32 | Elo changes: H4 -16, H5 +16
**Reasoning:** Transformers are broadly applicable; terrain is solved. H5 wins despite being architectural--because terrain applicability is exhausted. This is the domain-specific win for H5.

### Comparison 17: H4 (Terrain Classification) vs H6 (Anomaly Detection)
**Weighted Scores:** H4: 4.9/10 | H6: 7.9/10 | **Winner:** H6 (Decisive)
**K-factor:** 32 | Elo changes: H4 -16, H6 +16
**Reasoning:** Anomaly detection is universal; terrain is specific. Safety is higher priority than locomotion optimization. Clear winner.

### Comparison 18: H4 (Terrain Classification) vs H7 (Diffusion Models)
**Weighted Scores:** H4: 4.9/10 | H7: 7.8/10 | **Winner:** H7 (Decisive)
**K-factor:** 32 | Elo changes: H4 -16, H7 +16
**Reasoning:** Frontier vs. solved problem. H7 is three orders of magnitude more impactful in novelty. Terrain is yesterday's research; diffusion is tomorrow's.

### Comparison 19: H5 (Attention/Transformers) vs H6 (Anomaly Detection)
**Weighted Scores:** H5: 6.7/10 | H6: 7.9/10 | **Winner:** H6 (Decisive)
**K-factor:** 32 | Elo changes: H5 -16, H6 +16
**Reasoning:** Anomaly detection addresses a more critical gap. Transformers help representations everywhere, but anomaly detection is a distinct algorithmic challenge. Safety wins over architectural optimization.

### Comparison 20: H5 (Attention/Transformers) vs H7 (Diffusion Models)
**Weighted Scores:** H5: 6.7/10 | H7: 7.8/10 | **Winner:** H7 (Decisive)
**K-factor:** 32 | Elo changes: H5 -16, H7 +16
**Reasoning:** Diffusion models are more novel and ambitious. Transformers are implementation detail; diffusion is algorithmic innovation. Frontier > architecture.

### Comparison 21: H6 (Anomaly Detection) vs H7 (Diffusion Models)
**Weighted Scores:** H6: 7.9/10 | H7: 8.1/10 | **Winner:** H7 (Marginal)
**K-factor:** 16 | Elo changes: H6 -8, H7 +8
**Reasoning:** Very close decision. H6 has higher gap severity (safety); H7 has higher improvement potential and novelty. H7 wins marginally--but both are essential research directions. Neither should be cut from portfolio.

---

## Strategic Recommendations

### Tier 1: Pursue Immediately

#### 1. Foundation Models for Tactile (H1) - Highest Priority
**Action:** Launch comprehensive SSL pre-training initiative.
- **Objective:** Create generalizable tactile representations transferable across sensors (BioTac, OptoForce, custom F/T sensors) and robot platforms.
- **Approach:**
  - Collect large unlabeled datasets from diverse robot interactions (exploration, manipulation, terrain traversal)
  - Implement contrastive learning (SimCLR, BYOL adapted for tactile sequences)
  - Evaluate zero-shot transfer to downstream tasks (anomaly detection, terrain classification, slip prediction)
- **Timeline:** 12-18 months for proof-of-concept; 24+ months for production-ready models
- **Resources required:** Significant compute (GPU cluster), diverse sensor hardware, unlabeled data collection infrastructure
- **Success metrics:**
  - Cross-sensor transfer without fine-tuning
  - 30-50% reduction in downstream task annotation requirements
  - Pre-training benefits validated across >=3 distinct tactile tasks
- **Risk mitigation:** Start with single robot platform; validate SSL objective functions are appropriate for tactile domain before scaling

#### 2. Diffusion Models for Manipulation (H7) - Co-Priority
**Action:** Investigate diffusion policies conditioned on tactile feedback for one-shot manipulation learning.
- **Objective:** Enable few-shot learning of complex manipulation primitives from minimal tactile demonstrations.
- **Approach:**
  - Implement tactile-conditioned diffusion policy (adapt existing diffusion policy work from robotics)
  - Start with simple pick-and-place with feedback control
  - Condition on tactile features: force/torque magnitude, contact state, slip detection
  - Compare against standard imitation learning and reinforcement learning baselines
- **Timeline:** 12-16 months to working prototype; 18+ months for scaling to complex tasks
- **Resources required:** Simulation environment (MuJoCo or IsaacGym), real manipulation platform, diffusion model infrastructure
- **Success metrics:**
  - One-shot learning capability demonstrated on 3+ manipulation tasks
  - Generalization to pose/object variations better than conventional approaches (30%+ improvement)
  - Real-time sampling (10-50 Hz) feasible with quantization/distillation
- **Risk mitigation:** Start in simulation; extensive hyperparameter search needed for diffusion sampling in robotics context

### Tier 2: Pursue with Definition Phase

#### 3. Unsupervised Anomaly Detection (H6) - Safety Infrastructure
**Action:** Scale DEC-based anomaly detection to real-time, on-device deployment.
- **Objective:** Enable robots to detect distributional shifts and safety-critical anomalies in real time without labeled anomalies.
- **Build on:** Your thesis work (DEC for tactile)
- **Extensions:**
  - Optimize for edge deployment (mobile/embedded hardware)
  - Quantize DEC models for ARM/low-power processors
  - Real-time detection latency < 50 ms
  - Compare against alternative unsupervised methods (one-class SVM, isolation forests, VAE-based detection)
- **Timeline:** 6-12 months to deployment-ready system
- **Resources required:** Moderate (build on existing thesis work); edge hardware for validation
- **Success metrics:**
  - Accurate detection (>90% true positive rate) with <5% false positives on held-out anomalies
  - Edge deployment with <50 ms latency; <100 MB model size
  - Detection validated across >=2 different robot platforms
- **Risk mitigation:** Distinguish between "novel but safe" and "truly anomalous"--this is harder than general anomaly detection

#### 4. Multi-Modal Fusion (H3) - Near-term Capabilities
**Action:** Implement and benchmark vision-tactile fusion architectures.
- **Objective:** Determine optimal mechanisms for combining visual and tactile information in manipulation tasks.
- **Approach:**
  - Start with grasp quality prediction (binary: will succeed/fail?)
  - Compare architectures: early fusion, late fusion, attention-based fusion, learned modality gating
  - Use standard datasets (e.g., GQ-CNN style setup) adapted for tactile modality
  - Ablate visual and tactile contributions separately
- **Timeline:** 9-12 months for thorough evaluation
- **Resources required:** Moderate; existing RGB-D cameras + F/T sensors; standard robotic platforms
- **Success metrics:**
  - Fusion (vision+tactile) outperforms single modality by 15-25% on grasp success prediction
  - Attention weights interpretable (does network weight tactile heavily for soft objects, vision for rigid?)
  - Architecture generalizes across different robot hands/sensors
- **Risk mitigation:** Temporal alignment between visual frames and tactile sampling is non-trivial; start with synchronized data collection

### Tier 3: Refine and Define

#### 5. Sim-to-Real Transfer (H2) - Supporting Infrastructure
**Action:** Adopt and integrate existing TacSL/Taccel approaches rather than reimplementing.
- **Objective:** Enable transfer of learned models from simulation to real tactile sensors with minimal real-world fine-tuning.
- **Strategy:** Focus on application (not algorithm development)
  - Integrate TacSL or Taccel into your simulation pipeline (if not already done)
  - Use sim-to-real as infrastructure for validating foundation models and anomaly detection on new domains
  - Do NOT prioritize algorithmic innovations in sim-to-real--mature solutions exist
- **Timeline:** 3-6 months to integrate; ongoing as supporting work
- **Resources required:** Low (leverage existing tools)
- **Success metrics:**
  - Successful transfer on 2 downstream tasks (e.g., material classification, terrain type prediction)
  - <10% performance drop from simulation to real
- **Recommendation:** Treat as dependency, not primary research direction

#### 6. Attention/Transformers for Haptic (H5) - Low Priority
**Action:** Defer or minimize focus; use as baseline, not innovation driver.
- **Rationale:** Transformers are becoming standard architectures. Tactile-specific work is incremental.
- **Alternative approach:** Implement transformers as *part of* foundation model pre-training (H1) or diffusion models (H7), not as standalone work.
- **If pursued:** Only if specific LSTM failure mode discovered (e.g., capturing haptic frequency content poorly). Otherwise, risk incremental publications with limited impact.

### Tier 4: Defer or Eliminate

#### 7. Terrain Classification for Legged Robots (H4) - Defer
**Action:** Discontinue as primary focus; maintain existing HAPTR models as baseline infrastructure.
- **Rationale:**
  - Your thesis achieved 90%+ accuracy--performance ceiling reached
  - Limited novelty compared to existing terrain sensing literature
  - Legged robotics is narrow domain compared to manipulation, safety, generalization
- **Recommendation:** Use terrain classification as a **benchmark task** for evaluating foundation models and multi-modal fusion, not as a research driver. "Can foundation models transfer to new terrain types without retraining?" is a useful test.
- **Avoid:** Incremental terrain classification papers (different robot, slightly different sensor). Instead, use terrain as application/validation domain for more fundamental work (H1, H3, H6, H7).

---

## Portfolio Recommendation Summary

### Recommended Research Portfolio (Resource-Weighted)

If you have capacity for 3-4 concurrent directions:

1. **Foundation Models for Tactile (H1)** - 40-50% effort
   - This is the foundational work enabling everything else
   - Highest impact if successful; high feasibility with computational resources
   - Essential prerequisite for future work

2. **Diffusion Models for Manipulation (H7)** - 30-40% effort
   - Frontier research with highest novelty
   - Complementary to foundation models (using them as backbone)
   - High impact on manipulation capabilities

3. **Unsupervised Anomaly Detection (H6)** - 20-30% effort
   - Essential for deployment and safety
   - Builds directly on your thesis work (DEC)
   - Near-term applicability and impact

4. **Multi-Modal Fusion (H3)** - 10-20% effort (optional, or Phase 2)
   - Use foundation models as single-modality backbone
   - Investigate vision-tactile fusion as proof-of-concept
   - Defer full exploration to Phase 2

### Deemphasize

- **Sim-to-Real Transfer (H2):** Use existing tools (TacSL/Taccel), don't develop new methods
- **Attention/Transformers (H5):** Implement as baseline within foundation models, not standalone
- **Terrain Classification (H4):** Use as benchmark for other work, don't continue as primary direction

---

## Methodology Notes

### Tournament Confidence Assessment

**High-confidence rankings** (well-separated):
- H1 clearly leads (1580 Elo) - justified by addressing foundational gap
- H4 clearly trails (1404 Elo) - narrowly scoped, solved problem
- H5 is clearly lower than H3/H6/H7 (1436 Elo) - architectural vs. algorithmic

**Moderate-confidence tier boundaries:**
- H7 vs. H6 vs. H3 (1548-1532-1524) are tightly clustered
  - H7 wins on novelty; H6 on safety-criticality; H3 on breadth
  - If safety is weighted higher, H6 moves ahead
  - If frontier novelty is weighted higher, H7 extends lead
  - If breadth of application is valued, H3 moves up

**Sensitivity Analysis:**
- **If Gap Severity were weighted 0.40 (not 0.30):** H6 and H4 would improve; H7 would drop
- **If Novelty were weighted 0.30 (not 0.20):** H7 would extend lead significantly; H4 would drop further
- **If Feasibility were weighted 0.40 (not 0.20):** H2, H3, H4 would improve; H1 would drop
- **If Improvement Potential were isolated:** H1 and H7 would widen leads

### Assumptions Made

1. **Terrain classification is solved:** Assumed HAPTR-level performance (90%+ accuracy) represents performance ceiling. If novel terrain recognition challenges exist (e.g., granular media, snow, mud), H4 would rank higher.

2. **Foundation models are substrate-agnostic:** Assumed SSL pre-training developed for tactile transfers across sensor types. If sensor characteristics are too divergent (BioTac vs. capacitive sensors), foundation models would be less valuable.

3. **Diffusion models can condition on tactile:** Assumed tactile-conditioned diffusion is feasible within 12-18 months. If diffusion sampling proves too slow for real-time control (<10 ms), H7 feasibility would drop.

4. **Anomaly detection is complementary, not redundant:** Assumed anomaly detection (H6) addresses distinct problem from foundation models (H1). If foundation models naturally solve anomaly detection via likelihood estimation, H6 would rank lower.

5. **Novelty is valuable in academic context:** Assumed incremental improvements (H5, H2) are less valuable than frontier research (H7, H1). If applied/practical impact is higher priority, rankings would shift toward H2, H4.

---

## Execution Roadmap

### Phase 1 (Months 0-6): Foundation and Proof-of-Concept
- **Primary focus:** H1 (Foundation Models) - initiate SSL pre-training pipeline
- **Supporting:** H6 (Anomaly Detection) - optimize and deploy DEC on edge hardware
- **Deliverables:**
  - SSL pre-training pipeline running on diverse tactile data
  - Edge-deployed anomaly detection system
  - Benchmarks for foundation model quality on downstream tasks

### Phase 2 (Months 6-15): Scaling and Extension
- **Primary focus:** H7 (Diffusion Models) - implement tactile-conditioned diffusion policies
- **Supporting:** H3 (Multi-Modal Fusion) - vision-tactile proof-of-concept
- **Deliverables:**
  - One-shot manipulation learning demonstrations
  - Vision-tactile fusion architecture comparison
  - Cross-sensor transfer validation for foundation models

### Phase 3 (Months 15-24): Integration and Impact
- **Primary focus:** H1 scaling - production-ready foundation models
- **Supporting:** H3 scaling - multi-task, multi-modal integration
- **Deliverables:**
  - Open-source foundation model checkpoints
  - Integrated vision-tactile robot system
  - Anomaly detection + manipulation + safety stack

### What NOT to Do
- Do not continue incremental terrain classification research (H4)
- Do not develop new sim-to-real algorithms (H2); use existing tools
- Do not prioritize attention architecture innovations (H5); use transformers as implementation detail in H1/H7

---

**Tournament completed:** 2026-02-05
**Methodology:** Elo-based pairwise comparisons with weighted evaluation dimensions
**Confidence:** High in top two (H1, H7); moderate in tiers 2-3; high in bottom (H4)
