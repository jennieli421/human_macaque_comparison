library(scisorseqr)

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
cat(paste("args:", args, "\n"))

fqFolder <- args[1]
bcFile <- args[2]
outputFolder <- args[3]

cat(paste("fqFolder:", fqFolder, "\n"))
cat(paste("bcFile:", bcFile, "\n"))
cat(paste("outputFolder:", outputFolder, "\n"))

GetBarcodes(fqFolder=fqFolder, BCClustAssignFile=bcFile, outputFolder=outputFolder, numProcesses=12, filterReads=TRUE)

cat("Done. \n")



############
# fqFolderRaw62="/home/xil4009/store_tilgnerlab/Human_AD_MO_ONT/Human_AD_MO_ONT_Gan62_Gan47_Run1/"
# fqFolderRaw63="/home/xil4009/store_tilgnerlab/Human_AD_MO_ONT/Human_AD_MO_ONT_Gan63_Gan48/"
# fqFolderRaw64="/home/xil4009/store_tilgnerlab/Human_AD_MO_ONT/Human_AD_MO_ONT_Gan49_Gan64/"
# fqFolderRaw66="/home/xil4009/store_tilgnerlab/Human_AD_MO_ONT/Human_AD_MO_ONT_Gan50_Gan66/"

# bc62="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/barcodes/GAN62_celltype2barcode.txt"
# bc63="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/barcodes/GAN63_celltype2barcode.txt"
# bc64="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/barcodes/GAN64_celltype2barcode.txt"
# bc66="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/barcodes/GAN66_celltype2barcode.txt"

# out62="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/ctl_fastq/Gan62_fastq"
# out63="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/ctl_fastq/Gan63_fastq"
# out64="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/ctl_fastq/Gan64_fastq"
# out66="/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/ctl_fastq/Gan66_fastq"
