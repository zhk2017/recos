#!/usr/bin/perl -w
use strict;

die "perl $0 <in repeatmask out> <type list> <out prefix>" unless(@ARGV==3);

my $in_repeatmask_out = shift;
my $type_list = shift;
my $outdir = shift;

my %type_str;
my %handles;
open TP, "<$type_list";
while(<TP>){
	chomp;
	my @eles = split /\s+/;
	$type_str{$eles[0]} = $eles[-1];
	open $handles{$eles[0]}, ">$outdir/$eles[0]";
}
close TP;

open OUT, "<$in_repeatmask_out";
while(<OUT>){
	chomp;
	next if(/^\s*$/);
	next unless(/^\s*\d+/);
	$_ =~ s/^\s*//;
	my @eles = split /\s+/;
	my $type = $eles[10];
	foreach my $r (keys %type_str){
		if($type =~ /$type_str{$r}/){
			print {$handles{$r}} join("\t", $eles[4], $eles[5], $eles[6], $type)."\n";
			last;
		}
	}
}
close OUT;
