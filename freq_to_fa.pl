use warnings;
use strict;

my $a=$ARGV[0];
my $b=$ARGV[1];

open IN1,"$a";

my $bbb=0;

while(<IN1>)
{
	my @aaa=split /\s+/,$_;
	$bbb++;
	print ">$bbb\_$aaa[-2]_$aaa[-1]\n$aaa[-1]\n";
}
close IN1;



