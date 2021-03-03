# CIAlign Benchmarking Data
This repository contains the simulated data used for benchmarking CIAlign.
All code used to generate and analyse the data can be found in at github.com/CIAlign/benchmarking.

## Software
### EvolvAGene
Data generated using EvolvAGene4 (Hall 2015) using CIAlign/benchmarking/EvolvAGene/run_simulation.sh. 8 sequences generated for each of 100 simulations and all output saved in sim_$n, where $n is the simulation number. All simulations used CIAlign/benchmarking/human_gapdh.fasta as a reference.

### INDELible
Data generated using INDELible v1.03 (Fletcher & Yang, 2009) with a nucleotide, amino acid and codon model using CIAlign/benchmarking/run_simulations.sh with control_nucleotide.txt, control_amino_acid.txt and control_codon.txt (in the same directory) respectively as configuration files. 8 sequences generated for each of 100 simulations and all output saved in $model/sim_$n, where $model is the model and $n the simulation number.

### BadRead
Data generated using BadRead v0.1.5 (Wick, 2019) using the settings described in the tool documentation as resembling good, medium and bad Oxford Nanopore data, generated using CIAlign/benchmarking/BadRead/run_simulations.sh. All simulations used CIAlign/benchmarking/BadRead/dwv.fasta as a reference.

### BAliBase
Full benchmark downloaded from BAliBase4 (lbgi.fr/balibase) on Oct 1, 2020 and distributed into the 10 reference sets using the README associated with these files. The fasta files here are the tfa files with the same ID from the original dataset. 


## True Alignments, Trees, Consensus Sequences
All four tools provide some kind of "ground truth" for a combination of alignments, trees and consensus sequences, which can be used for benchmarking purposes.

### EvolvAGene
For EvolvAGene, the correct consensus for nucleotide alignments is the sequence used as input for the simulation - CIAlign/EvolvAGene/human_gapdh.fasta - and for protein alignments it's translated version CIAlign/EvolvAGene/human_gapdh_prot.fasta. True alignments and trees are provided.

#### True Nucleotide Alignment
sim_$i/human_gapdh_True_alignment.FASTA

#### True Protein Alignment
sim_$i/human_gapdh_True_Pep_alignment.FASTA

#### True Tree
sim_$i/human_gapdh_True.tre

### INDELible
For INDELible true alignments and trees aree provided, a true consensus is not possible.

#### True Nucleotide Alignment
nucleotide/sim_$n/alignment_true.fasta

#### True Nucleotide Tree
nucleotide/sim_$n/tree.nwk

#### True Protein Alignment
protein/sim_$n/alignment_true.fasta

#### True Protein Tree
protein/sim_$n/tree.nwk

#### True Codon Alignment
codon/sim_$n/alignment_true.fasta

#### True Codon Tree
codon/sim_$n/tree.nwk

### BadRead
For BadRead there are no reference alignments or trees, but the consensus should be as close as possible to the input sequence used as the basis for the simulations - CIAlign/BadRead/dwv.fasta

### BAliBase
BAliBase provides reference alignments but not trees or consensus sequences.
All alignments in BAliBase/reference_set_$n/aligned as the true alignments downloaded from the database.


## Original Alignments, Trees, Consensus Sequences
All alignments were generated with CIAlign/benchmarking/$tool/run_alignment.sh, where $tool can be EvolvAGene, INDELible, BadRead or BAliBase.

All consensus sequences were generated with CIAlign --make_consensus --consensus_type majority_nongap

All trees were built using FastTree -nt -gtr plus defaults for nucleotide sequences and all defaults for protein sequences.

Alignments are named xxx.fasta, trees xxx.tre, consensus sequences xxx_consensus.fasta.

###EvolvAGene
$typ is nucleotide for nucleotide sequences and pep for protein seqeunces
#### MAFFT localpair, 100 iterations
EvolvAGene/sim_$n/mafft/$typ/
* local_max100.fasta
* local_max100.tre
* local_max100_consensus.fasta

