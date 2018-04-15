# Eat Out

## APIs for a Reservation management iPad/Mobile application for restaurants using Ruby on rails as backend


### Prerequisites

* Ruby version `>= 2.3`

* System dependencies: `Postgres`

* Configuration: `rake db:setup`

* How to run the test suite: `rspec spec`


### How to:

* The application assumes that records for entities like Restaurants, Seating Tables, Shifts, Guests are seeded

- APIs:

1. Restaurant List API

- Url: `{app_url}/api/v1/restaurants`
- Method: GET

- Expected Response Format:
```
[{"id"=>100, "name"=>"Mr. Clarabelle Kilback", "email"=>"shane@stokes.name", "phone"=>360733577297, "seating_tables"=>[{"id"=>64, "name"=>"Kim Schuster", "min_seating"=>1, "max_seating"=>8}, {"id"=>65, "name"=>"Yessenia Dare DVM", "min_seating"=>1, "max_seating"=>8}, {"id"=>66, "name"=>"Alden Crooks", "min_seating"=>1, "max_seating"=>8}, {"id"=>67, "name"=>"Donnell Auer PhD", "min_seating"=>1, "max_seating"=>8}], "work_shifts"=>[{"id"=>77, "starts_at"=>"2000-01-01T05:55:33.000Z", "ends_at"=>"2000-01-01T12:17:53.000Z"}, {"id"=>78, "starts_at"=>"2000-01-01T01:17:48.000Z", "ends_at"=>"2000-01-01T10:34:04.000Z"}, {"id"=>79, "starts_at"=>"2000-01-01T01:35:34.000Z", "ends_at"=>"2000-01-01T08:01:43.000Z"}, {"id"=>80, "starts_at"=>"2000-01-01T00:34:49.000Z", "ends_at"=>"2000-01-01T10:39:00.000Z"}, {"id"=>81, "starts_at"=>"2000-01-01T05:26:36.000Z", "ends_at"=>"2000-01-01T08:50:27.000Z"}]}]
```


2. Reservation API

- Url: `{app_url}/api/v1/reservations`
- Method: POST
- Body:
```
{ 
  reservation: {
    work_shift_id: 12,
    arrival_at: 2000-01-01T06:38:38.000Z,
    guest_count: 4,
    guest_id: 102,
    seating_table_id: 64
  }
}
```

- Expected Response Format:
```
{"id"=>10, "arrival_at"=>"2000-01-01T06:38:38.000Z", "guest_count"=>4, "guest"=>{"id"=>102, "name"=>"Murray Gaylord", "email"=>"johnson_schoen@rosenbaum.info", "created_at"=>"2018-04-15T18:37:40.233Z", "updated_at"=>"2018-04-15T18:37:40.233Z"}, "seating_table"=>{"id"=>64, "name"=>"Kim Schuster", "min_seating"=>1, "max_seating"=>8}}
```


### TODO:
1. APIs to allow creation of entiies like Guests, Restaurants, Tables, Shifts etc
2. Format responses for Date