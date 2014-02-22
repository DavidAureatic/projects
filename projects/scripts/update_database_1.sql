SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `mydb`.`projects` 
CHANGE COLUMN `idproject` `idproject` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `alias` `alias` VARCHAR(45) NULL DEFAULT NULL ,
CHANGE COLUMN `tweet` `tweet` VARCHAR(45) NULL DEFAULT NULL ,
ADD UNIQUE INDEX `idproject_UNIQUE` (`idproject` ASC),
DROP INDEX `tweet_UNIQUE` ,
DROP INDEX `alias_UNIQUE` ,
DROP INDEX `name_UNIQUE` ;

ALTER TABLE `mydb`.`statuses` 
CHANGE COLUMN `idstatuses` `idstatuses` INT(11) NOT NULL AUTO_INCREMENT ,
ADD UNIQUE INDEX `idstatuses_UNIQUE` (`idstatuses` ASC);

ALTER TABLE `mydb`.`companies` 
CHANGE COLUMN `idcompany` `idcompany` INT(11) NOT NULL AUTO_INCREMENT ,
ADD UNIQUE INDEX `idcompany_UNIQUE` (`idcompany` ASC),
DROP INDEX `cif_UNIQUE` ;

ALTER TABLE `mydb`.`duties` 
CHANGE COLUMN `idduties` `idduties` INT(11) NOT NULL AUTO_INCREMENT ,
ADD UNIQUE INDEX `idduties_UNIQUE` (`idduties` ASC);

ALTER TABLE `mydb`.`users` 
CHANGE COLUMN `idusers` `idusers` INT(11) NOT NULL AUTO_INCREMENT ,
CHANGE COLUMN `lastname` `lastname` VARCHAR(255) NULL DEFAULT NULL ,
CHANGE COLUMN `tfno` `tfno` VARCHAR(12) NULL DEFAULT NULL ,
CHANGE COLUMN `email` `email` VARCHAR(255) NULL DEFAULT NULL ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
