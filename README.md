[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<br />
<div align="center">
  
  <h3 align="center">DNA Coverage Analysis</h3>

  <p align="center">
    Snakemake pipelines for preprocessing, mapping, and coverage charts of bacterial DNA-Seq data
    <br />
    <a href="https://github.com/pblumenkamp/dna_coverage_analysis"><strong>Explore the docs »</strong></a>
  </p>
</div>



<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Project

These pipelines visualize the coverage of DNA-Seq data on one or multiple reference genomes. A pipeline consists of the following steps:
1. Quality control of the raw data with FastQC
2. Preprocessing with fastp
3. Quality control of the preprocessed data with FastQC
4. rRNA filtering with SortMeRNA
5. For each reference:
    1. Mapping with bowtie2
    2. Feature counting with featureCounts
    3. Coverage plots with bedtools and R-Sushi


## Getting Started

### Prerequisites

The only requirements are a functional conda/mamba and Snakemake with version 8 or newer.
* [mamba](https://github.com/conda-forge/miniforge)

* [snakemake](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html)
  ```sh
  mamba create -c conda-forge -c bioconda -n snakemake snakemake
  ```

### Installation

   ```sh
   git clone https://github.com/pblumenkamp/dna_coverage_analysis.git
   ```

### Required files
* DNA-Seq data in gzipped **FASTQ** format
* One or multiple reference genomes in (gzipped or uncompressed) **FASTA** format
* Reference Annotation for each genome in uncompressed **GFF3** format

## Usage

1. Use the pipeline in [paired_end](paired_end) for paired-end data and the pipeline in [single_end](single_end) for single-end data.
   ```sh
   # e.g.
   cd paired_end
   ```

2. Change settings in [config.yaml](paired_end/config.yaml). The most important settings are the input directory and the used references.
   
3. Start the snakemake pipeline locally or on a compute cluster.
   ```sh
   # Local
   snakemake --configfile config.yaml --use-conda --resources mem_mb=<max_ram_usage_in_mb>
   # Compute cluster 
   snakemake --configfile config.yaml --use-conda --profile <path_to_your_cluster_profile>/cluster_profile
   ```

### Config.yaml
There are, at the moment, 4 different parts in the `config.yaml`.
#### fastq_input_dir
This defines the directory where the DNA-Seq data is stored. As a naming convention, all single-end DNA-Seq files must end with `fastq.gz,` and all paired-end files must end with `_R1.fastq.gz` and `_R2.fastq.gz`.
#### coverage_resolution
Defines the resolution in base pairs (bp) for each bar in the final coverage bar plots. A list with multiple resolutions is possible (comma-separated), so separate folders for each coverage plot are created.
#### references
A list of all reference genomes for the coverage analysis. Each reference will be analyzed separately. `genome` must be the path to the reference genome in (compressed) FASTA format. `annotation` is the path to the reference annotation in uncompressed GFF3 format. `gff_features` is a list of GFF feature types which will be counted in separate count tables. Please verify that the listed feature type can also be found in the GFF3 file.
#### memory_usage_in_mb
List of pipeline steps with data-dependent memory usage. Please adjust these numbers if you use Snakemake on a compute cluster with memory limits and run in out-of-memory errors. These settings can also be used locally with the option `--resources mem_mb=<max_ram_usage_in_mb>`.


## License

Distributed under the MIT License. See `LICENSE.txt` for more information.



<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->
[contributors-shield]: https://img.shields.io/github/contributors/pblumenkamp/dna_coverage_analysis.svg?style=for-the-badge
[contributors-url]: https://github.com/pblumenkamp/dna_coverage_analysis/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/pblumenkamp/dna_coverage_analysis.svg?style=for-the-badge
[forks-url]: https://github.com/pblumenkamp/dna_coverage_analysis/network/members
[stars-shield]: https://img.shields.io/github/stars/pblumenkamp/dna_coverage_analysis.svg?style=for-the-badge
[stars-url]: https://github.com/pblumenkamp/dna_coverage_analysis/stargazers
[issues-shield]: https://img.shields.io/github/issues/pblumenkamp/dna_coverage_analysis.svg?style=for-the-badge
[issues-url]: https://github.com/pblumenkamp/dna_coverage_analysis/issues
[license-shield]: https://img.shields.io/github/license/pblumenkamp/dna_coverage_analysis.svg?style=for-the-badge
[license-url]: https://github.com/pblumenkamp/dna_coverage_analysis/blob/master/LICENSE.txt
