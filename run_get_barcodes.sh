#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=GetBarcodes
#SBATCH --time=8:00:00   # HH/MM/SS 
#SBATCH --mem=100G   # memory requested, units available: K,M,G,T  128g
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END 


# Define usage function
usage() {
  echo "Usage: $0 <sampleID> <fqFolder>"
  exit 1
}

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
  usage
fi


conda activate my_r_env

log_name="barcoding.log"
echo $SLURM_JOB_ID "Starting at:" `date` >> $log_name

# Parse command line arguments
sample=$1
fqFolder=$2
bcFile="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/barcodes/${sample}_celltype2barcode.txt"
outputFolder="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/per_sample_fastq/${sample}_fastq"

# Run R script with command line arguments
Rscript get_barcodes.R $fqFolder $bcFile $outputFolder


echo "=========== Script terminated ==========="

echo $SLURM_JOB_ID "Finished at:" `date` >> $log_name
echo " " >> $log_name
exit
