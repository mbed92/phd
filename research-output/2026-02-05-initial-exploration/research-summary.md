# Research Landscape Analysis: Haptic Robotic Perception

## Executive Summary

The field of haptic robotic perception has undergone a significant transformation between 2023-2026, marking what many researchers call the "ImageNet moment" for tactile sensing. This period has seen the convergence of three major trends: (1) the emergence of foundation models and self-supervised learning approaches that dramatically reduce the need for labeled tactile data, (2) the proliferation of affordable vision-based tactile sensors (GelSight, DIGIT, Digit 360) enabling broader adoption, and (3) the integration of diffusion models and Vision-Language-Action (VLA) frameworks into tactile manipulation pipelines. The thesis focus on combining deep learning with haptic perception remains highly relevant, though the landscape has shifted toward multi-modal foundation models, sim-to-real transfer, and self-supervised representation learning as dominant paradigms.

Key developments since the thesis defense (2023) include: **Sparsh** (2024), a family of self-supervised touch representations trained on 460K+ tactile images; **TacSL** (2024), a library enabling 200x faster visuotactile simulation for sim-to-real transfer; **Digit 360** (2024), a 18-feature tactile sensor with human-level precision from Meta AI and GelSight; and **tactile foundation models** emerging from Tesla (Optimus), Amazon (Sparrow), and academic labs. The field is transitioning from task-specific classifiers toward general-purpose tactile intelligence that can transfer across sensors, tasks, and robots.

The thesis contributions on attention mechanisms for terrain classification (HAPTR), multi-modal fusion (MAL), and unsupervised haptic recognition (DEC) remain foundational but could be significantly extended. Current research emphasizes: (a) cross-sensor transfer learning rather than sensor-specific models, (b) vision-tactile alignment in latent space rather than late fusion, (c) diffusion policies for contact-rich manipulation, and (d) real-time anomaly detection for robotic safety. The most promising directions for follow-up research lie in bridging the gap between the thesis's efficient, lightweight architectures and the emerging foundation model paradigm, particularly for resource-constrained legged robots in unstructured environments.

---

## Focus Area 1: Foundation Models and Self-Supervised Learning for Tactile Perception

### Title and Scope Definition

**Title**: Tactile Foundation Models and Self-Supervised Representation Learning

**Scope**: Development of general-purpose tactile representations that transfer across sensors, tasks, and robots using self-supervised, contrastive, or masked autoencoder approaches. Includes pre-training strategies, cross-sensor transfer, and fine-tuning protocols.

**Out of Scope**: Task-specific supervised classifiers, sensor hardware design, non-learning approaches.

### Key Research Questions

1. How can self-supervised pre-training on diverse tactile datasets yield representations that generalize across sensor types (capacitive, piezoresistive, vision-based)?
2. What is the minimum amount of task-specific labeled data needed when starting from a pre-trained tactile foundation model?
3. Can tactile foundation models achieve zero-shot or few-shot generalization to novel objects and materials?
4. How do we align tactile representations with visual and language modalities for multi-modal understanding?

### Current State of Knowledge

**Seminal Works**:
- **Sparsh** (2024): Self-supervised touch representations for vision-based tactile sensors, trained on 460K+ images using masking and self-distillation
- **MViTac** (2024): Multimodal visual-tactile representation learning through contrastive pre-training
- **Transferable Tactile Transformers** (2024): Cross-sensor and cross-task transfer using transformer architectures
- **GenForce** (2025): First framework for transferable force sensing across diverse tactile sensors

**What's Known**:
- Contrastive learning can align visual and tactile modalities in latent space
- Self-supervised methods reduce labeled data requirements by 10-100x
- Pre-trained representations improve material classification, grasp stability prediction, and slip detection
- Vision-based tactile sensors (GelSight, DIGIT) are amenable to standard computer vision pre-training techniques

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on foundation models for non-vision-based tactile sensors (F/T sensors, piezoelectric, capacitive arrays)
- No established benchmark suite for tactile foundation model evaluation
- Unclear how to integrate proprioceptive/kinesthetic signals (IMU, joint encoders) into foundation model frameworks
- Few studies on foundation models for legged robot terrain classification (thesis domain)

