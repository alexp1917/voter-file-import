create table if not exists zone_type
(
    county          varchar(100) not null,
    zone_number     int          not null,
    zone_short_name varchar(50),
    zone_long_name  varchar(500),
    primary key (county, zone_number)
);

create table if not exists zone_code
(
    county           varchar(100),
    zone_type        int         not null,
    zone_code        varchar(50) not null,
    zone_description varchar(500),
    primary key (zone_type, zone_code),
    index (zone_code)
);

create table if not exists political_party
(
    code        varchar(10) not null primary key,
    description varchar(300)
);

create table if not exists election_mapping
(
    county        varchar(100) not null,
    id            int          not null,
    description   varchar(300),
    election_date date,
    primary key (county, id),
    index (id)
);

\. src/main/sql/fve_schema.sql
