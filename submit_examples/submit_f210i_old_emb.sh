pipelineBaseDir=/SAN/vyplab/IoN_RNAseq/Kitty/scripts/splicing/
sgseq_script=${pipelineBaseDir}/run_sgseq.sh 

support=/SAN/vyplab/IoN_RNAseq/F210I/Old_embryo_brain/processed_xs/f210i_emb_sgseq_support.tab 
code=f210i_old_emb
outputDir=/SAN/vyplab/IoN_RNAseq/F210I/Old_embryo_brain/processed_xs/sgseq/
clusterDir=/SAN/vyplab/IoN_RNAseq/F210I/Old_embryo_brain/processed_xs/sgseq/cluster/

#Step1a 
sh $sgseq_script --step step1a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

#Step1b
#sh $sgseq_script --step step1b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} --caseCondition KO

#Step2
sh $sgseq_script --step step2a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
#sh $sgseq_script --step step2b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
