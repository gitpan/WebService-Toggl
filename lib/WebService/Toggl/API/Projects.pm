package WebService::Toggl::API::Projects;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::Project' }

sub my_url { '/projects' }

1;
__END__
