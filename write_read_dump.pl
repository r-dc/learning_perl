#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

use dataGen qw	/
		ref_to_big_array
		ref_to_big_hash
		/;

my $array_ref = &ref_to_big_array;
my $hash_ref = &ref_to_big_hash;

foreach (@$array_ref) {
	$_ = sprintf "0x%X", $_;
}

foreach (keys %$hash_ref) {
	my $key_hex = sprintf "0x%X", $_;
	my $val_hex = sprintf "%X", $$hash_ref{$_};
	$$hash_ref{$key_hex} = $val_hex;
	delete $$hash_ref{$_};
}

open my $FH1, '>', 'd1';
print $FH1 Dumper($array_ref);
close $FH1;

open my $FH2, '>', 'd2';
print $FH2 Dumper($hash_ref);
close $FH2;
