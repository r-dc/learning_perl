package dataGen;

use strict;
use warnings;

use base 'Exporter';
our @EXPORT = qw/
		ref_to_big_array
		ref_to_big_hash
		/;

sub ref_to_big_array {
	my @big_array = map { rand(0xffffffff) } ( 1..10000 );		
	my $big_array_ref = \@big_array;
	return $big_array_ref
}

sub ref_to_big_hash {
	my %big_hash;
	my $big_hash_ref = \%big_hash;
	for ( 1..10000 ) {
		$big_hash{rand(0xffffffff)} = rand(0xffffffff);
	}
	return $big_hash_ref;
}

1;
