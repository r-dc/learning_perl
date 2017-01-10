#!/usr/bin/perl
use Data::Dumper;

sub ref_to_big_array {
	my @big_array = map { rand } ( 1..10000 );		
	my $big_array_ref = \@big_array;
	return $big_array_ref
}

sub ref_to_big_hash {
	my %big_hash;
	my $big_hash_ref = \%big_hash;
	for ( 1..10000 ) {
		$big_hash{rand(0xffffffff)} = int rand 2**32;
	}
	return $big_hash_ref;
}

$big_array_ref = &ref_to_big_array;
$big_hash_ref = &ref_to_big_hash;

print Dumper($big_hash_ref);
print Dumper($big_array_ref);
