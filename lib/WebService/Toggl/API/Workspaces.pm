package WebService::Toggl::API::Workspaces;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::Workspace' }

sub my_url { '/workspaces' }

1;
__END__