**Limitations**:
- Current foundation models require substantial compute (transformers, ViTs) -- not suitable for resource-constrained robots
- Sim-to-real gap for synthetic pre-training data
- Most work focuses on manipulation tasks, not locomotion or whole-body contact

**Contradictions**:
- Some papers claim sensor-agnostic representations are achievable; others show significant domain shift between sensor types
- Debate on whether tactile data can scale like vision data given hardware diversity

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| Sparsh | Meta AI | 2024 | SSL touch representations, 460K images |
| MViTac | CMU | 2024 | Contrastive visual-tactile pre-training |
| Transferable Tactile Transformers | MIT | 2024 | Cross-sensor transfer |
| GenForce | Stanford | 2025 | Unified force sensing across sensors |
| Tactile Foundation Models Survey | RoboCloud | 2025 | Comprehensive review |

### Initial Priority: **HIGH**

**Justification**:
- **Impact**: Foundation models could revolutionize how tactile systems are developed, reducing per-task engineering
- **Feasibility**: Building on thesis HAPTR architecture + new SSL techniques is tractable
- **Novelty**: Applying foundation model concepts to terrain classification and legged robots is underexplored
- **Risk**: Compute requirements may conflict with thesis emphasis on lightweight inference

---

## Focus Area 2: Sim-to-Real Transfer for Tactile Sensing

### Title and Scope Definition

**Title**: Bridging the Reality Gap in Tactile Robotic Perception

**Scope**: Methods for training tactile perception models in simulation and transferring to real robots, including domain randomization, domain adaptation, physics-based simulation, and single/few-shot transfer techniques.

**Out of Scope**: General sim-to-real for non-tactile modalities, simulation engine development.

### Key Research Questions

1. What simulation fidelity is required for tactile signals to enable effective sim-to-real transfer?
2. Can single-sample or few-shot domain adaptation bridge the tactile sim-to-real gap?
3. How should domain randomization be applied to tactile signals (noise models, material variation, contact dynamics)?
4. What is the role of physics-based vs. learned simulators for tactile data generation?

### Current State of Knowledge

**Seminal Works**:
- **TacSL** (2024): GPU-based visuotactile simulation, 200x faster than prior art, with asymmetric actor-critic distillation (AACD) for policy transfer
- **SingleS2R** (2024): Single-sample sim-to-real for visual-tactile understanding using multi-scale vision transformers
- **Taccel** (2024-2025): High-performance simulation platform from Peking University
- **TactGen** (2024): Zero-shot tactile data generation via sim-to-real

**What's Known**:
- Vision-based tactile sensors (GelSight) are more amenable to sim-to-real than direct force sensors
- Domain randomization of contact dynamics improves transfer
- Hybrid approaches (simulation + small real-world dataset) outperform pure sim or pure real training
- The thesis (2023) used MuJoCo for stiffness estimation sim-to-real -- still relevant approach

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on sim-to-real for F/T sensor data (thesis modality)
- No standard benchmarks for tactile sim-to-real evaluation
- Terrain classification sim-to-real largely unexplored
- Unclear optimal ratio of sim-to-real data mixing

**Limitations**:
- Current simulators struggle with soft/deformable materials and granular media (sand, gravel)
- Simulation of sensor noise and drift is often simplistic
- Computational cost of high-fidelity contact simulation

**Contradictions**:
- Some work shows sim-only training can work; others show real data is essential
- Debate on whether learned simulators or physics-based simulators are better for tactile

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| TacSL | Stanford | 2024 | 200x faster tactile simulation, AACD |
| SingleS2R | Various | 2024 | Single-sample transfer |
| Taccel | Peking University | 2024-2025 | High-perf tactile simulation |
| TactGen | Various | 2024 | Zero-shot sim-to-real generation |

### Initial Priority: **HIGH**

**Justification**:
- **Impact**: Directly addresses thesis limitation of small real-world datasets
- **Feasibility**: Thesis already has MuJoCo infrastructure; upgrading to TacSL/Taccel is tractable
- **Novelty**: Applying modern sim-to-real to terrain classification is novel
- **Risk**: Simulation of soft terrains (sand, foam) remains challenging

---

## Focus Area 3: Multi-Modal Fusion and Vision-Tactile Integration

### Title and Scope Definition

**Title**: Deep Multi-Modal Fusion of Vision, Touch, and Proprioception

