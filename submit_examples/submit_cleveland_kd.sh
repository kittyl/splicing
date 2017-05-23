pipelineBaseDir=/SAN/vyplab/IoN_RNAseq/Kitty/scripts/splicing/
sgseq_script=${pipelineBaseDir}/run_sgseq.sh 

support=/SAN/vyplab/IoN_RNAseq/Kitty/F210I/Cleveland_TDP43/cleveland_tdp43_sgseq_support.tab
code=cleveland_tdp
outputDir=/SAN/vyplab/IoN_RNAseq/Kitty/F210I/Cleveland_TDP43/sgseq/
clusterDir=/SAN/vyplab/IoN_RNAseq/Kitty/F210I/Cleveland_TDP43/sgseq/cluster/

#Step1a 
sh $sgseq_script --step step1a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

#Step1b
#sh $sgseq_script --step step1b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} --caseCondition HOM

#Step2
sh $sgseq_script --step step2a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
#sh $sgseq_script --step step2b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

