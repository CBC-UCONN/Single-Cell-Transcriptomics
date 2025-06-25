
# Start interactive session

Do this anytime you want to create a Mamba environment or install packages. These tasks are resource-intensive and should not be done on the login node.

```
srun --partition=mcbstudent --qos=mcbstudent --mem=16GB --pty bash
```

# Install Mamba
These steps only need to be done once.

## Download miniforge installer
```
wget -O Miniforge3.sh "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh"
```

## Install miniforge
```bash
bash Miniforge3.sh
```

1. Agree to license terms (yes)
2. Choose installation path (default is fine)
3. **Important**: Choose whether to initialize mamba (select "yes")

```bash
source ~/.bashrc
```

# Creating an environment
Once installed, you can create environments

```bash
mamba create -n single-cell python=3.11
```
1. Confirm changes (y)

# Activating an environment
Once you have created an environment, you can activate it:

```bash
mamba activate single-cell
```

# Installing packages
Once an environment is activated, you can install packages. The following commands install the necessary packages for this workshop.

```
mamba install -c conda-forge -c bioconda jupyter numpy"<2" scanpy \
  python-igraph leidenalg seaborn scipy scikit-image scikit-misc bbknn \
  celltypist rpy2 anndata2ri=1.1 r-soupx bioconda::bioconductor-scater \ 
  bioconda::bioconductor-scdblfinder bioconda::bioconductor-scry 

pip install scarches
```
 
