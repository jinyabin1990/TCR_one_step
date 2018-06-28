use warnings;
use strict;

my $a=$ARGV[0];
my $b=$ARGV[1];

open IN1,"$a";
open OUT,">$b";

my $first=<IN1>;
chomp($first);
print OUT $first;
my @ddd=split /_/,$first;
my $num=$ddd[0];

while(<IN1>)
{
	chomp;
	my @aaa=split /_/,$_;
	if ($aaa[0] == $num){print OUT "\t$_"}
	else{print OUT "\n$_";$num = $aaa[0];}
	

}
close IN1;
close OUT;
