#!/bin/bash

wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRikenCage/wgEncodeRikenCageHelas3CellPapAlnRep1.bam
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRikenCage/wgEncodeRikenCageHelas3CellPapAlnRep2.bam
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRikenCage/wgEncodeRikenCageHelas3CytosolPapAlnRep1.bam
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRikenCage/wgEncodeRikenCageHelas3CytosolPapAlnRep2.bam
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRikenCage/wgEncodeRikenCageHelas3NucleusPapAlnRep1.bam
wget http://hgdownload.cse.ucsc.edu/goldenPath/hg19/encodeDCC/wgEncodeRikenCage/wgEncodeRikenCageHelas3NucleusPapAlnRep2.bam

mkdir bam
mv *.bam bam
