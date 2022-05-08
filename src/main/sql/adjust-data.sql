-- todo normalize data in election history, districts...

drop table if exists voter_district;
create table if not exists voter_district
(
    id_number varchar(15),
    zone_type int,
    zone_code varchar(50),
    primary key(id_number, zone_type, zone_code),
    foreign key(id_number) references fve(id_number),
    foreign key(zone_type) references zone_type(zone_number),
    foreign key(zone_type, zone_code) references zone_code(zone_type, zone_code)
);

insert into voter_district select id_number, 1,  district_01 from voter_district_list vdl where vdl.district_01 is not null;
insert into voter_district select id_number, 2,  district_02 from voter_district_list vdl where vdl.district_02 is not null;
insert into voter_district select id_number, 3,  district_03 from voter_district_list vdl where vdl.district_03 is not null;
insert into voter_district select id_number, 4,  district_04 from voter_district_list vdl where vdl.district_04 is not null;
insert into voter_district select id_number, 5,  district_05 from voter_district_list vdl where vdl.district_05 is not null;
insert into voter_district select id_number, 6,  district_06 from voter_district_list vdl where vdl.district_06 is not null;
insert into voter_district select id_number, 7,  district_07 from voter_district_list vdl where vdl.district_07 is not null;
insert into voter_district select id_number, 8,  district_08 from voter_district_list vdl where vdl.district_08 is not null;
insert into voter_district select id_number, 9,  district_09 from voter_district_list vdl where vdl.district_09 is not null;
insert into voter_district select id_number, 10, district_10 from voter_district_list vdl where vdl.district_10 is not null;
insert into voter_district select id_number, 11, district_11 from voter_district_list vdl where vdl.district_11 is not null;
insert into voter_district select id_number, 12, district_12 from voter_district_list vdl where vdl.district_12 is not null;
insert into voter_district select id_number, 13, district_13 from voter_district_list vdl where vdl.district_13 is not null;
insert into voter_district select id_number, 14, district_14 from voter_district_list vdl where vdl.district_14 is not null;
insert into voter_district select id_number, 15, district_15 from voter_district_list vdl where vdl.district_15 is not null;
insert into voter_district select id_number, 16, district_16 from voter_district_list vdl where vdl.district_16 is not null;
insert into voter_district select id_number, 17, district_17 from voter_district_list vdl where vdl.district_17 is not null;
insert into voter_district select id_number, 18, district_18 from voter_district_list vdl where vdl.district_18 is not null;
insert into voter_district select id_number, 19, district_19 from voter_district_list vdl where vdl.district_19 is not null;
insert into voter_district select id_number, 20, district_20 from voter_district_list vdl where vdl.district_20 is not null;
insert into voter_district select id_number, 21, district_21 from voter_district_list vdl where vdl.district_21 is not null;
insert into voter_district select id_number, 22, district_22 from voter_district_list vdl where vdl.district_22 is not null;
insert into voter_district select id_number, 23, district_23 from voter_district_list vdl where vdl.district_23 is not null;
insert into voter_district select id_number, 24, district_24 from voter_district_list vdl where vdl.district_24 is not null;
insert into voter_district select id_number, 25, district_25 from voter_district_list vdl where vdl.district_25 is not null;
insert into voter_district select id_number, 26, district_26 from voter_district_list vdl where vdl.district_26 is not null;
insert into voter_district select id_number, 27, district_27 from voter_district_list vdl where vdl.district_27 is not null;
insert into voter_district select id_number, 28, district_28 from voter_district_list vdl where vdl.district_28 is not null;
insert into voter_district select id_number, 29, district_29 from voter_district_list vdl where vdl.district_29 is not null;
insert into voter_district select id_number, 30, district_30 from voter_district_list vdl where vdl.district_30 is not null;
insert into voter_district select id_number, 31, district_31 from voter_district_list vdl where vdl.district_31 is not null;
insert into voter_district select id_number, 32, district_32 from voter_district_list vdl where vdl.district_32 is not null;
insert into voter_district select id_number, 33, district_33 from voter_district_list vdl where vdl.district_33 is not null;
insert into voter_district select id_number, 34, district_34 from voter_district_list vdl where vdl.district_34 is not null;
insert into voter_district select id_number, 35, district_35 from voter_district_list vdl where vdl.district_35 is not null;
insert into voter_district select id_number, 36, district_36 from voter_district_list vdl where vdl.district_36 is not null;
insert into voter_district select id_number, 37, district_37 from voter_district_list vdl where vdl.district_37 is not null;
insert into voter_district select id_number, 38, district_38 from voter_district_list vdl where vdl.district_38 is not null;
insert into voter_district select id_number, 39, district_39 from voter_district_list vdl where vdl.district_39 is not null;
insert into voter_district select id_number, 40, district_40 from voter_district_list vdl where vdl.district_40 is not null;
