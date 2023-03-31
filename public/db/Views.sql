DROP VIEW IF EXISTS on_trip_vehicles_by_country;
CREATE VIEW on_trip_vehicles_by_country AS
SELECT vl.vehicle_id, vl.id
FROM country c
INNER JOIN branch b ON c.id = b.country_id
INNER JOIN vehicles v ON b.id = v.branch_id
INNER JOIN vehicle_locations vl ON v.id = vl.vehicle_id
WHERE vl.location = 'ON_TRIP';

DROP VIEW IF EXISTS maintenance_records_breakdowns;
CREATE VIEW maintenance_records_breakdowns AS
SELECT mr.vehicle_id, mr.id
FROM country c
INNER JOIN branch b ON c.id = b.country_id
INNER JOIN vehicles v ON b.id = v.branch_id
INNER JOIN maintenance_records mr ON v.id = mr.vehicle_id
WHERE mr.status = 'UNEXPECTED';

DROP VIEW IF EXISTS maintenance_records_scheduled;
CREATE VIEW maintenance_records_scheduled AS
SELECT mr.vehicle_id, mr.id
FROM country c
INNER JOIN branch b ON c.id = b.country_id
INNER JOIN vehicles v ON b.id = v.branch_id
INNER JOIN maintenance_records mr ON v.id = mr.vehicle_id
WHERE mr.status = 'SCHEDULED';

DROP VIEW IF EXISTS unique_customers_per_branch_per_country;
CREATE VIEW unique_customers_per_branch_per_country AS
SELECT c.name AS country_name, b.name AS branch_name, COUNT(DISTINCT u.id) AS unique_customers
FROM country c
JOIN branch b ON b.country_id = c.id
JOIN branch_user bu ON bu.branch_id = b.id
JOIN user u ON u.id = bu.user_id
GROUP BY c.id, b.id
ORDER BY unique_customers DESC;

DROP VIEW IF EXISTS repeating_customers_per_branch_per_country;
CREATE VIEW repeating_customers_per_branch_per_country AS
SELECT c.name AS country_name, b.name AS branch_name, COUNT(DISTINCT u.id) AS customers
FROM country c
JOIN branch b ON b.country_id = c.id
JOIN branch_user bu ON bu.branch_id = b.id
JOIN role_user ru ON ru.user_id = bu.user_id
JOIN roles r ON r.id = ru.role_id AND r.name = 'Customer'
JOIN user u ON u.id = ru.user_id
GROUP BY c.id, b.id
ORDER BY customers DESC;

DROP VIEW IF EXISTS completed_trips_per_branch_per_country;
CREATE VIEW completed_trips_per_branch_per_country AS
SELECT c.name AS country_name, b.name AS branch_name, COUNT(t.id) AS trips
FROM country c
JOIN branch b ON b.country_id = c.id
JOIN vehicles v ON v.branch_id = b.id
JOIN trips t ON t.vehicle_id = v.id
GROUP BY c.id, b.id
ORDER BY trips DESC;

-- number of fuel cards sols by branch per country
DROP VIEW IF EXISTS card_counts;
CREATE VIEW card_counts AS
SELECT c.name AS country_name, b.name AS branch_name,
  SUM(cardType = 'VIRTUAL') AS virtual_count,
  SUM(cardType = 'HARD') AS hard_count
FROM country c
JOIN branch b ON b.country_id = c.id
JOIN fuel_cards f ON f.branch_id = b.id
GROUP BY c.id, b.id;

-- list first 3 languages used on pages per country
DROP VIEW IF EXISTS country_top_languages;
DROP VIEW IF EXISTS country_top_languages;
CREATE VIEW country_top_languages AS
SELECT c.id AS country_id, l.id AS language_id, l.name AS language_name, COUNT(p.id) AS page_count
FROM country c
INNER JOIN country_languages cl ON c.id = cl.country_id
INNER JOIN languages l ON cl.languages_id = l.id
INNER JOIN languages_pages lp ON l.id = lp.languages_id
INNER JOIN pages p ON lp.pages_id = p.id
GROUP BY c.id, l.id
HAVING COUNT(p.id) > 0
ORDER BY c.id, COUNT(p.id) DESC
;

SELECT
    ctl.country_id,
    ctl.language_id,
    ctl.language_name,
    GROUP_CONCAT(DISTINCT p.title ORDER BY p.title SEPARATOR ', ') AS page_titles
FROM
    country_top_languages ctl
    INNER JOIN country c ON ctl.country_id = c.id
    INNER JOIN languages l ON ctl.language_id = l.id
    INNER JOIN languages_pages lp ON l.id = lp.languages_id
    INNER JOIN pages p ON lp.pages_id = p.id
WHERE
    (SELECT COUNT(*) FROM country_top_languages ctl2 WHERE ctl2.country_id = ctl.country_id AND ctl2.page_count > ctl.page_count AND ctl2.language_id <> ctl.language_id) < 3
GROUP BY
    ctl.country_id,
    ctl.language_id,
    ctl.language_name
ORDER BY
    ctl.country_id,
    ctl.page_count DESC;

DROP VIEW IF EXISTS audit_logs_by_vehicle_branch_country;
CREATE VIEW audit_logs_by_vehicle_branch_country AS
SELECT c.name AS country_name, b.name AS branch_name, v.model AS vehicle_name, al.*
FROM country c
JOIN branch b ON b.country_id = c.id
JOIN vehicles v ON v.branch_id = b.id
JOIN audit_logs al ON al.vehicle_id = v.id;

DROP VIEW IF EXISTS deposit_view;
CREATE VIEW deposit_view AS
SELECT c.id, b.name, v.registration_number, ro.deposit_amount
FROM country c
JOIN branch b ON c.id = b.country_id
JOIN vehicles v ON b.id = v.branch_id
JOIN rental_options_vehicles rv ON v.id = rv.vehicles_id
JOIN rental_options ro ON rv.rental_options_id = ro.id
WHERE ro.deposit_amount > 180;



