#!/bin/bash

# this script quality filters 16S sequences and creates a feature table, repre-
# sentative sequences, and overall statistics from the quality filtered sequences

# parameters
# none

# returns
# Blactam-table_ds1.qza: feature table
# Blactam-rep-seqs_ds1.qza: representative sequences
# Blactam-denoising-stats_ds1.qza: overall denoising statistics

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# denoise with following criteria:
# remove diversity region and forward primer (i.e remove first 23nt)
# remove reverse primer (i.e. remove last 20nt)
# truncate forward reads at 200nt
# truncare reverse reads at 170nt
# truncation based on interactive quality plot (Blactam-paired-end-demux.qzv)
qiime dada2 denoise-paired \
--i-demultiplexed-seqs ../data/qiime/Blactam-paired-end-demux_ds1.qza \
--p-trim-left-f 23 --p-trim-left-r 20 --p-trunc-len-f 200 --p-trunc-len-r 170 \
--o-table ../data/qiime/Blactam-table_ds1.qza \
--o-representative-sequences ../data/qiime/Blactam-rep-seqs_ds1.qza \
--o-denoising-stats ../data/qiime/Blactam-denoising-stats_ds1.qza
