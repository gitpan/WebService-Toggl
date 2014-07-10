package WebService::Toggl::API::Tasks;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::Task' }

sub my_url { '/tasks' }


1;
__END__
