# Research Pipeline Report: Haptic Robotic Perception
## PhD Thesis Extension: "Combining interaction and perception to determine the physical properties of the robot environment"

**Generated:** 2026-02-05
**Pipeline:** research-architect (opus) -> hypothesis-tournament (haiku) -> scientific-peer-reviewer (sonnet)

---

## Executive Summary

The field of haptic robotic perception has undergone a significant transformation since 2023, marking what researchers call the **"ImageNet moment" for tactile sensing**. Three major trends dominate:

1. **Foundation Models & Self-Supervised Learning**: Sparsh (2024), MViTac, Transferable Tactile Transformers reduce labeled data requirements by 10-100x
2. **Affordable Tactile Hardware**: Digit 360 (Meta/GelSight) with 18 sensing features and human-level precision
3. **Diffusion & VLA Integration**: Vision-Language-Action models and diffusion policies entering tactile manipulation pipelines

Your thesis contributions--**HAPTR** (attention for terrain), **MAL** (modality attention layer), and **DEC** (unsupervised clustering)--remain foundational but have significant extension opportunities.

---

## Ranked Focus Areas

### Tournament Results (Elo-Based Ranking)

| Rank | Focus Area | Elo | Tournament Tier | Peer Review Tier | Recommended Priority |
|------|------------|-----|-----------------|------------------|---------------------|
| 1 | Foundation Models for Tactile | 1580 | **Pursue** | Pursue (via distillation) | HIGH |
| 2 | Diffusion Models for Manipulation | 1548 | **Pursue** | Defer (monitor field) | MEDIUM |
| 3 | Unsupervised Anomaly Detection | 1532 | **Pursue** | Cross-cutting Safety | HIGH |
| 4 | Multi-Modal Fusion | 1524 | Refine | **Pursue** (extend MAL) | HIGH |
| 5 | Sim-to-Real Transfer | 1492 | Refine | **Pursue** (highest feasibility) | HIGH |
| 6 | Attention/Transformers for Haptic | 1436 | Defer | Defer (unless efficiency-focused) | LOW |
| 7 | Terrain Classification for Legged Robots | 1404 | Defer | **Promote to #1-2** (core thesis) | RECONSIDER |

### Key Disagreement: Tournament vs. Peer Review

