#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

{
	package State;
	use Moose;
	use MooseX::Types::Locale::US::States qw( USStateCode );

	has state => (
		is => 'rw',
		isa => USStateCode,
		coerce => 1,
	);
	__PACKAGE__->meta->make_immutable;
}

my $s0 = State->new({ state => 'MICHIGAN' });

is( $s0->state, 'MI', 'coerce to code' );

$s0->state('michigan');

is( $s0->state, 'MI', 'coerce from lowercase' );

done_testing;
