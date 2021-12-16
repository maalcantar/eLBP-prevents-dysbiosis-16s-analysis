#!/bin/bash

# conducts diversity analysis for the SpTEM1 and WT treatment group and excludes
# LL_load groups (which were only used to assess the abundance of L. lactis soon
# after administration)
# data is manually exported for futher analysis using the export command
# ( https://docs.qiime2.org/2020.8/tutorials/exporting/ )


# parameters
# none

# returns
# Blactam_no_LL_load_table_ds1.qza: reads for only WT and SpTEM1 group
# Blactam_no_LL_load_table_ds1.qzv: summary of reads
# Blactam-core-metrics-results_subset_no_LL_load: various diversity analyses for WT and SpTem1 groups
# faith_pd_vector.qzv: faith phylogenetic distance alpha diversity visualization
# shannon_vector_ds1.qzv: shannon diversity visualization

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# grab samples from WT and SPTEM1 treatment groups only
qiime feature-table filter-samples \
--i-table ../data/qiime/Blactam-table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]!='LL_Load'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza

# summary for subset
qiime feature-table summarize \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--o-visualization  ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qzv \
--m-sample-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv

# use orignal phylogenetic tree and resample to obtain alpha and beta diversity values
# for WT and SpTEM1 subset
# same as last time, sampling is stochastic so values might be very slightly
# different each time
qiime diversity core-metrics-phylogenetic \
--i-phylogeny ../data/qiime/Blactam-rooted-tree_ds1.qza \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--p-sampling-depth 15054 \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--output-dir ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load

# alpha diversity plot just to make sure subset plot is consistent with plot using all data
qiime diversity alpha-group-significance \
--i-alpha-diversity ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load/faith_pd_vector.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load/faith_pd_vector.qzv

# same as above except with Shannon metric
qiime diversity alpha-group-significance \
--i-alpha-diversity ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load/shannon_vector.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load/shannon_vector_ds1.qzv

# check beta diversity signifiance using PERMANOVA (default = 999 permutations)
qiime diversity beta-group-significance \
--i-distance-matrix ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load/bray_curtis_distance_matrix.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group-time \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-core-metrics-results_subset_no_LL_load/bray-curtis-treatment-group-significance_ds1.qzv \
--p-pairwise
