#!/bin/bash
#SBATCH --job-name='Hydra-z'
#SBATCH --time=72:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=14
#SBATCH --mem=100GB
#SBATCH --output=2_hydra-udgs_high_z_1615051332-%j-stdout.log
#SBATCH --error=2_hydra-udgs_high_z_1615051332-%j-stderr.log

#use last four digits of mosaic id for job-name

cd /idia/projects/hydra-udgs/HaoChen/hydra-udgs_high_z
venv=/idia/projects/hydra-udgs/CARACal_all/CARACal-venv-18Oct2021
source $venv/bin/activate
caracal -c 2_hydra-udgs_high_z_1615051332.yml --container-tech singularity -sid /software/astro/caracal/STIMELA_IMAGES_1.7.0
deactivate #closing caracal

