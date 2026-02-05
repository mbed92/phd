# Optimized Prompt (Clavix Enhanced)

Create a concise, visual-first README.md for a PhD thesis on haptic robotic perception. The README must fit approximately one screen and be scannable in under 60 seconds.

## Structure

1. **Header**: Thesis title + 1-sentence summary of the domain (robots learning to "feel")
2. **Key Contributions** (3 items, achievement-focused language):
   - **HAPTR**: First transformer for terrain classification - 30x parameter reduction
   - **MAL**: Modality Attention Layer for fusing force/torque + IMU sensors
   - **DEC Adaptation**: Applied Deep Embedding Clustering to tactile sensing for exploratory material analysis (adapted existing method to new domain, not invented)
3. **Future Directions** (3 items):
   - Foundation Models for Tactile sensing
   - Terrain Classification (cross-robot transfer, soft terrains)
   - Multi-Modal Fusion (vision + touch)
4. **Research Pipeline** (brief showcase):
   - AI-powered 3-stage discovery pipeline for exploring research directions
   - Flow: `research-architect` (opus) → `hypothesis-tournament` (haiku) → `scientific-peer-reviewer` (sonnet)
   - Keep very brief - 2-3 sentences max showing the tooling exists
4. **Visual showcase**: Include images inline to break up text

## Required Images (use relative paths)
- `sources/images/transformers/overview.png` - Robot system overview
- `sources/images/transformers/modality_attention.png` - MAL architecture
- `sources/images/transformers/attentiongetter.png` - Terrain classification visualization
- `sources/images/gaining_sense_of_touch/overview.png` - Neural network architecture
- `sources/images/robotic_touch/robot_touching_overview.jpg` - Physical interaction with materials

## Constraints
- **Tone**: Confident, achievement-focused ("Developed", "Demonstrated", "Achieved")
- **Audience**: Industry researchers + general visitors (minimal jargon)
- **Length**: As short as possible - every word must earn its place
- **Format**: GitHub-flavored Markdown

## Output
A single README.md file ready to place in the project root.

---

## Optimization Improvements Applied

1. **[STRUCTURED]** - Reorganized into clear sections: header → contributions → future → visuals
2. **[CLARIFIED]** - Specified exact image paths and their purpose
3. **[SCOPED]** - Added concrete constraint: "fits one screen, scannable in 60 seconds"
4. **[ACTIONABILITY]** - Converted vague "achievement-focused" into specific verbs: "Developed", "Demonstrated", "Achieved"
5. **[COMPLETENESS]** - Added output specification (single README.md file) and format (GitHub Markdown)

---
*Optimized by Clavix on 2026-02-05. This version is ready for implementation.*
