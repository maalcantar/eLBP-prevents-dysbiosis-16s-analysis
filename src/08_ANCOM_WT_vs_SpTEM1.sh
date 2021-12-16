#!/bin/bash
# conducts ANCOM between SpTEM1 and WT groups at all time points

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

############### T=0days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='0'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t0_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t0_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t0_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t0_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t0_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t0_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t0-WT_SpTem1_noLL_load_treatmentgroup.qzv

############### T=1days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='1'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t1_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t1_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t1_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t1_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t1_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t1_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t1-WT_SpTem1_noLL_load_treatmentgroup.qzv

############### T=2days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='2'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t2_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t2_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t2_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t2_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t2_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t2_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t2-WT_SpTem1_noLL_load_treatmentgroup.qzv

############### T=3days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='3'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t3_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t3_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t3_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t3_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t3_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t3_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t3-WT_SpTem1_noLL_load_treatmentgroup.qzv


############### T=5days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='5'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t5_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t5_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t5_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t5_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t5_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t5_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t5-WT_SpTem1_noLL_load_treatmentgroup.qzv

############### T=7days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='7'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t7_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t7_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t7_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t7_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t7_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t7_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t7-WT_SpTem1_noLL_load_treatmentgroup.qzv


############### T=9days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='9'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t9_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t9_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t9_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t9_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t9_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t9_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t9-WT_SpTem1_noLL_load_treatmentgroup.qzv

############### T=12days ###############
# subset samples
qiime feature-table filter-samples \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--p-where "[time-point-day]='12'" \
--o-filtered-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t12_table.qza

# collapse tables at family level
qiime taxa collapse \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_table_ds1_t12_table.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--p-level 5 \
--o-collapsed-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t12_table-family.qza

# add pseudocounts
qiime composition add-pseudocount \
--i-table ../data/qiime/no_LL_load_subset/Blactam_no_LL_load_ds1_t12_table-family.qza \
--o-composition-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t12_table-family.qza

# note that sometimes results flip across the y-axis -- doesn't change anything
# since this is just a result of comparing WT vs. SpTEM1 or SpTEM1 vs. WT
qiime composition ancom \
--i-table ../data/qiime/no_LL_load_subset/comp-Blactam_no_LL_load_ds1_t12_table-family.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--m-metadata-column treatment-group \
--o-visualization ../data/qiime/no_LL_load_subset/Blactam-ancom-family-t12-WT_SpTem1_noLL_load_treatmentgroup.qzv
#
