#!/usr/bin/perl
#
# convert data files to format for R/qtl
######################################################################
@files = ("37QTL-Lyons1.csv", 
	  "37QTL-Lyons3.csv",
	  "37QTL-Wittenburg1.csv",
	  "37QTL-Wittenburg3.csv");

# Cox et al. genetic map
$mapfile = "Data/coxmap.txt";
open(IN, $mapfile) or die("Cannot read from $mapfile");
while($line = <IN>) {
    chomp($line);
    ($marker, $junk, $chr, $pos) = split(/\s+/, $line);
    if($chr == 20) { $chr = "X"; }
    $chr{$marker} = $chr;
    $pos{$marker} = $pos;
}
@markers = sort bypos (keys %chr);

# revise map info using Cox map
$ifile = "Data/maps.csv";
$ofile = "Data/maps_rev.csv";
open(IN, $ifile) or die("Cannot read from $ifile");
open(OUT, ">$ofile") or die("Cannot write to $ofile");
$line = <IN>; chomp($line);
@v = split(/,/, $line);
print OUT (join(",", @v[0..2]), ",coxpos,", join(",", @v[3..(@v-1)]), "\n");
while($line = <IN>) {
    chomp($line);
    @v = split(/,/, $line);
    print OUT (join(",", @v[0..2]), ",$pos{$v[0]},", join(",", @v[3..(@v-1)]), "\n");
}



# write data files for R/qtl
foreach $filei (0..(@files-1)) {
    $ifile = "Rawdata/$files[$filei]";
    $files[$filei] =~ /^(.*)\.csv$/;
    $ofile = "Data/$1" . "_rev.csv";

    open(IN, $ifile) or die("Cannot read from $ifile");
    open(OUT, ">$ofile") or die("Cannot write to $ofile");
    print " -Reading from $ifile\n";
    $line1 = <IN>; chomp($line1);
    $chrline = <IN>; chomp($chrline);
    $posline = <IN>; chomp($posline);
    @v1 = split(/,/, $line1);
    @chr = split(/,/, $chrline);
    @pos = split(/,/, $posline);
    foreach $i (0..(@chr-1)) {
	if($chr[$i] ne "") { $nblank = $i; last; }
    }
    @mar = @v1[$nblank..(@v1-1)];
    
    foreach $i (0..($nblank-1)) {
	if($i > 0) { print OUT ","; }
	print OUT "$v1[$i]";
    }
    foreach $marker (@markers) {
	print OUT ",$marker";
    }
    print OUT "\n";
    
    foreach $i (1..($nblank-1)) {
	print OUT ","; 
    }
    foreach $marker (@markers) {
	print OUT ",$chr{$marker}";
    }
    print OUT "\n";
    
    foreach $i (1..($nblank-1)) {
	print OUT ","; 
    }
    foreach $marker (@markers) {
	print OUT ",$pos{$marker}";
    }
    print OUT "\n";
    
    while($line = <IN>) {
	chomp($line);
	@v = split(/,/, $line);
	@phe = @v[0..($nblank-1)];
	@gen = @v[$nblank..(@v-1)];
	%gen = ();
	foreach $i (0..(@gen-1)) {
	    $gen{$mar[$i]} = $gen[$i];
	}
	
	print OUT (join(",", @phe)); 
	foreach $mar (@markers) {
	    if($gen{$mar} eq "") {
		print OUT ",=";
	    }
	    else {
		print OUT ",$gen{$mar}";
	    }
	}
	print OUT "\n";
    }


}



sub bypos {
    $ca = $chr{$a};
    $cb = $chr{$b};
    if($ca eq "X") { $ca = 20; }
    if($cb eq "X") { $cb = 20; }
    if($ca == $cb) { return($pos{$a} <=> $pos{$b}); }
    $ca <=> $cb;
}
    
