package Model::FeedFile;

use warnings;
use strict;

use Model;
our @ISA = qw/Model/;

sub db_table()   { 'feed_file' }
sub db_columns() { qw/id feed feed_file for_date fsize/ }

sub feed_file_stat() {
    my $self = shift;

    use Model::FeedFileStat;
    $self->{feed_file_stat} ||= Model::FeedFileStat->list_where( $self->{id}, 'feed_file_id' );
}

1;

=pod

=encoding UTF-8

=head1 NAME

Model::FeedFile

=head1 VERSION

0.1

=head1 DESCRIPTION

Model::FeedFile - Model of feed_file table

=head1 SYNOPSIS

my $model = Model::FeedFile->load($arg->{id});
print $model->feed_file_stat->{started_at};

print ->load;

=head1 METHODS

=head2 feed_file_stat

load Model::FeedFileStat

=head1 AUTHORS

mobitrade.ua

=head1 COPYRIGHT AND LICENSE

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=head1 HISTORY

Version 0.1: first release; April 2015

=cut
