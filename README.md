# CIAlign Benchmarking Data
This repository contains the data used for benchmarking CIAlign.
All code used to generate and analyse the data can be found in at github.com/CIAlign/benchmarking.

## Software
### EvolvAGene
Data generated using EvolvAGene4 (Hall 2015) using CIAlign/benchmarking/EvolvAGene/run_simulation.sh. 8 sequences generated for each of 100 simulations and all output saved in sim_$n, where $n is the simulation number. All simulations used CIAlign/benchmarking/human_gapdh.fasta as a reference.

### INDELible
Data generated using INDELible v1.03 (Fletcher & Yang, 2009) with a nucleotide, amino acid and codon model using CIAlign/benchmarking/run_simulations.sh with control_nucleotide.txt, control_amino_acid.txt and control_codon.txt (in the same directory) respectively as configuration files. 8 sequences generated for each of 100 simulations and all output saved in $model/sim_$n, where $model is the model and $n the simulation number.

### BAliBASE
Data downloaded from the BAliBASE reference http://www.lbgi.fr/balibase/BalibaseDownload 

### BadRead
Data generated using BadRead v0.1.5 (Wick, 2019) using the settings described in the tool documentation as resembling good, medium and bad Oxford Nanopore data, generated using CIAlign/benchmarking/BadRead/run_simulations.sh. All simulations used CIAlign/benchmarking/BadRead/dwv.fasta as a reference.

## True Alignments, Trees, Consensus Sequences
All four tools provide some kind of "ground truth" for a combination of alignments, trees and consensus sequences, which can be used for benchmarking purposes.

### EvolvAGene
For EvolvAGene, the correct consensus for nucleotide alignments is the sequence used as input for the simulation - CIAlign/EvolvAGene/human_gapdh.fasta. True alignments and trees are provided.

#### True Nucleotide Alignment
sim_$i/human_gapdh_True_alignment.FASTA

#### True Tree
sim_$i/human_gapdh_True.tre

### INDELible
For INDELible true alignments and trees aree provided, a true consensus is not possible.

#### True Nucleotide Alignment
nucleotide/sim_$n/alignment_true.fasta

#### True Nucleotide Tree
nucleotide/sim_$n/tree.nwk

### BAliBASE
For BAliBase true alignments are provided for 10 reference sets.

