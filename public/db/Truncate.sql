USE idealcarprojectdb;
SET foreign_key_checks = 0;
 -- TRUNCATE TABLE _unique_customers_per_branch_per_country;
 TRUNCATE TABLE actions;
 -- TRUNCATE TABLE active_fleet_by_country;
 TRUNCATE TABLE audit_logs;
 -- TRUNCATE TABLE audit_logs_by_vehicle_branch_country;
 TRUNCATE TABLE branch;
 TRUNCATE TABLE branch_card_to_user;
 TRUNCATE TABLE branch_user;
 -- TRUNCATE TABLE card_counts;
 -- TRUNCATE TABLE completed_trips_per_branch_per_country;
 TRUNCATE TABLE country;
 TRUNCATE TABLE country_languages;
 -- TRUNCATE TABLE country_top_languages;
 -- TRUNCATE TABLE deposit_view;
 TRUNCATE TABLE fuel_cards;
 TRUNCATE TABLE fuel_entries;
 TRUNCATE TABLE invoices;
 TRUNCATE TABLE languages;
 TRUNCATE TABLE languages_pages;
 TRUNCATE TABLE maintenance_records;
 -- TRUNCATE TABLE maintenance_records_breakdowns;
 -- TRUNCATE TABLE maintenance_records_not_scheduled;
 -- TRUNCATE TABLE maintenance_records_scheduled;
 TRUNCATE TABLE maintenance_schedule;
 TRUNCATE TABLE migrations;
 -- TRUNCATE TABLE on_trip_vehicles_by_country;
 TRUNCATE TABLE pages;
 TRUNCATE TABLE payments;
 TRUNCATE TABLE permissions;
 TRUNCATE TABLE rental_options;
 TRUNCATE TABLE rental_options_vehicles;
 -- TRUNCATE TABLE repeating_customers_per_branch_per_country;
 TRUNCATE TABLE role_permission;
 TRUNCATE TABLE role_user;
 TRUNCATE TABLE roles;
 TRUNCATE TABLE routes;
 TRUNCATE TABLE trips;
 -- TRUNCATE TABLE unique_customers_per_branch_per_country;
 TRUNCATE TABLE user;
 TRUNCATE TABLE user_contacts;
 TRUNCATE TABLE user_logins;
 TRUNCATE TABLE user_profiles;
 TRUNCATE TABLE vehicle_locations;
 TRUNCATE TABLE vehicles;
SET foreign_key_checks = 1;
