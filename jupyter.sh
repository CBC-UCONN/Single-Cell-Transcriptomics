#!/bin/bash
#SBATCH -J jupyter-notebook
#SBATCH --partition mcbstudent 
#SBATCH --qos mcbstudent
#SBATCH -c 1
#SBATCH --mem=8gb
#SBATCH -t 0-6:00:00
#SBATCH -o %x_%j.out

# get info required to establish tunnel
port=$(shuf -i8000-9999 -n1)
node=$(hostname -s)
user=$(whoami)
cluster=xanadu-submit-int.cam.uchc.edu
token=$(echo $RANDOM | md5sum | head -c 30)
CondaEnvironment=${1}

# print tunneling instructions to log
echo -e "
Command to create ssh tunnel:
ssh -N -L ${port}:${node}:${port} ${user}@${cluster}

Use a Browser on your local machine to go to:
localhost:${port}/lab?token=${token}  (prefix w/ https:// if using password)


"

# Activate conda environment
source ~/.bashrc   # when using a local conda install, this is required to add conda to your path
mamba activate ${CondaEnvironment}  # loading conda environment containing jupyter and relevant software


# Run jupyter
export JUPYTER_TOKEN=$token
jupyter lab --no-browser --port=${port} --ip=${node}
