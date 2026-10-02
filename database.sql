CREATE TABLE IF NOT EXISTS `user_jobs` (
    `identifier` VARCHAR(60) NOT NULL,
    `job` VARCHAR(60) NOT NULL,
    `grade` INT(11) NOT NULL DEFAULT '0',
    PRIMARY KEY (`identifier`, `job`)
);

INSERT INTO `user_jobs` (`identifier`, `job`, `grade`) VALUES
('steam:11000010abcdef12', 'police', 0),
('steam:11000010abcdef12', 'ambulance', 0);