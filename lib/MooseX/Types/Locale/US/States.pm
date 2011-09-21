package MooseX::Types::Locale::US::States;
use 5.008;
use strict;
use warnings;
use namespace::autoclean;

# VERSION

use MooseX::Types -declare => [ qw( USStateName USStateCode ) ];
use MooseX::Types::Moose qw( Str );

use Locale::US;

my $u = Locale::US->new;

enum USStateName,
	[ $u->all_state_names ]
	;

enum USStateCode,
	[ $u->all_state_codes ]
	;

coerce USStateName,
	from USStateCode,
	via {
		return $u->{code2state}{$_};
	}
	;

coerce USStateName,
	from Str,
	via {
		uc( $_ );
	}
	;

coerce USStateCode,
	from USStateName,
	via {
		return $u->{state2code}{$_};
	}
	;


1;

# ABSTRACT: MooseX::Types::Locale::US::States
