use strict;
use warnings;
use ExtUtils::MakeMaker;

my $pm = 'lib/Games/Commentator.pm';
my $pod = 'lib/Games/Commentator.pod';
my $repo = 'https://github.com/benkasminbullock/Games-Commentator';

WriteMakefile (
    NAME => 'Games::Commentator',
    VERSION_FROM => $pm,
    ABSTRACT_FROM => $pod,
    AUTHOR => 'Ben Bullock <bkb@cpan.org>',
    LICENSE => 'perl',
    PREREQ_PM => {
        'Lingua::EN::Inflect' => 0,
    },
    META_MERGE => {
        resources => {
            repository => $repo,
            bugtracker => "$repo/issues",
        },
    },
    EXE_FILES => [
        'script/comment',
    ],
);
