# Collaborative Workflow Example: RStudio × GitHub × Overleaf 

This repository provides a minimal, fully reproducible example of how to organize collaborative research work using:
	•	GitHub → version control & collaboration on code
	•	RStudio → data cleaning, analysis, automatic generation of figures/tables
	•	Overleaf → writing papers and presentations that pull results directly from the repo

It is intended as a template for PhD students, coauthors, and research teams who want a clean, consistent, automated workflow for empirical work.

## Repository Structure

```
2_Collaborative_Work/
|
├── 2_Collaborative_Work.Rproj       # RStudio project (recommended entry point)
│
├── code/
│   ├── 1_code_cleaning/             # Scripts for data import & cleaning
│   └── 2_code_analysis/             # Scripts for figures, tables & analysis
│
├── data_in/                         # Raw or input data (you can decide not to track it on GitHub)
├── data_out/                        # Cleaned data exported by R scripts (you can decide not to track it on GitHub)
│
└── paper_presentation/
    ├── figures/                     # Figures automatically exported by R
    ├── tables/                      # Tables automatically exported by R (.tex)
    ├── presentation.tex             # Example Beamer presentation
    └── paper.tex                    # Placeholder for a future research paper
```

Not that this structure is an example of a repository for which data can be shared and is not too large. In a situation for which data cannot be placed in a repo, you must find another general repo structure such as placing your data folders and .Rproj outside the repo but leaving the code folder inside.

## Purpose of This Repository

This repository demonstrates how to separate tasks in a collaborative research project:

1. R code lives in code/ and is version-controlled on GitHub
	•	Every coauthor can work on the same R scripts.
	•	Data cleaning and analysis are reproducible.
	•	Figures and tables are generated automatically from R.

2. Outputs (figures & tables) are exported into paper_presentation/
	•	Figures → paper_presentation/figures/
	•	Tables → paper_presentation/tables/

These folders serve as the single source of truth for Overleaf.

3. Overleaf has Github integration

Instead of manually uploading figures/tables to Overleaf, we use GitHub as the intermediary:

R generates outputs → GitHub tracks them → Overleaf fetches them.

The Overleaf project associated with this example is:

🔗 https://www.overleaf.com/read/sksxfsykywsw

The .tex files on Overleaf simply reference the files stored in this repository, e.g.:
```
\includegraphics{figures/meetings_satisfaction.png}

\input{tables/desc_stats.tex}
```
As long as filenames remain the same, the LaTeX code on Overleaf never needs to be changed so that figures and tables can be updated directly in R.

## How the Workflow Works in Practice 

### Step 1 — Edit or expand R scripts

You modify the code inside code/:
	•	clean data
	•	run analyses
	•	produce tables and figures

### Step 2 — R automatically exports all outputs 

Running the R scripts regenerates:
	•	updated .png or .pdf figures
	•	updated .tex tables

These are saved in paper_presentation/figures/ and paper_presentation/tables/.

### Step 3 — Commit & push to GitHub

Once committed, the updated results are immediately available in your Github repo. You only need to pull them to Overleaf with the Github integration of Overleaf.

### Step 4 — Overleaf stays stable

You write your paper/presentation in Overleaf by calling the figures and tables with \includegraphics{} and \input{} commands. You don't have to import manually the figures and tables into Overleaf once the LaTeX code is table, because all file paths stay the same.
The content (figures/tables) updates automatically via GitHub when you modify it in R.

### Result: a fully synchronized workflow
	•	edit R code
	•	run
	•	commit and push
	•	Pull changes from Github to Overleaf so that Overleaf updates automatically
	•	coauthors always see the latest results

No more:
	•	“final_table2_v3_ok_def.tex”
	•	“last_new_figure_updated_bis.png”
	•	emailing PDFs between coauthors
	•	inconsistencies between versions


## Example Included in This Repository

The project includes:
	•	a small synthetic dataset
	•	a toy "analysis_code“ exporting a figure, a descriptive statistics table and a regression analysis table
	•	a Beamer presentation illustrating the workflow

This is intended as a didactic example showing how assets move from: RStudio → GitHub → Overleaf → PDF output

## Contribution & Extensions

This repo can be extended to:
	•	full papers with multiple sections
	•	more complex analyses 
	•	multi-author workflows using Git branching
	•	fully automated pipelines using {targets} or {drake}
	•	Quarto integration for unified R+LaTeX reports (Rmarkdown is used here)
	•	replication packages for journal submissions

Pull requests & issues are welcome.

## Contact

Maintainers: Alexandre Touw and Florence Lecuit
Feel free to reuse or adapt this structure for your own research collaborations.
