use warnings;
use strict;

my $a=$ARGV[0];
my $b=$ARGV[1];
open IN1,$a;
open OUT,">$a.CDR3";

while(<IN1>)
{
	chomp;
	my @aaa=split /\t/,$_;
	my $seq=$aaa[1];
	my @bbb=split //,$seq;
	my $start=0;
	my $end=0;
	for(my $i=2;$i<$b;$i++)
	{
		if($bbb[$i] eq "C" && $bbb[$i-2] eq "Y" &&($bbb[$i-1] eq "L"||$bbb[$i-1] eq "F"||$bbb[$i-1] eq "R" || $bbb[$i-1] eq "V" || $bbb[$i-1] eq "I")){$start=$i;last;}
	}
	for(my $i=$start;$i<$b-3;$i++)
	{
		if($bbb[$i] eq "F" && $bbb[$i+1] eq "G" && $bbb[$i+3] eq "G" && ($bbb[$i+2] eq "P" || $bbb[$i+2] eq "A" || $bbb[$i+2] eq "Q" || $bbb[$i+2] eq "S"|| $bbb[$i+2] eq "E"|| $bbb[$i+2] eq "D" || $bbb[$i+2] eq "N" )){$end=$i;last;}	
	}
	if($start==0||$end==0){}
	else
	{
	my $length=$end-$start+1;
	my $CDR3=substr($seq,$start,$length);
	print OUT "$aaa[0]\t$CDR3\t$aaa[2]\t$aaa[3]\n";
	}
}
close IN1;
close OUT;