**Scope**: Architectures and training strategies for fusing heterogeneous sensory modalities (RGB images, depth, tactile, F/T, proprioception, IMU) for robotic perception and manipulation. Includes early, late, and attention-based fusion.

**Out of Scope**: Single-modality processing, sensor calibration.

### Key Research Questions

1. What fusion architecture (early, late, mid-level, attention-based) is optimal for vision-tactile tasks?
2. How do we handle temporal asynchrony between vision (~30 Hz) and tactile (~kHz) sensing?
3. Can attention mechanisms learn to weight modalities based on task relevance and signal quality?
4. How does multi-modal fusion improve robustness to sensor failure or degradation?

### Current State of Knowledge

**Seminal Works**:
- **Multimodal Tactile Sensing for Dexterous Housekeeping** (Nature Communications, 2024): 85.5% success with simultaneous tactile-visual vs. 55.4% vision-only
- **VLA Models Survey** (2025): Vision-Language-Action models as unified framework
- **Bridging Vision and Touch** (Frontiers, 2024): Self-supervised multimodal learning for interaction prediction
- **Thesis MAL (2022)**: Modality Attention Layer for robustness -- foundational contribution

**What's Known**:
- Tactile sensing is crucial under visual occlusion
- Vision provides global geometry; touch provides local material properties
- Feature-level fusion generally outperforms late fusion
- Attention-based modality weighting improves robustness (thesis contribution)

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on fusion architectures that gracefully degrade when modalities fail
- Few studies on fusion for locomotion (terrain classification) vs. manipulation
- Unclear how to fuse 1D time-series (F/T) with 2D images in principled way
- Need for online modality quality estimation

**Limitations**:
- Different sampling rates and data dimensionalities create engineering challenges
- Most work assumes all modalities are always available
- Computational cost of multi-modal transformers

**Contradictions**:
- Some papers show late fusion is sufficient; others show early/mid fusion is essential
- Thesis showed MAL improves robustness; recent work on VLAs uses different attention mechanisms

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| Multimodal Tactile Housekeeping | Nature Communications | 2024 | 54% improvement with tactile |
| VLA Survey | Various | 2025 | Comprehensive review |
| Multi-modal Perception-Driven Decision Making | Frontiers | 2025 | Survey of HRI applications |
| HAPTR2/MAL | Bednarek et al. (thesis) | 2022 | Modality attention layer |

### Initial Priority: **HIGH**

**Justification**:
- **Impact**: Thesis MAL contribution is highly relevant; opportunity to extend
- **Feasibility**: Strong foundation from thesis work
- **Novelty**: Applying VLA-style fusion to terrain classification is novel
- **Risk**: Engineering complexity of multi-modal systems

---

## Focus Area 4: Attention Mechanisms and Transformers for Haptic Time-Series

### Title and Scope Definition

**Title**: Transformer Architectures for Tactile and Kinesthetic Time-Series

**Scope**: Application of attention mechanisms, transformers, and modern sequence models to haptic signal processing, including classification, regression, and anomaly detection tasks.

**Out of Scope**: Non-attention-based sequence models (unless as baseline).

### Key Research Questions

1. What transformer architecture is optimal for haptic time-series (self-attention, cross-attention, sparse attention)?
2. How do we adapt transformers for real-time inference on resource-constrained robots?
3. Can attention weights provide interpretable insights into which signal features are important?
4. How do haptic transformers compare to state-space models (Mamba) for long sequences?

### Current State of Knowledge

**Seminal Works**:
- **HAPTR/HAPTR2** (Thesis, 2021-2022): First transformer for terrain classification, 30x fewer parameters than baselines
- **Advances in Transformers for Robotics** (Survey, 2024): Comprehensive review
- **CATS** (2024): Cross-attention-only time-series transformer
- **TimeFormer** (2025): Attention modulation for time-series forecasting
- **Local Attention Mechanism (LAM)** (2024): Efficient attention for time-series

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on haptic-specific positional encodings
- Few studies on transformer distillation for edge deployment
- Unclear how to combine HAPTR with foundation model pre-training
- Need for benchmarks comparing transformers, state-space models, and CNNs on haptic data

**Limitations**:
- Quadratic complexity of self-attention limits sequence length
- Transformers require more training data than CNNs
- Interpretability of attention weights is debated

