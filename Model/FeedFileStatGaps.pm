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
