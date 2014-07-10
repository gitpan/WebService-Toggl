package DumDum;

use IO::All;
use JSON::MaybeXS;

use Moo;
use namespace::clean;

has url => (is => 'ro', required => 1);
has _data => (is => 'ro', lazy => 1, builder => 1);
sub _build__data { decode_json(io("t/data/" . $_[0]->url . ".json")->slurp) }

sub data { {data => $_[0]->_data} }

1;

$INC{'DumDum.pm'} = __FILE__;


package Toggl::MockRequest;

use DumDum;

use Moo;
use namespace::clean;

has get_call_count => (is => 'ro', default => 0);
sub incr_get_call { $_[0]->{get_call_count}++ }

sub get {
    my ($self, $url) = @_;
    $self->incr_get_call;
    $url =~ s{^/}{};
    return DumDum->new({url => $url});
}


1;
__END__
