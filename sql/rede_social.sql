-- Criar o banco de dados
CREATE DATABASE rede_social;

-- Criar as tabelas
-- Tabela `nome`
CREATE TABLE rede_social.nome (
    id INT NOT NULL AUTO_INCREMENT,
    primeiro_nome VARCHAR(25) NOT NULL,
    sobrenome VARCHAR(40) NOT NULL,
    CONSTRAINT pk_nome PRIMARY KEY (id)
);

-- Tabela `usuario`
CREATE TABLE rede_social.usuario (
    id INT NOT NULL AUTO_INCREMENT,
    id_nome INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    genero CHAR(1) NOT NULL,
    apelido VARCHAR(30),
    CONSTRAINT pk_usuario PRIMARY KEY (id),
    CONSTRAINT fk_nome_usuario FOREIGN KEY (id_nome) REFERENCES rede_social.nome (id),
    CONSTRAINT uc_email UNIQUE(email)
);

-- Tabela `telefone`
CREATE TABLE rede_social.telefone (
    id INT NOT NULL AUTO_INCREMENT,
    numero VARCHAR(11) NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT pk_telefone PRIMARY KEY (id),
    CONSTRAINT fk_usuario_telefone FOREIGN KEY (id_usuario) REFERENCES rede_social.usuario (id)
);

-- Tabela `pagina`
CREATE TABLE rede_social.pagina (
    url_pagina VARCHAR(100) NOT NULL,
    nome VARCHAR(80) NOT NULL,
    descricao VARCHAR(2500) NOT NULL,
    data_criacao DATETIME NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    num_seguidores INT,
    CONSTRAINT pk_pagina PRIMARY KEY (url_pagina)
);

-- Tabela `postagem`
CREATE TABLE rede_social.postagem (
    id INT NOT NULL AUTO_INCREMENT,
    titulo VARCHAR(250),
    data_hora DATETIME NOT NULL,
    localizacao VARCHAR(40),
    num_curtidas INT,
    id_usuario INT NOT NULL,
    url_pagina VARCHAR(100) NOT NULL,
    CONSTRAINT pk_postagem PRIMARY KEY (id),
    CONSTRAINT fk_usuario_postagem FOREIGN KEY (id_usuario) REFERENCES rede_social.usuario (id),
    CONSTRAINT fk_pagina_postagem FOREIGN KEY (url_pagina) REFERENCES rede_social.pagina (url_pagina)
);

-- Tabela `mensagem_post`
CREATE TABLE rede_social.mensagem_post (
    id INT NOT NULL AUTO_INCREMENT,
    descricao VARCHAR(300) NOT NULL,
    titulo_mensagem VARCHAR(30) NOT NULL,
    CONSTRAINT pk_mensagem_post PRIMARY KEY (id)
);

-- Tabela `comentario`
CREATE TABLE rede_social.comentario (
    id INT NOT NULL AUTO_INCREMENT,
    id_mensagem INT NOT NULL,
    id_postagem INT NOT NULL,
    CONSTRAINT pk_comentario PRIMARY KEY (id),
    CONSTRAINT fk_mensagem_comentario FOREIGN KEY (id_mensagem) REFERENCES rede_social.mensagem_post (id),
    CONSTRAINT fk_postagem_comentario FOREIGN KEY (id_postagem) REFERENCES rede_social.postagem (id)
);

-- Tabela `seguidor`
CREATE TABLE rede_social.seguidor (
    id_usuario INT NOT NULL,
    url_pagina VARCHAR(100) NOT NULL,
    CONSTRAINT pk_seguidor PRIMARY KEY (id_usuario, url_pagina),
    CONSTRAINT fk_usuario_seguidor FOREIGN KEY (id_usuario) REFERENCES rede_social.usuario (id),
    CONSTRAINT fk_pagina_seguidor FOREIGN KEY (url_pagina) REFERENCES rede_social.pagina (url_pagina)
);

-- Tabela `curtida`
CREATE TABLE rede_social.curtida (
    id_usuario INT NOT NULL,
    id_postagem INT NOT NULL,
    data_hora DATETIME NOT NULL,
    CONSTRAINT pk_curtida PRIMARY KEY (id_usuario, id_postagem),
    CONSTRAINT fk_usuario_curtida FOREIGN KEY (id_usuario) REFERENCES rede_social.usuario (id),
    CONSTRAINT fk_postagem_curtida FOREIGN KEY (id_postagem) REFERENCES rede_social.postagem (id)
);

-- Tabela `administrador`
CREATE TABLE rede_social.administrador (
    id_usuario INT NOT NULL,
    data_admissao DATETIME NOT NULL,
    CONSTRAINT pk_administrador PRIMARY KEY (id_usuario),
    CONSTRAINT fk_usuario_administrador FOREIGN KEY (id_usuario) REFERENCES rede_social.usuario (id)
);

-- Tabela `gerencia`
CREATE TABLE rede_social.gerencia (
    id_administrador INT NOT NULL,
    url_pagina VARCHAR(100) NOT NULL,
    CONSTRAINT pk_gerencia PRIMARY KEY (id_administrador, url_pagina),
    CONSTRAINT fk_administrador_gerencia FOREIGN KEY (id_administrador) REFERENCES rede_social.administrador (id_usuario),
    CONSTRAINT fk_pagina_gerencia FOREIGN KEY (url_pagina) REFERENCES rede_social.pagina (url_pagina)
);

-- Tabela `cargo`
CREATE TABLE rede_social.cargo (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(2500) NOT NULL,
    CONSTRAINT pk_cargo PRIMARY KEY (id)
);

-- Tabela `permissao`
CREATE TABLE rede_social.permissao (
    id_administrador INT NOT NULL,
    id_cargo INT NOT NULL,
    CONSTRAINT pk_permissao PRIMARY KEY (id_administrador, id_cargo),
    CONSTRAINT fk_administrador_permissao FOREIGN KEY (id_administrador) REFERENCES rede_social.administrador (id_usuario),
    CONSTRAINT fk_cargo_permissao FOREIGN KEY (id_cargo) REFERENCES rede_social.cargo (id)
);

-- Tabela `pedido_amizade`
CREATE TABLE rede_social.pedido_amizade (
    foi_aceito BOOLEAN NOT NULL DEFAULT 0,
    id_usuario_solicitante INT NOT NULL,
    id_usuario_solicitado INT NOT NULL,
    CONSTRAINT pk_pedido_amizade PRIMARY KEY (id_usuario_solicitante, id_usuario_solicitado),
    CONSTRAINT fk_usuario_solicitante_pedido_amizade FOREIGN KEY (id_usuario_solicitante) REFERENCES rede_social.usuario (id),
    CONSTRAINT fk_usuario_solicitado_pedido_amizade FOREIGN KEY (id_usuario_solicitado) REFERENCES rede_social.usuario (id)
);