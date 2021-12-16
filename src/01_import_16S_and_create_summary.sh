#!/bin/bash

# this script uses a pre-defined manifest file in order to store 16S sequences
# into a qiime artifact. then, a sequence summary is created using qiime2
# please run python notebook entitled '00_create_metadata_manifest.ipynb') in
# order to obtain manifest file

# parameters
# none

# returns
# Blactam-paired-end-demux_ds1.qza: qiime sequence artifact and sequence summary
# Blactam-paired-end-demux_ds1.qzv: visualization for qiime sequence artifact
# and sequence summary

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# import sequences from manifest file
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' \
--input-path ../data/metadata_and_manifest/Blactam_manifest_ds1.tsv \
--output-path ../data/qiime/Blactam-paired-end-demux_ds1.qza \
--input-format PairedEndFastqManifestPhred33V2

# create sequence summary
qiime demux summarize --i-data ../data/qiime/Blactam-paired-end-demux_ds1.qza \
--o-visualization ../data/qiime/Blactam-paired-end-demux_ds1.qzv
