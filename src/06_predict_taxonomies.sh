#!/bin/bash

# this script trains a Naive Bayes Classifier and applies it to our dataset
# in order to predict taxonomies. Native Bayes Classifier is trained on
# Greengenes v13.8 99% OTU dataset (ftp://greengenes.microbio.me/greengenes_release/gg_13_5/gg_13_8_otus.tar.gz)
# we use Greengenes as we were mainly interested in making family-level comparisons
# (see scripts 08 through 10) and quantifying L. lactis abundance -- for which
# taxonomic assignments were validated via a BLAST search -- and this database
# allowed for faster model training. the Silva database can also be used for more
# up-to-date species-level classifications, though training will take much longer
# silva sequences are here: https://data.qiime2.org/2021.4/common/silva-138-99-seqs.qza
# silva taxonomies are here: https://data.qiime2.org/2021.4/common/silva-138-99-tax.qza

# parameters
# none

# returns
# 99_otus.qza: Greengenes data in qiime artifact format (as opposed to fasta format)
# 99_otu-ref-taxonomy.qza: Greengenes reference sequences
# 99_otu-ref-seqs.qza: Greengenes reference sequences trimmed
# Blactam-classifier.qza: trained classifier
# Blactam-taxonomy_ds1.qza: classified sequences
# Blactam-taxonomy_ds1.qzv: tabulated classified sequences
# Blactam-taxa-bar-plots_ds1.qzv: barplot broken down by taxonomy


# Feature classifier
# Run from training-feature-classifiers

# load environment containing qiime 2 (2020.2 distribution)
source activate qiime2-2020.2

# convert 99% otus to qiime artifact
qiime tools import \
--type 'FeatureData[Sequence]' \
--input-path ../data/qiime/training-feature-classifiers/gg_13_8_otus/rep_set/99_otus.fasta \
--output-path ../data/qiime/training-feature-classifiers/99_otus.qza

qiime tools import \
--type 'FeatureData[Taxonomy]' \
--input-format HeaderlessTSVTaxonomyFormat \
--input-path ../data/qiime/training-feature-classifiers/gg_13_8_otus/taxonomy/99_otu_taxonomy.txt \
--output-path ../data/qiime/training-feature-classifiers/99_otu-ref-taxonomy.qza

# extract features from reference -- we are essentially extracting the 16S
# region that corresponds to the region amplified in our study
# primer sequences obtained from MIT BioMicro Center: https://openwetware.org/wiki/BioMicroCenter:DNA_HTL
qiime feature-classifier extract-reads \
--i-sequences ../data/qiime/training-feature-classifiers/99_otus.qza \
--p-f-primer GTGCCAGCMGCCGCGGTAA \
--p-r-primer GGACTACHVGGGTWTCTAAT \
--p-min-length 100 \
--p-max-length 400 \
--o-reads ../data/qiime/training-feature-classifiers/99_otu-ref-seqs.qza

# train classifier
qiime feature-classifier fit-classifier-naive-bayes \
--i-reference-reads ../data/qiime/training-feature-classifiers/99_otu-ref-seqs.qza \
--i-reference-taxonomy ../data/qiime/training-feature-classifiers/99_otu-ref-taxonomy.qza \
--o-classifier ../data/qiime/training-feature-classifiers/Blactam-classifier.qza

# classify our sequences
qiime feature-classifier classify-sklearn \
--i-classifier ../data/qiime/training-feature-classifiers/Blactam-classifier.qza \
--i-reads ../data/qiime/Blactam-rep-seqs_ds1.qza \
--o-classification ../data/qiime/Blactam-taxonomy_ds1.qza

# tabulate sequences
qiime metadata tabulate \
--m-input-file ../data/qiime/Blactam-taxonomy_ds1.qza \
--o-visualization ../data/qiime/Blactam-taxonomy_ds1.qzv

# create taxa barplot
qiime taxa barplot \
--i-table ../data/qiime/Blactam-table_ds1.qza \
--i-taxonomy ../data/qiime/Blactam-taxonomy_ds1.qza \
--m-metadata-file ../data/metadata_and_manifest/Blactam_metadata_ds1.tsv \
--o-visualization ../data/qiime/Blactam-taxa-bar-plots_ds1.qzv
