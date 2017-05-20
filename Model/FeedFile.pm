package Model::FeedFile;

use Model;
our @ISA = qw/Model/;
sub db_table() 	 {'feed_file'};
sub db_columns() {qw/id feed feed_file for_date fsize/};

sub feed_file_stat(){
    my $self = shift;

    use Model::FeedFileStat;
    $self->{feed_file_stat} ||= Model::FeedFileStat->list_where( $self->{id}, 'feed_file_id' );
}

1;
