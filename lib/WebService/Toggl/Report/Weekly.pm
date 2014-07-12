package WebService::Toggl::Report::Weekly;

use Sub::Quote qw(quote_sub);

use Moo;
with 'WebService::Toggl::Role::Report';
use namespace::clean;

sub api_path { 'weekly' }

around _req_params => sub {
    my $orig = shift;
    my $self = shift;
    return [ @{$self->$orig}, qw(grouping calculate) ];
};

# request params
has grouping  => (is => 'ro'); # users, projects
has calculate => (is => 'ro'); # time, earnings


# repsonse params
#  **none**

has week_totals => (is => 'ro', lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |));

1;
__END__


grouping == projects:

{
    "title":{"project":"Toggl Desktop","client":"Toggl"},
    "pid":7363449,
    "totals":[null,null,null,null,14400000,null,null,14400000],
    "details":[
      {
        "uid":352243,
        "title":{"user":"John Swift"},
        "totals":[null,null,null,null,14400000,null,null,14400000]
      }
    ]
  }


grouping == users:

  {
    "title":{"user":"John Swift"},
    "uid":352243,
    "totals":[null,null,14400000,null,14400000,null,null,28800000],
    "details":[
      {
        "pid":73649,
        "title":{ "client":"Toggl","project":"Toggl Desktop"},
        "totals":[null,null,null,null,14400000,null,null,14400000]
      },
      {
        "pid":1120651,
        "title":{"client":null,"project":"Super big client"},
        "totals":[null,null,14400000,null,null,null,null,14400000]
      }
    ]
  }


calculate == time:

  it is a simple array with 8 numbers - each for one day and the 8th
  for the seven day total.

  totals:[null,null,0,null,40,null,null,40]

calculate == earnings:

  it is an array of objects with currency string and the amounts array
  with 8 numbers - each for one day and the 8th for the seven day
  total.

  "totals":[
    {
      "currency":"EUR",
      "amount":[null,null,0,null,40,null,null,40]
    },
    {
      "currency":"USD",
      "amount":[20,null,0,null,14,null,null,34]
    }
  ]
