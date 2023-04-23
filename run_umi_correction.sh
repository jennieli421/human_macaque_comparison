#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=umiCorrection
#SBATCH --time=1:00:00   # HH/MM/SS 
#SBATCH --mem=30G   # memory requested, units available: K,M,G,T 
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END 


# Define usage function
usage() {
  echo "Usage: $0 <input file path> <output path>"
  exit 1
} 

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
  usage
fi

conda activate py37

# Parse command line arguments
input=$1
output=$2

# Run python script
py_script="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/count-umis-from-all-info.py"

python $py_script ${input} ${output}


echo "=========== Script terminated ==========="

exit