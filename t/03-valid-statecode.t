#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

{
	package State;
	use Moose;
	use MooseX::Types::Locale::US::States qw( USStateCode );

	has state => (
		is => 'ro',
		isa => USStateCode,
	);
	__PACKAGE__->meta->make_immutable;
}

my $s0 = State->new({ state => 'MI' });

is( $s0->state, 'MI', 'check state is correct' );

done_testing;
