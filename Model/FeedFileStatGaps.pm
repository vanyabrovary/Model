package Model::FeedFileStatGaps;

use warnings;
use strict;

use Model;
our @ISA = qw/Model/;

sub db_table()   { 'feed_file_stat_gaps' }
sub db_columns() { qw/id feed_file_stat_id rcv_time_after rcv_time_till/ }

sub feed_file_stat() {
    my $self = shift;

    use Model::FeedFileStat;
    $self->{feed_file_stat} ||= Model::FeedFileStat->load( $self->{feed_file_stat_id} );
}

1;

=pod

=encoding UTF-8

=head1 NAME

Model::FeedFileStatGaps

=head1 VERSION

0.1

=head1 DESCRIPTION

Model::FeedFileStatGaps - Model of feed_file_stat_gaps table

=head1 SYNOPSIS

print $_->{id} foreach ( @{ Model::FeedFileStatGaps->list() } );

=head1 METHODS

=head2 feed_file

load Model::FeedFile

=head2 feed_file_stat_gaps

"select * from feed_file_stat_gaps where feed_file_stat_id = ".$self->{id}

=head1 AUTHORS

mobitrade.ua

=head1 COPYRIGHT AND LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 HISTORY

Version 0.1: first release; April 2015

=cut
