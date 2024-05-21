DATABASE PARA @Sebastián Jaramillo 
CREATE TABLE item (
    SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE TABLE IF NOT EXISTS vapor.juegos (
  id_juegos INT(11) NOT NULL,
  titulo VARCHAR(45) NULL DEFAULT NULL,
  etiquetas VARCHAR(45) NULL DEFAULT NULL,
  usuario_id_usuario INT(11) NOT NULL,
  usuario_biblioteca_idbiblioteca INT(11) NOT NULL,
  PRIMARY KEY (id_juegos, usuario_id_usuario, usuario_biblioteca_idbiblioteca),
  INDEX fk_juegos_usuario1_idx (usuario_id_usuario ASC, usuario_biblioteca_idbiblioteca ASC) ,
  CONSTRAINT fk_juegos_usuario1
    FOREIGN KEY (usuario_id_usuario , usuario_biblioteca_idbiblioteca)
    REFERENCES vapor.usuario (id_usuario , biblioteca_idbiblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vapor.usuario (
  id_usuario INT(11) NOT NULL,
  nickname VARCHAR(45) NULL DEFAULT NULL,
  pais VARCHAR(45) NULL DEFAULT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  biblioteca VARCHAR(45) NULL DEFAULT NULL,
  biblioteca_idbiblioteca INT(11) NOT NULL,
  roles_id_roles INT(11) NOT NULL,
  biblioteca_id_biblioteca INT(11) NOT NULL,
  biblioteca_juegos_id_juegos INT(11) NOT NULL,
  biblioteca_juegos_usuario_id_usuario INT(11) NOT NULL,
  biblioteca_juegos_usuario_biblioteca_idbiblioteca INT(11) NOT NULL,
  PRIMARY KEY (id_usuario, biblioteca_idbiblioteca, roles_id_roles, biblioteca_id_biblioteca, biblioteca_juegos_id_juegos, biblioteca_juegos_usuario_id_usuario, biblioteca_juegos_usuario_biblioteca_idbiblioteca),
  INDEX fk_usuario_roles1_idx (roles_id_roles ASC) ,
  INDEX fk_usuario_biblioteca1_idx (biblioteca_id_biblioteca ASC, biblioteca_juegos_id_juegos ASC, biblioteca_juegos_usuario_id_usuario ASC, biblioteca_juegos_usuario_biblioteca_idbiblioteca ASC) ,
  CONSTRAINT fk_usuario_roles1
    FOREIGN KEY (roles_id_roles)
    REFERENCES vapor.roles (id_roles)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_usuario_biblioteca1
    FOREIGN KEY (biblioteca_id_biblioteca , biblioteca_juegos_id_juegos , biblioteca_juegos_usuario_id_usuario , biblioteca_juegos_usuario_biblioteca_idbiblioteca)
    REFERENCES vapor.biblioteca (id_biblioteca , juegos_id_juegos , juegos_usuario_id_usuario , juegos_usuario_biblioteca_idbiblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vapor.tienda (
  id_tienda INT(11) NOT NULL,
  carrito_juegos VARCHAR(45) NULL DEFAULT NULL,
  favoritos VARCHAR(45) NULL DEFAULT NULL,
  metodo_pago VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (id_tienda))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vapor.roles (
  id_roles INT(11) NOT NULL,
  nombre VARCHAR(45) NULL DEFAULT NULL,
  descripcion VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (id_roles))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vapor.biblioteca (
  id_biblioteca INT(11) NOT NULL,
  juegos_id_juegos INT(11) NOT NULL,
  juegos_usuario_id_usuario INT(11) NOT NULL,
  juegos_usuario_biblioteca_idbiblioteca INT(11) NOT NULL,
  PRIMARY KEY (id_biblioteca, juegos_id_juegos, juegos_usuario_id_usuario, juegos_usuario_biblioteca_idbiblioteca),
  INDEX fk_biblioteca_juegos1_idx (juegos_id_juegos ASC, juegos_usuario_id_usuario ASC, juegos_usuario_biblioteca_idbiblioteca ASC) ,
  CONSTRAINT fk_biblioteca_juegos1
    FOREIGN KEY (juegos_id_juegos , juegos_usuario_id_usuario , juegos_usuario_biblioteca_idbiblioteca)
    REFERENCES vapor.juegos (id_juegos , usuario_id_usuario , usuario_biblioteca_idbiblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vapor.categoria (
  id_categoria INT(11) NOT NULL,
  nombre_categoria VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (id_categoria))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS vapor.juegos_has_categoria (
  juegos_id_juegos INT(11) NOT NULL,
  juegos_usuario_id_usuario INT(11) NOT NULL,
  juegos_usuario_biblioteca_idbiblioteca INT(11) NOT NULL,
  categoria_id_categoria INT(11) NOT NULL,
  PRIMARY KEY (juegos_id_juegos, juegos_usuario_id_usuario, juegos_usuario_biblioteca_idbiblioteca, categoria_id_categoria),
  INDEX fk_juegos_has_categoria_categoria1_idx (categoria_id_categoria ASC) ,
  INDEX fk_juegos_has_categoria_juegos1_idx (juegos_id_juegos ASC, juegos_usuario_id_usuario ASC, juegos_usuario_biblioteca_idbiblioteca ASC) ,
  CONSTRAINT fk_juegos_has_categoria_juegos1
    FOREIGN KEY (juegos_id_juegos , juegos_usuario_id_usuario , juegos_usuario_biblioteca_idbiblioteca)
    REFERENCES vapor.juegos (id_juegos , usuario_id_usuario , usuario_biblioteca_idbiblioteca)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_juegos_has_categoria_categoria1
    FOREIGN KEY (categoria_id_categoria)
    REFERENCES vapor.categoria (id_categoria)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
);