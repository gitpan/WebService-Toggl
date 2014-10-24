package WebService::Toggl::Report::Details;

use Sub::Quote qw(quote_sub);
use Types::Standard qw(Int);

use Moo;
with 'WebService::Toggl::Role::Report';
use namespace::clean;

sub api_path { 'details' }

# request params
has page => (is => 'ro', isa => Int, default => 1);


# response params
has $_ => (is => 'ro', lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (qw(per_page total_count));


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Toggl::Report::Details - Toggl detailed report object

=head1 SYNOPSIS

 use WebService::Toggl;
 my $toggl = WebService::Toggl->new({api_key => 'foo'});

 my $report = $toggl->details({workspace_id => 1234});

 say $report->total_billable;  # billable milliseconds
 say $report->total_count;     # max($all_entries, $per_page)
 for $entry (@{ $report->data }) {
   say "User: $entry->{user} logged " . ($entry->{dur} / 1000)
     . " second on task: '" . $entry->{description} . "'";
 }

=head1 DESCRIPTION

This module is a wrapper object around the Toggl detailed report
L<described here|
https://github.com/toggl/toggl_api_docs/blob/master/reports/detailed.md>.
It returns all of the time entries that match the request criteria.

=head1 REQUEST ATTRIBUTES

Request attributes common to all reports are detailed in the
L<::Role::Request|WebService::Toggl::Role::Report#REQUEST-ATTRIBUTES> pod.

=head2 page

Detailed reports are paged.  This attribute sets the requested page.
If left empty, Toggl will return the first page by default.

=head1 RESPONSE ATTRIBUTES

Response attributes common to all reports are detailed in the
L<::Role::Request|WebService::Toggl::Role::Report#RESPONSE-ATTRIBUTES> pod.

=head2 per_page

How many time entries are being returned per page. Current default is
50.  This is not settable.

=head2 total_count

The total number of records found.  This will be the greater of the
actual number of entries returned and the C<per_page> parameter.

=head1 REPORT DATA

The C<data()> attribute of a C<::Report::Details> object is an
arrayref of time entry hashrefs.  For the contents of this structure, see the
L<Toggl API docs|https://github.com/toggl/toggl_api_docs/blob/master/reports/detailed.md>.


=head1 LICENSE

Copyright (C) Fitz Elliott.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Fitz Elliott E<lt>felliott@fiskur.orgE<gt>

=cut

