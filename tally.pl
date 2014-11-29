#!/bin/env perl

use strict;
use warnings;

my $usage = "Usage: $0 <infile.bed> <directory>\n";
my $bed = shift or die $usage;
my $dir = shift or die $usage;

my %count = ();
my @file = ();

opendir(DIR,$dir) || die "Could not open $dir: $!\n";
while(my $infile = readdir(DIR)){
	next unless $infile =~ /\.count$/;
	push(@file, $infile);
	open(IN,'<',"$dir/$infile") || die "Could not open $dir/$infile: $!\n";
	while(<IN>){
		chomp;
		#chr9    132655887       132655891       0  11   -       2
		my ($chr, $start, $end, $junk, $count, $strand, $tally) = split('\t');
		my $id = "${chr}_${start}_${end}_${strand}";
		$count{$id}{$infile} = $tally;
	}
	close(IN);
}
closedir(DIR);

#header
print join("\t",'chr','start','end','id','score','strand',@file),"\n";

open(IN,'<',$bed) || die "Could not open $bed: $!\n";
while(<IN>){
	chomp;
	my ($chr, $start, $end, $junk, $count, $strand) = split('\t');
	my $id = "${chr}_${start}_${end}_${strand}";
	my $line_to_print = "$_\t";
	my $total = 0;
	if (exists $count{$id}){
		foreach my $infile (@file){
			if (exists $count{$id}{$infile}){
				$line_to_print .= "$count{$id}{$infile}\t";
				$total += $count{$id}{$infile};
			} else {
				$line_to_print .= "0\t";
			}
		}
	} else {
		die "Error missing count for $id\n";
	}
	$line_to_print =~ s/\t$//;
	#checkpoint
	die unless $total == $count;
	print "$line_to_print\n";
}
close(IN);

exit(0);
