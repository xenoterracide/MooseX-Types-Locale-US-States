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
	);
	__PACKAGE__->meta->make_immutable;
}

my $s0 = State->new({ state => 'MICHIGAN' });

is( $s0->state, 'MICHIGAN', 'check state is correct' );

done_testing;
