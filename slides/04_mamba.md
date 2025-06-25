
# Start interactive session

```
srun --partition=mcbstudent --qos=mcbstudent --mem=16GB --pty bash
```

# Download miniforge installer
```
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
```

# Install miniforge
```bash
bash Miniforge3.sh
```

1. Agree to license terms (yes)
2. Choose installation path (default is fine)
3. Choose whether to initialize mamba (select "yes")

```bash
source ~/.bashrc
```

# Create environment
```
mamba create -n single-cell python=3.11
```
1. Confirm changes (y)

# Activate environment
```
mamba activate single-cell
```

# Install dependencies
```
mamba install -c conda-forge -c bioconda jupyter numpy"<2" scanpy \
python-igraph leidenalg seaborn scipy scikit-image scikit-misc bbknn \
celltypist rpy2 anndata2ri=1.1 r-soupx bioconda::bioconductor-scater \ bioconda::bioconductor-scdblfinder bioconda::bioconductor-scry 

pip install scarches
```