The tournament ranked **Terrain Classification (#7)** lowest as a "solved problem" (HAPTR achieved 90%+ accuracy). The peer reviewer strongly disagrees, arguing it should be **#1-2** because:
- It's the **core thesis contribution** with highest feasibility
- Combining HAPTR with foundation models/SSL is **novel**
- Academic niche: legged robots are underserved vs. manipulation

**Resolution:** User selected **Foundation-First** approach. Terrain classification serves as a benchmark task for validating foundation model transfer, not the primary research driver.

---

## Critical Findings

### From Peer Review

**Major Issues Requiring Revision:**

| Issue | Description | Recommendation |
|-------|-------------|----------------|
| M1 | Ranking lacks explicit weighting | Add MCDA: Thesis Fit 25%, Impact 30%, Feasibility 20%, Novelty 15%, Publication 10% |
| M2 | Terrain classification potentially undervalued | Promote to Rank 1-2 or justify #7 placement |
| M3 | Efficiency should be a research direction, not just a limitation | Add 8th focus area: "Efficient Deep Learning for Resource-Constrained Perception" |
| M4 | Missing industry vs. academic positioning | Identify "blue ocean" (legged robots, efficiency, safety) vs. "red ocean" (manipulation, large foundation models) |

**Undervalued Opportunity:** Anomaly Detection (H6) should be elevated as a **cross-cutting safety layer** integrated into all other areas.

---

## Recommended Research Agenda

### Foundation-First Approach (User Selected)

**Rationale:** Foundation models represent higher novelty and broader impact. Terrain classification serves as a benchmark task for validating foundation model transfer, not the primary research driver.

**Phase 1: Immediate (0-3 months)**
| Action | Focus Area | Deliverable |
|--------|------------|-------------|
| Deep dive into Sparsh, MViTac, Transferable Tactile Transformers | Foundation Models | Literature synthesis |
| Collect/curate large unlabeled tactile dataset (F/T, IMU) | Foundation Models | Pre-training data |
| Implement SSL pipeline (SimCLR/BYOL adapted for tactile) | Foundation Models | Pre-training infrastructure |
| Optimize DEC for edge deployment (<50ms latency) | Anomaly Detection | Real-time safety system |

**Phase 2: Short-term (3-8 months)**
| Action | Focus Area | Deliverable |
|--------|------------|-------------|
| Pre-train tactile foundation model on unlabeled data | Foundation Models | Pre-trained checkpoint |
| Evaluate zero-shot transfer to terrain classification (PUTANY) | Benchmark | Transfer validation |
| Fine-tune Sparsh/custom model on F/T sensor data | Foundation Models | Cross-sensor transfer paper |
| Extend MAL to Vision-Proprioception-Action (VPA) | Multi-Modal | VLA-style fusion architecture |

**Phase 3: Medium-term (8-18 months)**
| Action | Focus Area | Deliverable |
|--------|------------|-------------|
| Cross-sensor foundation model (F/T <-> vision-based tactile) | Foundation Models | ICRA/CoRL paper |
| Open-source "Tactile Foundation Model Toolkit" | Foundation Models | Community resource |
| Benchmark on terrain, material classification, slip detection | Benchmark Suite | Comprehensive evaluation |
| Multi-robot transfer: Train on ANYmal, deploy on Spot | Cross-Robot Transfer | JFR/RAL journal paper |

---

## Strategic Positioning

### Academic Niche (Blue Ocean)
- **Legged robot perception** (underserved vs. manipulation)
- **Lightweight/efficient models** (vs. foundation model compute)
- **Safety-critical applications** (certification path)
- **Cross-robot transfer learning** (generalization)

### Avoid Competition With (Red Ocean)
- Industry foundation models (Meta, Tesla, Amazon)
- Diffusion manipulation (strong academic competition)
- Large-scale dataset collection (resource constraints)

---

## Key Collaboration Targets

| Institution | Expertise | Collaboration Opportunity |
|-------------|-----------|---------------------------|
| Meta AI | Sparsh, Digit 360 | Transfer to F/T sensors |
| Stanford | TacSL | Sim-to-real for legged robots |
| ETH Zurich | ANYmal, RSL | Terrain dataset expansion |
| MIT | Transferable Tactile Transformers | Cross-sensor architectures |
| Boston Dynamics | Spot | Cross-robot validation |
| NASA JPL | ProNav | Planetary exploration |

---

## Key Sources (2024-2026)

### Must-Read Papers
- **Sparsh** (Meta AI, 2024): Self-supervised touch representations, 460K+ images
- **TacSL** (Stanford, 2024): 200x faster tactile simulation with AACD transfer
- **Multimodal Tactile Housekeeping** (Nature Comm, 2024): 85.5% vs 55.4% success with tactile
- **Terrain Classification Survey** (JFR, 2025): Comprehensive off-road perception review
- **Diffusion for Manipulation Survey** (Frontiers, 2025): State-of-the-art diffusion policies

---

## Verdict

### Peer Review Assessment
**[X] Accept with minor revisions**

Required revisions (10-17 hours total):
1. Add explicit MCDA ranking methodology
2. Resolve terrain classification priority disagreement
3. Add efficiency as research direction
4. Add industry vs. academic positioning section

### Final Priority Order (Foundation-First, User Selected)

| Priority | Focus Area | Rationale |
|----------|------------|-----------|
| **1** | Foundation Models for Tactile | SSL pre-training, cross-sensor transfer, highest novelty |
| **2** | Multi-Modal Fusion | Extend MAL to VLA-style architectures |
| **3** | Anomaly Detection | Cross-cutting safety layer (DEC-based) |
| **4** | Sim-to-Real Transfer | Infrastructure for scaling (use TacSL/Taccel) |
| **5** | Terrain Classification | **Benchmark task** for validating foundation models |
| **6** | Diffusion Models | Monitor field; consider for Phase 3 |
| **7** | Transformers (standalone) | Implement within foundation models, not standalone |

---

## Artifacts Generated

| File | Location | Contents |
|------|----------|----------|
| `research-summary.md` | research-output/ | Stage 1: Full landscape analysis (7 focus areas) |
| `ranked-focus-areas.md` | research-output/ | Stage 2: Elo tournament results (21 comparisons) |
| `final-report.md` | research-output/ | This compiled report |

---

*Pipeline: research-architect -> hypothesis-tournament -> scientific-peer-reviewer*
*Models: opus -> haiku -> sonnet*
