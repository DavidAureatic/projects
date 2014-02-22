SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';



DROP SCHEMA IF EXISTS `mydb` ;
DROP DATABASE IF EXISTS `mydb` ;
CREATE DATABASE `mydb`;

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;

CREATE TABLE IF NOT EXISTS `mydb`.`projects` (
  `idproject` INT(11) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `alias` VARCHAR(45) NOT NULL,
  `date_ini` VARCHAR(45) NULL DEFAULT NULL,
  `date_fini` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `tweet` VARCHAR(45) NOT NULL,
  `companies_idcompany` INT(11) NOT NULL,
  `statuses_idstatuses` INT(11) NOT NULL,
  PRIMARY KEY (`idproject`),
  INDEX `fk_projects_companies1_idx` (`companies_idcompany` ASC),
  INDEX `fk_projects_statuses1_idx` (`statuses_idstatuses` ASC),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  UNIQUE INDEX `alias_UNIQUE` (`alias` ASC),
  UNIQUE INDEX `tweet_UNIQUE` (`tweet` ASC),
  CONSTRAINT `fk_projects_companies1`
    FOREIGN KEY (`companies_idcompany`)
    REFERENCES `mydb`.`companies` (`idcompany`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_projects_statuses1`
    FOREIGN KEY (`statuses_idstatuses`)
    REFERENCES `mydb`.`statuses` (`idstatuses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mydb`.`statuses` (
  `idstatuses` INT(11) NOT NULL,
  `status` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idstatuses`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mydb`.`companies` (
  `idcompany` INT(11) NOT NULL,
  `company` VARCHAR(255) NOT NULL,
  `cif` VARCHAR(9) NOT NULL,
  `address` VARCHAR(255) NULL DEFAULT NULL,
  `location` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`idcompany`),
  UNIQUE INDEX `cif_UNIQUE` (`cif` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mydb`.`duties` (
  `idduties` INT(11) NOT NULL,
  `duty` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idduties`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mydb`.`users` (
  `idusers` INT(11) NOT NULL,
  `user` VARCHAR(255) NOT NULL,
  `lastname` VARCHAR(255) NOT NULL,
  `tfno` VARCHAR(12) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`idusers`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;

CREATE TABLE IF NOT EXISTS `mydb`.`teams` (
  `projects_idproject` INT(11) NOT NULL,
  `users_idusers` INT(11) NOT NULL,
  `duties_idduties` INT(11) NOT NULL,
  INDEX `fk_tasks_projects1_idx` (`projects_idproject` ASC),
  INDEX `fk_tasks_users1_idx` (`users_idusers` ASC),
  INDEX `fk_tasks_duties1_idx` (`duties_idduties` ASC),
  PRIMARY KEY (`projects_idproject`, `users_idusers`, `duties_idduties`),
  CONSTRAINT `fk_tasks_projects1`
    FOREIGN KEY (`projects_idproject`)
    REFERENCES `mydb`.`projects` (`idproject`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_users1`
    FOREIGN KEY (`users_idusers`)
    REFERENCES `mydb`.`users` (`idusers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tasks_duties1`
    FOREIGN KEY (`duties_idduties`)
    REFERENCES `mydb`.`duties` (`idduties`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
