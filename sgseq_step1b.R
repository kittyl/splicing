library(SGSeq) 
library(optparse)
options(echo=T)

option_list <- list(
    make_option(c('--support.tab'), help='', default = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i_new_support.tab"),
    make_option(c('--code'), help='', default = "F210I_embryonic_brain_norm"),
    make_option(c('--case_condition'), help='', default = "HOM"),
    make_option(c('--gtf'), help='', default="/cluster/scratch3/vyp-scratch2/reference_datasets/RNASeq/Mouse/Mus_musculus.GRCm38.82_fixed.gtf")
)

option.parser <- OptionParser(option_list=option_list)
opt <- parse_args(option.parser)

support.tab <- opt$support.tab
code <- opt$code
gtf <- opt$gtf
case_condition <- opt$case_condition

#sample.tab <- read.table(support.tab, header = T, stringsAsFactor = F) 
#sample.info <- getBamInfo(sample.tab) 
#save(sample.info, file = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i_info.RData") 
load("/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i_info.RData")

#tx <- importTranscripts(gtf) 
#txf <- convertToTxFeatures(tx) 
#sgf <- convertToSGFeatures(txf) 
message("loading annotation")
load("/SAN/vyplab/IoN_RNAseq/Kitty/Anny_FUS/sgseq_anno.RData")
load("/SAN/vyplab/IoN_RNAseq/Kitty/Anny_FUS/sgv_anno.RData")

si_cases <- subset(sample.info, condition == case_condition)
txf_novel <- predictTxFeatures(si_cases, min_junction_count = 5, verbose = TRUE, cores = 8)

save(txf_novel, file = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/txf_novel.RData")

txf_novel <- keepSeqlevels(txf_novel, paste0("chr",c(1:19, "X", "Y")))
sgf_novel <- convertToSGFeatures(txf_novel)
sgf_novel <- annotate(sgf_novel, txf)
sgv_novel <- findSGVariants(sgf_novel, include = "all")

sgvc_novel <- getSGVariantCounts(sgv_novel, sample_info = sample.info, cores = 8, min_denominator = 10, verbose = TRUE)
save(sgf_novel, sgv_novel, sgvc_novel, file = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/sgv_novel.RData")
