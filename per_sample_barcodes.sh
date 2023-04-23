#! /bin/bash -l

# Define usage function
usage() {
  echo "Usage: $0 <sampleID> <filterFor>"
  exit 1
}

# Check for correct number of arguments
if [ "$#" -ne 2 ]; then
  usage
fi

# Parse command line arguments
sampleID=$1
filterFor=$2

cd /athena/tilgnerlab/scratch/weh4002/Human_AD_Multiome/Seurat_Robj/all.samples.merge/celltype.assignment/ 

# cat Human_AD_GEX.all.sample.merge.harmony_celltype2barcode.txt | awk -v str=${filterFor} '$3 == str { print $3 }' 
cat Human_AD_GEX.all.sample.merge.harmony_celltype2barcode.txt | awk -v str=${filterFor} '$3 == str' > /home/xil4009/scratch_tilgnerlab/scisorseq_scripts/barcodes/${sampleID}_celltype2barcode.txt