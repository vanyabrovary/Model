# Model
Model - the simplest ORM implementation for Perl

## NAME

	Model - the simplest ORM implementation.

## DESCRIPTION

	ORM implementation with full SQL syntax support.
	Contain only methods needed for CRUD. No JOIN or UNION implementation inside.
	Mostly old scool Perl coding style using.

## EXAMPLES

* Create

	my $model = Model::FeedFileStat->new($args);
	$model->save();

* Update

	my $model = Model::FeedFileStat->load( $arg->{id}, 'id' );
	$model->{channel_id} = $channel_id;
	$model->save();
	
	Or
	
	my $model = Model::FeedFileStat->load( $arg->{id} );
	$model->{channel_id} = $channel_id;
	$model->save();

* Read

	my $model = Model::FeedFileStat->load( $channel_id, 'channel_id' );
	print Dumper($model);
	
* Read list.

	print $_->{some_field} foreach ( @{ Model::FeedFileStat->list() } )
	
* Read inner list.

	foreach ( @{ Model::FeedFileStat->list() } ){ 
		print Dumper($_) foreach ( @{ $_->gaps() } ); 
	}
	
* Delete.

	my $model = Model::FeedFileStat->load( $arg->{id} );
	$model->delete();
	
## BUGS

    newid - return bad for MySQL.

## SUPPORT

	Bugs may be submitted through vanyabrovaru@gmail.com

## AUTHORS

	vanyabrovaru@gmail.com
