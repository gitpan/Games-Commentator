use warnings;
use strict;
use Test::More tests => 3;
BEGIN { use_ok('Games::Commentator') };
use Games::Commentator qw/make_comment get_variables/;

my $comment = make_comment ({
    organization => 'British Airways',
    person => 'Richard Branson',
    about => 'the cost of flights',
});

ok ($comment, "Got a comment");        

my @variables = get_variables ();

ok (@variables > 1, "Got variables");

# Local variables:
# mode: perl
# End:
