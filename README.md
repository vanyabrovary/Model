## NAME

Model - the simplest ORM implementation for Perl

## DESCRIPTION

ORM implementation with full SQL syntax support.

Contain only methods needed for CRUD. 

No JOIN or UNION implementation inside.

Mostly old scool Perl coding style using.

## MODEL SAMPLE

### feed model
package Model::Feed;

use Model;
our @ISA = qw/Model/;

sub db_table() 	 { 'feed' };
sub db_columns() { qw/id name is_public updated created/ };

#feed files list
sub feed_file(){
    my $self = shift;
    use Model::FeedFile;
    $self->{feed_file} ||= Model::FeedFile->list_where( $self->{id}, 'feed_id' );
}

1;

### feed_file model
package Model::FeedFile;

use Model;
our @ISA = qw/Model/;

sub db_table() 	 { 'feed_file' };
sub db_columns() { qw/id feed_id name size is_public for_date updated created/ };

#feed load by feed_id
sub feed(){
    my $self = shift;
    use Model::Feed;
    $self->{feed} ||= Model::Feed->load( $self->{feed_id} );
}


1;

## REQUESTS EXAMPLES

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

## BUGS

newid - return bad value for MySQL.

## SUPPORT

Bugs may be submitted through vanyabrovaru@gmail.com

## AUTHORS

vanyabrovaru@gmail.com
