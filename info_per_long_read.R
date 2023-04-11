library(scisorseqr)

# Parse command line arguments
args <- commandArgs(trailingOnly = TRUE)
sample <- args[1]

barcodeCSV = sprintf("/home/xil4009/scratch_tilgnerlab/scisorseq_scripts/per_sample_fastq/%s_fastq/OutputFiltered/FilteredDeconvBC_AllFiles.csv", sample)

InfoPerLongRead(barcodeOutputFile=barcodeCSV, mapAndFilterOut="LRoutput/", minTimesIsoObserve=3, rmTmpFolder=FALSE)

cat("Done. \n")