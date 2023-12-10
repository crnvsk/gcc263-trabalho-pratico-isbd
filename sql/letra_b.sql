-- Adiciona uma nova coluna chamada status à tabela Usuario.
ALTER TABLE `mydb`.`Usuario`
ADD COLUMN `status` VARCHAR(10) DEFAULT 'Ativo' AFTER `telefone`;

-- Modifica o tamanho da coluna descricao_cargo na tabela Cargo para suportar descrições mais longas.
ALTER TABLE `mydb`.`Cargo`
MODIFY COLUMN `descricao_cargo` VARCHAR(150);

-- Renomeia a coluna nome_pagina para titulo_pagina na tabela Pagina.
ALTER TABLE `mydb`.`Pagina`
CHANGE COLUMN `nome_pagina` `titulo_pagina` VARCHAR(100);

-- Remove a tabela chamada TabelaExtra se ela existir.
DROP TABLE IF EXISTS `mydb`.`TabelaExtra`;

-- Cria uma nova tabela chamada NovaTabela.
CREATE TABLE IF NOT EXISTS `mydb`.`NovaTabela` (
  `id` INT(10) NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB;

-- Remove a tabela NovaTabela no final do script.
DROP TABLE IF EXISTS `mydb`.`NovaTabela`;

-- Muda o nome da coluna para o nome original
ALTER TABLE `mydb`.`Pagina`
CHANGE COLUMN `titulo_pagina` `nome_pagina` VARCHAR(100);
