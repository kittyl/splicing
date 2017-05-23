pipelineBaseDir=/SAN/vyplab/IoN_RNAseq/Kitty/scripts/splicing/
sgseq_script=${pipelineBaseDir}/run_sgseq.sh 

support=/SAN/vyplab/IoN_RNAseq/Anny_FUS/12_months/sgseq/Cortex/Anny_12months_Cortex_sgseq_support.tab
code=Anny_12months_Cortex
outputDir=/SAN/vyplab/IoN_RNAseq/Anny_FUS/12_months/sgseq/Cortex/
clusterDir=/SAN/vyplab/IoN_RNAseq/Anny_FUS/12_months/sgseq/cluster/

#Step1a 
#sh $sgseq_script --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

#Step1b
#sh $sgseq_script --step step1b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} --caseCondition HOM

#Step2
#sh $sgseq_script --step step2a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
sh $sgseq_script --step step2b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

