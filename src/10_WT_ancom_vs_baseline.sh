#!/bin/bash
# conducts ANCOM between WT at days 1, 2, 3, 5, 7, 9, and 12 vs baseline

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

############### 1 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='1' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t1_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t1_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t1_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t1_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t1_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t1_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t1-t0-WT_no_LL_load_treatmentgroup.qzv

############### 2 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='2' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t2_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t2_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t2_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t2_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t2_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t2_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t2-t0-WT_no_LL_load_treatmentgroup.qzv

############### 3 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='3' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t3_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t3_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t3_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t3_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t3_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t3_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t3-t0-WT_no_LL_load_treatmentgroup.qzv

############### 5 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='5' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t5_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t5_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t5_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t5_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t5_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t5_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t5-t0-WT_no_LL_load_treatmentgroup.qzv

############### 7 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='7' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t7_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t7_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t7_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t7_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t7_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t7_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t7-t0-WT_no_LL_load_treatmentgroup.qzv

############### 9 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='9' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t9_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t9_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t9_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t9_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t9_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t9_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t9-t0-WT_no_LL_load_treatmentgroup.qzv

############### 12 days vs baseline ###############
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[treatment-group]='WT' AND ([time-point-day]='12' OR [time-point-day]='0')" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t12_t0_table.qza

qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t12_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t12_t0_table-family.qza

qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_WT_no_LL_load_t12_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t12_t0_table-family.qza

qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_WT_no_LL_load_t12_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column time-point-day \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t12-t0-WT_no_LL_load_treatmentgroup.qzv
