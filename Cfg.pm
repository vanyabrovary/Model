package Cfg;

use warnings;
use strict;

BEGIN {
    use Exporter;
    our @ISA    = qw( Exporter );
    our @EXPORT = qw( $cfg );

    my %cfg = (

        DB => {
            database_name => 'name',
            database_host => 'host',
            database_user => 'user',
            database_pass => 'pass'
          }

    );
    our $cfg = \%cfg;
}

1;

=pod

=encoding UTF-8

=head1 NAME

Cfg - Global access to configuration values.

=head1 DESCRIPTION

Implementation of global access to configuration values via global variable $cfg

=head1 EXAMPLES

=over 4

=item * Using 

use Cfg;
print Dumper($cfg);

=back

=head1 SUPPORT

Bugs may be submitted through vanyabrovaru@gmail.com

=head1 AUTHORS

vanyabrovaru@gmail.com

=cut
