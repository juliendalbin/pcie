-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`competence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`competence` (
  `idcompetence` INT(11) NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL DEFAULT NULL,
  `titre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idcompetence`))
ENGINE = InnoDB
AUTO_INCREMENT = 116
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`offre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`offre` (
  `idOffre` INT(11) NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(100) NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  `nbDePostes` VARCHAR(45) NULL DEFAULT NULL,
  `statut` VARCHAR(45) NULL DEFAULT NULL,
  `ville_offre` VARCHAR(45) NULL DEFAULT NULL,
  `zoneDeDeplacement` VARCHAR(45) NULL DEFAULT NULL,
  `salaire_offre` VARCHAR(45) NULL DEFAULT NULL,
  `experience` VARCHAR(45) NULL DEFAULT NULL,
  `suivi` VARCHAR(45) NULL DEFAULT NULL,
  `refApec` VARCHAR(45) NULL DEFAULT NULL,
  `datePublication` VARCHAR(45) NULL DEFAULT NULL,
  `dateActualisation` VARCHAR(45) NULL DEFAULT NULL,
  `typeDeContrat` VARCHAR(45) NULL DEFAULT NULL,
  `code_postal_offre` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idOffre`))
ENGINE = InnoDB
AUTO_INCREMENT = 15
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`rang`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`rang` (
  `idrang` INT(11) NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idrang`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`utilisateur`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`utilisateur` (
  `idUtilisateur` INT(11) NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NULL DEFAULT NULL,
  `prenom` VARCHAR(45) NULL DEFAULT NULL,
  `voie` VARCHAR(45) NULL DEFAULT NULL,
  `code_postal` VARCHAR(45) NULL DEFAULT NULL,
  `ville` VARCHAR(45) NULL DEFAULT NULL,
  `telephone_fixe` VARCHAR(45) NULL DEFAULT NULL,
  `telephone_portable` VARCHAR(45) NULL DEFAULT NULL,
  `mail` VARCHAR(45) NULL DEFAULT NULL,
  `idrang` INT(11) NOT NULL,
  `hash` VARCHAR(60) NULL DEFAULT NULL,
  `curriculum_vitae` VARCHAR(45) NULL DEFAULT NULL,
  `lettre_de_motivation` VARCHAR(45) NULL DEFAULT NULL,
  `salaire` VARCHAR(45) NULL DEFAULT NULL,
  `salaire_actuel` VARCHAR(45) NULL DEFAULT NULL,
  `preavis` VARCHAR(45) NULL DEFAULT NULL,
  `commentaire_candidat` VARCHAR(45) NULL DEFAULT NULL,
  `dateDeModification` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`, `idrang`),
  INDEX `fk_Utilisateur_rang1_idx` (`idrang` ASC),
  CONSTRAINT `fk_Utilisateur_rang1`
    FOREIGN KEY (`idrang`)
    REFERENCES `mydb`.`rang` (`idrang`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 46
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`utilisateur_has_offre`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`utilisateur_has_offre` (
  `idUtilisateur` INT(11) NOT NULL,
  `idOffre` INT(11) NOT NULL,
  PRIMARY KEY (`idUtilisateur`, `idOffre`),
  INDEX `fk_Utilisateur_has_Offre_Offre1_idx` (`idOffre` ASC),
  INDEX `fk_Utilisateur_has_Offre_Utilisateur1_idx` (`idUtilisateur` ASC),
  CONSTRAINT `fk_Utilisateur_has_Offre_Offre1`
    FOREIGN KEY (`idOffre`)
    REFERENCES `mydb`.`offre` (`idOffre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Utilisateur_has_Offre_Utilisateur1`
    FOREIGN KEY (`idUtilisateur`)
    REFERENCES `mydb`.`utilisateur` (`idUtilisateur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`niveau`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`niveau` (
  `idUtilisateur` INT(11) NOT NULL,
  `idOffre` INT(11) NOT NULL,
  `idcompetence` INT(11) NOT NULL,
  `niveau` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idUtilisateur`, `idOffre`, `idcompetence`),
  INDEX `fk_table1_tag1_idx` (`idcompetence` ASC),
  CONSTRAINT `fk_table1_tag1`
    FOREIGN KEY (`idcompetence`)
    REFERENCES `mydb`.`competence` (`idcompetence`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_utilisateur_has_offre1`
    FOREIGN KEY (`idUtilisateur` , `idOffre`)
    REFERENCES `mydb`.`utilisateur_has_offre` (`idUtilisateur` , `idOffre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`offre_has_competence`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`offre_has_competence` (
  `idOffre` INT(11) NOT NULL,
  `idcompetence` INT(11) NOT NULL,
  PRIMARY KEY (`idOffre`, `idcompetence`),
  INDEX `fk_offre_has_competence_competence1_idx` (`idcompetence` ASC),
  INDEX `fk_offre_has_competence_offre1_idx` (`idOffre` ASC),
  CONSTRAINT `fk_offre_has_competence_competence1`
    FOREIGN KEY (`idcompetence`)
    REFERENCES `mydb`.`competence` (`idcompetence`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_offre_has_competence_offre1`
    FOREIGN KEY (`idOffre`)
    REFERENCES `mydb`.`offre` (`idOffre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
