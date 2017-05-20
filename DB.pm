package XMLData::DB;

use warnings; use strict;

use Cfg;

BEGIN {
	use Exporter;
	our @ISA 	= qw( Exporter );
	our @EXPORT	= qw( $db );	
	use DBI;
	our $db = DBI->connect( 'DBI:mysql:database='.$cfg->{DB}->{database_name}.';hostname='.$cfg->{DB}->{database_host}, $cfg->{DB}->{database_user}, $cfg->{DB}->{database_pass} );
	# $db->trace( 1, '/var/log/long_dbi_trace.txt' );
}

1;

=pod

=encoding UTF-8

=head1 NAME

	DB - Global access to DBI MySQL connection.

=head1 DESCRIPTION

	Implementation of global access to DBI MySQL connection via global variable $db

=head1 REQUIRES

	L<DBI> 

	L<Cfg> 

=head1 EXAMPLES

=over 4

=item * Using

	use DB;
	my $h = $db->prepare("SELECT id FROM feed");
	$h->execute();

=back

=head1 SUPPORT

	Bugs may be submitted through vanyabrovaru@gmail.com

=head1 AUTHORS

	vanyabrovaru@gmail.com