**Contradictions**:
- Some papers (CATS) claim self-attention is unnecessary for time-series; others show it's essential
- Debate on whether CNNs or transformers are better for short haptic sequences

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| HAPTR2 | Bednarek et al. (thesis) | 2022 | Lightweight haptic transformer |
| Transformers for Robotics Survey | arXiv | 2024 | Comprehensive review |
| LAM | arXiv | 2024 | Local attention for time-series |
| CATS | NeurIPS | 2024 | Cross-attention only |

### Initial Priority: **MEDIUM**

**Justification**:
- **Impact**: Thesis already contributed significantly here; incremental improvements likely
- **Feasibility**: Strong foundation; clear path forward
- **Novelty**: Integrating with foundation models would add novelty
- **Risk**: Competition from state-space models (Mamba) may shift field

---

## Focus Area 5: Unsupervised and Self-Supervised Anomaly Detection for Robot Safety

### Title and Scope Definition

**Title**: Unsupervised Anomaly Detection for Tactile-Based Robot Monitoring

**Scope**: Methods for detecting anomalous contact events, sensor failures, and environmental changes using unsupervised learning on tactile/haptic data. Applications include slip detection, collision detection, and predictive maintenance.

**Out of Scope**: Supervised anomaly classification, visual anomaly detection.

### Key Research Questions

1. What latent representations enable effective anomaly detection in haptic time-series?
2. How quickly can anomaly detection trigger a safety response (<10ms)?
3. Can unsupervised methods distinguish sensor faults from genuine environmental anomalies?
4. How do we set anomaly thresholds without labeled anomaly data?

### Current State of Knowledge

**Seminal Works**:
- **Thesis DEC work** (2023): Deep embedding clustering for haptic recognition -- foundational
- **Multimodal Anomaly Detection for Object Slip** (2024): Deep autoencoder with heterogeneous sensors
- **Real-time Anomaly Detection with Flexible Latent Space** (2025): <1ms inference
- **Mahalanobis SVDD with Audio-IMU Fusion** (2025): Mobile robot anomaly detection

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on anomaly detection for legged robot terrain (thesis domain)
- Few studies combining clustering (DEC) with online anomaly detection
- Need for anomaly detection that adapts to changing operating conditions
- Unclear how to leverage foundation models for anomaly detection

**Limitations**:
- Unsupervised methods struggle with imbalanced data (normal >> abnormal)
- Threshold setting requires some labeled data in practice
- Real-time requirements constrain model complexity

**Contradictions**:
- Some papers use reconstruction error; others use latent distance -- unclear which is better
- Debate on whether autoencoders or contrastive methods are better for anomaly detection

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| Thesis DEC | Bednarek et al. | 2023 | Deep embedding clustering |
| Multimodal Slip Detection | arXiv | 2024 | Multi-sensor autoencoder |
| Flexible Latent Space | arXiv | 2025 | <1ms inference |
| Mahalanobis SVDD | arXiv | 2025 | Audio-IMU fusion |

### Initial Priority: **MEDIUM**

**Justification**:
- **Impact**: Critical for robot safety; growing industrial interest
- **Feasibility**: Thesis has DEC foundation; extension is tractable
- **Novelty**: Combining DEC with online detection and foundation models is novel
- **Risk**: Industrial adoption may require certifications

---

## Focus Area 6: Terrain Classification and Proprioceptive Perception for Legged Robots

### Title and Scope Definition

**Title**: Terrain-Aware Locomotion through Haptic and Proprioceptive Learning

**Scope**: Methods for classifying terrain and estimating terrain properties (stiffness, friction, stability) using F/T sensors, IMU, and joint proprioception on legged robots. Includes gait adaptation.

**Out of Scope**: Visual terrain classification, path planning.

### Key Research Questions

1. Can proprioception-only (IMU, joint encoders) achieve competitive terrain classification?
2. How should terrain classification inform real-time gait adaptation?
3. What is the transferability of terrain classifiers across different legged robots?
4. Can we estimate continuous terrain properties (stiffness, damping) from discrete terrain classes?

### Current State of Knowledge

