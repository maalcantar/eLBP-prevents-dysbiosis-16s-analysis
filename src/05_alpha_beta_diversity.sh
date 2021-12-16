#!/bin/bash

# this script obtains alpha and beta diversity values and visualizations.
# note that these values should later be exported and inserted into csv format
# for plotting with python and PRISM
# data is manually exported for futher analysis using the export command
# ( https://docs.qiime2.org/2020.8/tutorials/exporting/ )

# parameters
# none

# returns
# faith_pd_vector_ds1.qzv: faith phylogenetic distance diversity comparisons
# evenness_vector_ds1.qzv: pielou's evenness diversity comparisons
# shannon_vector_ds1.qzv: shannon diversity comparisons
# unweighted-unifrac-treatment-group-significance_ds1.qzv: unweighted unifrac distances
# Blactam-alpha-rarefaction_ds1.qzv: rarefaction curves

# additional descriptions of output files are included in comments below

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

## Alpha diversity
# significant differences between differenct groups -- this is just to get
# a general overview of alpha diversities between groups using faith pd metric
qiime diversity alpha-group-significance \
--i-alpha-diversity ../data/qiime/Blactam-core-metrics-results_ds1/faith_pd_vector.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/Blactam-core-metrics-results_ds1/faith_pd_vector_ds1.qzv

# same as above except with evenness metric
qiime diversity alpha-group-significance \
--i-alpha-diversity ../data/qiime/Blactam-core-metrics-results_ds1/evenness_vector.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/Blactam-core-metrics-results_ds1/evenness_vector_ds1.qzv

# same as above except with Shannon metric
qiime diversity alpha-group-significance \
--i-alpha-diversity ../data/qiime/Blactam-core-metrics-results_ds1/shannon_vector.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/Blactam-core-metrics-results_ds1/shannon_vector_ds1.qzv

## Beta diversity
# check differences in beta diversity with samples grouped by treatment group and
# time point just to get an idea of what community composition differences are like
qiime diversity beta-group-significance \
--i-distance-matrix ../data/qiime/Blactam-core-metrics-results_ds1/unweighted_unifrac_distance_matrix.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group-time \
--o-visualization ../data/qiime/Blactam-core-metrics-results_ds1/unweighted-unifrac-treatment-group-significance_ds1.qzv \
--p-pairwise

# create emperor plot of PCoA using bray-curtis dissimilarity metric
qiime emperor plot \
--i-pcoa ../data/qiime/Blactam-core-metrics-results_ds1/bray_curtis_pcoa_results.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/Blactam-core-metrics-results_ds1/bray_curtis_emperor_ds1.qzv

# Alpha rarefaction to ensure that the sampling depth we choose captures
# actual community compositions
qiime diversity alpha-rarefaction \
--i-table ../data/qiime/Blactam-table_ds1.qza \
--i-phylogeny ../data/qiime/Blactam-rooted-tree_ds1.qza \
--p-max-depth 15054 \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/Blactam-alpha-rarefaction_ds1.qzv
