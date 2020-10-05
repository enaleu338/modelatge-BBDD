-- -----------------------------------------------------
-- Schema CulAmpolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CulAmpolla` ;

USE `CulAmpolla` ;

-- -----------------------------------------------------
-- Table `CulAmpolla`.`Proveidor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla`.`Proveidor` (
  `idProvider` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `street` VARCHAR(75) NULL,
  `number` INT NULL,
  `letter` VARCHAR(1) NULL,
  `floor` INT NULL,
  `zipCode` INT NULL,
  `door` INT NULL,
  `country` VARCHAR(45) NULL,
  `phone` INT NULL,
  `fax` INT NULL,
  `nif` VARCHAR(9) NULL,
  PRIMARY KEY (`idProvider`),
  UNIQUE INDEX `idProvider_UNIQUE` (`idProvider` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla`.`Ulleres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla`.`Ulleres` (
  `idGlasses` INT NOT NULL,
  `brand` VARCHAR(45) NULL,
  `graduation` DECIMAL(4,2) NULL,
  `mountType` VARCHAR(45) NULL,
  `glassColor` VARCHAR(20) NULL,
  `price` DECIMAL(6,2) NULL,
  `providerId` INT NOT NULL,
  PRIMARY KEY (`idGlasses`),
  INDEX `fk_Ulleres_Proveidor1_idx` (`providerId` ASC) VISIBLE,
  CONSTRAINT `fk_Ulleres_Proveidor1`
    FOREIGN KEY (`providerId`)
    REFERENCES `CulAmpolla`.`Proveidor` (`idProvider`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla`.`Empleat` (
  `idStaffMember` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `surname` VARCHAR(45) NULL,
  PRIMARY KEY (`idStaffMember`),
  UNIQUE INDEX `idStaffMember_UNIQUE` (`idStaffMember` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CulAmpolla`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CulAmpolla`.`Client` (
  `idCustomer` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `zipCode` INT NULL,
  `phone` INT NULL,
  `email` VARCHAR(45) NULL,
  `regDate` DATE NULL,
  `recommendedBy` INT NULL,
  `soldBy` INT NULL,
  `glassesId` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_Client_Empleat_idx` (`soldBy` ASC) VISIBLE,
  INDEX `fk_Client_Ulleres1_idx` (`glassesId` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Empleat`
    FOREIGN KEY (`soldBy`)
    REFERENCES `CulAmpolla`.`Empleat` (`idStaffMember`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Client_Ulleres1`
    FOREIGN KEY (`glassesId`)
    REFERENCES `CulAmpolla`.`Ulleres` (`idGlasses`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
