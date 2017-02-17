## Now take the counts and pretend each event is one gene and each variant is one exon 
## and run in dexseq 

library(SGSeq) 
library(DEXSeq)

load("/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/sgfc.RData") 
load("/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/sgfc_pred.RData") 
load("/SAN/vyplab/IoN_RNAseq/Kitty/F210I/sgseq/dexseq.RData") 

varcounts <- countsVariant(sgvc)
vid <- variantID(sgvc)
eid <- eventID(sgvc)

noreads <- which(rowSums(varcounts) == 0)
varcounts <- varcounts[-noreads,] 
vid <- vid[-noreads] 
eid <- eid[-noreads] 

support  <- read.table("/SAN/vyplab/IoN_RNAseq/Kitty/F210I/hisat/f210i.tab", header = T, stringsAsFactor = F) 

varfreq <- variantFreq(sgvc)
varfreq <- varfreq[-noreads,] 

res <- DEXSeq::DEXSeqResults (DexSeqExons.loc)
res.clean <- as.data.frame(res)
res.clean$FDR <- p.adjust(res.clean$pvalue, method = 'fdr')
sgvc.df <- as.data.frame(mcols(sgvc) )
sgvc.df <- sgvc.df[-noreads,] 
res.clean$geneName <- sgvc.df$geneName
res.clean$variantType <- sgvc.df$variantType
res.clean$from <- sgvc.df$from
res.clean$to <- sgvc.df$to
res.clean$type <- sgvc.df$type
res.clean <- cbind(res.clean, varfreq) 

res.clean <- res.clean[order(res.clean$pvalue), ]

se.sig <- subset(res.clean, FDR < 0.05 & variantType %in% c("SE:I") )
