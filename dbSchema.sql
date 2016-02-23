CREATE SCHEMA IF NOT EXISTS homestead DEFAULT CHARACTER SET utf8;
USE homestead;

DROP TABLE IF EXISTS users, tokens, blocked_users, matched_users, user_locations;

CREATE TABLE IF NOT EXISTS `users` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`firstname` VARCHAR(30) NOT NULL,
`lastname` VARCHAR(30) NOT NULL,
`email` VARCHAR(50),
`facebookid` VARCHAR(32) NOT NULL UNIQUE,
`tokenid` INT(6) UNSIGNED UNIQUE,
`locationid` INT(6) UNSIGNED UNIQUE,
`matched_userid` INT(6) UNSIGNED UNIQUE,
`blocked_userid` INT(6) UNSIGNED UNIQUE,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
); 

CREATE TABLE IF NOT EXISTS `tokens` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT(6) UNSIGNED, 
`api_token` VARCHAR(256) NOT NULL,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`userid`) REFERENCES users(`tokenid`)
);

CREATE TABLE IF NOT EXISTS `matched_users` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT(6) UNSIGNED,
`matched_userid` INT(6) UNSIGNED,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`userid`) REFERENCES users(`id`),
FOREIGN KEY (`matched_userid`) REFERENCES users(`matched_userid`)
);

CREATE TABLE IF NOT EXISTS `blocked_users` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT(6) UNSIGNED,
`blocked_userid` INT(6) UNSIGNED,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`userid`) REFERENCES users(`id`),
FOREIGN KEY (`blocked_userid`) REFERENCES users(`blocked_userid`)
);

CREATE TABLE IF NOT EXISTS `user_locations` (
`id` INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
`userid` INT(6) UNSIGNED,
`location` VARCHAR(32) NOT NULL,
`created_at` TIMESTAMP NOT NULL DEFAULT 0,
`updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
FOREIGN KEY (`userid`) REFERENCES users(`locationid`)
);

