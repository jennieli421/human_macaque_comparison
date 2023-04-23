library(scisorseqr)

polyABed = "/athena/tilgnerlab/store/shardwick/genomes/human/atlas.clusters.2.0.GRCh38.96_chrNames.bed.gz"
cageBed = "/athena/tilgnerlab/scratch/anj2026/2020_11_30_snisorseqAnalysis/2021_04_06_ONTdataProcessing_BothRuns/updatedPhastcons/hg38_fair+new_CAGE_peaks_phase1and2.bed.gz"
annotation = "/athena/tilgnerlab/store/hut2006/data/annotations/H.sapiens/GRCh38/gencode.v34.annotation.gtf.gz"
referenceDir = "/athena/tilgnerlab/store/hut2006/data/seq/genomes/H.sapiens/GRCh38/chromFa/"

# new order of args 
MapAndFilter(numThreads=12, filterFullLength=TRUE, 
            polyABed=polyABed, 
            cageBed=cageBed, 
            annoGZ=annotation, 
            seqDir=referenceDir,  
            genomeVersion="GRCh38")

# original order of args 
# MapAndFilter(outputDir="LRoutput", 
#             annoGZ=annotation, 
#             seqDir=referenceDir, 
#             cageBed=cageBed,
#             polyABed=polyABed,
#             filterFullLength=TRUE,
#             genomeVersion="GRCh38",
#             numThreads=12 )


cat("Done. \n")