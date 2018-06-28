use warnings;
use strict;

my $a=$ARGV[0];
my $b=$ARGV[1];
my $c=$ARGV[2];

open IN1,"$a";
open OUT,">$c";


while(<IN1>)
{
	chomp;
	my @aaa=split /\s+/,$_;
	my $st;my $end;
	if($aaa[8]<$aaa[9])
	{
	 $st=$aaa[8];
	 $end=$aaa[9];
	}
	else
	{
	$st=$aaa[9];
        $end=$aaa[8];

	}
	print OUT $_;
	open IN2,"$b";
	while(my $ccc=<IN2>)
	{
		chomp($ccc);
		my @bbb=split /\s+/,$ccc;
		my $st1=$bbb[1];
		my $end1=$bbb[2];
		my $anno=$bbb[0];
		if($end<$st1||$end1<$st){}
		else
		{
			print OUT "\t$ccc";
		}		
	}
	close IN2;	

	print OUT  "\n";

}
close IN2;
close OUT;
