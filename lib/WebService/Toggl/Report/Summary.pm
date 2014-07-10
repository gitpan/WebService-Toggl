package WebService::Toggl::Report::Summary;

use Types::Standard qw(Bool);

use Moo;
with 'WebService::Toggl::Report';
use namespace::clean;

sub api_path { 'summary' }

around _req_params => sub {
    my $orig = shift;
    my $self = shift;
    return [ @{$self->$orig}, qw(grouping subgrouping) ]; # subgrouping_ids grouped_time_entry_ids) ];
};

# request params
has grouping    => (is => 'ro', default => 'projects',);
has subgrouping => (is => 'ro', default => 'tasks',);
has subgrouping_ids => (is => 'ro', isa => Bool, default => 0,);
has grouped_time_entry_ids => (is => 'ro', isa => Bool, default => 0,);


# repsonse params
#  **none**



1;
__END__


subgrouping_ids (boolean)
   - whether returned items will contain 'ids' key
     containing coma separated group item ID values

grouped_time_entry_ids (boolean)
   - whether returned items will contain 'time_entry_ids'
     key containing coma separated time entries ID values for given item



has items => (is => 'ro', lazy => 1, builder => 1);
sub _build_items { $_[0]->raw->{data} }

  {
    "data": [
      {
        "id":73569,
        "title":{"project":"Toggl Desktop","client":"Toggl"},
        "time":14400000,
        "total_currencies":[{"currency":"EUR","amount":40}],
        "items":[
          {
            "title":{"time_entry":"Implementing some important things"},
            "time":14400000,
            "cur":"EUR",
            "sum":40,
            "rate":10
          }
        ]
      },{
        "id":193009951,
        "title":{"project":"Toggl Development","client":null},
        "time":14400000,
        "total_currencies":[{"currency":"EUR","amount":0}],
        "items":[
          {
            "title":{"time_entry":"Hard work"},
            "time":14400000,
            "cur":"EUR",
            "sum":0,
            "rate":50
          }
        ]
      },{
        "id":null,
        "title":{"project":null,"client":null},
        "time":7204000,
        "total_currencies":[],
        "items":[
          {
            "title":{"time_entry":"No title yet"},
            "time":1000,
            "cur":"EUR",
            "sum":0,
            "rate":50
          },{
            "title":{"time_entry":"Did nothing"},
            "time":1000,
            "cur":"EUR",
            "sum":0,
            "rate":50
          },{
            "title":{"time_entry":"Hard work again"},
            "time":7202000,
            "cur":"EUR",
            "sum":0,
            "rate":50
          }
        ]
      }
    ]
  }
