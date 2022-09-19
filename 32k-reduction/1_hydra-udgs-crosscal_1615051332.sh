#!/bin/bash
#SBATCH --job-name='Hydra-HI' #updated name
#SBATCH --time=2-12:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=230GB
#SBATCH --output=1_hydra-udgs_crosscal_1615051332-%j-stdout.log ##updated names
#SBATCH --error=1_hydra-udgs_crosscal_1615051332-%j-stderr.log ## updated names

#use last four digits of mosaic id for job-name

cd /scratch3/users/nazir/hydra-udgs/ ## updated naming
venv=/scratch3/users/nazir/hydra-udgs/CARACal/CARACal-venv-18Aug2022
source $venv/bin/activate
caracal -c 1_hydra-udgs_crosscal_1615051332.yml --container-tech singularity -sid /software/astro/caracal/STIMELA_IMAGES_1.7.0
deactivate #closing caracal
