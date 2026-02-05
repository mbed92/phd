# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

PhD dissertation in LaTeX: "Combining interaction and perception to determine the physical properties of the robot environment" by Michał Bednarek. The thesis focuses on haptic robotic perception using deep learning methods for material classification, stiffness estimation, and terrain recognition.

## Build Commands

```bash
# Compile the thesis (from sources/ directory)
cd sources && pdflatex main.tex

# Full build with bibliography and glossary
cd sources && pdflatex main.tex && bibtex main && makeglossaries main && pdflatex main.tex && pdflatex main.tex

# Quick recompile (after initial full build)
cd sources && pdflatex main.tex
```

## Project Structure

- `sources/main.tex` - Main document containing all thesis content (chapters embedded inline)
- `sources/bib.bib` - Bibliography database (BibTeX)
- `sources/glossary.tex` - Acronym definitions using `glossaries` package
- `sources/shortcuts.tex` - LaTeX math macros for robotics notation (SE(3), IMU, transformations)
- `sources/IEEEtran.bst` - IEEE citation style
- `sources/images/` - Figures organized by chapter:
  - `gaining_sense_of_touch/` - Stiffness estimation figures
  - `robotic_touch/` - Material classification figures
  - `transformers/` - HAPTR architecture figures
  - `on_robustness/` - Multi-modal fusion figures
  - `unsupervised/` - Clustering/DEC figures

## Document Structure

The thesis uses `report` class with `\part{}` and `\chapter{}` divisions:
- Part I: Introduction (motivation, problem statement)
- Part II: Methods (material recognition, terrain classification, multi-modal fusion)
- Part III: Experiments (corresponding experimental results)
- Conclusions

## Key LaTeX Conventions

**Custom environments:**
- `\begin{notefromauthor}...\end{notefromauthor}` - Boxed notes about publication sources

**Acronyms (defined in glossary.tex):**
- Use `\acrshort{imu}`, `\acrfull{cnn}`, `\acrlong{lstm}` for acronyms
- Common: `ft` (Force/Torque), `imu`, `cnn`, `rnn`, `lstm`, `haptr`, `mal`, `dec`

**Math shortcuts (from shortcuts.tex):**
- `\ie`, `\eg`, `\cf` - Latin abbreviations
- `\Real`, `\SE`, `\SO` - Mathematical sets/groups
- `\T`, `\R` - Transformation/rotation matrices
- `\acc`, `\rotvel`, `\vel`, `\bias` - IMU-related symbols
- `\calM`, `\calK`, `\calD` - Calligraphic fonts for sets

**Copyright notices for reused figures:**
- `\ieee{2019}` → "(© 2019 IEEE)"
- `\elsevier{2019}` → "(© 2019 ELSEVIER)"
- `\mdpi{2019}` → "(2019 MDPI)"

## Language

The document is primarily in English with Polish abstract (`\begin{otherlanguage}{polish}`). Uses `babel` package with `[polish, english]` options.
