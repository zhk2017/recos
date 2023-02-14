#!/usr/bin/perl -w
use strict;
use File::Basename;
use Getopt::Long;
use FindBin qw($Bin);
use Cwd 'abs_path';
my $usage=<<USAGE;

Program: recos (plot genomic characteristics and collinearity)
Version: 1.0.0
Contact: Haikuan Zhang <zhk_\@hotmail.com>                                                                                                     

Usage: perl $0 -c <ini format config file> -o [output file name]

    -c  [required] Config file for all settings. Input variant file or plot parameters.
	-o  [optional] Output file name. [default:genome.comparison].
	
NOTE:
	For non-commercial use only, all rights reserved!
	
USAGE

my ($config, $out);
GetOptions(
    "c:s"=>\$config,
	"o:s"=>\$out,
);
die $usage if (!defined $config );
$out ||= 'genome.comparison';
$out = abs_path($out);
$config = abs_path($config);
my %paths;
my @path_list;
push @path_list, $Bin;
my $absolute_path;
push @path_list, $out;
push @path_list, $config;

open IN, "<$config";
while(<IN>){
	chomp;
	my @eles = split /=/, $_;
	chomp @eles;
	if(@eles == 2){
		if($eles[0] =~ /chromosome_list/ or $eles[0] =~ /file/ or $eles[0] =~ /coord/){
			chomp $eles[1];
			$absolute_path = abs_path($eles[1])
		}
	}
}
close IN;

foreach my $path (@path_list){
	my @temp = split /\//, $path;
	$paths{$temp[1]} = 1;
}

my $B = "";
foreach my $p (keys %paths){
	$B.=" /$p:/$p";
}

print("[run command]: singularity run -B $B --env LC_ALL=C $Bin/img/recos.sif $Bin/exe/recos -c $config -o $out\n\n");
system("singularity run -B $B --env LC_ALL=C $Bin/img/recos.sif $Bin/exe/recos -c $config -o $out");
