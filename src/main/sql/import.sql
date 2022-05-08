load data local infile 'data/ALLEGHENY Zone Types 20220502.txt'
    into table zone_type
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n';

load data local infile 'data/ALLEGHENY Zone Codes 20220502.txt'
    into table zone_code
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n';

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
    (id_number, title, last_name, first_name, middle_name, suffix, gender, @csv_dob, @csv_registration_date, @csv_voter_status, @csv_status_change_date, party_code, house_number, house_number_suffix, street_name, apartment_number, address_line_2, city, state, zip, mail_address_1, mail_address_2, mail_city, mail_state, mail_zip, @csv_last_vote_date, precinct_code, precinct_split_id, @csv_date_last_changed, @custom_data_1, @district_1, @district_2, @district_3, @district_4, @district_5, @district_6, @district_7, @district_8, @district_9, @district_10, @district_11, @district_12, @district_13, @district_14, @district_15, @district_16, @district_17, @district_18, @district_19, @district_20, @district_21, @district_22, @district_23, @district_24, @district_25, @district_26, @district_27, @district_28, @district_29, @district_30, @district_31, @district_32, @district_33, @district_34, @district_35, @district_36, @district_37, @district_38, @district_39, @district_40, @election_1_vote_method, @election_1_party, @election_2_vote_method, @election_2_party, @election_3_vote_method, @election_3_party, @election_4_vote_method, @election_4_party, @election_5_vote_method, @election_5_party, @election_6_vote_method, @election_6_party, @election_7_vote_method, @election_7_party, @election_8_vote_method, @election_8_party, @election_9_vote_method, @election_9_party, @election_10_vote_method, @election_10_party, @election_11_vote_method, @election_11_party, @election_12_vote_method, @election_12_party, @election_13_vote_method, @election_13_party, @election_14_vote_method, @election_14_party, @election_15_vote_method, @election_15_party, @election_16_vote_method, @election_16_party, @election_17_vote_method, @election_17_party, @election_18_vote_method, @election_18_party, @election_19_vote_method, @election_19_party, @election_20_vote_method, @election_20_party, @election_21_vote_method, @election_21_party, @election_22_vote_method, @election_22_party, @election_23_vote_method, @election_23_party, @election_24_vote_method, @election_24_party, @election_25_vote_method, @election_25_party, @election_26_vote_method, @election_26_party, @election_27_vote_method, @election_27_party, @election_28_vote_method, @election_28_party, @election_29_vote_method, @election_29_party, @election_30_vote_method, @election_30_party, @election_31_vote_method, @election_31_party, @election_32_vote_method, @election_32_party, @election_33_vote_method, @election_33_party, @election_34_vote_method, @election_34_party, @election_35_vote_method, @election_35_party, @election_36_vote_method, @election_36_party, @election_37_vote_method, @election_37_party, @election_38_vote_method, @election_38_party, @election_39_vote_method, @election_39_party, @election_40_vote_method, @election_40_party, home_phone, county, mail_country)
    set
        dob = if(@csv_dob is not null and @csv_dob <> '', STR_TO_DATE(CONCAT(substring(@csv_dob , 7, 4),'-',substring(@csv_dob, 1, 2),'-',substring(@csv_dob, 4, 2)), '%Y-%m-%d'),null),
        registration_date = if(@csv_registration_date is not null and @csv_registration_date <> '', STR_TO_DATE(CONCAT(substring(@csv_registration_date , 7, 4),'-',substring(@csv_registration_date, 1, 2),'-',substring(@csv_registration_date, 4, 2)), '%Y-%m-%d'),null),
        status_change_date = if(@csv_status_change_date is not null and @csv_status_change_date <> '', STR_TO_DATE(CONCAT(substring(@csv_status_change_date, 7, 4),'-',substring(@csv_status_change_date, 1, 2),'-',substring(@csv_status_change_date, 4, 2)), '%Y-%m-%d'),null),
        last_vote_date = if(@csv_last_vote_date is not null and @csv_last_vote_date <> '', STR_TO_DATE(CONCAT(substring(@csv_last_vote_date , 7, 4),'-',substring(@csv_last_vote_date, 1, 2),'-',substring(@csv_last_vote_date, 4, 2)), '%Y-%m-%d'),null),
        date_last_changed = if(@csv_date_last_changed is not null and @csv_date_last_changed <> '', STR_TO_DATE(CONCAT(substring(@csv_date_last_changed , 7, 4),'-',substring(@csv_date_last_changed, 1, 2),'-',substring(@csv_date_last_changed, 4, 2)), '%Y-%m-%d'),null),
        voter_status = if(@csv_voter_status = 'A', 1, 0)
    ;

load data local infile 'data/ALLEGHENY FVE 20220502.txt'
    into table voter_district_list
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (id_number, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, district_01, district_02, district_03, district_04, district_05, district_06, district_07, district_08, district_09, district_10, district_11, district_12, district_13, district_14, district_15, district_16, district_17, district_18, district_19, district_20, district_21, district_22, district_23, district_24, district_25, district_26, district_27, district_28, district_29, district_30, district_31, district_32, district_33, district_34, district_35, district_36, district_37, district_38, district_39, district_40, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var);

load data local infile 'data/ALLEGHENY FVE 20220502.txt'
    into table voter_votes_list
    fields terminated by '\t'
    enclosed by '"'
    lines terminated by '\r\n'
    (id_number, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, @var, method_01, choice_01, method_02, choice_02, method_03, choice_03, method_04, choice_04, method_05, choice_05, method_06, choice_06, method_07, choice_07, method_08, choice_08, method_09, choice_09, method_10, choice_10, method_11, choice_11, method_12, choice_12, method_13, choice_13, method_14, choice_14, method_15, choice_15, method_16, choice_16, method_17, choice_17, method_18, choice_18, method_19, choice_19, method_20, choice_20, method_21, choice_21, method_22, choice_22, method_23, choice_23, method_24, choice_24, method_25, choice_25, method_26, choice_26, method_27, choice_27, method_28, choice_28, method_29, choice_29, method_30, choice_30, method_31, choice_31, method_32, choice_32, method_33, choice_33, method_34, choice_34, method_35, choice_35, method_36, choice_36, method_37, choice_37, method_38, choice_38, method_39, choice_39, method_40, choice_40, @var, @var, @var);
