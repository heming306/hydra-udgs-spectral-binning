#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=230GB
#SBATCH --job-name='Hydra-HI' #updated name
#SBATCH --distribution=plane=1
#SBATCH --output=4_hydra-udgs_selfcal2-%j-stdout.log ##updated names
#SBATCH --error=4_hydra-udgs_selfcal2-%j-stderr.log ## updated names
#SBATCH --partition=Main
#SBATCH --time="14-00:00:00"
#SBATCH --mail-user="mkdnaz002@myuct.ac.za"
#SBATCH --mail-type="START,END,FAIL"

#use last four digits of mosaic id for job-name

cd /scratch3/users/nazir/hydra-udgs/ ## updated naming
venv=/scratch3/users/nazir/hydra-udgs/CARACal_all/CARACal-venv-19Sep2022
source $venv/bin/activate
caracal -c 4_hydra-udgs-selfcal2.yml --container-tech singularity -sid /software/astro/caracal/STIMELA_IMAGES_1.7.5
deactivate #closing caracal