#### MAFFT globalpair, 100 iterations
EvolvAGene/sim_$n/mafft/$typ/
* global_max100.fasta
* global_max100.tre
* global_max100_consensus.fasta

#### MUSCLE, 100 iterations
EvolvAGene/sim_$n/muscle/$typ/
* max100.fasta
* max100.tre
* max100_consensus.fasta

#### CLUSTAL, auto
EvolvAGene/sim_$n/clustal/$typ/
* auto.fasta
* auto.tre
* auto_consensus.fasta

### INDELible
$typ is nucleotide for sequences generated with a nucleotide model, amino_acid for sequences generated with an amino acid model, codon for sequences generated with a codon model.
Consensus sequences were not generated here as no reference consensus is available.
Alignments are named xxx.fasta and trees xxx.tre

#### MAFFT localpair, 100 iterations
INDELible/$typ/sim_$n/mafft/
* local_max100.fasta
* local_max100.tre

#### MAFFT globalpair, 100 iterations
INDELible/$typ/sim_$n/mafft/
* global_max100.fasta
* global_max100.tre

#### MUSCLE, 100 iterations
INDELible/$typ/sim_$n/muscle/
* max100.fasta
* max100.tre

#### CLUSTAL, auto
INDELible/$type/sim_$n/clustal/
* auto.fasta
* auto.tre


### BadRead
Only MAFFT was used for the BadRead data as only local alignment is appropriate and trees were not generated as this tool is not simulating evolution.
#### MAFFT, localpair, 100 iterations
##### Simulated good nanopore data
BadRead/mafft/good_nanopore_mafft_localpair.fasta
##### Simulated medium nanopore data
BadRead/mafft/medium_nanopore_mafft_localpair.fasta
##### Simulated bad nanopore data
BadRead/mafft/bad_nanopore_mafft_localpair.fasta


### BAliBase
BAliBase sequences are divided into 10 reference sets. xxx here represents the stem of the original filename (which would be named xxx.fasta). Trees and consensus sequences were not generated as neither have available references.
Original alignments are:
#### MAFFT localpair, 100 iterations
reference_set_$n/mafft/xxx_local_max100.fasta
#### MAFFT globalpair, 100 iterations
reference_set_$n/mafft/xxx_global_max100.fasta
#### MUSCLE, 100 iterations
reference_set_$n/muscle/xxx_max100.fasta
#### CLUSTAL, auto
reference_set_$n/clustal/xxx_auto.fasta


## CIAlign Output Files
CIAlign was run on each of these alignments with highly stringent, moderate and relaxed settings. This anlaysis was performed with CIAlign/benchmarking/$tool/run_cialign.sh where $tool can be EvolvAGene, INDELible, BadRead or BAliBase.

All CIAlign output files are named with one of the following prefixes:
* high_stringent - highly stringent settings based on CIAlign/benchmarking/$tool/highly_stingent_config_$tool.ini, where $tool can be EvolvAGene, INDELible, BadRead or BAliBase
* med_stringent - moderate settings based on CIAlign/benchmarking/$tool/med_stingent_config_$tool.ini, where $tool can be EvolvAGene, INDELible, BadRead or BAliBase
* low_stringent - relaxed settings based on CIAlign/benchmarking/$tool/low_stingent_config_$tool.ini, where $tool can be EvolvAGene, INDELible, BadRead or BAliBase

In all cases, CIAlign has the following 10 output files:
xxx_cleaned.fasta - the processed alignment
xxx_consensus.fasta - a majority_nongap consensus sequence
xxx_with_consensus.fasta - the processed alignment plus the consensus sequence
xxx_input.png - mini alignment for the input file
xxx_output.png - mini alignment for the output file
xxx_input_similarity.tsv - similarity matrix for the input file
xxx_output_similarity.tsv - similarity matrix for the otuput file
xxx_removed.txt - list of removed positions
xxx_log.txt - CIAlign log file

All CIAlign outputs are in the same directory as the original alignments with the prefix high_stringent, med_stringent or low_stringent.
