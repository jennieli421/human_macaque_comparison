#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=Mapping
#SBATCH --time=12:00:00   # HH/MM/SS  12h
#SBATCH --mem=248G   # memory requested, units available: K,M,G,T  248g
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END


conda activate my_r_env

log_name="mapping.log"
echo "Starting at:" `date` >> $log_name
echo "This is job #:" $SLURM_JOB_ID >> $log_name
echo "Running on node:" `hostname` >> $log_name
echo "Running on cluster:" $SLURM_CLUSTER_NAME >> $log_name
echo "This job was assigned the temporary (local) directory:" $TMPDIR >> $log_name


Rscript mapping.R

echo "=========== Script terminated ==========="
echo "Ending at:" `date` >> $log_name
echo " " >> $log_name
exit
