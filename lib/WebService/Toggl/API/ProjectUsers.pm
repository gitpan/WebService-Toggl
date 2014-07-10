package WebService::Toggl::API::ProjectUsers;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::ProjectUser' }

sub my_url { '/project_users' }


1;
__END__
