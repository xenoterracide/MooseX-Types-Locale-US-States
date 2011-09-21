#!/usr/bin/perl
use strict;
use warnings;
use Test::More;

{
	package State;
	use Moose;
	use MooseX::Types::Locale::US::States qw( USStateName );

	has state => (
		is => 'ro',
		isa => USStateName,
		coerce => 1,
	);
	__PACKAGE__->meta->make_immutable;
}

my $s0 = State->new({ state => 'Michigan' });

is( $s0->state, 'MICHIGAN', 'check state is correct' );

my $s1 = State->new({ state => 'MI' });

is( $s1->state, 'MICHIGAN', 'check state is correct' );

done_testing;
