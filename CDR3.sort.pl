use warnings;
use strict;

my $a=$ARGV[0];
open IN1,$a;
my %hash;
my $sum=0;
while(<IN1>)
{
	chomp;
	my @aaa=split /\t/,$_;
	my $name="$aaa[2]\t$aaa[3]\t$aaa[1]";
	my $num=$aaa[0];
	$sum=$sum+$num;
	if(exists $hash{$name})
	{
		$hash{$name}=$hash{$name}+$num;
	}
	else
	{
		$hash{$name}=$num;
	}
}
close IN1;

open OUT,">$a.com";
foreach my $keys(keys %hash)
{
	my $per=$hash{$keys}/$sum;
	print OUT "$hash{$keys}\t$keys\t$per\t$sum\n";
}
close OUT;
