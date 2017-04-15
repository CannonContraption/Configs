#!/usr/bin/perl
my $gscounter = 0;
for my $line(`git status -s`){
	$gscounter++;
}
print "$gscounter";
