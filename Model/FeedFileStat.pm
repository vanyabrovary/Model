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

=pod

=encoding UTF-8

=head1 NAME

Model::FeedFileStat

=head1 VERSION

0.1

=head1 DESCRIPTION

Model::FeedFileStat - Model of feed_file_stat table

=head1 SYNOPSIS

my $model = Model::FeedFileStat->load($arg->{id});
print $_->{id} foreach ( @{ $model->feed_file_stat_gaps } );


=head1 METHODS

=head2 feed_file

load Model::FeedFile

=head2 feed_file_stat_gaps

"select * from feed_file_stat_gaps where feed_file_stat_id = ".$self->{id}

=head1 AUTHORS

mobitrade.ua

=head1 COPYRIGHT AND LICENSE

This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=head1 HISTORY

Version 0.1: first release; April 2015

=cut
