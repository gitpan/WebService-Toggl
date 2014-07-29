package Toggl::DummyAPI;

use IO::All;
use JSON::MaybeXS;

use Moo;
use namespace::clean;

has url => (is => 'ro', required => 1);
has _data => (is => 'ro', lazy => 1, builder => 1);
sub _build__data { decode_json(io("t/data/" . $_[0]->url . ".json")->slurp) }

sub data { {data => $_[0]->_data} }

1;

$INC{'Toggl::DummyAPI.pm'} = __FILE__;


package Toggl::DummyReport;

use IO::All;
use JSON::MaybeXS;

use Moo;
use namespace::clean;

has url => (is => 'ro', required => 1);
has _data => (is => 'ro', lazy => 1, builder => 1);
sub _build__data { decode_json(io("t/data/" . $_[0]->url . ".json")->slurp) }

sub data { $_[0]->_data }

1;

$INC{'Toggl::DummyReport.pm'} = __FILE__;


package Toggl::MockRequest;

use Toggl::DummyAPI;
use Toggl::DummyReport;

use Moo;
use namespace::clean;

has get_call_count => (is => 'ro', default => 0);
sub incr_get_call { $_[0]->{get_call_count}++ }

has user_agent_id => (is => 'ro', default => 'Toggl-MockRequest');

sub get {
    my ($self, $url) = @_;
    $self->incr_get_call;
    $url =~ s{^/}{};
    my $class = $url =~ m/reports/ ? 'Toggl::DummyReport' : 'Toggl::DummyAPI';
    return $class->new({url => $url});
}


1;
__END__
