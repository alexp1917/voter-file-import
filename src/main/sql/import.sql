load data local infile 'data/ALLEGHENY Zone Types 20220502.txt'
    into table zone_type
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (county, zone_number, zone_short_name, zone_long_name);

load data local infile 'data/ALLEGHENY Zone Codes 20220502.txt'
    into table zone_code
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (county, zone_type, zone_code, zone_description);

load data local infile 'data/Political Party Codes and Descriptions.txt'
    into table political_party
    fields terminated by '\t'
    lines terminated by '\r\n'
    ignore 1 lines;

load data local infile 'data/ALLEGHENY Election Map 20220502.txt'
    into table election_mapping
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (county, id, description, @csv_date)
    set election_date = STR_TO_DATE(CONCAT(
        substring(@csv_date, 7, 4),
        '-',
        substring(@csv_date, 1, 2),
        '-',
        substring(@csv_date, 4, 2)
    ), '%Y-%m-%d');

load data local infile 'data/ALLEGHENY FVE 20220502.txt'
    into table fve
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (id_number, @blank_title, @blank_last_name, @blank_first_name, @blank_middle_name, @blank_suffix, gender, @csv_dob, @csv_registration_date, @csv_voter_status, @csv_status_change_date, @blank_party_code, @blank_house_number, @blank_house_number_suffix, @blank_street_name, @blank_apartment_number, @blank_address_line_2, @blank_city, @blank_state, @blank_zip, @blank_mail_address_1, @blank_mail_address_2, @blank_mail_city, @blank_mail_state, @blank_mail_zip, @csv_last_vote_date, @blank_precinct_code, @blank_precinct_split_id, @csv_date_last_changed, @custom_data_1, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @dvar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @evar, @blank_home_phone, @blank_county, mail_country)
    set
        dob = if(@csv_dob is not null and @csv_dob <> '', STR_TO_DATE(CONCAT(substring(@csv_dob , 7, 4),'-',substring(@csv_dob, 1, 2),'-',substring(@csv_dob, 4, 2)), '%Y-%m-%d'),null),
        registration_date = if(@csv_registration_date is not null and @csv_registration_date <> '', STR_TO_DATE(CONCAT(substring(@csv_registration_date , 7, 4),'-',substring(@csv_registration_date, 1, 2),'-',substring(@csv_registration_date, 4, 2)), '%Y-%m-%d'),null),
        status_change_date = if(@csv_status_change_date is not null and @csv_status_change_date <> '', STR_TO_DATE(CONCAT(substring(@csv_status_change_date, 7, 4),'-',substring(@csv_status_change_date, 1, 2),'-',substring(@csv_status_change_date, 4, 2)), '%Y-%m-%d'),null),
        last_vote_date = if(@csv_last_vote_date is not null and @csv_last_vote_date <> '', STR_TO_DATE(CONCAT(substring(@csv_last_vote_date , 7, 4),'-',substring(@csv_last_vote_date, 1, 2),'-',substring(@csv_last_vote_date, 4, 2)), '%Y-%m-%d'),null),
        date_last_changed = if(@csv_date_last_changed is not null and @csv_date_last_changed <> '', STR_TO_DATE(CONCAT(substring(@csv_date_last_changed , 7, 4),'-',substring(@csv_date_last_changed, 1, 2),'-',substring(@csv_date_last_changed, 4, 2)), '%Y-%m-%d'),null),
        title               = if(@blank_title = '', NULL, @blank_title),
        last_name           = if(@blank_last_name = '', NULL, @blank_last_name),
        first_name          = if(@blank_first_name = '', NULL, @blank_first_name),
        middle_name         = if(@blank_middle_name = '', NULL, @blank_middle_name),
        suffix              = if(@blank_suffix = '', NULL, @blank_suffix),
        party_code          = if(@blank_party_code = '', NULL, @blank_party_code),
        house_number        = if(@blank_house_number = '', NULL, @blank_house_number),
        house_number_suffix = if(@blank_house_number_suffix = '', NULL, @blank_house_number_suffix),
        street_name         = if(@blank_street_name = '', NULL, @blank_street_name),
        apartment_number    = if(@blank_apartment_number = '', NULL, @blank_apartment_number),
        address_line_2      = if(@blank_address_line_2 = '', NULL, @blank_address_line_2),
        city                = if(@blank_city = '', NULL, @blank_city),
        state               = if(@blank_state = '', NULL, @blank_state),
        zip                 = if(@blank_zip = '', NULL, @blank_zip),
        mail_address_1      = if(@blank_mail_address_1 = '', NULL, @blank_mail_address_1),
        mail_address_2      = if(@blank_mail_address_2 = '', NULL, @blank_mail_address_2),
        mail_city           = if(@blank_mail_city = '', NULL, @blank_mail_city),
        mail_state          = if(@blank_mail_state = '', NULL, @blank_mail_state),
        mail_zip            = if(@blank_mail_zip = '', NULL, @blank_mail_zip),
        precinct_code       = if(@blank_precinct_code = '', NULL, @blank_precinct_code),
        precinct_split_id   = if(@blank_precinct_split_id = '', NULL, @blank_precinct_split_id),
        home_phone          = if(@blank_home_phone = '', NULL, @blank_home_phone),
        county              = if(@blank_county = '', NULL, @blank_county),
        voter_status = if(@csv_voter_status = 'A', 1, 0)
    ;

