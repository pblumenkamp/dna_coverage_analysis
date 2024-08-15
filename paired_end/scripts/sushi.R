library('Sushi')

options <- commandArgs(trailingOnly = TRUE)
output_dir <- options[1]
file_prefix <- options[2]
coverage_file <- options[3]

dir.create(output_dir, recursive=TRUE)

coverage <- read.table(file = coverage_file, header = FALSE, sep = "\t", stringsAsFactors = TRUE)
chromosomes <- unique(coverage[1])
for (i in 1:length(chromosomes[,1])) {
  chrom <- (chromosomes[i,1])
  chromstart <- 0
  chromend <- tail(coverage[coverage[,1] == chrom,], n=1)[[3]]
  number_tickmarks <- 10
  
  svg(paste(output_dir, paste(file_prefix, chrom, "sushi.svg", sep="_"), sep="/"))
  plotBedgraph(coverage, chrom, chromstart, chromend, colorbycol = SushiColors(5))
  labelgenome(chrom, chromstart, chromend, n=number_tickmarks, scale = "Mb", chromline = 2.5, scaleline = 2.5, edgeblankfraction = 0)
  mtext("Read Depth",side=2,line=3.2,cex=1,font=2)
  axis(side=2,las=2,tcl=.2)
  dev.off()
}