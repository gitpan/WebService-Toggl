package WebService::Toggl::Report::Details;

use Sub::Quote qw(quote_sub);

use Moo;
with 'WebService::Toggl::Report';
use namespace::clean;

sub api_path { 'summary' }

# request params
has page => (is => 'ro');


# response params
has $_ => (is => 'ro', lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
    for (qw(per_page total_count));

1;
__END__

  {
    "data":[
      {
        "id":43669578,
        "pid":1930589,
        "tid":null,
        "uid":777,
        "description":"tegin tööd",
        "start":"2013-05-20T06:55:04",
        "end":"2013-05-20T10:55:04",
        "updated":"2013-05-20T13:56:04",
        "dur":14400000,
        "user":"John Swift",
        "use_stop":true,
        "client":"Avies",
        "project":"Toggl Desktop",
        "task":null,
        "billable":8.00,
        "is_billable":true,
        "cur":"EUR",
        "tags":["paid"]
      },{
        "id":43669579,
        "pid":1930625,
        "tid":1334973,
        "uid":7776,
        "description":"agee",
        "start":"2013-05-20T09:37:00",
        "end":"2013-05-20T12:01:41",
        "updated":"2013-05-20T15:01:41",
        "dur":8645000,
        "user":"John Swift",
        "use_stop":true,
        "client":"Apprise",
        "project":"Development project",
        "task":"Work hard",
        "billable":120.07,
        "is_billable":true,
        "cur":"EUR",
        "tags":[]
      }
    ]
  }
