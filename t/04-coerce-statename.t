#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

{
	package State;
	use Moose;
	use MooseX::Types::Locale::US::States qw( USStateName );

	has state => (
		is => 'rw',
		isa => USStateName,
		coerce => 1,
	);
	__PACKAGE__->meta->make_immutable;
}

my $s0 = State->new({ state => 'MI' });

is( $s0->state, 'MICHIGAN', 'coerce to name' );

$s0->state('michigan');

is( $s0->state, 'MICHIGAN', 'coerce from lowercase' );

done_testing;
