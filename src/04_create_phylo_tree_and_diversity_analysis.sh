#!/bin/bash

# this script constructs a phylogenetic tree with which we can use to assess the
# diversity of our microbiome community samples

# parameters
# none

# returns
# Blactam-aligned-rep-seqs_ds1.qza: alignment
# Blactam-masked-aligned-rep-seqs_ds1.qza: masked alignment
# Blactam-unrooted-tree_ds1.qza: unrooted phylogenetic tree
# Blactam-rooted-tree_ds1.qza: rooted phylogenetic tree
# Blactam-core-metrics-results_ds1: directory containing various analyses (e.g.,
# diversity metrics)

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# create phylogenetic tree
qiime phylogeny align-to-tree-mafft-fasttree \
--i-sequences ../data/qiime/Blactam-rep-seqs_ds1.qza \
--o-alignment ../data/qiime/Blactam-aligned-rep-seqs_ds1.qza \
--o-masked-alignment ../data/qiime/Blactam-masked-aligned-rep-seqs_ds1.qza \
--o-tree ../data/qiime/Blactam-unrooted-tree_ds1.qza \
--o-rooted-tree ../data/qiime/Blactam-rooted-tree_ds1.qza


# diversity analysis -- this outputs a variety of differnt files containing
# alpha and beta diversity analysis

# sampling depth was chosen using the Blactam-table_ds1.qzv file
# more specifically, we used the Interactive Sample Detail tab to estimate
# the maximum sampling depth we could use and only lose one sample
qiime diversity core-metrics-phylogenetic \
--i-phylogeny ../data/qiime/Blactam-rooted-tree_ds1.qza \
--i-table ../data/qiime/Blactam-table_ds1.qza \
--p-sampling-depth 15054 \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--output-dir ../data/qiime/Blactam-core-metrics-results_ds1
