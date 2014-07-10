package WebService::Toggl::API;

use Moo::Role;

has base_url => (is => 'ro', default => '/api/v8');


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Toggl::API - Base Role for WebService::Toggl::API Items and Sets

=head1 DESCRIPTION

This role provide behavoir common to all C<WebService::Toggl::API::>
objects.

=head1 ATTRIBUTES

=head2 base_url

The base of the URL for the Toggl API.  Defaults to C</api/v8>.

=head1 LICENSE

Copyright (C) Fitz Elliott.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Fitz Elliott E<lt>felliott@fiskur.orgE<gt>

=cut

