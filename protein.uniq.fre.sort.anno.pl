use warnings;
use strict;

my $a=$ARGV[0];

my %hash;

open IN2,"$a";
while(<IN2>)
{
	chomp;
	my @aaa=split /\s+/,$_;
	if(exists $hash{$aaa[0]}){}
	else
	{
		for(my $i=0;$i<@aaa;$i++)
		{
			if ($aaa[$i] =~/TCRBV/)
			{
				$hash{$aaa[0]}="$aaa[$i]";
				last;
			}
		}
		for(my $i=0;$i<@aaa;$i++)
		{
			if ($aaa[$i] =~/TCRBJ/)
			{
				$hash{$aaa[0]}="$hash{$aaa[0]}\t$aaa[$i]";
				last;
			}
		}
		for(my $i=0;$i<@aaa;$i++)
		{
			if ($aaa[$i] =~/TCRBC/)
			{
				$hash{$aaa[0]}="$hash{$aaa[0]}\t$aaa[$i]";
				last;
			}
		}
	}
}	
	close IN2;

open IN1,"$a.uniq.fre.sort";
open OUT,">$a.uniq.fre.sort.anno";

while(<IN1>)
{
	chomp;
	my @bbb=split /\s+/,$_;
	print OUT "$_\t$hash{$bbb[1]}\n";
}
close IN1;
close OUT;



