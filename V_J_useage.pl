use warnings;
use strict;

### haveVJC.protein.uniq
my $a=$ARGV[0];

open OUT,">$a.VJ";
open IN1,"$a";
my %hash;
my $Jname;
my $Vname;
my $total=0;


while(<IN1>)
{
	chomp;
	my @aaa=split /\s+/,$_;
    $Vname=$aaa[1];
	$Jname=$aaa[2];
	$total=$total+$aaa[0];
	my $name="$Vname\t$Jname";
	if(exists $hash{$name})
	{$hash{$name}=$hash{$name}+$aaa[0];}
	else
	{$hash{$name}=$aaa[0];}
}
close IN1;



open IN2,"B_VJ_pairs.list";
while(<IN2>)
{
	chomp;
	if(exists $hash{$_})
	{
		print OUT "$hash{$_}\n";
	}
	else
	{
		print OUT "0\n";
	}
}

close IN2;
close OUT;