**Seminal Works**:
- **HAPTR/HAPTR2** (Thesis, 2021-2022): State-of-the-art F/T terrain classification
- **ProNav** (2024): Proprioceptive traversability estimation (IEEE RA-L)
- **STERLING** (2024): Self-supervised terrain representation with multi-modal data
- **Advances in Terrain Classification** (Wiley, 2025): Comprehensive survey
- **Teacher-Student Networks for Terrain** (2025): Proprioception-only quadruped training

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on soft/deformable terrain (sand, mud) estimation
- Few studies on continuous property estimation vs. discrete classification
- Need for terrain classifiers that transfer across robots (ANYmal -> Spot)
- Unclear how to fuse foot tactile sensing with body IMU

**Limitations**:
- Most datasets are from flat terrain; slopes and stairs underrepresented
- Real-time requirements limit model complexity
- Ground truth labeling for continuous terrain properties is difficult

**Contradictions**:
- Some papers show F/T is essential; others show proprioception-only is sufficient
- Debate on whether to classify terrain or directly predict gait parameters

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| HAPTR2 | Bednarek et al. (thesis) | 2022 | Transformer terrain classification |
| ProNav | IEEE RA-L | 2024 | Proprioceptive traversability |
| STERLING | Various | 2024 | Self-supervised multi-modal |
| Terrain Classification Survey | Wiley | 2025 | Comprehensive review |

### Initial Priority: **HIGH**

**Justification**:
- **Impact**: Core thesis contribution; direct path to extension
- **Feasibility**: Datasets and infrastructure available
- **Novelty**: Combining HAPTR with foundation models and self-supervision is novel
- **Risk**: Competition from RL-based locomotion methods that implicitly learn terrain

---

## Focus Area 7: Diffusion Models for Contact-Rich Manipulation

### Title and Scope Definition

**Title**: Diffusion Policies for Tactile-Guided Robotic Manipulation

**Scope**: Application of diffusion models to generate manipulation trajectories conditioned on tactile feedback, including force-domain policies and reactive control.

**Out of Scope**: Vision-only diffusion policies, non-manipulation tasks.

### Key Research Questions

1. How should tactile signals be encoded as conditioning for diffusion policies?
2. Can diffusion models generate force profiles for contact-rich tasks (insertion, wiping)?
3. What is the latency-accuracy tradeoff for diffusion policies in real-time manipulation?
4. How do tactile diffusion policies compare to direct policy learning (BC, RL)?

### Current State of Knowledge

**Seminal Works**:
- **Diffusion Policy** (Chi et al., 2023): Foundational visuomotor diffusion
- **TacDiffusion** (2024): Force-domain diffusion policy for precise tactile manipulation
- **Reactive Diffusion Policy** (2025): Slow-fast visual-tactile policy learning
- **Diffusion Models for Manipulation Survey** (Frontiers, 2025): Comprehensive review
- **BiTLA** (2025): Bimanual tactile-language-action model

### Identified Gaps, Limitations, and Contradictions

**Gaps**:
- Limited work on diffusion for locomotion (thesis domain)
- Few studies on diffusion with F/T sensor conditioning
- Need for efficient diffusion inference (<100ms)
- Unclear how to combine diffusion with terrain classification

**Limitations**:
- Diffusion inference is slow (multiple denoising steps)
- Training requires large demonstration datasets
- Real-time control is challenging

**Contradictions**:
- Some papers show diffusion outperforms BC; others show comparable performance
- Debate on whether diffusion is necessary or if simpler models suffice

### Relevant Recent Papers/Authors (2023-2026)

| Paper/Project | Authors/Lab | Year | Key Contribution |
|--------------|-------------|------|------------------|
| TacDiffusion | Various | 2024 | Force-domain diffusion |
| Reactive Diffusion Policy | arXiv | 2025 | Visual-tactile policy |
| Diffusion Survey | Frontiers | 2025 | Comprehensive review |
| BiTLA | Various | 2025 | Bimanual tactile-language-action |

### Initial Priority: **MEDIUM**

**Justification**:
- **Impact**: Hot topic; high potential for manipulation
- **Feasibility**: Requires significant infrastructure; further from thesis foundation
- **Novelty**: Applying to terrain-aware locomotion would be very novel
- **Risk**: Inference latency may preclude real-time locomotion control

---

## Summary: Initial Ranking of Focus Areas

