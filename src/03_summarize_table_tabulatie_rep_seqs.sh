#!/bin/bash

# this script summarizes feature table and tabulates representative sequences

# parameters
# none

# returns
# Blactam-table_ds1.qzv: visualizable feature table
# Blactam-rep-seqs_ds1.qzv: visualizable reference sequences

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# summarize feature table
# make sure metadata tsv is created and path is specified
qiime feature-table summarize --i-table ../data/qiime/Blactam-table_ds1.qza \
--o-visualization  ../data/qiime/Blactam-table_ds1.qzv \
--m-sample-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv

# tabulate representative sequences table
qiime feature-table tabulate-seqs --i-data ../data/qiime/Blactam-rep-seqs_ds1.qza \
--o-visualization ../data/qiime/Blactam-rep-seqs_ds1.qzv
