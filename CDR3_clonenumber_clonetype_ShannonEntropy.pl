use warnings;
use strict;

my $a=$ARGV[0];

open IN1,"$a";

my $zhonglei=0;
my $zongshu=0;

while(<IN1>)
{
	chomp;
	my @bbb=split /\t/,$_;
	$zongshu=$zongshu+$bbb[0];
	$zhonglei=$zhonglei+1;
}

print "$a\t$zongshu\t$zhonglei\t";

close IN1;

open IN2,"$a";

my $entropy=0;

while(<IN2>)
{
	chomp;
	my @bbb=split /\t/,$_;
	my $pi=$bbb[0]/$zongshu;
	$entropy=$entropy-$pi*log($pi)/log(2);
}
print "$entropy\t";
close IN2;


open IN4,"$a";
my $sim=0;
while(<IN4>)
{
	chomp;
	my @bbb=split /\t/,$_;
	$sim=$sim+($bbb[0]/$zongshu)*($bbb[0]/$zongshu);
}
close IN4;

my $simpson=1/$sim;
print "$simpson\n";














