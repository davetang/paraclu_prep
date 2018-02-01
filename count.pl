#!/usr/bin/env perl

use strict;
use warnings;

my $usage = "Usage: $0 <infile.input> <infile.bed>\n";
my $infile = shift or die $usage;
my $bed = shift or die $usage;

my $bin_size = 200;

my %bed = ();
open(IN,'<',$bed) || die "Could not open $bed: $!\n";
while(<IN>){
   chomp;
   my ($chr, $start, $end, $id, $score, $strand) = split(/\t/);
   my $which_bin = int($start / $bin_size);
   #print "$which_bin\t$_\n";
   my $key = join(":", $chr, $start, $end, $id, $score, $strand);
   $bed{$chr}{$strand}{$which_bin}{$key} = 1;
}
close(IN);

my %result = ();
open(IN,'<',$infile) || die "Could not open $infile; $!\n";
while(<IN>){
   chomp;
   #chr1    +       10088   1
   my ($c, $str, $sta, $count) = split(/\t/);
   my $which_bin = int($sta / $bin_size);

   #check bin before and after
   #incase the coordinates span a bin
   for ($which_bin - 1 .. $which_bin + 1){
      my $current_bin = $_;
      if (exists $bed{$c}{$str}{$current_bin}){
         foreach my $key (keys $bed{$c}{$str}{$current_bin}){
            my ($chr, $start, $end, $id, $score, $strand) = split(/:/,$key);
            if ($sta >= $start && $sta <= $end){
               if (exists $result{$key}){
                  $result{$key}++;
               } else {
                  $result{$key} = 1;
               }
            }
         }
      }
   }
}
close(IN);

foreach my $key (keys %result){
   my ($chr, $start, $end, $id, $score, $strand) = split(/:/,$key);
   print join("\t", $chr, $start, $end, 0, $score, $strand, $result{$key}),"\n";
}

exit(0);

__END__
