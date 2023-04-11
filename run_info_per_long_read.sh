#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=infolong
#SBATCH --time=8:00:00   # HH/MM/SS 
#SBATCH --mem=50G   # memory requested, units available: K,M,G,T 
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END 


# Define usage function
usage() {
  echo "Usage: $0 <sampleID>"
  exit 1
} 

# Check for correct number of arguments
if [ "$#" -ne 1 ]; then
  usage
fi

conda activate my_r_env

# Parse command line arguments
sample=$1

# cd into the directory with LRoutput
cd /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/mmalign/${sample}_mmalign

log_name="infoPerLongRead.log"
echo $sample $SLURM_JOB_ID >> $log_name
echo $SLURM_JOB_ID "Starting at:" `date` >> $log_name

# Run R script 
Rscript /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/info_per_long_read.R $sample


echo "=========== Script terminated ==========="

echo $SLURM_JOB_ID "Finished at:" `date` >> $log_name
echo " " >> $log_name
exit