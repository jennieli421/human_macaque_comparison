#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=casecontrol
#SBATCH --time=24:00:00   # HH/MM/SS 
#SBATCH --mem=50G   # memory requested, units available: K,M,G,T 
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END 


# Define usage function
usage() {
  echo "Usage: $0 <caseList> <controlList> <outdir>"
  exit 1
} 

# Check for correct number of arguments
if [ "$#" -ne 3 ]; then
  usage
fi

conda activate my_r_env

# Parse command line arguments
caseList=$1     # the path to the gz allinfofile of a cell type
controlList=$2  # path to the gz allinfo of another cell type
outdir=$3 

#### ! must be in the output folder before run 

# cd into the directory 
cd $outdir


script="/athena/tilgnerlab/scratch/nab4004/snisor-new-probes/cassette-exon-scripts/v1.1a_exonInclusion_CTspecific_case_control.sh"
chromosomes_file="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/caseVsControl/all.chroms.1-22.X.Y" # have all human chs, include Y
nthreads=10
annotation="/athena/tilgnerlab/store/hut2006/data/annotations/H.sapiens/GRCh38/gencode.v34.annotation.gtf.gz"
other_script="/athena/tilgnerlab/scratch/nab4004/snisor-new-probes/cassette-exon-scripts/other-scripts/"
min_psi=0.05
max_psi=0.95
min_num_combined_reads=10
cellTypeList="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/caseVsControl/cellTypeFile.txt" # if names have "_", change it 

echo "/scratchLocal/" > tmpdirs; time bash $script $caseList $controlList tmpdirs $chromosomes_file \
$nthreads $annotation $other_script $min_psi $max_psi $min_num_combined_reads zcat 0.8 $cellTypeList &> report


echo "=========== Script terminated ==========="

exit