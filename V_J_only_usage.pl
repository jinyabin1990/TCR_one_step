use warnings;
use strict;

my $a=$ARGV[0];

open IN1,$a;
open OUT1,">$a.V";
open OUT2,">$a.J";

my $J1=0;
my $J2=0;
my $J3=0;
my $J4=0;
my $J5=0;
my $J6=0;
my $J7=0;
my $J8=0;
my $J9=0;
my $J10=0;
my $J11=0;
my $J12=0;
my $J13=0;


while(my $aa=<IN1>)
{
	chomp($aa);
	my $num=0;
	$J1=$J1+$aa;
	my $bb=<IN1>;chomp($bb);  $J2=$J2+$bb;
	my $cc=<IN1>;chomp($cc);  $J3=$J3+$cc;
	my $dd=<IN1>;chomp($dd);  $J4=$J4+$dd;
	my $ee=<IN1>;chomp($ee);  $J5=$J5+$ee;
	my $ff=<IN1>;chomp($ff);  $J6=$J6+$ff;
	my $gg=<IN1>;chomp($gg);  $J7=$J7+$gg;
	my $hh=<IN1>;chomp($hh);  $J8=$J8+$hh;
	my $ii=<IN1>;chomp($ii);  $J9=$J9+$ii;
	my $jj=<IN1>;chomp($jj);  $J10=$J10+$jj;
	my $kk=<IN1>;chomp($kk);  $J11=$J11+$kk;
	my $ll=<IN1>;chomp($ll);  $J12=$J12+$ll;
	my $mm=<IN1>;chomp($mm);  $J13=$J13+$mm;
	
	my $Vsum=$aa+$bb+$cc+$dd+$ee+$ff+$gg+$hh+$ii+$jj+$kk+$ll+$mm;
	print OUT1 "$Vsum\n";
}
close IN1;

print OUT2 "$J1\n$J2\n$J3\n$J4\n$J5\n$J6\n$J7\n$J8\n$J9\n$J10\n$J11\n$J12\n$J13\n";

close OUT1;
close OUT2;


