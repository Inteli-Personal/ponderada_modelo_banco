-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'usuários'
-- 
-- ---

DROP TABLE IF EXISTS `usuários`;
		
CREATE TABLE `usuários` (
  `id` INTEGER NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `senha` VARCHAR(12) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'feed'
-- 
-- ---

DROP TABLE IF EXISTS `feed`;
		
CREATE TABLE `feed` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_usuarios` INTEGER NOT NULL,
  `texto_do_post` VARCHAR(250) NULL DEFAULT NULL,
  `data` DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'usuarios-e-publico-alvo'
-- 
-- ---

DROP TABLE IF EXISTS `usuarios-e-publico-alvo`;
		
CREATE TABLE `usuarios-e-publico-alvo` (
  `id_usuarios` INTEGER NOT NULL,
  `id_publico_alvo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY ()
);

-- ---
-- Table 'publico_alvo'
-- 
-- ---

DROP TABLE IF EXISTS `publico_alvo`;
		
CREATE TABLE `publico_alvo` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `publico_alvo` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Table 'feed_e_publico_alvo'
-- 
-- ---

DROP TABLE IF EXISTS `feed_e_publico_alvo`;
		
CREATE TABLE `feed_e_publico_alvo` (
  `id` INTEGER NULL AUTO_INCREMENT DEFAULT NULL,
  `id_feed` INTEGER NULL DEFAULT NULL,
  `id_publico_alvo` INTEGER NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `feed` ADD FOREIGN KEY (id_usuarios) REFERENCES `usuários` (`id`);
ALTER TABLE `usuarios-e-publico-alvo` ADD FOREIGN KEY (id_usuarios) REFERENCES `usuários` (`id`);
ALTER TABLE `usuarios-e-publico-alvo` ADD FOREIGN KEY (id_publico_alvo) REFERENCES `publico_alvo` (`id`);
ALTER TABLE `feed_e_publico_alvo` ADD FOREIGN KEY (id_feed) REFERENCES `feed` (`id`);
ALTER TABLE `feed_e_publico_alvo` ADD FOREIGN KEY (id_publico_alvo) REFERENCES `publico_alvo` (`id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `usuários` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `feed` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `usuarios-e-publico-alvo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `publico_alvo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `feed_e_publico_alvo` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `usuários` (`id`,`nome`,`email`,`senha`) VALUES
-- ('','','','');
-- INSERT INTO `feed` (`id`,`id_usuarios`,`texto_do_post`,`data`) VALUES
-- ('','','','');
-- INSERT INTO `usuarios-e-publico-alvo` (`id_usuarios`,`id_publico_alvo`) VALUES
-- ('','');
-- INSERT INTO `publico_alvo` (`id`,`publico_alvo`) VALUES
-- ('','');
-- INSERT INTO `feed_e_publico_alvo` (`id`,`id_feed`,`id_publico_alvo`) VALUES
-- ('','','');