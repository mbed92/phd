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


<!-- CLAVIX:START -->
## Clavix Integration

This project uses Clavix for prompt improvement and PRD generation. The following slash commands are available:

> **Command Format:** Commands shown with colon (`:`) format. Some tools use hyphen (`-`): Claude Code uses `/clavix:improve`, Cursor uses `/clavix-improve`. Your tool autocompletes the correct format.

### Prompt Optimization

#### /clavix:improve [prompt]
Optimize prompts with smart depth auto-selection. Clavix analyzes your prompt quality and automatically selects the appropriate depth (standard or comprehensive). Use for all prompt optimization needs.

### PRD & Planning

#### /clavix:prd
Launch the PRD generation workflow. Clavix will guide you through strategic questions and generate both a comprehensive PRD and a quick-reference version optimized for AI consumption.

#### /clavix:plan
Generate an optimized implementation task breakdown from your PRD. Creates a phased task plan with dependencies and priorities.

#### /clavix:implement
Execute tasks or prompts with AI assistance. Auto-detects source: tasks.md (from PRD workflow) or prompts/ (from improve workflow). Supports automatic git commits and progress tracking.

Use `--latest` to implement most recent prompt, `--tasks` to force task mode.

### Session Management

#### /clavix:start
Enter conversational mode for iterative prompt development. Discuss your requirements naturally, and later use `/clavix:summarize` to extract an optimized prompt.

#### /clavix:summarize
Analyze the current conversation and extract key requirements into a structured prompt and mini-PRD.

### Refinement

#### /clavix:refine
Refine existing PRD or prompt through continued discussion. Detects available PRDs and saved prompts, then guides you through updating them with tracked changes.

### Agentic Utilities

These utilities provide structured workflows for common tasks. Invoke them using the slash commands below:

- **Verify** (`/clavix:verify`): Check implementation against PRD requirements. Runs automated validation and generates pass/fail reports.
- **Archive** (`/clavix:archive`): Archive completed work. Moves finished PRDs and outputs to archive for future reference.

**When to use which mode:**
- **Improve mode** (`/clavix:improve`): Smart prompt optimization with auto-depth selection
- **PRD mode** (`/clavix:prd`): Strategic planning with architecture and business impact

**Recommended Workflow:**
1. Start with `/clavix:prd` or `/clavix:start` for complex features
2. Refine requirements with `/clavix:refine` as needed
3. Generate tasks with `/clavix:plan`
4. Implement with `/clavix:implement`
5. Verify with `/clavix:verify`
6. Archive when complete with `/clavix:archive`

**Pro tip**: Start complex features with `/clavix:prd` or `/clavix:start` to ensure clear requirements before implementation.
<!-- CLAVIX:END -->
