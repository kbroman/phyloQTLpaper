#!/usr/bin/perl
# 
# combine the genetic maps
######################################################################
@files = ("37QTL-Lyons1.csv", 
	  "37QTL-Lyons3.csv",
	  "37QTL-Wittenburg1.csv",
	  "37QTL-Wittenburg3.csv");

@crosses = ("cd", "cs", "pi", "pd");

foreach $filei (0..(@files-1)) {
    $ifile = "Rawdata/$files[$filei]";
    open(IN, $ifile) or die("Cannot read from $ifile");
    print " -Reading from $ifile\n";
    $line1 = <IN>; chomp($line1);
    $chrline = <IN>; chomp($chrline);
    $posline = <IN>; chomp($posline);
    @v1 = split(/,/, $line1);
    @chr = split(/,/, $chrline);
    @pos = split(/,/, $posline);
#    print(join("|", @chr), "\n");
    foreach $i (0..(@chr-1)) {
	if($chr[$i] ne "") { $nblank = $i; last; }
    }
#    print " ---no. blanks = $nblank\n";
    @mar = @v1[$nblank..(@v1-1)];
    @chr = @chr[$nblank..(@chr-1)];
    @pos = @pos[$nblank..(@pos-1)];
    
    foreach $i (0..(@mar-1)) {
	if($chr{$mar[$i]} ne "" and $chr{$mar[$i]} != $chr[$i]) {
	    print "Chr mismatch: $mar[$i] $chr[$i] $chr{$mar[$i]}\n";
	}
	$chr{$mar[$i]} = $chr[$i];
	push(@{$pos{$mar[$i]}}, $pos[$i]);
	$Pos{$mar[$i]}{$crosses[$filei]} = $pos[$i];
    }
}

foreach $mar (keys %pos) {
    $n = @{$pos{$mar}};
    $x = 0;
    foreach $i (0..($n-1)) {
	$x += $pos{$mar}[$i];
    }
    $avepos{$mar} = $x / $n;
    $ncross{$mar} = $n;
}

# write combined map and list of markers
$ofile = "Data/maps.csv";
$ofile2 = "Data/markers.csv";
open(OUT, ">$ofile") or die("Cannot write to $ofile");
open(OUT2, ">$ofile2") or die("Cannot write to $ofile2");
print OUT "marker,chr,ncross,avepos";
foreach $cross (@crosses) {
    print OUT ",pos $cross";
}
print OUT "\n";

foreach $marker (sort bypos keys %chr) {
    print OUT2 "$marker\n";
    print OUT "$marker,$chr{$marker},$ncross{$marker},$avepos{$marker}";
    foreach $cross (@crosses) {
	print OUT ",$Pos{$marker}{$cross}";
    }
    print OUT "\n";
}


sub bypos {
    $ca = $chr{$a};
    $cb = $chr{$b};
    if($ca eq "X") { $ca = 20; }
    if($cb eq "X") { $cb = 20; }
    if($ca == $cb) { return($avepos{$a} <=> $avepos{$b}); }
    $ca <=> $cb;
}
    
