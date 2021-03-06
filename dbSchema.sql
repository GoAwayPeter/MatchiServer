CREATE SCHEMA IF NOT EXISTS homestead DEFAULT CHARACTER SET utf8;
USE homestead;

DROP TABLE IF EXISTS users, tokens, blocked_users, matched_users, user_locations;

CREATE TABLE IF NOT EXISTS `users` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`firstname` VARCHAR(30) NOT NULL,
`lastname` VARCHAR(30) NOT NULL,
`email` VARCHAR(50),
`facebookid` VARCHAR(32) NOT NULL UNIQUE,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
); 

CREATE TABLE IF NOT EXISTS `tokens` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` INT(6) UNSIGNED NOT NULL,
`api_token` VARCHAR(256) NOT NULL,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

CREATE TABLE IF NOT EXISTS `matched_users` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` INT(6) UNSIGNED NOT NULL,
`matched_userid` INT(6) UNSIGNED,
`rank` INT(8) UNSIGNED NOT NULL,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user_id`) REFERENCES users(`id`),
FOREIGN KEY (`matched_userid`) REFERENCES users(`id`)
);

CREATE TABLE IF NOT EXISTS `blocked_users` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` INT(6) UNSIGNED NOT NULL,
`blocked_userid` INT(6) UNSIGNED,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user_id`) REFERENCES users(`id`),
FOREIGN KEY (`blocked_userid`) REFERENCES users(`id`)
);

CREATE TABLE IF NOT EXISTS `user_locations` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`user_id` INT(6) UNSIGNED NOT NULL,
`location` VARCHAR(32) NOT NULL,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`user_id`) REFERENCES users(`id`)
);

