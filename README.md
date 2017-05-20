# Model
Model - the simplest ORM implementation for Perl

=head1 NAME

	Model - the simplest ORM implementation.

=head1 DESCRIPTION

	ORM implementation with full SQL syntax support.
	Contain only methods needed for CRUD. No JOIN or UNION implementation inside.
	Mostly old scool Perl coding style using.

=head1 EXAMPLES

=over 4

=item * Create

	my $model = Model::FeedFileStat->new($args);
	$model->save();

=item * Update

	my $model = Model::FeedFileStat->load( $arg->{id}, 'id' );
	$model->{channel_id} = $channel_id;
	$model->save();
	
	Or
	
	my $model = Model::FeedFileStat->load( $arg->{id} );
	$model->{channel_id} = $channel_id;
	$model->save();

=item * Read

	my $model = Model::FeedFileStat->load( $channel_id, 'channel_id' );
	print Dumper($model);
	
=item * Read list.

	print $_->{some_field} foreach ( @{ Model::FeedFileStat->list() } )
	
=item * Read inner list.

	foreach ( @{ Model::FeedFileStat->list() } ){ 
		print Dumper($_) foreach ( @{ $_->gaps() } ); # if this method is implemented each row contain Model::FeedFileStatGaps
	}
	
=item * Delete.

	my $model = Model::FeedFileStat->load( $arg->{id} );
	$model->delete();
	
=back

=head1 BUGS

    newid - return bad for MySQL.
	
=head1 TODO

=over 4

=item * _id 

	To finish smarter. It's fast fixme now

=item * ExtModel
	
	Add ExtModel from Full version
	
=item * Replace
	
	Add Replace from Full version
	
=back

=head1 SUPPORT

	Bugs may be submitted through vanyabrovaru@gmail.com

=head1 AUTHORS

	vanyabrovaru@gmail.com
