#!/bin/bash

# conducts diversity analysis for the SpTEM1 and WT treatment group
# subset and excludes WT post-AMP samples

# parameters
# none

# returns
# Blactam_WT_no_post_amp_SpTEM1_table.qza: reads for only WT and SpTEM1 group (excluding post-amp groups for WT)
# Blactam_WT_no_post_amp_SpTEM1_table.qzv: summary of reads (excluding post-amp groups for WT)
# Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp: various diversity analyses for WT and SpTem1 groups (excluding post-amp groups for WT)
# faith_pd_vector.qzv: faith phylogenetic distance alpha diversity visualization (excluding post-amp groups for WT)
# bray-curtis-treatment-group-significance.qzv: between sample significance using PERMANOVA
# bray-curtis-treatment-group-significance_anosim.qzv: between sample significance using anosim

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# grab samples from WT and SPTEM1 treatment groups only
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1_v2.tsv \
--p-where "([treatment-group-time]!='WT-day1') AND ([treatment-group-time]!='WT-day2') AND ([treatment-group-time]!='WT-day3') AND ([treatment-group-time]!='WT-day5') AND ([treatment-group-time]!='WT-day7') AND ([treatment-group-time]!='WT-day9') AND ([treatment-group-time]!='WT-day12')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam_WT_no_post_amp_SpTEM1_table.qza

# summary for subset
qiime feature-table summarize \
--i-table ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam_WT_no_post_amp_SpTEM1_table.qza \
--o-visualization  ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam_WT_no_post_amp_SpTEM1_table.qzv \
--m-sample-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1_v2.tsv

# use orignal phylogenetic tree and resample to obtain alpha and beta diversity values
# for WT and SpTEM1 subset
# same as last time, sampling is stochastic so values might be very slightly
# different each time
qiime diversity core-metrics-phylogenetic \
--i-phylogeny ../data/qiime/Blactam-rooted-tree_ds1.qza \
--i-table ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam_WT_no_post_amp_SpTEM1_table.qza \
--p-sampling-depth 15054 \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1_v2.tsv \
--output-dir ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp

# alpha diversity plot just to make sure subset plot is consistent with plot using all data
qiime diversity alpha-group-significance \
--i-alpha-diversity ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp/faith_pd_vector.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1_v2.tsv \
--o-visualization ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp/faith_pd_vector.qzv

# check between sample distance using PERMANOVA
qiime diversity beta-group-significance \
--i-distance-matrix ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp/bray_curtis_distance_matrix.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1_v2.tsv \
--m-metadata-column treatment-group-time \
--o-visualization ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp/bray-curtis-treatment-group-significance.qzv \
--p-pairwise

# check between sample distance using ANOSIM
qiime diversity beta-group-significance \
--i-distance-matrix ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp/bray_curtis_distance_matrix.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1_v2.tsv \
--m-metadata-column treatment-group-time \
--o-visualization ../data/qiime/no_LL_load_subset/exclude_WT_post-amp/Blactam-core-metrics-results_subset_WT_SpTEM1_exclude_WT_post_amp/bray-curtis-treatment-group-significance_anosim.qzv \
--p-pairwise \
--p-method anosim
