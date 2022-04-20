#!/bin/bash
#SBATCH --job-name='Hydra-HI' #updated name
#SBATCH --time=120:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=230GB
#SBATCH --output=3_hydra-udgs_HI_combined-%j-stdout.log ##updated names
#SBATCH --error=3_hydra-udgs_HI_combined-%j-stderr.log ## updated names

#use last four digits of mosaic id for job-name

cd /idia/projects/hydra-udgs/Nazir/hydra-udgs-HI-spec-binn ## updated naming
venv=/idia/projects/hydra-udgs/CARACal_all/CARACal-venv-18Oct2021
source $venv/bin/activate
caracal -c 3_hydra-udgs_HI_combined.yml --container-tech singularity -sid /software/astro/caracal/STIMELA_IMAGES_1.7.0
deactivate #closing caracal
