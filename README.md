# Single Cell Transcriptomics Workshop

## Slides
### Day 1
[Introduction to Single Cell Transcriptomics](https://CBC-UCONN.github.io/Single-Cell-Transcriptomics/slides/01_introduction.html)

[Data Processing](https://CBC-UCONN.github.io/Single-Cell-Transcriptomics/slides/02_data_processing.html)


### Days 2 & 3
[Single Cell RNA-Seq Analysis Tools](https://CBC-UCONN.github.io/Single-Cell-Transcriptomics/slides/03_tools.html)

[Installing & Configuring Mamba](https://CBC-UCONN.github.io/Single-Cell-Transcriptomics/slides/04_mamba.html)

[Starting a Jupyter notebook](https://CBC-UCONN.github.io/Single-Cell-Transcriptomics/slides/05_jupyter_notebook.html)

[Single Cell RNA-Seq Analysis](https://CBC-UCONN.github.io/Single-Cell-Transcriptomics/slides/06_analysis.html)


## Getting Workshop Code
To get the code for the workshop, you can clone the repository using the following command:

```bash
git clone https://github.com/CBC-UCONN/Single-Cell-Transcriptomics.git
```

If you do not wish to run the entire pipeline (scripts 01-05), you will need to create symlinks to the pre-existing results files.

Within the Single-Cell-Transcriptomics directory, run the following commands to create the necessary symlinks:
```bash 
ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/leukemia/results/ leukemia/results
```