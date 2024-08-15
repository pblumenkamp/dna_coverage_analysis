<a id="readme-top"></a>

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]



<br />
<div align="center">
  
  <h3 align="center">DNA Coverage Analysis</h3>

  <p align="center">
    Snakemake pipelines for preprocessing, mapping and coverage charts of bacterial DNA-Seq data
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
1. Qualitity control of the raw data with FastQC
2. Preprocessing with Fastp
3. Qualitity control of the preprocessed data with FastQC
4. rRNA filtering with sortmerna
5. For each reference:
    1. Mapping with bowtie2
    2. Feature counting with featureCounts
    3. Coverage plots with bedtools and R-Sushi

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## Getting Started

### Prerequisites

The only reqirements are a functional conda/mamba and Snakemake with version 8 or newer.
* [mamba](https://github.com/conda-forge/miniforge)

* [snakemake](https://snakemake.readthedocs.io/en/stable/getting_started/installation.html)
  ```sh
  mamba create -c conda-forge -c bioconda -n snakemake snakemake
  ```

### Installation

1. Clone this repo
   ```sh
   git clone https://github.com/pblumenkamp/dna_coverage_analysis.git
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

1. Use the pipeline in `paired_end` for paired-end data and the pipeline in `single_end` for single-end data.
   ```sh
   # e.g.
   cd paired_end
   ```

2. Change settings in `config.yaml`. The most important settings are the input directory and the used references.
   
3. Start snakemake pipeline.
   ```sh
   # Local
   snakemake --configfile config.yaml
   # Compute cluster 
   snakemake --configfile config.yaml --profile <path_to_your_cluster_profile>/cluster_profile
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>



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
