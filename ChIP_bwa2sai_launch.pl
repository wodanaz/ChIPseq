#!/usr/bin/perl

my $usage= "

Prints out list of commands for launcher_creator.py
in order to create .sai files to execute bwa-map 
to map ChIPseq reads

The arguments are:
1: glob to fastq files
2: Genome reference to map to (basename of bwa index file)'

";

if (!$ARGV[0]) { die $usage;}
my $glob=$ARGV[0];
if (!$ARGV[1]) { die $usage;}
my $ref=$ARGV[1];


opendir THIS, ".";
my @fqs=grep /$glob/,readdir THIS;
my $outname="";

foreach $fqf (@fqs) {
        if ($ARGV[2]) {
                my @parts=split('_',$fqf);
                $outname=$parts[$ARGV[1]-1].".sai";
        }
	else { $outname=$fqf.".sai";}
        print "bwa aln $ref $fqf > $outname\n";
}
