use warnings;
use strict;

#usage:  perl TCR_one_Step.pl  samples.seq  TCR_range(9-125)  3'primerseq  blat_adress  TCRB/TCRA

my $sample=$ARGV[0];
my $range=$ARGV[1];
my $primerseq=$ARGV[2];
my $blat=$ARGV[3];
my $TCRAB=$ARGV[4];

my @num=split /-/,$range;
my $nt_num=$num[1]-$num[0]+1;
my $pr_num=$nt_num/3;


open OUT,">$sample.sh";

print OUT "
grep ^$primerseq $sample|cut -b $range > $sample.1.\n
sort $sample.1.|uniq -c|sort -n -r > $sample.2.\n
perl perl_project/freq_to_fa.pl $sample.2. > $sample.3.\n
$blat $TCRAB.fasta $sample.3. -out=blast8 -stepSize=5 -minScore=0 -minIdentity=0 $sample.4.\n
perl perl_project/anno.pl $sample.4. $TCRAB.anno  $sample.5.\n
perl perl_project/anno2oneline.pl $sample.5. $sample.6.\n
less $sample.6.|grep V|grep J > $sample.7.\n
perl perl_project/haveVJ_seq_to_protein.pl  $sample.7. $nt_num > $sample.8.\n
perl perl_project/haveVJ.protein_to_uniq.fre.pl $sample.8. \n
sort -n -r $sample.8..uniq.fre > $sample.8..uniq.fre.sort\n
perl perl_project/protein.uniq.fre.sort.anno.pl $sample.8.\n
perl perl_project/cut_CDR3.pl $sample.8..uniq.fre.sort.anno $pr_num\n
perl perl_project/CDR3.sort.pl $sample.8..uniq.fre.sort.anno.CDR3\n
perl perl_project/V_J_usage.pl $sample.8..uniq.fre.sort.anno.CDR3.com\n
perl perl_project/V_J_only_usage.pl  $sample.8..uniq.fre.sort.anno.CDR3.com.VJ\n
perl perl_project/clonenumber_clonetype_ShannonEntropy.pl  $sample.8..uniq.fre.sort.anno.CDR3.com > $sample.ShannonEntropy.list\n
";

