use warnings;
use strict;


my $a=$ARGV[0];
my $b=$ARGV[1];

my $azong=0;
my $bzong=0;
my $az=0;
my $bz=0;
my %hash;

open IN1,$a;
while(<IN1>)
{
	chomp;
	my @aaa=split /\s+/,$_;
	$azong=$azong+$aaa[0];
	$az++;
	$hash{$aaa[1]}=$aaa[0];
}
close IN1;

open IN2,$b;
while(<IN2>)
{
    chomp;
	$bz++;
	my @aaa=split /\s+/,$_;
	$bzong=$bzong+$aaa[0];
}
close IN2;

my $num=0;
my $per=0;
my $fenzi=0;
my $fenmu1=0;
my $fenmu2=0; 

open IN1,$a;
while(<IN1>)
{
	chomp;
	my @aaa=split /\s+/,$_;
	$fenmu1=$fenmu1+$aaa[0]*$aaa[0];
}
close IN1;

open IN2,$b;
while(<IN2>)
{
    chomp;
	my @aaa=split /\s+/,$_;
	$fenmu2=$fenmu2+$aaa[0]*$aaa[0];
	if (exists $hash{$aaa[1]})
	{
		$num++;
		$per=$per+($hash{$aaa[1]}+$aaa[0])/($azong+$bzong);
		$fenzi=$fenzi+$hash{$aaa[1]}*$aaa[0];
	}
	

}
close IN2;
my $numb=$num*2/($az+$bz);
print "$numb\t$per\t";


$fenmu1=$fenmu1/($azong*$azong);
$fenmu2=$fenmu2/($bzong*$bzong);



my $MHindex=2*$fenzi/(($fenmu1+$fenmu2)*$azong*$bzong);
print "$MHindex\n";
