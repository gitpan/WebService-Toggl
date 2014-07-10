package WebService::Toggl::API::TimeEntries;

use Moo;
with 'WebService::Toggl::API', 'WebService::Toggl::Role::Set';
use namespace::clean;

sub list_of { '::TimeEntry' }

sub my_url { '/time_entries' }

1;
__END__
