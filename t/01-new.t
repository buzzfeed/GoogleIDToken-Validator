#!perl -T

use 5.006;
use strict;
use warnings FATAL => 'all';

use LWP::UserAgent;

use Test::More;

BEGIN { plan tests => 2; }

use GoogleIDToken::Validator;

my $validator = GoogleIDToken::Validator->new(
    web_client_id => 'test',
    app_client_ids => [ 'test' ]
);

ok( $validator );

my $validator_with_ua = GoogleIDToken::Validator->new(
    web_client_id => 'test',
    app_client_ids => [ 'test' ],
    ua => LWP::UserAgent->new( agent => 'test-agent' ),
);

is $validator_with_ua->{ua}->agent, 'test-agent', 'Got correct UA';

