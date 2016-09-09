------------------------- versao 1.0 -----------------------

CREATE DATABASE "biotecmar"
  WITH ENCODING='UTF8'
       CONNECTION LIMIT=-1;


CREATE SCHEMA biotecmar;

CREATE TABLE biotecmar.ator
(
   id serial NOT NULL, 
   email character varying NOT NULL, 
   senha character varying NOT NULL, 
   nome character varying NOT NULL, 
   perfil character varying NOT NULL, 
   CONSTRAINT pk_ator PRIMARY KEY (id), 
   CONSTRAINT ak_ator_email UNIQUE (email)
) 
WITH (
  OIDS = FALSE
)
;

INSERT INTO biotecmar.ator(
             email, senha, nome, perfil)
    VALUES ('admin', '202cb962ac59075b964b07152d234b70', 'Admin','AD');


CREATE TABLE biotecmar.configuracao
(
  nom_configuracao character varying(100),
  valor_configuracao character varying(200),
  CONSTRAINT unique_nom_configuracao UNIQUE (nom_configuracao)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE biotecmar.configuracao
  OWNER TO postgres;


  
  
INSERT INTO biotecmar.configuracao(
            nom_configuracao, valor_configuracao)
    VALUES ('gerenciador', '1.0');
    
    
 

