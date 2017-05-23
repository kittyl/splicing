pipelineBaseDir=/SAN/vyplab/IoN_RNAseq/Kitty/scripts/splicing/
sgseq_script=${pipelineBaseDir}/run_sgseq.sh 

support=/SAN/vyplab/IoN_RNAseq/Kitty/HNRNPK/K562_ENCSR529JNJ_sgseq_support.tab 
code=Encode_Hnrnpk
outputDir=/SAN/vyplab/IoN_RNAseq/Kitty/HNRNPK/sgseq/
clusterDir=/SAN/vyplab/IoN_RNAseq/Kitty/HNRNPK/sgseq/cluster/
species="human"

#Step1a 
sh $sgseq_script --step step1a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir}  --species $species

#Step1b
#sh $sgseq_script --step step1b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} --caseCondition KO

#Step2
sh $sgseq_script --step step2a --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
#sh $sgseq_script --step step2b --support ${support} --code ${code} --outputDir ${outputDir} --clusterDir ${clusterDir} --pipelineBaseDir ${pipelineBaseDir} 
