#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=mapnfilter
#SBATCH --time=8:00:00   # HH/MM/SS 
#SBATCH --mem=100G   # memory requested, units available: K,M,G,T 
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

# cd into the directory with MMoutput and Misc
cd /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/mmalign/${sample}_mmalign

log_name="mapAndFilter.log"
echo $sample $SLURM_JOB_ID >> $log_name
echo $SLURM_JOB_ID "Starting at:" `date` >> $log_name

# Run R script 
Rscript /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/map_and_filter.R 


echo "=========== Script terminated ==========="

echo "Generating summary for MapAndFilter outputs" 
cd /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/mmalign/${sample}_mmalign/LRProcessingOutput
echo "File Name    Number of Lines" > summary.txt 
for file in mapping.bestperRead.bam mapping.bestperRead.RNAdirection.withConsensIntrons.transcriptWise.genes.gz CagePolyA.complete.mapping.bestperRead.RNAdirection.withConsensIntrons.transcriptWise.genes.gz newIsoforms_vs_Anno_ignoreAnno/CagePolyA.complete.stretches.gz newIsoforms_vs_Anno_ignoreAnno/exonStretches.gz; do 
   if [[ "$file" == *.bam ]]; then 
      echo "$file    $(samtools view -c $file)" >> summary.txt ; 
   else 
      echo "$file    $(zcat $file | wc -l)" >> summary.txt ; 
   fi 
done


echo $SLURM_JOB_ID "Finished at:" `date` >> $log_name
echo " " >> $log_name
exit
