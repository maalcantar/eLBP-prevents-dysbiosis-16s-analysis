# Engineered live biotherapeutic product (eLBP) prevents antibiotic-induced dysbiosis: 16S rDNA sequencing analysis

This repository contains code needed to reproduce 16S rDNA sequence analyses described in “An engineered live biotherapeutic for the prevention of antibiotic-induced dysbiosis” (Cubillos-Ruiz et al. 2022). 

# Installation & requirements  

This repository, including all code needed to reproduce analyses, can be installed using:

~~~
git clone https://github.com/maalcantar/engineered-probiotic-prevents-dysbiosis-16s-analysis.git 
cd engineered-probiotic-prevents-dysbiosis-16s-analysis
pip install -r requirements_python.txt # requirements for Jupyter Notebooks 
~~~

16S sequence processing and analyses were conducted using QIIME 2 (Core 2020.2 distribution). The QIIME 2 2020.2 distribution can be installed by following [this tutorial](https://docs.qiime2.org/2020.2/install/native/). You will need to install QIIME2 in order to run shell scripts. 

# Directory structure
### source code

All code is in <code>/src</code>, which contains a combination of shell scripts and Python Jupyter Notebooks. The numbering at the beginning of each file name indicates the order in which that script should be run. The code provided was written on a machine with a native QIIME 2 2020.2 distribution; the virtual environment containing this QIIME2 installation is accessed various times using the command <code>source activate qiime2-2020.2</code>. If needed, please replace this command with the command used to access your own virtual environment containing a QIIME2 installation.  

### data

All data files are found in and/or will be written to <code>data/</code>

* <code>data/beta_diversity_dataframes/</code>
  * Contains raw csv files used by Python Jupyter Notebooks in order to recreate B-diversity PCoA plots. These dataframes were manually created by extracting data from QIIME 2 B-diversity PCoA output files
* <code>data/Blactam_16s_data/</code>
  * Directory where all sequencing files should be stored. Each pair of files -- for forward and reverse reads -- is contained in its own folder. Please see the manifest file (<code>data/Blactam_16s_data/metadata_and_manifest/Blactam_manifest_ds1.tsv</code>) for a complete description of file names and directory paths.
* <code>data/metadata_and_manifest/</code>
  * Contains manifest files (used to load sequencing data into a QIIME artifact) and all iterations of the metafata files.
* <code>data/qiime/</code>
  * Directory where all files created with QIIME 2 (i.e., qza and qzv files) will be written

  
16S rDNA sequencing data is not included in this repository due to their large file sizes; however, all data are publicly available under NCBI Bioproject PRJNA803721. 
Some other large files (e.g., Blactam-paired-end-demux_ds1.qza; >7GB) could not be included and can be produced by running the code found in this repository. 

### figures

Various figures created by Jupyter Notebooks can be found in <code>figs/</code>. The majority of figures shown in the publication were recreated using PRISM.


Please feel free to reach out if you have any questions about implementation or reproducing analyses! (alcantar [at] mit [dot] edu).
