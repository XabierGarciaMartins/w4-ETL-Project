-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema champions_league
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema champions_league
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `champions_league` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `champions_league` ;

-- -----------------------------------------------------
-- Table `champions_league`.`estadisticas_equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `champions_league`.`estadisticas_equipos` (
  `Equipo` TEXT NOT NULL,
  `Pais` TEXT NULL DEFAULT NULL,
  `Goles` TEXT NULL DEFAULT NULL,
  `Pie_derecho` TEXT NULL DEFAULT NULL,
  `Pie_izquierdo` TEXT NULL DEFAULT NULL,
  `Goles_cabeza` TEXT NULL DEFAULT NULL,
  `Otros` TEXT NULL DEFAULT NULL,
  `Goles_dentro_area` TEXT NULL DEFAULT NULL,
  `Goles_fuera_area` TEXT NULL DEFAULT NULL,
  `Penalties` TEXT NULL DEFAULT NULL,
  `Partidos_jugados` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `champions_league`.`valores_equipos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `champions_league`.`valores_equipos` (
  `Equipo` TEXT NOT NULL,
  `Plantilla` BIGINT NULL DEFAULT NULL,
  `Edad_media` TEXT NULL DEFAULT NULL,
  `Valor_equipo` DOUBLE NULL DEFAULT NULL,
  `Valor_medio_jugadores` DOUBLE NULL DEFAULT NULL,
  `Continua` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`Equipo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `champions_league`.`fase_grupos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `champions_league`.`fase_grupos` (
  `Equipo` TEXT NOT NULL,
  `Grupo` TEXT NULL DEFAULT NULL,
  `Jugados` DOUBLE NULL DEFAULT NULL,
  `Ganados` DOUBLE NULL DEFAULT NULL,
  `Empates` DOUBLE NULL DEFAULT NULL,
  `Perdidos` DOUBLE NULL DEFAULT NULL,
  `Goles_favor` DOUBLE NULL DEFAULT NULL,
  `Goles_contra` DOUBLE NULL DEFAULT NULL,
  `Diferencia` DOUBLE NULL DEFAULT NULL,
  `Puntos` DOUBLE NULL DEFAULT NULL,
  `valores_equipos_Equipo` TEXT NOT NULL,
  `estadisticas_equipos_Equipo` TEXT NOT NULL,
  PRIMARY KEY (`Equipo`),
  INDEX `fk_fase_grupos_valores_equipos_idx` (`valores_equipos_Equipo` ASC) VISIBLE,
  INDEX `fk_fase_grupos_estadisticas_equipos1_idx` (`estadisticas_equipos_Equipo` ASC) VISIBLE,
  CONSTRAINT `fk_fase_grupos_valores_equipos`
    FOREIGN KEY (`valores_equipos_Equipo`)
    REFERENCES `champions_league`.`valores_equipos` (`Equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fase_grupos_estadisticas_equipos1`
    FOREIGN KEY (`estadisticas_equipos_Equipo`)
    REFERENCES `champions_league`.`estadisticas_equipos` (`Equipo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
