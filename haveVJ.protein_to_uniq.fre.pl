use warnings;
use strict;
my$a=$ARGV[0];

open IN1,"$a";
open OUT,">$a.uniq.fre";
my %hash;

while(<IN1>)
{
	chomp;
	if ($_=~/\*/)
	{}
	else
	{
		my @aaa=split /\s+/,$_;
		my @bbb=split /_/,$aaa[1];
		if(exists $hash{$aaa[0]})
		{
			$hash{$aaa[0]}=$hash{$aaa[0]}+$bbb[1];
		}
		else
		{
			$hash{$aaa[0]}=$bbb[1];
		}
	}
}
close IN1;

foreach my $ccc(keys %hash)
{
	print OUT "$hash{$ccc}\t$ccc\n";
}
close OUT;
