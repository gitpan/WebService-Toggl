package WebService::Toggl::API::Users;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::User' }

sub my_url { '/users' }

1;
__END__
