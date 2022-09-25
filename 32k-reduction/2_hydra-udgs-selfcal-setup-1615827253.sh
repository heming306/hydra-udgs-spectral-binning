#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=30
#SBATCH --mem=230GB
#SBATCH --job-name='Hydra-HI' #updated name
#SBATCH --distribution=plane=1
#SBATCH --output=1_hydra-udgs_selfcal_setup_1615827253-%j-stdout.log ##updated names
#SBATCH --error=1_hydra-udgs_selfcal_setup_1615827253-%j-stderr.log ## updated names
#SBATCH --partition=Main
#SBATCH --time="2-12:00:00"
#SBATCH --mail-user="mkdnaz002@myuct.ac.za"
#SBATCH --mail-type="START,END,FAIL"

#use last four digits of mosaic id for job-name

cd /scratch3/users/nazir/hydra-udgs/ ## updated naming
venv=/scratch3/users/nazir/hydra-udgs/CARACal/CARACal-venv-18Aug2022
source $venv/bin/activate
caracal -c 2_hydra-udgs-selfcal-setup-1615827253.yml --container-tech singularity -sid /software/astro/caracal/STIMELA_IMAGES_1.7.0
deactivate #closing caracal