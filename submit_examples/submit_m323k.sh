pipelineBaseDir=/SAN/vyplab/IoN_RNAseq/Kitty/scripts/splicing/
sgseq_script=${pipelineBaseDir}/run_sgseq.sh 

support=/SAN/vyplab/IoN_RNAseq/Kitty/M323K/sgseq/m323k_support.tab
code=M323K_adult_brain
outputDir=/SAN/vyplab/IoN_RNAseq/Kitty/M323K/sgseq/
clusterDir=/SAN/vyplab/IoN_RNAseq/Kitty/M323K/cluster/

#Step1a 
#sh $sgseq_script --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

#Step1b
#sh $sgseq_script --step step1b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} --caseCondition HOM

#Step2
sh $sgseq_script --step step2a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
sh $sgseq_script --step step2b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

