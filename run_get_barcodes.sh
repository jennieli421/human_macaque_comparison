#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=GetBarcodes
#SBATCH --time=8:00:00   # HH/MM/SS 
#SBATCH --mem=12G   # memory requested, units available: K,M,G,T  128g
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END 


conda activate my_r_env

log_name="barcoding.log"
echo "Starting at:" `date` >> $log_name
echo "This is job #:" $SLURM_JOB_ID >> $log_name
echo "Running on node:" `hostname` >> $log_name
echo "Running on cluster:" $SLURM_CLUSTER_NAME >> $log_name
echo "This job was assigned the temporary (local) directory:" $TMPDIR >> $log_name


# Parse command line arguments
fqFolder=$1
bcFile=$2
outputFolder=$3


# Run R script with command line arguments
Rscript get_barcodes.R $fqFolder $bcFile $outputFolder

echo "=========== Script terminated ==========="

echo "Finished at:" `date` >> $log_name
echo " " >> $log_name
exit
