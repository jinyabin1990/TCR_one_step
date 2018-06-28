use warnings;
use strict;

my $a=$ARGV[0];
my $b=$ARGV[1];

open IN1,$a;

while(<IN1>)
{
	chomp;
	my @bbb=split /\s+/,$_;
	my @ccc=split /_/,$bbb[0];
	my @aaa=split //,$ccc[2];
	for (my $i=1;$i<$b;$i=$i+3)
	{

		my $name=$aaa[-$i-2].$aaa[-$i-1].$aaa[-$i];
		my $yes=0;
		if($name eq "AAA" || $name eq "GAA"){print "F";$yes=1;}
		if($name eq "TAA" || $name eq "CAA"){print "L";$yes=1;}
		if($name eq "AGA" || $name eq "GGA" ||$name eq "TGA" || $name eq "CGA"){print "S";$yes=1;}
		if($name eq "ATA" || $name eq "GTA"){print "Y";$yes=1;}
		if($name eq "ACA" || $name eq "GCA"){print "C";$yes=1;}
		if($name eq "CCA" ){print "W";$yes=1;}
		if($name eq "AAG" || $name eq "GAG" ||$name eq "TAG" || $name eq "CAG"){print "L";$yes=1;}
		if($name eq "AGG" || $name eq "GGG" ||$name eq "TGG" || $name eq "CGG"){print "P";$yes=1;}
		if($name eq "ATG" || $name eq "GTG"){print "H";$yes=1;}
		if($name eq "TTG" || $name eq "CTG"){print "Q";$yes=1;}
		if($name eq "ACG" || $name eq "GCG" ||$name eq "TCG" || $name eq "CCG"){print "R";$yes=1;}
		if($name eq "AAT" || $name eq "GAT" ||$name eq "TAT"){print "I";$yes=1;}
		if($name eq "CAT" ){print "M";$yes=1;}
		if($name eq "AGT" || $name eq "GGT" ||$name eq "CGT" || $name eq "TGT"){print "T";$yes=1;}
		if($name eq "ATT" || $name eq "GTT"){print "N";$yes=1;}
        if($name eq "TTT" || $name eq "CTT"){print "K";$yes=1;}
		if($name eq "ACT" || $name eq "GCT"){print "S";$yes=1;}
        if($name eq "TCT" || $name eq "CCT"){print "R";$yes=1;}
		if($name eq "AAC" || $name eq "TAC" ||$name eq "CAC" || $name eq "GAC"){print "V";$yes=1;}
		if($name eq "AGC" || $name eq "TGC" ||$name eq "CGC" || $name eq "GGC"){print "A";$yes=1;}
		if($name eq "ATC" || $name eq "GTC"){print "D";$yes=1;}
        if($name eq "TTC" || $name eq "CTC"){print "E";$yes=1;}
		if($name eq "ACC" || $name eq "GCC" ||$name eq "TCC" || $name eq "CCC"){print "G";$yes=1;}
		if($yes==0){print "*";}
	}
	print "\t";
	print "$_\n"
}
close IN1;