reference_set_$i/aligned/*fasta


### BadRead
For BadRead there are no reference alignments or trees, but the consensus should be as close as possible to the input sequence used as the basis for the simulations - CIAlign/BadRead/dwv.fasta


## Original Alignments, Trees, Consensus Sequences
All alignments for EvovlAGene, INDELible, BAliBase and BadRead were generated with CIAlign/benchmarking/$tool/run_alignment.sh, where $tool can be EvolvAGene, INDELible, BAliBase or BadRead.

All consensus sequences were generated with CIAlign --make_consensus --consensus_type majority_nongap

All trees were built using FastTree -nt -gtr plus defaults for nucleotide sequences and all defaults for protein sequences.

Alignments are named xxx.fasta, trees xxx.tre, consensus sequences xxx_consensus.fasta.

###EvolvAGene
#### MAFFT localpair, 100 iterations
EvolvAGene/sim_$n/mafft/nucleotide/
* local_max100.fasta
* local_max100.tre
* local_max100_consensus.fasta

#### MAFFT globalpair, 100 iterations
EvolvAGene/sim_$n/mafft/nucleotide/
* global_max100.fasta
* global_max100.tre
* global_max100_consensus.fasta

#### MUSCLE, 100 iterations
EvolvAGene/sim_$n/muscle/nucleotide/
* max100.fasta
* max100.tre
* max100_consensus.fasta

#### CLUSTAL, auto
EvolvAGene/sim_$n/clustal/nucleotide/
* auto.fasta
* auto.tre
* auto_consensus.fasta

### INDELible
Consensus sequences were not generated here as no reference consensus is available.
Alignments are named xxx.fasta and trees xxx.tre

#### MAFFT localpair, 100 iterations
INDELible/nucleotide/sim_$n/mafft/
* local_max100.fasta
* local_max100.tre

#### MAFFT globalpair, 100 iterations
INDELible/nucleotide/sim_$n/mafft/
* global_max100.fasta
* global_max100.tre

#### MUSCLE, 100 iterations
INDELible/nucleotide/sim_$n/muscle/
* max100.fasta
* max100.tre

#### CLUSTAL, auto
INDELible/nucleotide/sim_$n/clustal/
* auto.fasta
* auto.tre


### BAliBASE
Consensus sequences and trees were not generated here as no reference consensus or reference trees are available.
Alignments are named xxx.fasta

#### MAFFT localpair, 100 iterations
BAliBASE/reference_set_$i/mafft/
* local_max100.fasta

#### MAFFT globalpair, 100 iterations
BAliBASE/reference_set_$i/mafft/
* global_max100.fasta

#### MUSCLE, 100 iterations
BAliBASE/reference_set_$i/mafft/
* max100.fasta

#### CLUSTAL, auto
BAliBASE/reference_set_$i/clustal/
* auto.fasta


### BadRead
Only MAFFT was used for the BadRead data as only local alignment is appropriate and trees were not generated as this tool is not simulating evolution.
#### MAFFT, localpair, 100 iterations
##### Simulated good nanopore data
BadRead/mafft/good_nanopore_mafft_localpair.fasta
##### Simulated medium nanopore data
BadRead/mafft/medium_nanopore_mafft_localpair.fasta
##### Simulated bad nanopore data
BadRead/mafft/bad_nanopore_mafft_localpair.fasta


## CIAlign Output Files
CIAlign was run on each of these alignments with highly stringent, moderate and relaxed settings. This anlaysis was performed with CIAlign/benchmarking/$tool/run_cialign.sh where $tool can be EvolvAGene, INDELible, BAliBase or BadRead. Only moderate settings were run for BadRead.

All CIAlign output files are named with one of the following prefixes:
* high_stringent - highly stringent settings based on CIAlign/benchmarking/$tool/highly_stingent_config_$tool.ini, where $tool can be EvolvAGene, INDELible or BadRead.
* med_stringent - moderate settings based on CIAlign/benchmarking/$tool/med_stingent_config_$tool.ini, where $tool can be EvolvAGene, INDELible or BadRead.
* low_stringent - relaxed settings based on CIAlign/benchmarking/$tool/low_stingent_config_$tool.ini, where $tool can be EvolvAGene, INDELible or BadRead.

In all cases, CIAlign has the following 10 output files:
xxx_cleaned.fasta - the processed alignment
xxx_consensus.fasta - a majority_nongap consensus sequence
xxx_with_consensus.fasta - the processed alignment plus the consensus sequence
xxx_input.png - mini alignment for the input file
xxx_output.png - mini alignment for the output file
xxx_input_similarity.tsv - similarity matrix for the input file
xxx_output_similarity.tsv - similarity matrix for the otuput file (not generated for BAliBase)
xxx_removed.txt - list of removed positions
xxx_log.txt - CIAlign log file

All CIAlign outputs are in the same directory as the original alignments with the prefix high_stringent, med_stringent or low_stringent.

## gblocks, trimal, zorro

For each of the simulated EvolvAGene and INDELible alignments, each trimming tools and each of the four alignment tools there are six output files. 

e.g. for clustal with gblocks
clustal.log - the raw GBlocks output for the clustal alignment (for zorro this file is clustal.txt)
clustal_removed.txt - the GBlocks output converted into the style of the CIAlign removed.txt output file
clustal.fasta - the alignment cleaned with GBlocks
clustal.tre - phylogeny based on the cleaned alignment
clustal_consensus.fasta - consensus sequence for the cleaned alignment
clustal_with_consensus.fasta - consensus sequence aligned to the cleaned alignment

## HomFam

There are six files per homfam alignment in the homfam directory
xxx_seed+test.fasta - the seed+test alignment after cleaning with CIAlign
xxx_removed.txt - file showing positions removed by CIAlign from the seed+test alignment
xxx_log.txt - log file for processing the seed+test alignment with CIAlign
xxx_seedext.fasta - the seed sequences extracted from the cleaned seed+test alignment, with gap only columns removed
xxx_seedext.tre - phylogenetic tree based on xxx_seedext.fasta
xxx_consensus.fasta - consensus sequence for the cleaned seed+test alignment

## Aligners
Each alignment tool listed in the "Comparing Alignment Tools" section of the manuscript was run on the 100 EvolvAGene simulations and the 100 INDELible simulations.

For each of EvolvAGene and INDELible, for each simulation 1 to 100, there are six files:
e.g. for EvolvAGene sim_1 and t_coffee

t_coffee/EvolvAGene_sim_1.fasta - nucleotide sequences for EvolvAGene simulation 1 aligned with t_coffee
t_coffee/EvolvAGene_sim_1_aa.fasta - amino acid sequences for EvolvAGene simulation 1 aligned with t_coffee
t_coffee/EvolvAGene_sim_1_consensus.fasta - consensus for EvolvAGene_sim_1.fasta
t_coffee/EvolvAGene_sim_1_aa_consensus.fasta - consensus for EvovAGene_sim_1_aa.fsata
t_coffee/EvolvAGene_sim_1.tre - phylogenetic tree based on EvolvAGene_sim_1.fasta
t_coffee/EvolvAGene_sim_1_aa.tre - phylogenetic tree based on EvolvAGene_sim_1_aa.fasta

In the CIAlign subdirectory for each tool there are 6 files for each stringency level for nucleotide and for amino acid (_aa) alignments
e.g. t_coffee, medium stringency, EvolvAGene sim 1, nucleotide

t_coffee/cialign/med_stringent_EvolvAGene_sim_1_cleaned.fasta - the t_coffee alignment for EvolvAGene simulation 1 cleaned with CIAlign with moderate parameters
t_coffee/cialign/med_stringent_EvolvAGene_sim_1_cleaned.tre - phylogenetic tree based on med_stringent_EvolvAGene_sim_1_cleaned.fasta
t_coffee/cialign/med_stringent_EvolvAGene_sim_1_log.txt - log file for running CIAlign on this alignment with these settings
t_coffee/cialign/med_stringent_EvolvAGene_sim_1_removed.txt - file listing positions removed by CIAlign on this alignment with these settings
t_coffee/cialign/med_stringent_EvolvAGene_sim_1_consensus.fasta - consensus sequence for the cleaned alignment
t_coffee/cialign/med_stringent_EvolvAGene_sim_1_with_consensus.fasta - consensus sequence aligned to the cleaned alignment

## QuanTest2

The QuanTest2 folder contains three subfolders. MSAs are the by QuanTest2 (https://doi.org/10.1093/bioinformatics/btz552) provided test alignments aligned with MUSCLE (http://dx.doi.org/10.1093/nar/gkh340).
CIAlign_MSAs are the cleaned alignments using CIAlign with default parameters except for a remove_divergent_minperc threshold of 0.15.
The results folder contains the QuanTest2 output with and without prior CIAlign cleaning.