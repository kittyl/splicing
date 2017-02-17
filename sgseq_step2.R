## Now take the counts and pretend each event is one gene and each variant is one exon 
## and run in dexseq 

library(SGSeq) 
library(DEXSeq)

library(optparse)
options(echo=T)

option_list <- list(
    make_option(c('--support.tab'), help='', default = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i/f210i_new_support.tab"),
    make_option(c('--sgvc.data'), help='', default = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i/sgfc.RData"),
    make_option(c('--dexseq.data'), help='', default = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i/dexseq.RData"),
    make_option(c('--output'), help='', default = "/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/f210i/sgseq_res.tab")
)

option.parser <- OptionParser(option_list=option_list)
opt <- parse_args(option.parser)

support.tab <- opt$support.tab
sgvc.data <- opt$sgvc.data
dexseq.data <- opt$dexseq.data
output <- opt$output 

load(sgvc.data) 

varcounts <- counts(sgvc)
vid <- variantID(sgvc)
eid <- eventID(sgvc)

noreads <- which(rowSums(varcounts) == 0)

if(length(noreads) > 0) { 
varcounts <- varcounts[-noreads,] 
vid <- vid[-noreads] 
eid <- eid[-noreads] 
} 

support  <- read.table(support.tab, header = T, stringsAsFactor = F) 

formuladispersion <- ~ sample + (condition + type) * exon
formula0 <-  ~ sample + condition
formula1 <-  ~ sample + condition * exon

DexSeqExons.loc <- DEXSeqDataSet(countData = varcounts,
                                              sampleData = support,
                                              design = formula1,
                                        featureID = as.factor(vid),
                                        groupID = as.factor(eid))

DexSeqExons.loc <- estimateSizeFactors(DexSeqExons.loc)
DexSeqExons.loc <- DEXSeq::estimateDispersions(DexSeqExons.loc)
DexSeqExons.loc <- DEXSeq::testForDEU(DexSeqExons.loc)
DexSeqExons.loc <- DEXSeq::estimateExonFoldChanges(DexSeqExons.loc)

save(DexSeqExons.loc, file = dexseq.data) 

res <- DEXSeq::DEXSeqResults (DexSeqExons.loc)
res.clean <- as.data.frame(res)
res.clean$FDR <- p.adjust(res.clean$pvalue, method = 'fdr')

sgvc.df <- as.data.frame(mcols(sgvc) )
psi <- variantFreq(sgvc)

if (length(noreads) > 0) { 
    sgvc.df <- sgvc.df[-noreads,]
    psi <- psi[-noreads,] 
} 

colnames(psi) <- paste0(colnames(psi)  , "_psi") 
res.clean <- cbind(res.clean, psi) 
res.clean$geneName <- sgvc.df$geneName
res.clean$txName <- sgvc.df$txName
res.clean$eventID <- sgvc.df$eventID
res.clean$variantType <- sgvc.df$variantType
res.clean$from <- sgvc.df$from
res.clean$to <- sgvc.df$to
res.clean$type <- sgvc.df$type
res.clean <- res.clean[order(res.clean$pvalue), ]
write.table(res.clean, file = output, sep = "\t")
