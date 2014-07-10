package WebService::Toggl::API::Tags;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::Tag' }

sub my_url { '/tags' }

1;
__END__
