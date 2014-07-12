package WebService::Toggl::API::Client;

use WebService::Toggl::Role::Item as => 'JsonItem';

use Moo;
with 'WebService::Toggl::Role::API';
use namespace::clean;

with JsonItem(
    bools => [ qw() ],
    strings => [ qw(name notes at) ],
    integers => [ qw(id wid) ]
);


sub api_path { 'clients' }
sub api_id   { shift->id }


sub projects {
    my ($self, $args) = @_;
    $args ||= {};
    # todo: validate $args->{active} is [true,false,both]
    my $res = $self->api_get($self->my_url . '/projects', $args);
    return $self->new_set_from_raw('::Projects', $res->data);
}


1;
__END__

{
   "id":1239455,
   "wid":777,
   "name":"Very Big Company",
   "notes":"something about the client",
   "at":"2013-02-26T08:55:28+00:00"
}

Not Yet:
hrate: The hourly rate for this client (float, not required, available only for pro workspaces)
cur: The name of the client's currency (string, not required, available only for pro workspaces)


projects():
   active: possible values true/false/both. By default true. If false,
           only archived projects are returned.
