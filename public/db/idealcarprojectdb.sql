-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema idealcarprojectdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `idealcarprojectdb` ;

-- -----------------------------------------------------
-- Schema idealcarprojectdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `idealcarprojectdb` DEFAULT CHARACTER SET latin1 ;
USE `idealcarprojectdb` ;

-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`actions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`actions` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`actions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` ENUM('MAINTENANCE', 'RENTED', 'CUSTOMER_LOCATION', 'BOUGHT_FUEL') NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`user` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 703
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`country` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`country` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 81
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`branch`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`branch` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`branch` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `country_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `country_id` (`country_id` ASC) VISIBLE,
  CONSTRAINT `branch_ibfk_1`
    FOREIGN KEY (`country_id`)
    REFERENCES `idealcarprojectdb`.`country` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 78
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`vehicles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`vehicles` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`vehicles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `make` VARCHAR(255) NOT NULL,
  `model` VARCHAR(255) NOT NULL,
  `year` INT NOT NULL,
  `registration_number` VARCHAR(255) NOT NULL,
  `mileage` INT NOT NULL,
  `branch_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `branch_id` (`branch_id` ASC) VISIBLE,
  CONSTRAINT `vehicles_ibfk_1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `idealcarprojectdb`.`branch` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`trips`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`trips` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`trips` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT UNSIGNED NOT NULL,
  `start_time` DATETIME NOT NULL,
  `end_time` DATETIME NOT NULL,
  `distance` DECIMAL(10,2) NOT NULL,
  `duration` TIME NOT NULL,
  `cost` DECIMAL(10,2) NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `vehicle_id` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `trips_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `trips_ibfk_2`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 23
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`audit_logs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`audit_logs` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`audit_logs` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` ENUM('MAINTENANCE', 'LEASED', 'CUSTOMER_LOCATION', 'BOUGHT_FUEL') NOT NULL,
  `user_id` INT UNSIGNED NULL DEFAULT NULL,
  `action_id` INT UNSIGNED NULL DEFAULT NULL,
  `trip_id` INT UNSIGNED NULL DEFAULT NULL,
  `vehicle_id` INT UNSIGNED NULL DEFAULT NULL,
  `log_details` TEXT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `action_id` (`action_id` ASC) VISIBLE,
  INDEX `trip_id` (`trip_id` ASC) VISIBLE,
  INDEX `vehicle_id` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `audit_logs_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `audit_logs_ibfk_2`
    FOREIGN KEY (`action_id`)
    REFERENCES `idealcarprojectdb`.`actions` (`id`),
  CONSTRAINT `audit_logs_ibfk_3`
    FOREIGN KEY (`trip_id`)
    REFERENCES `idealcarprojectdb`.`trips` (`id`),
  CONSTRAINT `audit_logs_ibfk_4`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`fuel_cards`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`fuel_cards` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`fuel_cards` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `card_number` VARCHAR(16) NOT NULL,
  `expirationDate` DATETIME NOT NULL,
  `cardType` ENUM('VIRTUAL', 'HARD') NOT NULL,
  `issuer` ENUM('MASTERCARD', 'MAESTRO', 'VISA', 'JESUS') NOT NULL,
  `currencyCode` ENUM('EUR (Euro)', 'NGN (Nigeria Naira)', 'USD (United States Dollar)', 'GBP (British Pound Sterling)', 'JPY (Japanese Yen)', 'AUD (Australian Dollar)', 'CHF (Swiss Franc)', 'CNY (Chinese Yuan Renminbi)', 'HKD (Hong Kong Dollar)', 'INR (Indian Rupee)', 'MXN (Mexican Peso)', 'SGD (Singapore Dollar)', 'THB (Thai Baht)', 'BRL (Brazilian Real)', 'ZAR (South African Rand)', 'SEK (Swedish Krona)', 'NOK (Norwegian Krone)', 'DKK (Danish Krone)', 'RUB (Russian Ruble)', 'TRY (Turkish Lira)', 'AED (United Arab Emirates Dirham)', 'BGN (Bulgarian Lev)', 'COP (Colombian Peso)', 'CZK (Czech Koruna)', 'EGP (Egyptian Pound)', 'HUF (Hungarian Forint)', 'IDR (Indonesian Rupiah)', 'ILS (Israeli Shekel)', 'KRW (South Korean Won)') NOT NULL,
  `balance` DECIMAL(10,2) NOT NULL,
  `branch_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `card_number` (`card_number` ASC) VISIBLE,
  INDEX `branch_id` (`branch_id` ASC) VISIBLE,
  CONSTRAINT `fuel_cards_ibfk_1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `idealcarprojectdb`.`branch` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`branch_card_to_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`branch_card_to_user` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`branch_card_to_user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `fuel_card_id` INT UNSIGNED NOT NULL,
  `branch_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  INDEX `fuel_card_id` (`fuel_card_id` ASC) VISIBLE,
  INDEX `branch_id` (`branch_id` ASC) VISIBLE,
  CONSTRAINT `branch_card_to_user_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `branch_card_to_user_ibfk_2`
    FOREIGN KEY (`fuel_card_id`)
    REFERENCES `idealcarprojectdb`.`fuel_cards` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `branch_card_to_user_ibfk_3`
    FOREIGN KEY (`branch_id`)
    REFERENCES `idealcarprojectdb`.`branch` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`branch_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`branch_user` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`branch_user` (
  `branch_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`branch_id`, `user_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `branch_user_ibfk_1`
    FOREIGN KEY (`branch_id`)
    REFERENCES `idealcarprojectdb`.`branch` (`id`),
  CONSTRAINT `branch_user_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`languages` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`languages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`country_languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`country_languages` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`country_languages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `country_id` INT UNSIGNED NOT NULL,
  `languages_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` TIMESTAMP NULL DEFAULT NULL,
  `deleted_by` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `country_id` (`country_id` ASC) VISIBLE,
  INDEX `languages_id` (`languages_id` ASC) VISIBLE,
  CONSTRAINT `country_languages_ibfk_1`
    FOREIGN KEY (`country_id`)
    REFERENCES `idealcarprojectdb`.`country` (`id`),
  CONSTRAINT `country_languages_ibfk_2`
    FOREIGN KEY (`languages_id`)
    REFERENCES `idealcarprojectdb`.`languages` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`fuel_entries`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`fuel_entries` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`fuel_entries` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT UNSIGNED NOT NULL,
  `fuel_card_id` INT UNSIGNED NOT NULL,
  `date` DATE NOT NULL,
  `odometer` INT NOT NULL,
  `liters` DECIMAL(10,2) NOT NULL,
  `price_per_liter` DECIMAL(10,2) NOT NULL,
  `total_price` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `vehicle_id` (`vehicle_id` ASC) VISIBLE,
  INDEX `fuel_card_id` (`fuel_card_id` ASC) VISIBLE,
  CONSTRAINT `fuel_entries_ibfk_1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `fuel_entries_ibfk_2`
    FOREIGN KEY (`fuel_card_id`)
    REFERENCES `idealcarprojectdb`.`fuel_cards` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`invoices`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`invoices` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`invoices` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `trip_id` INT UNSIGNED NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `issued_date` DATETIME NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `trip_id` (`trip_id` ASC) VISIBLE,
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `invoices_ibfk_1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `idealcarprojectdb`.`trips` (`id`),
  CONSTRAINT `invoices_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 9
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`pages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`pages` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`pages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `slug` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NOT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `slug` (`slug` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`languages_pages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`languages_pages` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`languages_pages` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `pages_id` INT UNSIGNED NOT NULL,
  `languages_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` TIMESTAMP NULL DEFAULT NULL,
  `deleted_by` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `pages_id` (`pages_id` ASC, `languages_id` ASC) VISIBLE,
  INDEX `languages_id` (`languages_id` ASC) VISIBLE,
  CONSTRAINT `languages_pages_ibfk_1`
    FOREIGN KEY (`pages_id`)
    REFERENCES `idealcarprojectdb`.`pages` (`id`),
  CONSTRAINT `languages_pages_ibfk_2`
    FOREIGN KEY (`languages_id`)
    REFERENCES `idealcarprojectdb`.`languages` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`maintenance_records`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`maintenance_records` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`maintenance_records` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT UNSIGNED NOT NULL,
  `description` TEXT NOT NULL,
  `date` DATE NOT NULL,
  `status` ENUM('SCHEDULED', 'UNEXPECTED') NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `vehicle_id` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `maintenance_records_ibfk_1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`maintenance_schedule`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`maintenance_schedule` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`maintenance_schedule` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `vehicle_id` INT UNSIGNED NOT NULL,
  `mileage_interval` INT NOT NULL,
  `date_interval` INT NOT NULL,
  `duration` TIME NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `vehicle_id` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `maintenance_schedule_ibfk_1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`migrations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`migrations` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`migrations` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`payments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`payments` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`payments` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` INT UNSIGNED NOT NULL,
  `amount` DECIMAL(10,2) NOT NULL,
  `payment_date` DATETIME NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `invoice_id` (`invoice_id` ASC) VISIBLE,
  CONSTRAINT `payments_ibfk_1`
    FOREIGN KEY (`invoice_id`)
    REFERENCES `idealcarprojectdb`.`invoices` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`permissions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`permissions` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`permissions` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `name` VARCHAR(50) NOT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`rental_options`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`rental_options` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`rental_options` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `rental_duration` INT NOT NULL,
  `daily_rate` DECIMAL(10,2) NOT NULL,
  `weekly_rate` DECIMAL(10,2) NOT NULL,
  `monthly_rate` DECIMAL(10,2) NOT NULL,
  `mileage_limit` INT NOT NULL,
  `excess_mileage_rate` DECIMAL(10,2) NOT NULL,
  `deposit_amount` DECIMAL(10,2) NOT NULL,
  `late_return_fee` DECIMAL(10,2) NOT NULL,
  `insurance_rate` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`rental_options_vehicles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`rental_options_vehicles` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`rental_options_vehicles` (
  `rental_options_id` INT UNSIGNED NOT NULL,
  `vehicles_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`rental_options_id`, `vehicles_id`),
  INDEX `vehicles_id` (`vehicles_id` ASC) VISIBLE,
  CONSTRAINT `rental_options_vehicles_ibfk_1`
    FOREIGN KEY (`rental_options_id`)
    REFERENCES `idealcarprojectdb`.`rental_options` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `rental_options_vehicles_ibfk_2`
    FOREIGN KEY (`vehicles_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`roles` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`roles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`role_permission`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`role_permission` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`role_permission` (
  `role_id` INT UNSIGNED NOT NULL,
  `permission_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NOT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `permission_id`),
  INDEX `permission_id` (`permission_id` ASC) VISIBLE,
  CONSTRAINT `role_permission_ibfk_1`
    FOREIGN KEY (`role_id`)
    REFERENCES `idealcarprojectdb`.`roles` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `role_permission_ibfk_2`
    FOREIGN KEY (`permission_id`)
    REFERENCES `idealcarprojectdb`.`permissions` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`role_user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`role_user` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`role_user` (
  `role_id` INT UNSIGNED NOT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` TIMESTAMP NULL DEFAULT NULL,
  `deleted_by` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`role_id`, `user_id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `role_user_ibfk_1`
    FOREIGN KEY (`role_id`)
    REFERENCES `idealcarprojectdb`.`roles` (`id`)
    ON DELETE CASCADE,
  CONSTRAINT `role_user_ibfk_2`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`users` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`routes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`routes` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`routes` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `trip_id` INT UNSIGNED NOT NULL,
  `name` VARCHAR(255) NULL DEFAULT NULL,
  `start_location` FLOAT UNSIGNED NOT NULL,
  `end_location` FLOAT UNSIGNED NOT NULL,
  `duration_in_minutes` INT NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `trip_id` (`trip_id` ASC) VISIBLE,
  CONSTRAINT `routes_ibfk_1`
    FOREIGN KEY (`trip_id`)
    REFERENCES `idealcarprojectdb`.`trips` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`user_contacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`user_contacts` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`user_contacts` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` ENUM('BUSINESS', 'PERSONAL') NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` TIMESTAMP NULL DEFAULT NULL,
  `deleted_by` TIMESTAMP NULL DEFAULT NULL,
  `user_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_contacts_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`user_logins`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`user_logins` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`user_logins` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `login_time` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ip_address` VARCHAR(50) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` TIMESTAMP NULL DEFAULT NULL,
  `deleted_by` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_logins_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`user_profiles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`user_profiles` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`user_profiles` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` INT UNSIGNED NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `date_of_birth` DATE NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` TIMESTAMP NULL DEFAULT NULL,
  `updated_by` TIMESTAMP NULL DEFAULT NULL,
  `deleted_by` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `user_id` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_profiles_ibfk_1`
    FOREIGN KEY (`user_id`)
    REFERENCES `idealcarprojectdb`.`user` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `idealcarprojectdb`.`vehicle_locations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`vehicle_locations` ;

CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`vehicle_locations` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `latitude` DECIMAL(10,8) NOT NULL,
  `longitude` DECIMAL(11,8) NOT NULL,
  `timestamp` DATETIME NOT NULL,
  `vehicle_id` INT UNSIGNED NOT NULL,
  `location` ENUM('AT_BRANCH', 'ON_TRIP') NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  `deleted_at` TIMESTAMP NULL DEFAULT NULL,
  `created_by` INT UNSIGNED NULL DEFAULT NULL,
  `updated_by` INT UNSIGNED NULL DEFAULT NULL,
  `deleted_by` INT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `vehicle_id` (`vehicle_id` ASC) VISIBLE,
  CONSTRAINT `vehicle_locations_ibfk_1`
    FOREIGN KEY (`vehicle_id`)
    REFERENCES `idealcarprojectdb`.`vehicles` (`id`)
    ON DELETE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

USE `idealcarprojectdb` ;

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`_unique_customers_per_branch_per_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`_unique_customers_per_branch_per_country` (`country_name` INT, `branch_name` INT, `customers` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`active_fleet_by_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`active_fleet_by_country` (`name` INT, `id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`audit_logs_by_vehicle_branch_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`audit_logs_by_vehicle_branch_country` (`country_name` INT, `branch_name` INT, `vehicle_name` INT, `id` INT, `name` INT, `user_id` INT, `action_id` INT, `trip_id` INT, `vehicle_id` INT, `log_details` INT, `created_at` INT, `updated_at` INT, `deleted_at` INT, `created_by` INT, `updated_by` INT, `deleted_by` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`card_counts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`card_counts` (`country_name` INT, `branch_name` INT, `virtual_count` INT, `hard_count` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`completed_trips_per_branch_per_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`completed_trips_per_branch_per_country` (`country_name` INT, `branch_name` INT, `trips` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`country_top_languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`country_top_languages` (`country_id` INT, `language_id` INT, `language_name` INT, `page_count` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`deposit_view`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`deposit_view` (`id` INT, `name` INT, `registration_number` INT, `deposit_amount` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`maintenance_records_breakdowns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`maintenance_records_breakdowns` (`vehicle_id` INT, `id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`maintenance_records_not_scheduled`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`maintenance_records_not_scheduled` (`vehicle_id` INT, `id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`maintenance_records_scheduled`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`maintenance_records_scheduled` (`vehicle_id` INT, `id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`on_trip_vehicles_by_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`on_trip_vehicles_by_country` (`vehicle_id` INT, `id` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`repeating_customers_per_branch_per_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`repeating_customers_per_branch_per_country` (`country_name` INT, `branch_name` INT, `customers` INT);

-- -----------------------------------------------------
-- Placeholder table for view `idealcarprojectdb`.`unique_customers_per_branch_per_country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `idealcarprojectdb`.`unique_customers_per_branch_per_country` (`country_name` INT, `branch_name` INT, `unique_customers` INT);

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`_unique_customers_per_branch_per_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`_unique_customers_per_branch_per_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`_unique_customers_per_branch_per_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`_unique_customers_per_branch_per_country` AS select `c`.`name` AS `country_name`,`b`.`name` AS `branch_name`,count(distinct `u`.`id`) AS `customers` from (((((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`b`.`country_id` = `c`.`id`))) join `idealcarprojectdb`.`branch_user` `bu` on((`bu`.`branch_id` = `b`.`id`))) join `idealcarprojectdb`.`role_user` `ru` on((`ru`.`user_id` = `bu`.`user_id`))) join `idealcarprojectdb`.`roles` `r` on(((`r`.`id` = `ru`.`role_id`) and (`r`.`name` = 'Customer')))) join `idealcarprojectdb`.`user` `u` on((`u`.`id` = `ru`.`user_id`))) group by `c`.`id`,`b`.`id` order by `customers` desc;

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`active_fleet_by_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`active_fleet_by_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`active_fleet_by_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`active_fleet_by_country` AS select `idealcarprojectdb`.`country`.`name` AS `name`,`idealcarprojectdb`.`country`.`id` AS `id` from `idealcarprojectdb`.`country`;

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`audit_logs_by_vehicle_branch_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`audit_logs_by_vehicle_branch_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`audit_logs_by_vehicle_branch_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`audit_logs_by_vehicle_branch_country` AS select `c`.`name` AS `country_name`,`b`.`name` AS `branch_name`,`v`.`model` AS `vehicle_name`,`al`.`id` AS `id`,`al`.`name` AS `name`,`al`.`user_id` AS `user_id`,`al`.`action_id` AS `action_id`,`al`.`trip_id` AS `trip_id`,`al`.`vehicle_id` AS `vehicle_id`,`al`.`log_details` AS `log_details`,`al`.`created_at` AS `created_at`,`al`.`updated_at` AS `updated_at`,`al`.`deleted_at` AS `deleted_at`,`al`.`created_by` AS `created_by`,`al`.`updated_by` AS `updated_by`,`al`.`deleted_by` AS `deleted_by` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`b`.`country_id` = `c`.`id`))) join `idealcarprojectdb`.`vehicles` `v` on((`v`.`branch_id` = `b`.`id`))) join `idealcarprojectdb`.`audit_logs` `al` on((`al`.`vehicle_id` = `v`.`id`)));

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`card_counts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`card_counts`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`card_counts` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`card_counts` AS select `c`.`name` AS `country_name`,`b`.`name` AS `branch_name`,sum((`f`.`cardType` = 'VIRTUAL')) AS `virtual_count`,sum((`f`.`cardType` = 'HARD')) AS `hard_count` from ((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`b`.`country_id` = `c`.`id`))) join `idealcarprojectdb`.`fuel_cards` `f` on((`f`.`branch_id` = `b`.`id`))) group by `c`.`id`,`b`.`id`;

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`completed_trips_per_branch_per_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`completed_trips_per_branch_per_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`completed_trips_per_branch_per_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`completed_trips_per_branch_per_country` AS select `c`.`name` AS `country_name`,`b`.`name` AS `branch_name`,count(`t`.`id`) AS `trips` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`b`.`country_id` = `c`.`id`))) join `idealcarprojectdb`.`vehicles` `v` on((`v`.`branch_id` = `b`.`id`))) join `idealcarprojectdb`.`trips` `t` on((`t`.`vehicle_id` = `v`.`id`))) group by `c`.`id`,`b`.`id` order by `trips` desc;

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`country_top_languages`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`country_top_languages`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`country_top_languages` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`country_top_languages` AS select `c`.`id` AS `country_id`,`l`.`id` AS `language_id`,`l`.`name` AS `language_name`,count(`p`.`id`) AS `page_count` from ((((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`country_languages` `cl` on((`c`.`id` = `cl`.`country_id`))) join `idealcarprojectdb`.`languages` `l` on((`cl`.`languages_id` = `l`.`id`))) join `idealcarprojectdb`.`languages_pages` `lp` on((`l`.`id` = `lp`.`languages_id`))) join `idealcarprojectdb`.`pages` `p` on((`lp`.`pages_id` = `p`.`id`))) group by `c`.`id`,`l`.`id` having (count(`p`.`id`) > 0) order by `c`.`id`,count(`p`.`id`) desc;

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`deposit_view`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`deposit_view`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`deposit_view` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`deposit_view` AS select `c`.`id` AS `id`,`b`.`name` AS `name`,`v`.`registration_number` AS `registration_number`,`ro`.`deposit_amount` AS `deposit_amount` from ((((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`c`.`id` = `b`.`country_id`))) join `idealcarprojectdb`.`vehicles` `v` on((`b`.`id` = `v`.`branch_id`))) join `idealcarprojectdb`.`rental_options_vehicles` `rv` on((`v`.`id` = `rv`.`vehicles_id`))) join `idealcarprojectdb`.`rental_options` `ro` on((`rv`.`rental_options_id` = `ro`.`id`))) where (`ro`.`deposit_amount` > 180);

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`maintenance_records_breakdowns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`maintenance_records_breakdowns`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`maintenance_records_breakdowns` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`maintenance_records_breakdowns` AS select `mr`.`vehicle_id` AS `vehicle_id`,`mr`.`id` AS `id` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`c`.`id` = `b`.`country_id`))) join `idealcarprojectdb`.`vehicles` `v` on((`b`.`id` = `v`.`branch_id`))) join `idealcarprojectdb`.`maintenance_records` `mr` on((`v`.`id` = `mr`.`vehicle_id`))) where (`mr`.`status` = 'UNEXPECTED');

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`maintenance_records_not_scheduled`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`maintenance_records_not_scheduled`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`maintenance_records_not_scheduled` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`maintenance_records_not_scheduled` AS select `mr`.`vehicle_id` AS `vehicle_id`,`mr`.`id` AS `id` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`c`.`id` = `b`.`country_id`))) join `idealcarprojectdb`.`vehicles` `v` on((`b`.`id` = `v`.`branch_id`))) join `idealcarprojectdb`.`maintenance_records` `mr` on((`v`.`id` = `mr`.`vehicle_id`))) where (`mr`.`status` = 'UNEXPECTED');

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`maintenance_records_scheduled`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`maintenance_records_scheduled`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`maintenance_records_scheduled` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`maintenance_records_scheduled` AS select `mr`.`vehicle_id` AS `vehicle_id`,`mr`.`id` AS `id` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`c`.`id` = `b`.`country_id`))) join `idealcarprojectdb`.`vehicles` `v` on((`b`.`id` = `v`.`branch_id`))) join `idealcarprojectdb`.`maintenance_records` `mr` on((`v`.`id` = `mr`.`vehicle_id`))) where (`mr`.`status` = 'SCHEDULED');

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`on_trip_vehicles_by_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`on_trip_vehicles_by_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`on_trip_vehicles_by_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`on_trip_vehicles_by_country` AS select `vl`.`vehicle_id` AS `vehicle_id`,`vl`.`id` AS `id` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`c`.`id` = `b`.`country_id`))) join `idealcarprojectdb`.`vehicles` `v` on((`b`.`id` = `v`.`branch_id`))) join `idealcarprojectdb`.`vehicle_locations` `vl` on((`v`.`id` = `vl`.`vehicle_id`))) where (`vl`.`location` = 'ON_TRIP');

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`repeating_customers_per_branch_per_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`repeating_customers_per_branch_per_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`repeating_customers_per_branch_per_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`repeating_customers_per_branch_per_country` AS select `c`.`name` AS `country_name`,`b`.`name` AS `branch_name`,count(distinct `u`.`id`) AS `customers` from (((((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`b`.`country_id` = `c`.`id`))) join `idealcarprojectdb`.`branch_user` `bu` on((`bu`.`branch_id` = `b`.`id`))) join `idealcarprojectdb`.`role_user` `ru` on((`ru`.`user_id` = `bu`.`user_id`))) join `idealcarprojectdb`.`roles` `r` on(((`r`.`id` = `ru`.`role_id`) and (`r`.`name` = 'Customer')))) join `idealcarprojectdb`.`user` `u` on((`u`.`id` = `ru`.`user_id`))) group by `c`.`id`,`b`.`id` order by `customers` desc;

-- -----------------------------------------------------
-- View `idealcarprojectdb`.`unique_customers_per_branch_per_country`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `idealcarprojectdb`.`unique_customers_per_branch_per_country`;
DROP VIEW IF EXISTS `idealcarprojectdb`.`unique_customers_per_branch_per_country` ;
USE `idealcarprojectdb`;
CREATE  OR REPLACE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `idealcarprojectdb`.`unique_customers_per_branch_per_country` AS select `c`.`name` AS `country_name`,`b`.`name` AS `branch_name`,count(distinct `u`.`id`) AS `unique_customers` from (((`idealcarprojectdb`.`country` `c` join `idealcarprojectdb`.`branch` `b` on((`b`.`country_id` = `c`.`id`))) join `idealcarprojectdb`.`branch_user` `bu` on((`bu`.`branch_id` = `b`.`id`))) join `idealcarprojectdb`.`user` `u` on((`u`.`id` = `bu`.`user_id`))) group by `c`.`id`,`b`.`id` order by `unique_customers` desc;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
