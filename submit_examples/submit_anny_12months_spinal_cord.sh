pipelineBaseDir=/SAN/vyplab/IoN_RNAseq/Kitty/scripts/splicing/
sgseq_script=${pipelineBaseDir}/run_sgseq.sh 

support=/SAN/vyplab/IoN_RNAseq/Anny_FUS/12_months/sgseq/Spinal_Cord/Anny_12months_Spinal_Cord_sgseq_support.tab
code=Anny_12months_Spinal_Cord
outputDir=/SAN/vyplab/IoN_RNAseq/Anny_FUS/12_months/sgseq/Spinal_Cord/
clusterDir=/SAN/vyplab/IoN_RNAseq/Anny_FUS/12_months/sgseq/cluster/

#Step1a 
#sh $sgseq_script --step step1a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 

#Step1b
#sh $sgseq_script --step step1b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} --caseCondition D14

#Step2
#sh $sgseq_script --step step2a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
sh $sgseq_script --step step2b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
