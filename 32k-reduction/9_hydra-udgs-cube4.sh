#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=230GB
#SBATCH --job-name='Hydra-HI' #updated name
#SBATCH --distribution=plane=1
#SBATCH --output=9_hydra-udgs_cube4-%j-stdout.log ##updated names
#SBATCH --error=9_hydra-udgs_cube4-%j-stderr.log ## updated names
#SBATCH --partition=Main
#SBATCH --time="3-12:00:00"
#SBATCH --mail-user="mkdnaz002@myuct.ac.za"
#SBATCH --mail-type="START,END,FAIL"

#use last four digits of mosaic id for job-name

cd /scratch3/users/nazir/hydra-udgs/ ## updated naming
venv=/scratch3/users/nazir/hydra-udgs/CARACal_all/CARACal-venv-19Sep2022
source $venv/bin/activate
caracal -c 9_hydra-udgs-cube4.yml --container-tech singularity -sid /software/astro/caracal/STIMELA_IMAGES_1.7.5
deactivate #closing caracal
