#! /bin/bash -l

#SBATCH --partition=panda   # cluster-specific 
#SBATCH --nodes=1 
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=12
#SBATCH --job-name=pairwise
#SBATCH --time=48:00:00   # HH/MM/SS  
#SBATCH --mem=100G   # memory requested, units available: K,M,G,T  248g
#SBATCH --mail-user=xil4009@med.cornell.edu
#SBATCH --mail-type=END

mapfile -t cell_types < caseVsControl/cellTypeFile.txt
for ((i=0; i<${#cell_types[@]}-1; i++)); do
    for ((j=i+1; j<${#cell_types[@]}; j++)); do
        echo "Pairwise for ${cell_types[i]} and ${cell_types[j]}"
        dir="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/caseVsControl"
        outdir="${dir}/pairwise_compare/${cell_types[i]}_vs_${cell_types[j]}"
        control="${dir}/AllInfo_paths/${cell_types[i]}.txt"
        case="${dir}/AllInfo_paths/${cell_types[j]}.txt"
        mkdir -p ${outdir}
        sbatch run_case_vs_control.sh $control $case $outdir
    done
done