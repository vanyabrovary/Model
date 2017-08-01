package Model::FeedFileStat;

use warnings;
use strict;

use Model;
our @ISA = qw/Model/;
sub db_table()   { 'feed_file_stat' }
sub db_columns() { qw/id feed_file_id channel_id started_at/ }

sub feed_file() {
    my $self = shift;

    use Model::FeedFile;
    $self->{feed_file} ||= Model::FeedFile->load( $self->{feed_file_id} );
}

sub feed_file_stat_gaps() {
    my $self = shift;

    use Model::FeedFileStatGaps;
    $self->{feed_file_stat_gaps} ||= Model::FeedFileStatGaps->list_where( $self->{id}, 'feed_file_stat_id' );
}

sub is_exists() {
    my $self = shift;
    return $self->{started_at} ? 1 : 0;
}

1;
