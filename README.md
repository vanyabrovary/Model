# Model
Model - the simplest ORM implementation for Perl

### DESCRIPTION

ORM implementation with full SQL syntax support.
Contain only methods needed for CRUD. No JOIN or UNION implementation inside.
Mostly old scool Perl coding style using.

### EXAMPLES

#### Create

<pre>
my $model = Model::FeedFileStat->new($args);
$model->save();
</pre>

#### Update

<pre>
my $model = Model::FeedFileStat->load( $arg->{id}, 'id' );
$model->{channel_id} = $channel_id;
$model->save();
</pre>	

Or

<pre>	
my $model = Model::FeedFileStat->load( $arg->{id} );
$model->{channel_id} = $channel_id;
$model->save();
</pre>

#### Read
<pre>
my $model = Model::FeedFileStat->load( $channel_id, 'channel_id' );
print Dumper($model);
</pre>	

#### Read list.
<pre>
print $_->{some_field} foreach ( @{ Model::FeedFileStat->list() } )
</pre>

#### Read inner list.
<pre>
foreach ( @{ Model::FeedFileStat->list() } ){ 
	print Dumper($_) foreach ( @{ $_->gaps() } ); 
}
</pre>	

#### Delete.
<pre>
my $model = Model::FeedFileStat->load( $arg->{id} );
$model->delete();
</pre>

### BUGS

newid - return bad value for MySQL.

### SUPPORT

Bugs may be submitted through vanyabrovaru@gmail.com

### AUTHORS

vanyabrovaru@gmail.com