| Rank | Focus Area | Priority | Impact | Feasibility | Novelty |
|------|-----------|----------|--------|-------------|---------|
| 1 | Foundation Models for Tactile | HIGH | High | Medium | High |
| 2 | Sim-to-Real Transfer | HIGH | High | High | Medium |
| 3 | Multi-Modal Fusion | HIGH | High | High | Medium |
| 4 | Terrain Classification for Legged Robots | HIGH | High | High | Medium |
| 5 | Attention/Transformers for Haptic | MEDIUM | Medium | High | Low |
| 6 | Unsupervised Anomaly Detection | MEDIUM | Medium | Medium | Medium |
| 7 | Diffusion Models for Manipulation | MEDIUM | High | Low | High |

---

## Recommended Next Steps

1. **Immediate**: Deep dive into Sparsh, TacSL, and recent terrain classification papers to identify specific integration points with thesis work
2. **Short-term**: Design experiments combining HAPTR architecture with self-supervised pre-training
3. **Medium-term**: Explore sim-to-real transfer using TacSL/Taccel for terrain classification
4. **Long-term**: Develop a tactile foundation model for legged robot perception that transfers across robots and environments

---

## Key Sources and References

### Surveys and Reviews
- [Multimodal Perception-Driven Decision-Making for HRI](https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2025.1604472/full) (Frontiers, 2025)
- [Tactile Robotics: An Outlook](https://arxiv.org/html/2508.11261v1) (arXiv, 2025)
- [Foundation Models in Robotics](https://journals.sagepub.com/doi/10.1177/02783649251390579) (IJRR, 2025)
- [Diffusion Models for Robotic Manipulation Survey](https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2025.1606247/full) (Frontiers, 2025)
- [Advances in Terrain Classification](https://onlinelibrary.wiley.com/doi/10.1002/rob.22586) (JFR, 2025)

### Self-Supervised and Foundation Models
- [Sparsh: Self-supervised Touch Representations](https://arxiv.org/html/2410.24090v1) (arXiv, 2024)
- [MViTac: Multimodal Visual-Tactile Contrastive Learning](https://arxiv.org/abs/2401.12024) (arXiv, 2024)
- [Transferable Tactile Transformers](https://arxiv.org/html/2406.13640v1) (arXiv, 2024)

### Sim-to-Real and Simulation
- [TacSL: Visuotactile Sensor Simulation Library](https://arxiv.org/abs/2408.06506) (arXiv, 2024)
- [SingleS2R: Single Sample Sim-to-Real](https://www.sciencedirect.com/science/article/abs/pii/S1566253524001684) (Information Fusion, 2024)

### Multi-Modal Fusion
- [Multimodal Tactile Sensing for Dexterous Housekeeping](https://www.nature.com/articles/s41467-024-51261-5) (Nature Communications, 2024)
- [Bridging Vision and Touch](https://www.frontiersin.org/journals/robotics-and-ai/articles/10.3389/frobt.2024.1407519/full) (Frontiers, 2024)

### Hardware and Sensors
- [GelSight and Meta AI: Digit 360](https://www.gelsight.com/gelsight-and-meta-ai-introduce-digit-360-tactile-sensor/) (2024)
- [Training Tactile Sensors to Learn from Each Other](https://www.nature.com/articles/s41467-026-68753-1) (Nature Communications, 2026)

### Anomaly Detection
- [Multimodal Anomaly Detection for Object Slip](https://arxiv.org/html/2403.03563v1) (arXiv, 2024)
- [Real-time Anomaly Detection with Flexible Latent Space](https://arxiv.org/html/2504.11170v2) (arXiv, 2025)

### Terrain and Locomotion
- [Terrain Classification with Proprioception](https://www.mdpi.com/2079-9292/14/6/1231) (Electronics, 2025)
- [Proprioceptive Terrain Mapping for Planetary Exploration](https://arxiv.org/html/2510.18986v1) (arXiv, 2025)

### Diffusion Models
- [TacDiffusion: Force-domain Diffusion Policy](https://arxiv.org/pdf/2409.11047) (arXiv, 2024)
- [Reactive Diffusion Policy](https://arxiv.org/pdf/2503.02881) (arXiv, 2025)

---

*Analysis generated: 2026-02-05*
*Thesis context: "Combining interaction and perception to determine the physical properties of the robot environment" (Bednarek, 2023)*
