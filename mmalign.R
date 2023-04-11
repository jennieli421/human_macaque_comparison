library(scisorseqr)

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
sample <- args[1]

sample_fqFolder = sprintf("/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/ctl_fastq/%s_fastq/OutputFiltered", sample)

mmPath = "/home/caf4010/minimap2-2.21_x64-linux/minimap2"
reference = "/athena/tilgnerlab/scratch/anj2026/2020_09_04_SpeciesComparison_PBMCs/references/H.sapiens/hg38.fa.gz"
nThreads = 12

cat(paste("fqFolder:", sample_fqFolder, "\n"))

MMalign(fqFolder=sample_fqFolder, mmProgPath=mmPath, refGenome=reference, numThreads=nThreads)

cat("Done.")