#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=Mapping
#SBATCH --time=8:00:00   # HH/MM/SS  12h
#SBATCH --mem=100G   # memory requested, units available: K,M,G,T  248g
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

# Make a output dir for this sample if doesn't exist and cd into it 
mkdir -p mmalign/${sample}_mmalign && cd $_

log_name="mapping.log"
echo $SLURM_JOB_ID "Starting at:" `date` >> $log_name


Rscript /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/mamalign.R $sample

echo "=========== Script terminated ==========="

echo $SLURM_JOB_ID "Finished at:" `date` >> $log_name
echo " " >> $log_name
exit