load data local infile 'data/ALLEGHENY FVE 20220502.txt'
    into table voter_district_list
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (id_number, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @bd_01, @bd_02, @bd_03, @bd_04, @bd_05, @bd_06, @bd_07, @bd_08, @bd_09, @bd_10, @bd_11, @bd_12, @bd_13, @bd_14, @bd_15, @bd_16, @bd_17, @bd_18, @bd_19, @bd_20, @bd_21, @bd_22, @bd_23, @bd_24, @bd_25, @bd_26, @bd_27, @bd_28, @bd_29, @bd_30, @bd_31, @bd_32, @bd_33, @bd_34, @bd_35, @bd_36, @bd_37, @bd_38, @bd_39, @bd_40, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var)
    set
        district_01 = if(@bd_01 = '', NULL, @bd_01), district_02 = if(@bd_02 = '', NULL, @bd_02),
        district_03 = if(@bd_03 = '', NULL, @bd_03), district_04 = if(@bd_04 = '', NULL, @bd_04),
        district_05 = if(@bd_05 = '', NULL, @bd_05), district_06 = if(@bd_06 = '', NULL, @bd_06),
        district_07 = if(@bd_07 = '', NULL, @bd_07), district_08 = if(@bd_08 = '', NULL, @bd_08),
        district_09 = if(@bd_09 = '', NULL, @bd_09), district_10 = if(@bd_10 = '', NULL, @bd_10),
        district_11 = if(@bd_11 = '', NULL, @bd_11), district_12 = if(@bd_12 = '', NULL, @bd_12),
        district_13 = if(@bd_13 = '', NULL, @bd_13), district_14 = if(@bd_14 = '', NULL, @bd_14),
        district_15 = if(@bd_15 = '', NULL, @bd_15), district_16 = if(@bd_16 = '', NULL, @bd_16),
        district_17 = if(@bd_17 = '', NULL, @bd_17), district_18 = if(@bd_18 = '', NULL, @bd_18),
        district_19 = if(@bd_19 = '', NULL, @bd_19), district_20 = if(@bd_20 = '', NULL, @bd_20),
        district_21 = if(@bd_21 = '', NULL, @bd_21), district_22 = if(@bd_22 = '', NULL, @bd_22),
        district_23 = if(@bd_23 = '', NULL, @bd_23), district_24 = if(@bd_24 = '', NULL, @bd_24),
        district_25 = if(@bd_25 = '', NULL, @bd_25), district_26 = if(@bd_26 = '', NULL, @bd_26),
        district_27 = if(@bd_27 = '', NULL, @bd_27), district_28 = if(@bd_28 = '', NULL, @bd_28),
        district_29 = if(@bd_29 = '', NULL, @bd_29), district_30 = if(@bd_30 = '', NULL, @bd_30),
        district_31 = if(@bd_31 = '', NULL, @bd_31), district_32 = if(@bd_32 = '', NULL, @bd_32),
        district_33 = if(@bd_33 = '', NULL, @bd_33), district_34 = if(@bd_34 = '', NULL, @bd_34),
        district_35 = if(@bd_35 = '', NULL, @bd_35), district_36 = if(@bd_36 = '', NULL, @bd_36),
        district_37 = if(@bd_37 = '', NULL, @bd_37), district_38 = if(@bd_38 = '', NULL, @bd_38),
        district_39 = if(@bd_39 = '', NULL, @bd_39), district_40 = if(@bd_40 = '', NULL, @bd_40)
    ;

