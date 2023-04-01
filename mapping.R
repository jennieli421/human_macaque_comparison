library(scisorseqr)

fqFolder62 = "/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/Gan62_fastq"
fqFolder63 = "/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/Gan63_fastq"
fqFolder64 = "/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/Gan64_fastq"
fqFolder66 = "/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/Gan66_fastq"

mmPath = "/home/caf4010/minimap2-2.21_x64-linux/minimap2"
reference = "/athena/tilgnerlab/scratch/anj2026/2020_09_04_SpeciesComparison_PBMCs/references/H.sapiens/hg38.fa.gz"
nThreads = 12

MMalign(fqFolder=fqFolder62, mmProgPath=mmPath, refGenome=reference, numThreads=nThreads)
