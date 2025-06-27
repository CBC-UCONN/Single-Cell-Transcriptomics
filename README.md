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
Code for the workshop can be downloaded from https://github.com/CBC-UCONN/Genome_Assembly/releases.

Copy the url for the version you wish to download and use `wget` or `curl` to download it.

To download the most recent version:

```bash
wget wget https://github.com/CBC-UCONN/Genome_Assembly/archive/refs/tags/2025.06.zip
```
One downloaded, unzip the file:

```bash
unzip 2025.06.zip
``` 

If you do not wish to run the entire pipeline (scripts 01-05), you will need to create symlinks to the pre-existing results files.

Within the Single-Cell-Transcriptomics directory, run the following commands to create the necessary symlinks:
```bash 
ln -s /core/cbc/tutorials/workshopdirs/Single-Cell-Transcriptomics/leukemia/results/ leukemia/results
```