load data local infile 'data/ALLEGHENY FVE 20220502.txt'
    into table voter_votes_list
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (id_number, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @bm_01, @bc_01, @bm_02, @bc_02, @bm_03, @bc_03, @bm_04, @bc_04, @bm_05, @bc_05, @bm_06, @bc_06, @bm_07, @bc_07, @bm_08, @bc_08, @bm_09, @bc_09, @bm_10, @bc_10, @bm_11, @bc_11, @bm_12, @bc_12, @bm_13, @bc_13, @bm_14, @bc_14, @bm_15, @bc_15, @bm_16, @bc_16, @bm_17, @bc_17, @bm_18, @bc_18, @bm_19, @bc_19, @bm_20, @bc_20, @bm_21, @bc_21, @bm_22, @bc_22, @bm_23, @bc_23, @bm_24, @bc_24, @bm_25, @bc_25, @bm_26, @bc_26, @bm_27, @bc_27, @bm_28, @bc_28, @bm_29, @bc_29, @bm_30, @bc_30, @bm_31, @bc_31, @bm_32, @bc_32, @bm_33, @bc_33, @bm_34, @bc_34, @bm_35, @bc_35, @bm_36, @bc_36, @bm_37, @bc_37, @bm_38, @bc_38, @bm_39, @bc_39, @bm_40, @bc_40, @var, @var, @var)
    set
        method_01 = if(@bm_01 = '', NULL, @bm_01), choice_01 = if(@bc_01 = '', NULL, @bc_01),
        method_02 = if(@bm_02 = '', NULL, @bm_02), choice_02 = if(@bc_02 = '', NULL, @bc_02),
        method_03 = if(@bm_03 = '', NULL, @bm_03), choice_03 = if(@bc_03 = '', NULL, @bc_03),
        method_04 = if(@bm_04 = '', NULL, @bm_04), choice_04 = if(@bc_04 = '', NULL, @bc_04),
        method_05 = if(@bm_05 = '', NULL, @bm_05), choice_05 = if(@bc_05 = '', NULL, @bc_05),
        method_06 = if(@bm_06 = '', NULL, @bm_06), choice_06 = if(@bc_06 = '', NULL, @bc_06),
        method_07 = if(@bm_07 = '', NULL, @bm_07), choice_07 = if(@bc_07 = '', NULL, @bc_07),
        method_08 = if(@bm_08 = '', NULL, @bm_08), choice_08 = if(@bc_08 = '', NULL, @bc_08),
        method_09 = if(@bm_09 = '', NULL, @bm_09), choice_09 = if(@bc_09 = '', NULL, @bc_09),
        method_10 = if(@bm_10 = '', NULL, @bm_10), choice_10 = if(@bc_10 = '', NULL, @bc_10),
        method_11 = if(@bm_11 = '', NULL, @bm_11), choice_11 = if(@bc_11 = '', NULL, @bc_11),
        method_12 = if(@bm_12 = '', NULL, @bm_12), choice_12 = if(@bc_12 = '', NULL, @bc_12),
        method_13 = if(@bm_13 = '', NULL, @bm_13), choice_13 = if(@bc_13 = '', NULL, @bc_13),
        method_14 = if(@bm_14 = '', NULL, @bm_14), choice_14 = if(@bc_14 = '', NULL, @bc_14),
        method_15 = if(@bm_15 = '', NULL, @bm_15), choice_15 = if(@bc_15 = '', NULL, @bc_15),
        method_16 = if(@bm_16 = '', NULL, @bm_16), choice_16 = if(@bc_16 = '', NULL, @bc_16),
        method_17 = if(@bm_17 = '', NULL, @bm_17), choice_17 = if(@bc_17 = '', NULL, @bc_17),
        method_18 = if(@bm_18 = '', NULL, @bm_18), choice_18 = if(@bc_18 = '', NULL, @bc_18),
        method_19 = if(@bm_19 = '', NULL, @bm_19), choice_19 = if(@bc_19 = '', NULL, @bc_19),
        method_20 = if(@bm_20 = '', NULL, @bm_20), choice_20 = if(@bc_20 = '', NULL, @bc_20),
        method_21 = if(@bm_21 = '', NULL, @bm_21), choice_21 = if(@bc_21 = '', NULL, @bc_21),
        method_22 = if(@bm_22 = '', NULL, @bm_22), choice_22 = if(@bc_22 = '', NULL, @bc_22),
        method_23 = if(@bm_23 = '', NULL, @bm_23), choice_23 = if(@bc_23 = '', NULL, @bc_23),
        method_24 = if(@bm_24 = '', NULL, @bm_24), choice_24 = if(@bc_24 = '', NULL, @bc_24),
        method_25 = if(@bm_25 = '', NULL, @bm_25), choice_25 = if(@bc_25 = '', NULL, @bc_25),
        method_26 = if(@bm_26 = '', NULL, @bm_26), choice_26 = if(@bc_26 = '', NULL, @bc_26),
        method_27 = if(@bm_27 = '', NULL, @bm_27), choice_27 = if(@bc_27 = '', NULL, @bc_27),
        method_28 = if(@bm_28 = '', NULL, @bm_28), choice_28 = if(@bc_28 = '', NULL, @bc_28),
        method_29 = if(@bm_29 = '', NULL, @bm_29), choice_29 = if(@bc_29 = '', NULL, @bc_29),
        method_30 = if(@bm_30 = '', NULL, @bm_30), choice_30 = if(@bc_30 = '', NULL, @bc_30),
        method_31 = if(@bm_31 = '', NULL, @bm_31), choice_31 = if(@bc_31 = '', NULL, @bc_31),
        method_32 = if(@bm_32 = '', NULL, @bm_32), choice_32 = if(@bc_32 = '', NULL, @bc_32),
        method_33 = if(@bm_33 = '', NULL, @bm_33), choice_33 = if(@bc_33 = '', NULL, @bc_33),
        method_34 = if(@bm_34 = '', NULL, @bm_34), choice_34 = if(@bc_34 = '', NULL, @bc_34),
        method_35 = if(@bm_35 = '', NULL, @bm_35), choice_35 = if(@bc_35 = '', NULL, @bc_35),
        method_36 = if(@bm_36 = '', NULL, @bm_36), choice_36 = if(@bc_36 = '', NULL, @bc_36),
        method_37 = if(@bm_37 = '', NULL, @bm_37), choice_37 = if(@bc_37 = '', NULL, @bc_37),
        method_38 = if(@bm_38 = '', NULL, @bm_38), choice_38 = if(@bc_38 = '', NULL, @bc_38),
        method_39 = if(@bm_39 = '', NULL, @bm_39), choice_39 = if(@bc_39 = '', NULL, @bc_39),
        method_40 = if(@bm_40 = '', NULL, @bm_40), choice_40 = if(@bc_40 = '', NULL, @bc_40)
    ;
