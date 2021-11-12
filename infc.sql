-- write by FFS

DROP TABLE IF EXISTS `tw_Users`;
CREATE TABLE IF NOT EXISTS `tw_Users` (
	`UserId` INT NOT NULL AUTO_INCREMENT, 
	`Username` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
	`Email` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
	`PasswordHash` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
	`Level` INT DEFAULT '0' NOT NULL, 
	`RegisterDate` DATETIME NOT NULL DEFAULT NOW(), 
	`RegisterIp` VARCHAR(64) NOT NULL, 
    PRIMARY KEY (`UserId`)
) DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tw_infc_Rounds`;
CREATE TABLE IF NOT EXISTS `tw_infc_Rounds` (
    `RoundId` INT NOT NULL AUTO_INCREMENT, 
    `MapName` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
    `NumPlayersMin` INT NOT NULL, 
    `NumPlayersMax` INT NOT NULL, 
    `NumWinners` INT NOT NULL, 
    `RoundDate` DATETIME NOT NULL DEFAULT NOW(), 
    `RoundDuration` INT NOT NULL, 
    PRIMARY KEY (`RoundId`)
) DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `tw_infc_RoundScore`;
CREATE TABLE IF NOT EXISTS `tw_infc_RoundScore` (
    `RoundScoreId` INT NOT NULL AUTO_INCREMENT, 
    `UserId` INT NOT NULL, 
    `RoundId` INT NOT NULL, 
    `MapName` VARCHAR(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL, 
    `ScoreType` INT NOT NULL, 
    `ScoreDate` DATETIME NOT NULL DEFAULT NOW(), 
    `Score` INT NOT NULL, 
    PRIMARY KEY (`RoundScoreId`), 
    FOREIGN KEY (`UserId`) REFERENCES tw_Users(`UserId`), 
    FOREIGN KEY (`RoundId`) REFERENCES tw_infc_Rounds(`RoundId`)
) DEFAULT CHARSET=utf8mb4;