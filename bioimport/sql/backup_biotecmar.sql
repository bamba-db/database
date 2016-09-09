--
-- PostgreSQL database dump
--

-- Dumped from database version 9.2.8
-- Dumped by pg_dump version 9.5.0

-- Started on 2016-09-08 22:10:52

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 6 (class 2615 OID 107145)
-- Name: bio; Type: SCHEMA; Schema: -; Owner: biotecmar
--

CREATE SCHEMA bio;


ALTER SCHEMA bio OWNER TO biotecmar;

--
-- TOC entry 7 (class 2615 OID 74378)
-- Name: biotecmar; Type: SCHEMA; Schema: -; Owner: biotecmar
--

CREATE SCHEMA biotecmar;


ALTER SCHEMA biotecmar OWNER TO biotecmar;

SET search_path = bio, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 178 (class 1259 OID 107202)
-- Name: amostra; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE amostra (
    id_amostra bigint NOT NULL,
    id_usuario bigint NOT NULL,
    dt_inclusao date NOT NULL,
    dt_amostra date NOT NULL,
    latitude numeric NOT NULL,
    longitude numeric NOT NULL,
    profundidade numeric
);


ALTER TABLE amostra OWNER TO biotecmar;

--
-- TOC entry 2292 (class 0 OID 0)
-- Dependencies: 178
-- Name: TABLE amostra; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE amostra IS 'Tabela responsável por armazenar a amostra, que por sua vez possui uma lista de análises.';


--
-- TOC entry 179 (class 1259 OID 107210)
-- Name: analise; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE analise (
    id_analise bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_amostra bigint NOT NULL,
    dt_analise date NOT NULL
);


ALTER TABLE analise OWNER TO biotecmar;

--
-- TOC entry 2293 (class 0 OID 0)
-- Dependencies: 179
-- Name: TABLE analise; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE analise IS 'Tabela responsável por armazenar a Análise como um todo. Nesta tabela registra-se vários dados de análise de um ser vivo.';


--
-- TOC entry 181 (class 1259 OID 107223)
-- Name: analise_bio; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE analise_bio (
    id_analise_bio bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_taxon bigint NOT NULL,
    id_analise bigint NOT NULL,
    dt_inclusao date NOT NULL
);


ALTER TABLE analise_bio OWNER TO biotecmar;

--
-- TOC entry 2294 (class 0 OID 0)
-- Dependencies: 181
-- Name: TABLE analise_bio; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE analise_bio IS 'Tabela responsável por armazenar a análise da parte biológica do ser vivo.
A partir desta tabela é possível acessar os dados de taxonomia da análise e também de dados gerais.';


--
-- TOC entry 171 (class 1259 OID 107146)
-- Name: configuracao; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE configuracao (
    nom_configuracao character varying NOT NULL,
    valor character varying NOT NULL
);


ALTER TABLE configuracao OWNER TO biotecmar;

--
-- TOC entry 180 (class 1259 OID 107215)
-- Name: dados_gerais; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE dados_gerais (
    id_dados_gerais bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_analise bigint NOT NULL,
    id_descritor_unidade bigint NOT NULL,
    valor character varying NOT NULL,
    dt_inclusao date NOT NULL
);


ALTER TABLE dados_gerais OWNER TO biotecmar;

--
-- TOC entry 2295 (class 0 OID 0)
-- Dependencies: 180
-- Name: TABLE dados_gerais; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE dados_gerais IS 'Tabela responsável por armazenar os valores de dados gerais relacionados à Análise Biológica do ser vivo.
Neste caso esta tabela irá representar qualquer valor que não for registrado na taxonomia.';


--
-- TOC entry 173 (class 1259 OID 107162)
-- Name: dados_taxon; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE dados_taxon (
    taxonkey bigint NOT NULL,
    kingdom character varying NOT NULL,
    phylum character varying NOT NULL,
    class character varying NOT NULL,
    ord character varying NOT NULL,
    family character varying NOT NULL,
    genus character varying NOT NULL,
    species character varying NOT NULL,
    infraspecificepithet character varying NOT NULL,
    taxonrank character varying NOT NULL,
    scientifcname character varying NOT NULL
);


ALTER TABLE dados_taxon OWNER TO biotecmar;

--
-- TOC entry 174 (class 1259 OID 107170)
-- Name: descritor; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE descritor (
    id_descritor bigint NOT NULL,
    id_usuario bigint NOT NULL,
    dsc_descritor character varying NOT NULL,
    tipo_descritor character varying NOT NULL,
    dt_inclusao date NOT NULL
);


ALTER TABLE descritor OWNER TO biotecmar;

--
-- TOC entry 2296 (class 0 OID 0)
-- Dependencies: 174
-- Name: TABLE descritor; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE descritor IS 'Tabela responsável a descrição / tipo dos dados possíveis para se armazenar.
Ex: latitude, longitude, profundidade e etc.';


--
-- TOC entry 176 (class 1259 OID 107186)
-- Name: descritor_unidade; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE descritor_unidade (
    id_descritor_unidade bigint NOT NULL,
    id_usuario bigint NOT NULL,
    id_descritor bigint NOT NULL,
    id_unidade_medida bigint NOT NULL,
    dt_inclusao date NOT NULL,
    valor character varying NOT NULL
);


ALTER TABLE descritor_unidade OWNER TO biotecmar;

--
-- TOC entry 2297 (class 0 OID 0)
-- Dependencies: 176
-- Name: TABLE descritor_unidade; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE descritor_unidade IS 'Tabela responsável por agrupar os dados do Descritor com a unidade de medida respectiva.
Informação importante para indicar qual o tipo de dados está sendo gravado na tabela DADOS_GERAIS';


--
-- TOC entry 182 (class 1259 OID 107439)
-- Name: seq_amostra; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_amostra
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_amostra OWNER TO biotecmar;

--
-- TOC entry 183 (class 1259 OID 107441)
-- Name: seq_analise; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_analise
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_analise OWNER TO biotecmar;

--
-- TOC entry 184 (class 1259 OID 107443)
-- Name: seq_analise_bio; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_analise_bio
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_analise_bio OWNER TO biotecmar;

--
-- TOC entry 185 (class 1259 OID 107445)
-- Name: seq_dados_gerais; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_dados_gerais
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_dados_gerais OWNER TO biotecmar;

--
-- TOC entry 186 (class 1259 OID 107447)
-- Name: seq_dados_taxon; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_dados_taxon
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_dados_taxon OWNER TO biotecmar;

--
-- TOC entry 187 (class 1259 OID 107449)
-- Name: seq_descritor; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_descritor
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_descritor OWNER TO biotecmar;

--
-- TOC entry 188 (class 1259 OID 107452)
-- Name: seq_descritor_unidade; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_descritor_unidade
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_descritor_unidade OWNER TO biotecmar;

--
-- TOC entry 189 (class 1259 OID 107454)
-- Name: seq_taxon; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_taxon
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_taxon OWNER TO biotecmar;

--
-- TOC entry 190 (class 1259 OID 107456)
-- Name: seq_unidade_medida; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_unidade_medida
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_unidade_medida OWNER TO biotecmar;

--
-- TOC entry 191 (class 1259 OID 107458)
-- Name: seq_usuario; Type: SEQUENCE; Schema: bio; Owner: biotecmar
--

CREATE SEQUENCE seq_usuario
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seq_usuario OWNER TO biotecmar;

--
-- TOC entry 177 (class 1259 OID 107194)
-- Name: taxon; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE taxon (
    id_taxon bigint NOT NULL,
    id_usuario bigint NOT NULL,
    taxonkey bigint NOT NULL,
    nome character varying
);


ALTER TABLE taxon OWNER TO biotecmar;

--
-- TOC entry 2298 (class 0 OID 0)
-- Dependencies: 177
-- Name: TABLE taxon; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE taxon IS 'Descreve cada dado taxonômico baseado no gbif';


--
-- TOC entry 175 (class 1259 OID 107178)
-- Name: unidade_medida; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE unidade_medida (
    id_unidade_medida bigint NOT NULL,
    id_usuario bigint NOT NULL,
    dsc_unidade_medida character varying NOT NULL,
    dt_inclusao date NOT NULL
);


ALTER TABLE unidade_medida OWNER TO biotecmar;

--
-- TOC entry 2299 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE unidade_medida; Type: COMMENT; Schema: bio; Owner: biotecmar
--

COMMENT ON TABLE unidade_medida IS 'Tabela que armazena as unidades de medidas possíveis.
Ex: metros, centímetros e etc.';


--
-- TOC entry 172 (class 1259 OID 107154)
-- Name: usuario; Type: TABLE; Schema: bio; Owner: biotecmar
--

CREATE TABLE usuario (
    id_usuario bigint NOT NULL,
    login character varying NOT NULL,
    nome character varying NOT NULL,
    senha character varying NOT NULL,
    perfil character varying(10)
);


ALTER TABLE usuario OWNER TO biotecmar;

SET search_path = biotecmar, pg_catalog;

--
-- TOC entry 192 (class 1259 OID 187147)
-- Name: abiotic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE abiotic_analysis (
    id integer NOT NULL,
    ammonia_um numeric(19,2),
    doc_um numeric(19,2),
    nitrate_um numeric(19,2),
    nitrite_um numeric(19,2),
    organic_nitrogen_um numeric(19,2),
    organic_phosphorous_um numeric(19,2),
    ortho_phosphate_um numeric(19,2),
    salinity_s numeric(19,2),
    silicate_um numeric(19,2),
    temperature_c numeric(19,2),
    id_sample bigint
);


ALTER TABLE abiotic_analysis OWNER TO biotecmar;

--
-- TOC entry 193 (class 1259 OID 187152)
-- Name: area; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE area (
    id integer NOT NULL,
    name character varying(255),
    nw_latitude numeric(19,2),
    nw_longitude numeric(19,2),
    se_latitude numeric(19,2),
    se_longitude numeric(19,2)
);


ALTER TABLE area OWNER TO biotecmar;

--
-- TOC entry 194 (class 1259 OID 187157)
-- Name: ator; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE ator (
    id bigint NOT NULL,
    login character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE ator OWNER TO biotecmar;

--
-- TOC entry 195 (class 1259 OID 187165)
-- Name: benthic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE benthic_analysis (
    id integer NOT NULL,
    relative_abundance numeric(19,2),
    taxon character varying(255),
    id_sample bigint
);


ALTER TABLE benthic_analysis OWNER TO biotecmar;

--
-- TOC entry 196 (class 1259 OID 187170)
-- Name: biotic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE biotic_analysis (
    id integer NOT NULL,
    bacterial_count_cellml numeric(19,2),
    chlorophyll_a_ugl numeric(19,2),
    pheophytin_ugl numeric(19,2),
    id_sample bigint
);


ALTER TABLE biotic_analysis OWNER TO biotecmar;

--
-- TOC entry 170 (class 1259 OID 74392)
-- Name: configuracao; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE configuracao (
    nom_configuracao character varying(100),
    valor_configuracao character varying(200)
);


ALTER TABLE configuracao OWNER TO biotecmar;

--
-- TOC entry 198 (class 1259 OID 187177)
-- Name: contact; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE contact (
    id_contato bigint NOT NULL,
    city character varying(255),
    country character varying(255),
    created timestamp without time zone,
    createdby character varying(255),
    description character varying(255),
    firstname character varying(255),
    key_ integer,
    lastname character varying(255),
    modified timestamp without time zone,
    modifiedby character varying(255),
    organization character varying(255),
    postalcode character varying(255),
    primary_ boolean,
    province character varying(255),
    type_ character varying(255),
    id_dataset bigint
);


ALTER TABLE contact OWNER TO biotecmar;

--
-- TOC entry 197 (class 1259 OID 187175)
-- Name: contact_id_contato_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE contact_id_contato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE contact_id_contato_seq OWNER TO biotecmar;

--
-- TOC entry 2300 (class 0 OID 0)
-- Dependencies: 197
-- Name: contact_id_contato_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE contact_id_contato_seq OWNED BY contact.id_contato;


--
-- TOC entry 199 (class 1259 OID 187186)
-- Name: dataset; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE dataset (
    id_dataset bigint NOT NULL,
    abbreviation text,
    additionalinfo text,
    alias character varying(255),
    created timestamp without time zone,
    create_by character varying(255),
    data_alt timestamp without time zone,
    deleted timestamp without time zone,
    descricao character varying(255),
    description text,
    duplicate_of_dataset_key character varying(255),
    external_ boolean,
    geographic_coverage_desc text,
    homepage character varying(255),
    installation_key character varying(255),
    language_ character varying(255),
    modified timestamp without time zone,
    modified_by character varying(255),
    num_constituents integer,
    parent_dataset_key character varying(255),
    project character varying(255),
    pub_date timestamp without time zone,
    publishing_organization_key character varying(255),
    purpose text,
    rights character varying(255),
    sub_type character varying(255),
    title character varying(255),
    type_ character varying(255),
    uuid character varying(255)
);


ALTER TABLE dataset OWNER TO biotecmar;

--
-- TOC entry 201 (class 1259 OID 187196)
-- Name: email; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE email (
    id_email bigint NOT NULL,
    email character varying(255),
    id_contato bigint
);


ALTER TABLE email OWNER TO biotecmar;

--
-- TOC entry 200 (class 1259 OID 187194)
-- Name: email_id_email_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE email_id_email_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE email_id_email_seq OWNER TO biotecmar;

--
-- TOC entry 2301 (class 0 OID 0)
-- Dependencies: 200
-- Name: email_id_email_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE email_id_email_seq OWNED BY email.id_email;


--
-- TOC entry 203 (class 1259 OID 187204)
-- Name: endereco; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE endereco (
    id_endereco bigint NOT NULL,
    endereco character varying(255),
    id_contato bigint
);


ALTER TABLE endereco OWNER TO biotecmar;

--
-- TOC entry 202 (class 1259 OID 187202)
-- Name: endereco_id_endereco_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE endereco_id_endereco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE endereco_id_endereco_seq OWNER TO biotecmar;

--
-- TOC entry 2302 (class 0 OID 0)
-- Dependencies: 202
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE endereco_id_endereco_seq OWNED BY endereco.id_endereco;


--
-- TOC entry 223 (class 1259 OID 187304)
-- Name: evento; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE evento (
    id_evento bigint NOT NULL,
    coord_uncertainty_meters integer,
    country_code text,
    decimal_latitude numeric(19,2),
    decimal_longitude numeric(19,2),
    event_date timestamp without time zone,
    event_id character varying(255),
    foot_print_wkt text,
    geodetic_datum text,
    habitat character varying(255),
    sample_size_unit character varying(255),
    sample_size_value character varying(255),
    sampling_protocol text
);


ALTER TABLE evento OWNER TO biotecmar;

--
-- TOC entry 222 (class 1259 OID 187302)
-- Name: evento_id_evento_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE evento_id_evento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE evento_id_evento_seq OWNER TO biotecmar;

--
-- TOC entry 2303 (class 0 OID 0)
-- Dependencies: 222
-- Name: evento_id_evento_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE evento_id_evento_seq OWNED BY evento.id_evento;


--
-- TOC entry 204 (class 1259 OID 187210)
-- Name: fish_assembly_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE fish_assembly_analysis (
    id integer NOT NULL,
    abundance numeric(19,2),
    id_evento bigint,
    id_sample bigint,
    id_taxon bigint
);


ALTER TABLE fish_assembly_analysis OWNER TO biotecmar;

--
-- TOC entry 224 (class 1259 OID 187413)
-- Name: fish_assembly_analysis_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE fish_assembly_analysis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE fish_assembly_analysis_id_seq OWNER TO biotecmar;

--
-- TOC entry 206 (class 1259 OID 187217)
-- Name: geospatial_coverage; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE geospatial_coverage (
    id_geospatial_coverage bigint NOT NULL,
    global_coverage boolean,
    max_latitude double precision,
    max_longitude double precision,
    min_latitude double precision,
    min_longitude double precision,
    id_dataset bigint
);


ALTER TABLE geospatial_coverage OWNER TO biotecmar;

--
-- TOC entry 205 (class 1259 OID 187215)
-- Name: geospatial_coverage_id_geospatial_coverage_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE geospatial_coverage_id_geospatial_coverage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE geospatial_coverage_id_geospatial_coverage_seq OWNER TO biotecmar;

--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 205
-- Name: geospatial_coverage_id_geospatial_coverage_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE geospatial_coverage_id_geospatial_coverage_seq OWNED BY geospatial_coverage.id_geospatial_coverage;


--
-- TOC entry 225 (class 1259 OID 187415)
-- Name: id_dataset_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE id_dataset_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE id_dataset_seq OWNER TO biotecmar;

--
-- TOC entry 207 (class 1259 OID 187223)
-- Name: metagenome_functional_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE metagenome_functional_analysis (
    function character varying(255) NOT NULL,
    id integer NOT NULL,
    reference_db_id character varying(255) NOT NULL,
    id_meta_analysis integer
);


ALTER TABLE metagenome_functional_analysis OWNER TO biotecmar;

--
-- TOC entry 208 (class 1259 OID 187231)
-- Name: metagenome_taxonomic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE metagenome_taxonomic_analysis (
    id integer NOT NULL,
    taxon character varying(255) NOT NULL,
    abundance numeric(19,2),
    id_meta_analysis integer
);


ALTER TABLE metagenome_taxonomic_analysis OWNER TO biotecmar;

--
-- TOC entry 209 (class 1259 OID 187236)
-- Name: metagenomic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE metagenomic_analysis (
    id integer NOT NULL,
    external_id character varying(255),
    fasta_file_url character varying(255),
    id_sample bigint
);


ALTER TABLE metagenomic_analysis OWNER TO biotecmar;

--
-- TOC entry 211 (class 1259 OID 187246)
-- Name: pagina_contato; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE pagina_contato (
    id_pagina_contato bigint NOT NULL,
    id_contato bigint,
    pagina character varying(255)
);


ALTER TABLE pagina_contato OWNER TO biotecmar;

--
-- TOC entry 210 (class 1259 OID 187244)
-- Name: pagina_contato_id_pagina_contato_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE pagina_contato_id_pagina_contato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pagina_contato_id_pagina_contato_seq OWNER TO biotecmar;

--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 210
-- Name: pagina_contato_id_pagina_contato_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE pagina_contato_id_pagina_contato_seq OWNED BY pagina_contato.id_pagina_contato;


--
-- TOC entry 213 (class 1259 OID 187254)
-- Name: posicao_contato; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE posicao_contato (
    id_posicao_contato bigint NOT NULL,
    id_contato bigint,
    posicao character varying(255)
);


ALTER TABLE posicao_contato OWNER TO biotecmar;

--
-- TOC entry 212 (class 1259 OID 187252)
-- Name: posicao_contato_id_posicao_contato_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE posicao_contato_id_posicao_contato_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE posicao_contato_id_posicao_contato_seq OWNER TO biotecmar;

--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 212
-- Name: posicao_contato_id_posicao_contato_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE posicao_contato_id_posicao_contato_seq OWNED BY posicao_contato.id_posicao_contato;


--
-- TOC entry 214 (class 1259 OID 187260)
-- Name: reference_db; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE reference_db (
    id character varying(255) NOT NULL
);


ALTER TABLE reference_db OWNER TO biotecmar;

--
-- TOC entry 215 (class 1259 OID 187265)
-- Name: sample; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE sample (
    id bigint NOT NULL,
    depth numeric(19,2),
    dt date,
    environment character varying(255),
    latitude numeric(19,2),
    longitude numeric(19,2),
    name character varying(255),
    id_dataset bigint,
    type character varying(255)
);


ALTER TABLE sample OWNER TO biotecmar;

--
-- TOC entry 226 (class 1259 OID 187417)
-- Name: sample_id_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sample_id_seq OWNER TO biotecmar;

--
-- TOC entry 216 (class 1259 OID 187273)
-- Name: sample_type; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE sample_type (
    type character varying(255) NOT NULL
);


ALTER TABLE sample_type OWNER TO biotecmar;

--
-- TOC entry 217 (class 1259 OID 187278)
-- Name: taxon; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE taxon (
    id_taxon bigint NOT NULL,
    class character varying(255),
    family character varying(255),
    genus character varying(255),
    infraspecificepithet character varying(255),
    kingdom character varying(255),
    ord character varying(255),
    phylum character varying(255),
    scientificname character varying(255),
    species character varying(255),
    taxonkey character varying(255),
    taxonrank character varying(255)
);


ALTER TABLE taxon OWNER TO biotecmar;

--
-- TOC entry 227 (class 1259 OID 187419)
-- Name: taxon_id_taxon_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE taxon_id_taxon_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE taxon_id_taxon_seq OWNER TO biotecmar;

--
-- TOC entry 219 (class 1259 OID 187288)
-- Name: telefone; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE telefone (
    id_telefone bigint NOT NULL,
    id_contato bigint,
    telefone character varying(255)
);


ALTER TABLE telefone OWNER TO biotecmar;

--
-- TOC entry 218 (class 1259 OID 187286)
-- Name: telefone_id_telefone_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE telefone_id_telefone_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE telefone_id_telefone_seq OWNER TO biotecmar;

--
-- TOC entry 2307 (class 0 OID 0)
-- Dependencies: 218
-- Name: telefone_id_telefone_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE telefone_id_telefone_seq OWNED BY telefone.id_telefone;


--
-- TOC entry 221 (class 1259 OID 187296)
-- Name: temporal_coverage; Type: TABLE; Schema: biotecmar; Owner: biotecmar
--

CREATE TABLE temporal_coverage (
    id_temporal_coverage bigint NOT NULL,
    temporal_format character varying(255),
    id_dataset bigint
);


ALTER TABLE temporal_coverage OWNER TO biotecmar;

--
-- TOC entry 220 (class 1259 OID 187294)
-- Name: temporal_coverage_id_temporal_coverage_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE temporal_coverage_id_temporal_coverage_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE temporal_coverage_id_temporal_coverage_seq OWNER TO biotecmar;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 220
-- Name: temporal_coverage_id_temporal_coverage_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE temporal_coverage_id_temporal_coverage_seq OWNED BY temporal_coverage.id_temporal_coverage;


--
-- TOC entry 2009 (class 2604 OID 187180)
-- Name: id_contato; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY contact ALTER COLUMN id_contato SET DEFAULT nextval('contact_id_contato_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 187199)
-- Name: id_email; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY email ALTER COLUMN id_email SET DEFAULT nextval('email_id_email_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 187207)
-- Name: id_endereco; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY endereco ALTER COLUMN id_endereco SET DEFAULT nextval('endereco_id_endereco_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 187307)
-- Name: id_evento; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY evento ALTER COLUMN id_evento SET DEFAULT nextval('evento_id_evento_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 187220)
-- Name: id_geospatial_coverage; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY geospatial_coverage ALTER COLUMN id_geospatial_coverage SET DEFAULT nextval('geospatial_coverage_id_geospatial_coverage_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 187249)
-- Name: id_pagina_contato; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY pagina_contato ALTER COLUMN id_pagina_contato SET DEFAULT nextval('pagina_contato_id_pagina_contato_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 187257)
-- Name: id_posicao_contato; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY posicao_contato ALTER COLUMN id_posicao_contato SET DEFAULT nextval('posicao_contato_id_posicao_contato_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 187291)
-- Name: id_telefone; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY telefone ALTER COLUMN id_telefone SET DEFAULT nextval('telefone_id_telefone_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 187299)
-- Name: id_temporal_coverage; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY temporal_coverage ALTER COLUMN id_temporal_coverage SET DEFAULT nextval('temporal_coverage_id_temporal_coverage_seq'::regclass);


SET search_path = bio, pg_catalog;

--
-- TOC entry 2238 (class 0 OID 107202)
-- Dependencies: 178
-- Data for Name: amostra; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--

INSERT INTO amostra VALUES (233, 1, '2016-02-16', '2015-11-04', -20.13152, -37.49183, 71.0);
INSERT INTO amostra VALUES (234, 1, '2016-02-16', '2015-11-04', -20.80583, -37.76123, 77.5);
INSERT INTO amostra VALUES (235, 1, '2016-02-16', '2015-11-04', -20.76584, -31.83651, 84.0);
INSERT INTO amostra VALUES (236, 1, '2016-02-16', '2015-11-04', -20.52542, -29.31035, 42.5);
INSERT INTO amostra VALUES (237, 1, '2016-02-16', '2015-11-04', -20.57672, -34.80645, 37.0);
INSERT INTO amostra VALUES (238, 1, '2016-02-16', '2015-11-04', -21.00496, -34.11486, 85.0);
INSERT INTO amostra VALUES (239, 1, '2016-02-16', '2015-11-04', -19.84874, -38.13464, NULL);
INSERT INTO amostra VALUES (240, 1, '2016-02-16', '2015-11-04', -20.48813, -28.84407, 15.0);
INSERT INTO amostra VALUES (241, 1, '2016-02-16', '2015-11-04', -20.41495, -36.4185, 37.0);
INSERT INTO amostra VALUES (242, 1, '2016-02-16', '2015-11-04', -20.41495, -36.4185, NULL);
INSERT INTO amostra VALUES (243, 1, '2016-02-16', '2015-11-04', -22.38222, -37.5875, 66.0);
INSERT INTO amostra VALUES (244, 1, '2016-02-16', '2015-11-04', -20.38903, -36.68958, 62.0);
INSERT INTO amostra VALUES (253, 1, '2016-02-17', '2015-11-04', -20.13152, -37.49183, 71.0);
INSERT INTO amostra VALUES (254, 1, '2016-02-17', '2015-11-04', -20.80583, -37.76123, 77.5);
INSERT INTO amostra VALUES (255, 1, '2016-02-17', '2015-11-04', -20.76584, -31.83651, 84.0);
INSERT INTO amostra VALUES (256, 1, '2016-02-17', '2015-11-04', -20.52542, -29.31035, 42.5);
INSERT INTO amostra VALUES (257, 1, '2016-02-17', '2015-11-04', -20.57672, -34.80645, 37.0);
INSERT INTO amostra VALUES (258, 1, '2016-02-17', '2015-11-04', -21.00496, -34.11486, 85.0);
INSERT INTO amostra VALUES (259, 1, '2016-02-17', '2015-11-04', -19.84874, -38.13464, NULL);
INSERT INTO amostra VALUES (260, 1, '2016-02-17', '2015-11-04', -20.48813, -28.84407, 15.0);
INSERT INTO amostra VALUES (261, 1, '2016-02-17', '2015-11-04', -20.41495, -36.4185, 37.0);
INSERT INTO amostra VALUES (262, 1, '2016-02-17', '2015-11-04', -20.41495, -36.4185, NULL);
INSERT INTO amostra VALUES (263, 1, '2016-02-17', '2015-11-04', -22.38222, -37.5875, 66.0);
INSERT INTO amostra VALUES (264, 1, '2016-02-17', '2015-11-04', -20.38903, -36.68958, 62.0);


--
-- TOC entry 2239 (class 0 OID 107210)
-- Dependencies: 179
-- Data for Name: analise; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--

INSERT INTO analise VALUES (6451, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6452, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6453, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6454, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6455, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6456, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6457, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6458, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6459, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6460, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6461, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6462, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6463, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6464, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6465, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6466, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6467, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6468, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6469, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6470, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6471, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6472, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6473, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6474, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6475, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6476, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6477, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6478, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6479, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6480, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6481, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6482, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6483, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6484, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6485, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6486, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6487, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6488, 1, 233, '2016-02-16');
INSERT INTO analise VALUES (6489, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6490, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6491, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6492, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6493, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6494, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6495, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6496, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6497, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6498, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6499, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6500, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6501, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6502, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6503, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6504, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6505, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6506, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6507, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6508, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6509, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6510, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6511, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6512, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6513, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6514, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6515, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6516, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6517, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6518, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6519, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6520, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6521, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6522, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6523, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6524, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6525, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6526, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6527, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6528, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6529, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6530, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6531, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6532, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6533, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6534, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6535, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6536, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6537, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6538, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6539, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6540, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6541, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6542, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6543, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6544, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6545, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6546, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6547, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6548, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6549, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6550, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6551, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6552, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6553, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6554, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6555, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6556, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6557, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6558, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6559, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6560, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6561, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6562, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6563, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6564, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6565, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6566, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6567, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6568, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6569, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6570, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6571, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6572, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6573, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6574, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6575, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6576, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6577, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6578, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6579, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6580, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6581, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6582, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6583, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6584, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6585, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6586, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6587, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6588, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6589, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6590, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6591, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6592, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6593, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6594, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6595, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6596, 1, 234, '2016-02-16');
INSERT INTO analise VALUES (6597, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6598, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6599, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6600, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6601, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6602, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6603, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6604, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6605, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6606, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6607, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6608, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6609, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6610, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6611, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6612, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6613, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6614, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6615, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6616, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6617, 1, 235, '2016-02-16');
INSERT INTO analise VALUES (6618, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6619, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6620, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6621, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6622, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6623, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6624, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6625, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6626, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6627, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6628, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6629, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6630, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6631, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6632, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6633, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6634, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6635, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6636, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6637, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6638, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6639, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6640, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6641, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6642, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6643, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6644, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6645, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6646, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6647, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6648, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6649, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6650, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6651, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6652, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6653, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6654, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6655, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6656, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6657, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6658, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6659, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6660, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6661, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6662, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6663, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6664, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6665, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6666, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6667, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6668, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6669, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6670, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6671, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6672, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6673, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6674, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6675, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6676, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6677, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6678, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6679, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6680, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6681, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6682, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6683, 1, 236, '2016-02-16');
INSERT INTO analise VALUES (6684, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6685, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6686, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6687, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6688, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6689, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6690, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6691, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6692, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6693, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6694, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6695, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6696, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6697, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6698, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6699, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6700, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6701, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6702, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6703, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6704, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6705, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6706, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6707, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6708, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6709, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6710, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6711, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6712, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6713, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6714, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6715, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6716, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6717, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6718, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6719, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6720, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6721, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6722, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6723, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6724, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6725, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6726, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6727, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6728, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6729, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6730, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6731, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6732, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6733, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6734, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6735, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6736, 1, 237, '2016-02-16');
INSERT INTO analise VALUES (6737, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6738, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6739, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6740, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6741, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6742, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6743, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6744, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6745, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6746, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6747, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6748, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6749, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6750, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6751, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6752, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6753, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6754, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6755, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6756, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6757, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6758, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6759, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6760, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6761, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6762, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6763, 1, 238, '2016-02-16');
INSERT INTO analise VALUES (6764, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6765, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6766, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6767, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6768, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6769, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6770, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6771, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6772, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6773, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6774, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6775, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6776, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6777, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6778, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6779, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6780, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6781, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6782, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6783, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6784, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6785, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6786, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6787, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6788, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6789, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6790, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6791, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6792, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6793, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6794, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6795, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6796, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6797, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6798, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6799, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6800, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6801, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6802, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6803, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6804, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6805, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6806, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6807, 1, 239, '2016-02-16');
INSERT INTO analise VALUES (6808, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6809, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6810, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6811, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6812, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6813, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6814, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6815, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6816, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6817, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6818, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6819, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6820, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6821, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6822, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6823, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6824, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6825, 1, 240, '2016-02-16');
INSERT INTO analise VALUES (6826, 1, 241, '2016-02-16');
INSERT INTO analise VALUES (6827, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6828, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6829, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6830, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6831, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6832, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6833, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6834, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6835, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6836, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6837, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6838, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6839, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6840, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6841, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6842, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6843, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6844, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6845, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6846, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6847, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6848, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6849, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6850, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6851, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6852, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6853, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6854, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6855, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6856, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6857, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6858, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6859, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6860, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6861, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6862, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6863, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6864, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6865, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6866, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6867, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6868, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6869, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6870, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6871, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6872, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6873, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6874, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6875, 1, 242, '2016-02-16');
INSERT INTO analise VALUES (6876, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6877, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6878, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6879, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6880, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6881, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6882, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6883, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6884, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6885, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6886, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6887, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6888, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6889, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6890, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6891, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6892, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6893, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6894, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6895, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6896, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6897, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6898, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6899, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6900, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6901, 1, 243, '2016-02-16');
INSERT INTO analise VALUES (6902, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6903, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6904, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6905, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6906, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6907, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6908, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6909, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6910, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6911, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6912, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6913, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6914, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6915, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6916, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6917, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6918, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6919, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6920, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6921, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6922, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6923, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6924, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6925, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6926, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6927, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6928, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6929, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6930, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6931, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6932, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6933, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6934, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6935, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6936, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6937, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6938, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6939, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6940, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6941, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6942, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6943, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6944, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6945, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6946, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6947, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6948, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6949, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6950, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6951, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6952, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6953, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6954, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6955, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6956, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6957, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6958, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6959, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6960, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6961, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6962, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6963, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6964, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6965, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6966, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6967, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6968, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6969, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6970, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6971, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6972, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6973, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6974, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6975, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6976, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6977, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6978, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6979, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6980, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (6981, 1, 244, '2016-02-16');
INSERT INTO analise VALUES (7138, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7139, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7140, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7141, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7142, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7143, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7144, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7145, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7146, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7147, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7148, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7149, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7150, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7151, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7152, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7153, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7154, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7155, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7156, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7157, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7158, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7159, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7160, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7161, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7162, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7163, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7164, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7165, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7166, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7167, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7168, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7169, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7170, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7171, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7172, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7173, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7174, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7175, 1, 253, '2016-02-17');
INSERT INTO analise VALUES (7176, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7177, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7178, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7179, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7180, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7181, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7182, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7183, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7184, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7185, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7186, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7187, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7188, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7189, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7190, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7191, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7192, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7193, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7194, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7195, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7196, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7197, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7198, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7199, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7200, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7201, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7202, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7203, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7204, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7205, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7206, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7207, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7208, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7209, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7210, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7211, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7212, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7213, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7214, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7215, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7216, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7217, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7218, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7219, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7220, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7221, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7222, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7223, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7224, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7225, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7226, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7227, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7228, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7229, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7230, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7231, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7232, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7233, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7234, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7235, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7236, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7237, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7238, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7239, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7240, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7241, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7242, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7243, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7244, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7245, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7246, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7247, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7248, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7249, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7250, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7251, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7252, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7253, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7254, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7255, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7256, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7257, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7258, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7259, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7260, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7261, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7262, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7263, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7264, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7265, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7266, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7267, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7268, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7269, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7270, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7271, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7272, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7273, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7274, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7275, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7276, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7277, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7278, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7279, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7280, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7281, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7282, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7283, 1, 254, '2016-02-17');
INSERT INTO analise VALUES (7284, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7285, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7286, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7287, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7288, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7289, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7290, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7291, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7292, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7293, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7294, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7295, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7296, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7297, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7298, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7299, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7300, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7301, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7302, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7303, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7304, 1, 255, '2016-02-17');
INSERT INTO analise VALUES (7305, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7306, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7307, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7308, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7309, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7310, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7311, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7312, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7313, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7314, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7315, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7316, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7317, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7318, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7319, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7320, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7321, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7322, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7323, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7324, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7325, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7326, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7327, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7328, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7329, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7330, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7331, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7332, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7333, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7334, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7335, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7336, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7337, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7338, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7339, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7340, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7341, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7342, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7343, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7344, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7345, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7346, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7347, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7348, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7349, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7350, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7351, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7352, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7353, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7354, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7355, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7356, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7357, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7358, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7359, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7360, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7361, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7362, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7363, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7364, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7365, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7366, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7367, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7368, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7369, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7370, 1, 256, '2016-02-17');
INSERT INTO analise VALUES (7371, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7372, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7373, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7374, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7375, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7376, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7377, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7378, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7379, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7380, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7381, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7382, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7383, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7384, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7385, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7386, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7387, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7388, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7389, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7390, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7391, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7392, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7393, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7394, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7395, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7396, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7397, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7398, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7399, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7400, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7401, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7402, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7403, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7404, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7405, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7406, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7407, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7408, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7409, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7410, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7411, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7412, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7413, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7414, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7415, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7416, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7417, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7418, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7419, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7420, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7421, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7422, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7423, 1, 257, '2016-02-17');
INSERT INTO analise VALUES (7424, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7425, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7426, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7427, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7428, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7429, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7430, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7431, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7432, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7433, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7434, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7435, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7436, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7437, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7438, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7439, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7440, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7441, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7442, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7443, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7444, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7445, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7446, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7447, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7448, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7449, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7450, 1, 258, '2016-02-17');
INSERT INTO analise VALUES (7451, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7452, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7453, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7454, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7455, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7456, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7457, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7458, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7459, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7460, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7461, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7462, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7463, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7464, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7465, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7466, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7467, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7468, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7469, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7470, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7471, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7472, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7473, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7474, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7475, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7476, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7477, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7478, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7479, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7480, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7481, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7482, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7483, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7484, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7485, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7486, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7487, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7488, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7489, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7490, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7491, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7492, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7493, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7494, 1, 259, '2016-02-17');
INSERT INTO analise VALUES (7495, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7496, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7497, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7498, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7499, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7500, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7501, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7502, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7503, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7504, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7505, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7506, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7507, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7508, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7509, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7510, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7511, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7512, 1, 260, '2016-02-17');
INSERT INTO analise VALUES (7513, 1, 261, '2016-02-17');
INSERT INTO analise VALUES (7514, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7515, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7516, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7517, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7518, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7519, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7520, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7521, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7522, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7523, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7524, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7525, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7526, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7527, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7528, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7529, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7530, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7531, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7532, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7533, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7534, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7535, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7536, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7537, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7538, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7539, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7540, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7541, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7542, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7543, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7544, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7545, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7546, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7547, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7548, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7549, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7550, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7551, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7552, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7553, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7554, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7555, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7556, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7557, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7558, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7559, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7560, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7561, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7562, 1, 262, '2016-02-17');
INSERT INTO analise VALUES (7563, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7564, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7565, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7566, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7567, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7568, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7569, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7570, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7571, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7572, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7573, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7574, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7575, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7576, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7577, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7578, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7579, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7580, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7581, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7582, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7583, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7584, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7585, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7586, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7587, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7588, 1, 263, '2016-02-17');
INSERT INTO analise VALUES (7589, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7590, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7591, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7592, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7593, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7594, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7595, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7596, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7597, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7598, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7599, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7600, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7601, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7602, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7603, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7604, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7605, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7606, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7607, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7608, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7609, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7610, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7611, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7612, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7613, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7614, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7615, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7616, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7617, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7618, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7619, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7620, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7621, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7622, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7623, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7624, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7625, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7626, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7627, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7628, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7629, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7630, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7631, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7632, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7633, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7634, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7635, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7636, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7637, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7638, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7639, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7640, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7641, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7642, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7643, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7644, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7645, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7646, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7647, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7648, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7649, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7650, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7651, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7652, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7653, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7654, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7655, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7656, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7657, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7658, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7659, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7660, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7661, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7662, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7663, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7664, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7665, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7666, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7667, 1, 264, '2016-02-17');
INSERT INTO analise VALUES (7668, 1, 264, '2016-02-17');


--
-- TOC entry 2241 (class 0 OID 107223)
-- Dependencies: 181
-- Data for Name: analise_bio; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--

INSERT INTO analise_bio VALUES (6451, 1, 5921, 6451, '2016-02-16');
INSERT INTO analise_bio VALUES (6452, 1, 5922, 6452, '2016-02-16');
INSERT INTO analise_bio VALUES (6453, 1, 5923, 6453, '2016-02-16');
INSERT INTO analise_bio VALUES (6454, 1, 5924, 6454, '2016-02-16');
INSERT INTO analise_bio VALUES (6455, 1, 5925, 6455, '2016-02-16');
INSERT INTO analise_bio VALUES (6456, 1, 5926, 6456, '2016-02-16');
INSERT INTO analise_bio VALUES (6457, 1, 5927, 6457, '2016-02-16');
INSERT INTO analise_bio VALUES (6458, 1, 5928, 6458, '2016-02-16');
INSERT INTO analise_bio VALUES (6459, 1, 5929, 6459, '2016-02-16');
INSERT INTO analise_bio VALUES (6460, 1, 5930, 6460, '2016-02-16');
INSERT INTO analise_bio VALUES (6461, 1, 5931, 6461, '2016-02-16');
INSERT INTO analise_bio VALUES (6462, 1, 5932, 6462, '2016-02-16');
INSERT INTO analise_bio VALUES (6463, 1, 5933, 6463, '2016-02-16');
INSERT INTO analise_bio VALUES (6464, 1, 5934, 6464, '2016-02-16');
INSERT INTO analise_bio VALUES (6465, 1, 5935, 6465, '2016-02-16');
INSERT INTO analise_bio VALUES (6466, 1, 5936, 6466, '2016-02-16');
INSERT INTO analise_bio VALUES (6467, 1, 5937, 6467, '2016-02-16');
INSERT INTO analise_bio VALUES (6468, 1, 5938, 6468, '2016-02-16');
INSERT INTO analise_bio VALUES (6469, 1, 5939, 6469, '2016-02-16');
INSERT INTO analise_bio VALUES (6470, 1, 5940, 6470, '2016-02-16');
INSERT INTO analise_bio VALUES (6471, 1, 5941, 6471, '2016-02-16');
INSERT INTO analise_bio VALUES (6472, 1, 5942, 6472, '2016-02-16');
INSERT INTO analise_bio VALUES (6473, 1, 5943, 6473, '2016-02-16');
INSERT INTO analise_bio VALUES (6474, 1, 5944, 6474, '2016-02-16');
INSERT INTO analise_bio VALUES (6475, 1, 5945, 6475, '2016-02-16');
INSERT INTO analise_bio VALUES (6476, 1, 5946, 6476, '2016-02-16');
INSERT INTO analise_bio VALUES (6477, 1, 5947, 6477, '2016-02-16');
INSERT INTO analise_bio VALUES (6478, 1, 5948, 6478, '2016-02-16');
INSERT INTO analise_bio VALUES (6479, 1, 5949, 6479, '2016-02-16');
INSERT INTO analise_bio VALUES (6480, 1, 5950, 6480, '2016-02-16');
INSERT INTO analise_bio VALUES (6481, 1, 5951, 6481, '2016-02-16');
INSERT INTO analise_bio VALUES (6482, 1, 5952, 6482, '2016-02-16');
INSERT INTO analise_bio VALUES (6483, 1, 5953, 6483, '2016-02-16');
INSERT INTO analise_bio VALUES (6484, 1, 5954, 6484, '2016-02-16');
INSERT INTO analise_bio VALUES (6485, 1, 5955, 6485, '2016-02-16');
INSERT INTO analise_bio VALUES (6486, 1, 5956, 6486, '2016-02-16');
INSERT INTO analise_bio VALUES (6487, 1, 5957, 6487, '2016-02-16');
INSERT INTO analise_bio VALUES (6488, 1, 5958, 6488, '2016-02-16');
INSERT INTO analise_bio VALUES (6489, 1, 5959, 6489, '2016-02-16');
INSERT INTO analise_bio VALUES (6490, 1, 5960, 6490, '2016-02-16');
INSERT INTO analise_bio VALUES (6491, 1, 5961, 6491, '2016-02-16');
INSERT INTO analise_bio VALUES (6492, 1, 5962, 6492, '2016-02-16');
INSERT INTO analise_bio VALUES (6493, 1, 5963, 6493, '2016-02-16');
INSERT INTO analise_bio VALUES (6494, 1, 5964, 6494, '2016-02-16');
INSERT INTO analise_bio VALUES (6495, 1, 5965, 6495, '2016-02-16');
INSERT INTO analise_bio VALUES (6496, 1, 5966, 6496, '2016-02-16');
INSERT INTO analise_bio VALUES (6497, 1, 5967, 6497, '2016-02-16');
INSERT INTO analise_bio VALUES (6498, 1, 5968, 6498, '2016-02-16');
INSERT INTO analise_bio VALUES (6499, 1, 5969, 6499, '2016-02-16');
INSERT INTO analise_bio VALUES (6500, 1, 5970, 6500, '2016-02-16');
INSERT INTO analise_bio VALUES (6501, 1, 5971, 6501, '2016-02-16');
INSERT INTO analise_bio VALUES (6502, 1, 5972, 6502, '2016-02-16');
INSERT INTO analise_bio VALUES (6503, 1, 5973, 6503, '2016-02-16');
INSERT INTO analise_bio VALUES (6504, 1, 5974, 6504, '2016-02-16');
INSERT INTO analise_bio VALUES (6505, 1, 5975, 6505, '2016-02-16');
INSERT INTO analise_bio VALUES (6506, 1, 5976, 6506, '2016-02-16');
INSERT INTO analise_bio VALUES (6507, 1, 5977, 6507, '2016-02-16');
INSERT INTO analise_bio VALUES (6508, 1, 5978, 6508, '2016-02-16');
INSERT INTO analise_bio VALUES (6509, 1, 5979, 6509, '2016-02-16');
INSERT INTO analise_bio VALUES (6510, 1, 5980, 6510, '2016-02-16');
INSERT INTO analise_bio VALUES (6511, 1, 5981, 6511, '2016-02-16');
INSERT INTO analise_bio VALUES (6512, 1, 5982, 6512, '2016-02-16');
INSERT INTO analise_bio VALUES (6513, 1, 5983, 6513, '2016-02-16');
INSERT INTO analise_bio VALUES (6514, 1, 5984, 6514, '2016-02-16');
INSERT INTO analise_bio VALUES (6515, 1, 5985, 6515, '2016-02-16');
INSERT INTO analise_bio VALUES (6516, 1, 5986, 6516, '2016-02-16');
INSERT INTO analise_bio VALUES (6517, 1, 5987, 6517, '2016-02-16');
INSERT INTO analise_bio VALUES (6518, 1, 5988, 6518, '2016-02-16');
INSERT INTO analise_bio VALUES (6519, 1, 5989, 6519, '2016-02-16');
INSERT INTO analise_bio VALUES (6520, 1, 5990, 6520, '2016-02-16');
INSERT INTO analise_bio VALUES (6521, 1, 5991, 6521, '2016-02-16');
INSERT INTO analise_bio VALUES (6522, 1, 5992, 6522, '2016-02-16');
INSERT INTO analise_bio VALUES (6523, 1, 5993, 6523, '2016-02-16');
INSERT INTO analise_bio VALUES (6524, 1, 5994, 6524, '2016-02-16');
INSERT INTO analise_bio VALUES (6525, 1, 5995, 6525, '2016-02-16');
INSERT INTO analise_bio VALUES (6526, 1, 5996, 6526, '2016-02-16');
INSERT INTO analise_bio VALUES (6527, 1, 5997, 6527, '2016-02-16');
INSERT INTO analise_bio VALUES (6528, 1, 5998, 6528, '2016-02-16');
INSERT INTO analise_bio VALUES (6529, 1, 5999, 6529, '2016-02-16');
INSERT INTO analise_bio VALUES (6530, 1, 6000, 6530, '2016-02-16');
INSERT INTO analise_bio VALUES (6531, 1, 6001, 6531, '2016-02-16');
INSERT INTO analise_bio VALUES (6532, 1, 6002, 6532, '2016-02-16');
INSERT INTO analise_bio VALUES (6533, 1, 6003, 6533, '2016-02-16');
INSERT INTO analise_bio VALUES (6534, 1, 6004, 6534, '2016-02-16');
INSERT INTO analise_bio VALUES (6535, 1, 6005, 6535, '2016-02-16');
INSERT INTO analise_bio VALUES (6536, 1, 6006, 6536, '2016-02-16');
INSERT INTO analise_bio VALUES (6537, 1, 6007, 6537, '2016-02-16');
INSERT INTO analise_bio VALUES (6538, 1, 6008, 6538, '2016-02-16');
INSERT INTO analise_bio VALUES (6539, 1, 6009, 6539, '2016-02-16');
INSERT INTO analise_bio VALUES (6540, 1, 6010, 6540, '2016-02-16');
INSERT INTO analise_bio VALUES (6541, 1, 6011, 6541, '2016-02-16');
INSERT INTO analise_bio VALUES (6542, 1, 6012, 6542, '2016-02-16');
INSERT INTO analise_bio VALUES (6543, 1, 6013, 6543, '2016-02-16');
INSERT INTO analise_bio VALUES (6544, 1, 6014, 6544, '2016-02-16');
INSERT INTO analise_bio VALUES (6545, 1, 6015, 6545, '2016-02-16');
INSERT INTO analise_bio VALUES (6546, 1, 6016, 6546, '2016-02-16');
INSERT INTO analise_bio VALUES (6547, 1, 6017, 6547, '2016-02-16');
INSERT INTO analise_bio VALUES (6548, 1, 6018, 6548, '2016-02-16');
INSERT INTO analise_bio VALUES (6549, 1, 6019, 6549, '2016-02-16');
INSERT INTO analise_bio VALUES (6550, 1, 6020, 6550, '2016-02-16');
INSERT INTO analise_bio VALUES (6551, 1, 6021, 6551, '2016-02-16');
INSERT INTO analise_bio VALUES (6552, 1, 6022, 6552, '2016-02-16');
INSERT INTO analise_bio VALUES (6553, 1, 6023, 6553, '2016-02-16');
INSERT INTO analise_bio VALUES (6554, 1, 6024, 6554, '2016-02-16');
INSERT INTO analise_bio VALUES (6555, 1, 6025, 6555, '2016-02-16');
INSERT INTO analise_bio VALUES (6556, 1, 6026, 6556, '2016-02-16');
INSERT INTO analise_bio VALUES (6557, 1, 6027, 6557, '2016-02-16');
INSERT INTO analise_bio VALUES (6558, 1, 6028, 6558, '2016-02-16');
INSERT INTO analise_bio VALUES (6559, 1, 6029, 6559, '2016-02-16');
INSERT INTO analise_bio VALUES (6560, 1, 6030, 6560, '2016-02-16');
INSERT INTO analise_bio VALUES (6561, 1, 6031, 6561, '2016-02-16');
INSERT INTO analise_bio VALUES (6562, 1, 6032, 6562, '2016-02-16');
INSERT INTO analise_bio VALUES (6563, 1, 6033, 6563, '2016-02-16');
INSERT INTO analise_bio VALUES (6564, 1, 6034, 6564, '2016-02-16');
INSERT INTO analise_bio VALUES (6565, 1, 6035, 6565, '2016-02-16');
INSERT INTO analise_bio VALUES (6566, 1, 6036, 6566, '2016-02-16');
INSERT INTO analise_bio VALUES (6567, 1, 6037, 6567, '2016-02-16');
INSERT INTO analise_bio VALUES (6568, 1, 6038, 6568, '2016-02-16');
INSERT INTO analise_bio VALUES (6569, 1, 6039, 6569, '2016-02-16');
INSERT INTO analise_bio VALUES (6570, 1, 6040, 6570, '2016-02-16');
INSERT INTO analise_bio VALUES (6571, 1, 6041, 6571, '2016-02-16');
INSERT INTO analise_bio VALUES (6572, 1, 6042, 6572, '2016-02-16');
INSERT INTO analise_bio VALUES (6573, 1, 6043, 6573, '2016-02-16');
INSERT INTO analise_bio VALUES (6574, 1, 6044, 6574, '2016-02-16');
INSERT INTO analise_bio VALUES (6575, 1, 6045, 6575, '2016-02-16');
INSERT INTO analise_bio VALUES (6576, 1, 6046, 6576, '2016-02-16');
INSERT INTO analise_bio VALUES (6577, 1, 6047, 6577, '2016-02-16');
INSERT INTO analise_bio VALUES (6578, 1, 6048, 6578, '2016-02-16');
INSERT INTO analise_bio VALUES (6579, 1, 6049, 6579, '2016-02-16');
INSERT INTO analise_bio VALUES (6580, 1, 6050, 6580, '2016-02-16');
INSERT INTO analise_bio VALUES (6581, 1, 6051, 6581, '2016-02-16');
INSERT INTO analise_bio VALUES (6582, 1, 6052, 6582, '2016-02-16');
INSERT INTO analise_bio VALUES (6583, 1, 6053, 6583, '2016-02-16');
INSERT INTO analise_bio VALUES (6584, 1, 6054, 6584, '2016-02-16');
INSERT INTO analise_bio VALUES (6585, 1, 6055, 6585, '2016-02-16');
INSERT INTO analise_bio VALUES (6586, 1, 6056, 6586, '2016-02-16');
INSERT INTO analise_bio VALUES (6587, 1, 6057, 6587, '2016-02-16');
INSERT INTO analise_bio VALUES (6588, 1, 6058, 6588, '2016-02-16');
INSERT INTO analise_bio VALUES (6589, 1, 6059, 6589, '2016-02-16');
INSERT INTO analise_bio VALUES (6590, 1, 6060, 6590, '2016-02-16');
INSERT INTO analise_bio VALUES (6591, 1, 6061, 6591, '2016-02-16');
INSERT INTO analise_bio VALUES (6592, 1, 6062, 6592, '2016-02-16');
INSERT INTO analise_bio VALUES (6593, 1, 6063, 6593, '2016-02-16');
INSERT INTO analise_bio VALUES (6594, 1, 6064, 6594, '2016-02-16');
INSERT INTO analise_bio VALUES (6595, 1, 6065, 6595, '2016-02-16');
INSERT INTO analise_bio VALUES (6596, 1, 6066, 6596, '2016-02-16');
INSERT INTO analise_bio VALUES (6597, 1, 6067, 6597, '2016-02-16');
INSERT INTO analise_bio VALUES (6598, 1, 6068, 6598, '2016-02-16');
INSERT INTO analise_bio VALUES (6599, 1, 6069, 6599, '2016-02-16');
INSERT INTO analise_bio VALUES (6600, 1, 6070, 6600, '2016-02-16');
INSERT INTO analise_bio VALUES (6601, 1, 6071, 6601, '2016-02-16');
INSERT INTO analise_bio VALUES (6602, 1, 6072, 6602, '2016-02-16');
INSERT INTO analise_bio VALUES (6603, 1, 6073, 6603, '2016-02-16');
INSERT INTO analise_bio VALUES (6604, 1, 6074, 6604, '2016-02-16');
INSERT INTO analise_bio VALUES (6605, 1, 6075, 6605, '2016-02-16');
INSERT INTO analise_bio VALUES (6606, 1, 6076, 6606, '2016-02-16');
INSERT INTO analise_bio VALUES (6607, 1, 6077, 6607, '2016-02-16');
INSERT INTO analise_bio VALUES (6608, 1, 6078, 6608, '2016-02-16');
INSERT INTO analise_bio VALUES (6609, 1, 6079, 6609, '2016-02-16');
INSERT INTO analise_bio VALUES (6610, 1, 6080, 6610, '2016-02-16');
INSERT INTO analise_bio VALUES (6611, 1, 6081, 6611, '2016-02-16');
INSERT INTO analise_bio VALUES (6612, 1, 6082, 6612, '2016-02-16');
INSERT INTO analise_bio VALUES (6613, 1, 6083, 6613, '2016-02-16');
INSERT INTO analise_bio VALUES (6614, 1, 6084, 6614, '2016-02-16');
INSERT INTO analise_bio VALUES (6615, 1, 6085, 6615, '2016-02-16');
INSERT INTO analise_bio VALUES (6616, 1, 6086, 6616, '2016-02-16');
INSERT INTO analise_bio VALUES (6617, 1, 6087, 6617, '2016-02-16');
INSERT INTO analise_bio VALUES (6618, 1, 6088, 6618, '2016-02-16');
INSERT INTO analise_bio VALUES (6619, 1, 6089, 6619, '2016-02-16');
INSERT INTO analise_bio VALUES (6620, 1, 6090, 6620, '2016-02-16');
INSERT INTO analise_bio VALUES (6621, 1, 6091, 6621, '2016-02-16');
INSERT INTO analise_bio VALUES (6622, 1, 6092, 6622, '2016-02-16');
INSERT INTO analise_bio VALUES (6623, 1, 6093, 6623, '2016-02-16');
INSERT INTO analise_bio VALUES (6624, 1, 6094, 6624, '2016-02-16');
INSERT INTO analise_bio VALUES (6625, 1, 6095, 6625, '2016-02-16');
INSERT INTO analise_bio VALUES (6626, 1, 6096, 6626, '2016-02-16');
INSERT INTO analise_bio VALUES (6627, 1, 6097, 6627, '2016-02-16');
INSERT INTO analise_bio VALUES (6628, 1, 6098, 6628, '2016-02-16');
INSERT INTO analise_bio VALUES (6629, 1, 6099, 6629, '2016-02-16');
INSERT INTO analise_bio VALUES (6630, 1, 6100, 6630, '2016-02-16');
INSERT INTO analise_bio VALUES (6631, 1, 6101, 6631, '2016-02-16');
INSERT INTO analise_bio VALUES (6632, 1, 6102, 6632, '2016-02-16');
INSERT INTO analise_bio VALUES (6633, 1, 6103, 6633, '2016-02-16');
INSERT INTO analise_bio VALUES (6634, 1, 6104, 6634, '2016-02-16');
INSERT INTO analise_bio VALUES (6635, 1, 6105, 6635, '2016-02-16');
INSERT INTO analise_bio VALUES (6636, 1, 6106, 6636, '2016-02-16');
INSERT INTO analise_bio VALUES (6637, 1, 6107, 6637, '2016-02-16');
INSERT INTO analise_bio VALUES (6638, 1, 6108, 6638, '2016-02-16');
INSERT INTO analise_bio VALUES (6639, 1, 6109, 6639, '2016-02-16');
INSERT INTO analise_bio VALUES (6640, 1, 6110, 6640, '2016-02-16');
INSERT INTO analise_bio VALUES (6641, 1, 6111, 6641, '2016-02-16');
INSERT INTO analise_bio VALUES (6642, 1, 6112, 6642, '2016-02-16');
INSERT INTO analise_bio VALUES (6643, 1, 6113, 6643, '2016-02-16');
INSERT INTO analise_bio VALUES (6644, 1, 6114, 6644, '2016-02-16');
INSERT INTO analise_bio VALUES (6645, 1, 6115, 6645, '2016-02-16');
INSERT INTO analise_bio VALUES (6646, 1, 6116, 6646, '2016-02-16');
INSERT INTO analise_bio VALUES (6647, 1, 6117, 6647, '2016-02-16');
INSERT INTO analise_bio VALUES (6648, 1, 6118, 6648, '2016-02-16');
INSERT INTO analise_bio VALUES (6649, 1, 6119, 6649, '2016-02-16');
INSERT INTO analise_bio VALUES (6650, 1, 6120, 6650, '2016-02-16');
INSERT INTO analise_bio VALUES (6651, 1, 6121, 6651, '2016-02-16');
INSERT INTO analise_bio VALUES (6652, 1, 6122, 6652, '2016-02-16');
INSERT INTO analise_bio VALUES (6653, 1, 6123, 6653, '2016-02-16');
INSERT INTO analise_bio VALUES (6654, 1, 6124, 6654, '2016-02-16');
INSERT INTO analise_bio VALUES (6655, 1, 6125, 6655, '2016-02-16');
INSERT INTO analise_bio VALUES (6656, 1, 6126, 6656, '2016-02-16');
INSERT INTO analise_bio VALUES (6657, 1, 6127, 6657, '2016-02-16');
INSERT INTO analise_bio VALUES (6658, 1, 6128, 6658, '2016-02-16');
INSERT INTO analise_bio VALUES (6659, 1, 6129, 6659, '2016-02-16');
INSERT INTO analise_bio VALUES (6660, 1, 6130, 6660, '2016-02-16');
INSERT INTO analise_bio VALUES (6661, 1, 6131, 6661, '2016-02-16');
INSERT INTO analise_bio VALUES (6662, 1, 6132, 6662, '2016-02-16');
INSERT INTO analise_bio VALUES (6663, 1, 6133, 6663, '2016-02-16');
INSERT INTO analise_bio VALUES (6664, 1, 6134, 6664, '2016-02-16');
INSERT INTO analise_bio VALUES (6665, 1, 6135, 6665, '2016-02-16');
INSERT INTO analise_bio VALUES (6666, 1, 6136, 6666, '2016-02-16');
INSERT INTO analise_bio VALUES (6667, 1, 6137, 6667, '2016-02-16');
INSERT INTO analise_bio VALUES (6668, 1, 6138, 6668, '2016-02-16');
INSERT INTO analise_bio VALUES (6669, 1, 6139, 6669, '2016-02-16');
INSERT INTO analise_bio VALUES (6670, 1, 6140, 6670, '2016-02-16');
INSERT INTO analise_bio VALUES (6671, 1, 6141, 6671, '2016-02-16');
INSERT INTO analise_bio VALUES (6672, 1, 6142, 6672, '2016-02-16');
INSERT INTO analise_bio VALUES (6673, 1, 6143, 6673, '2016-02-16');
INSERT INTO analise_bio VALUES (6674, 1, 6144, 6674, '2016-02-16');
INSERT INTO analise_bio VALUES (6675, 1, 6145, 6675, '2016-02-16');
INSERT INTO analise_bio VALUES (6676, 1, 6146, 6676, '2016-02-16');
INSERT INTO analise_bio VALUES (6677, 1, 6147, 6677, '2016-02-16');
INSERT INTO analise_bio VALUES (6678, 1, 6148, 6678, '2016-02-16');
INSERT INTO analise_bio VALUES (6679, 1, 6149, 6679, '2016-02-16');
INSERT INTO analise_bio VALUES (6680, 1, 6150, 6680, '2016-02-16');
INSERT INTO analise_bio VALUES (6681, 1, 6151, 6681, '2016-02-16');
INSERT INTO analise_bio VALUES (6682, 1, 6152, 6682, '2016-02-16');
INSERT INTO analise_bio VALUES (6683, 1, 6153, 6683, '2016-02-16');
INSERT INTO analise_bio VALUES (6684, 1, 6154, 6684, '2016-02-16');
INSERT INTO analise_bio VALUES (6685, 1, 6155, 6685, '2016-02-16');
INSERT INTO analise_bio VALUES (6686, 1, 6156, 6686, '2016-02-16');
INSERT INTO analise_bio VALUES (6687, 1, 6157, 6687, '2016-02-16');
INSERT INTO analise_bio VALUES (6688, 1, 6158, 6688, '2016-02-16');
INSERT INTO analise_bio VALUES (6689, 1, 6159, 6689, '2016-02-16');
INSERT INTO analise_bio VALUES (6690, 1, 6160, 6690, '2016-02-16');
INSERT INTO analise_bio VALUES (6691, 1, 6161, 6691, '2016-02-16');
INSERT INTO analise_bio VALUES (6692, 1, 6162, 6692, '2016-02-16');
INSERT INTO analise_bio VALUES (6693, 1, 6163, 6693, '2016-02-16');
INSERT INTO analise_bio VALUES (6694, 1, 6164, 6694, '2016-02-16');
INSERT INTO analise_bio VALUES (6695, 1, 6165, 6695, '2016-02-16');
INSERT INTO analise_bio VALUES (6696, 1, 6166, 6696, '2016-02-16');
INSERT INTO analise_bio VALUES (6697, 1, 6167, 6697, '2016-02-16');
INSERT INTO analise_bio VALUES (6698, 1, 6168, 6698, '2016-02-16');
INSERT INTO analise_bio VALUES (6699, 1, 6169, 6699, '2016-02-16');
INSERT INTO analise_bio VALUES (6700, 1, 6170, 6700, '2016-02-16');
INSERT INTO analise_bio VALUES (6701, 1, 6171, 6701, '2016-02-16');
INSERT INTO analise_bio VALUES (6702, 1, 6172, 6702, '2016-02-16');
INSERT INTO analise_bio VALUES (6703, 1, 6173, 6703, '2016-02-16');
INSERT INTO analise_bio VALUES (6704, 1, 6174, 6704, '2016-02-16');
INSERT INTO analise_bio VALUES (6705, 1, 6175, 6705, '2016-02-16');
INSERT INTO analise_bio VALUES (6706, 1, 6176, 6706, '2016-02-16');
INSERT INTO analise_bio VALUES (6707, 1, 6177, 6707, '2016-02-16');
INSERT INTO analise_bio VALUES (6708, 1, 6178, 6708, '2016-02-16');
INSERT INTO analise_bio VALUES (6709, 1, 6179, 6709, '2016-02-16');
INSERT INTO analise_bio VALUES (6710, 1, 6180, 6710, '2016-02-16');
INSERT INTO analise_bio VALUES (6711, 1, 6181, 6711, '2016-02-16');
INSERT INTO analise_bio VALUES (6712, 1, 6182, 6712, '2016-02-16');
INSERT INTO analise_bio VALUES (6713, 1, 6183, 6713, '2016-02-16');
INSERT INTO analise_bio VALUES (6714, 1, 6184, 6714, '2016-02-16');
INSERT INTO analise_bio VALUES (6715, 1, 6185, 6715, '2016-02-16');
INSERT INTO analise_bio VALUES (6716, 1, 6186, 6716, '2016-02-16');
INSERT INTO analise_bio VALUES (6717, 1, 6187, 6717, '2016-02-16');
INSERT INTO analise_bio VALUES (6718, 1, 6188, 6718, '2016-02-16');
INSERT INTO analise_bio VALUES (6719, 1, 6189, 6719, '2016-02-16');
INSERT INTO analise_bio VALUES (6720, 1, 6190, 6720, '2016-02-16');
INSERT INTO analise_bio VALUES (6721, 1, 6191, 6721, '2016-02-16');
INSERT INTO analise_bio VALUES (6722, 1, 6192, 6722, '2016-02-16');
INSERT INTO analise_bio VALUES (6723, 1, 6193, 6723, '2016-02-16');
INSERT INTO analise_bio VALUES (6724, 1, 6194, 6724, '2016-02-16');
INSERT INTO analise_bio VALUES (6725, 1, 6195, 6725, '2016-02-16');
INSERT INTO analise_bio VALUES (6726, 1, 6196, 6726, '2016-02-16');
INSERT INTO analise_bio VALUES (6727, 1, 6197, 6727, '2016-02-16');
INSERT INTO analise_bio VALUES (6728, 1, 6198, 6728, '2016-02-16');
INSERT INTO analise_bio VALUES (6729, 1, 6199, 6729, '2016-02-16');
INSERT INTO analise_bio VALUES (6730, 1, 6200, 6730, '2016-02-16');
INSERT INTO analise_bio VALUES (6731, 1, 6201, 6731, '2016-02-16');
INSERT INTO analise_bio VALUES (6732, 1, 6202, 6732, '2016-02-16');
INSERT INTO analise_bio VALUES (6733, 1, 6203, 6733, '2016-02-16');
INSERT INTO analise_bio VALUES (6734, 1, 6204, 6734, '2016-02-16');
INSERT INTO analise_bio VALUES (6735, 1, 6205, 6735, '2016-02-16');
INSERT INTO analise_bio VALUES (6736, 1, 6206, 6736, '2016-02-16');
INSERT INTO analise_bio VALUES (6737, 1, 6207, 6737, '2016-02-16');
INSERT INTO analise_bio VALUES (6738, 1, 6208, 6738, '2016-02-16');
INSERT INTO analise_bio VALUES (6739, 1, 6209, 6739, '2016-02-16');
INSERT INTO analise_bio VALUES (6740, 1, 6210, 6740, '2016-02-16');
INSERT INTO analise_bio VALUES (6741, 1, 6211, 6741, '2016-02-16');
INSERT INTO analise_bio VALUES (6742, 1, 6212, 6742, '2016-02-16');
INSERT INTO analise_bio VALUES (6743, 1, 6213, 6743, '2016-02-16');
INSERT INTO analise_bio VALUES (6744, 1, 6214, 6744, '2016-02-16');
INSERT INTO analise_bio VALUES (6745, 1, 6215, 6745, '2016-02-16');
INSERT INTO analise_bio VALUES (6746, 1, 6216, 6746, '2016-02-16');
INSERT INTO analise_bio VALUES (6747, 1, 6217, 6747, '2016-02-16');
INSERT INTO analise_bio VALUES (6748, 1, 6218, 6748, '2016-02-16');
INSERT INTO analise_bio VALUES (6749, 1, 6219, 6749, '2016-02-16');
INSERT INTO analise_bio VALUES (6750, 1, 6220, 6750, '2016-02-16');
INSERT INTO analise_bio VALUES (6751, 1, 6221, 6751, '2016-02-16');
INSERT INTO analise_bio VALUES (6752, 1, 6222, 6752, '2016-02-16');
INSERT INTO analise_bio VALUES (6753, 1, 6223, 6753, '2016-02-16');
INSERT INTO analise_bio VALUES (6754, 1, 6224, 6754, '2016-02-16');
INSERT INTO analise_bio VALUES (6755, 1, 6225, 6755, '2016-02-16');
INSERT INTO analise_bio VALUES (6756, 1, 6226, 6756, '2016-02-16');
INSERT INTO analise_bio VALUES (6757, 1, 6227, 6757, '2016-02-16');
INSERT INTO analise_bio VALUES (6758, 1, 6228, 6758, '2016-02-16');
INSERT INTO analise_bio VALUES (6759, 1, 6229, 6759, '2016-02-16');
INSERT INTO analise_bio VALUES (6760, 1, 6230, 6760, '2016-02-16');
INSERT INTO analise_bio VALUES (6761, 1, 6231, 6761, '2016-02-16');
INSERT INTO analise_bio VALUES (6762, 1, 6232, 6762, '2016-02-16');
INSERT INTO analise_bio VALUES (6763, 1, 6233, 6763, '2016-02-16');
INSERT INTO analise_bio VALUES (6764, 1, 6234, 6764, '2016-02-16');
INSERT INTO analise_bio VALUES (6765, 1, 6235, 6765, '2016-02-16');
INSERT INTO analise_bio VALUES (6766, 1, 6236, 6766, '2016-02-16');
INSERT INTO analise_bio VALUES (6767, 1, 6237, 6767, '2016-02-16');
INSERT INTO analise_bio VALUES (6768, 1, 6238, 6768, '2016-02-16');
INSERT INTO analise_bio VALUES (6769, 1, 6239, 6769, '2016-02-16');
INSERT INTO analise_bio VALUES (6770, 1, 6240, 6770, '2016-02-16');
INSERT INTO analise_bio VALUES (6771, 1, 6241, 6771, '2016-02-16');
INSERT INTO analise_bio VALUES (6772, 1, 6242, 6772, '2016-02-16');
INSERT INTO analise_bio VALUES (6773, 1, 6243, 6773, '2016-02-16');
INSERT INTO analise_bio VALUES (6774, 1, 6244, 6774, '2016-02-16');
INSERT INTO analise_bio VALUES (6775, 1, 6245, 6775, '2016-02-16');
INSERT INTO analise_bio VALUES (6776, 1, 6246, 6776, '2016-02-16');
INSERT INTO analise_bio VALUES (6777, 1, 6247, 6777, '2016-02-16');
INSERT INTO analise_bio VALUES (6778, 1, 6248, 6778, '2016-02-16');
INSERT INTO analise_bio VALUES (6779, 1, 6249, 6779, '2016-02-16');
INSERT INTO analise_bio VALUES (6780, 1, 6250, 6780, '2016-02-16');
INSERT INTO analise_bio VALUES (6781, 1, 6251, 6781, '2016-02-16');
INSERT INTO analise_bio VALUES (6782, 1, 6252, 6782, '2016-02-16');
INSERT INTO analise_bio VALUES (6783, 1, 6253, 6783, '2016-02-16');
INSERT INTO analise_bio VALUES (6784, 1, 6254, 6784, '2016-02-16');
INSERT INTO analise_bio VALUES (6785, 1, 6255, 6785, '2016-02-16');
INSERT INTO analise_bio VALUES (6786, 1, 6256, 6786, '2016-02-16');
INSERT INTO analise_bio VALUES (6787, 1, 6257, 6787, '2016-02-16');
INSERT INTO analise_bio VALUES (6788, 1, 6258, 6788, '2016-02-16');
INSERT INTO analise_bio VALUES (6789, 1, 6259, 6789, '2016-02-16');
INSERT INTO analise_bio VALUES (6790, 1, 6260, 6790, '2016-02-16');
INSERT INTO analise_bio VALUES (6791, 1, 6261, 6791, '2016-02-16');
INSERT INTO analise_bio VALUES (6792, 1, 6262, 6792, '2016-02-16');
INSERT INTO analise_bio VALUES (6793, 1, 6263, 6793, '2016-02-16');
INSERT INTO analise_bio VALUES (6794, 1, 6264, 6794, '2016-02-16');
INSERT INTO analise_bio VALUES (6795, 1, 6265, 6795, '2016-02-16');
INSERT INTO analise_bio VALUES (6796, 1, 6266, 6796, '2016-02-16');
INSERT INTO analise_bio VALUES (6797, 1, 6267, 6797, '2016-02-16');
INSERT INTO analise_bio VALUES (6798, 1, 6268, 6798, '2016-02-16');
INSERT INTO analise_bio VALUES (6799, 1, 6269, 6799, '2016-02-16');
INSERT INTO analise_bio VALUES (6800, 1, 6270, 6800, '2016-02-16');
INSERT INTO analise_bio VALUES (6801, 1, 6271, 6801, '2016-02-16');
INSERT INTO analise_bio VALUES (6802, 1, 6272, 6802, '2016-02-16');
INSERT INTO analise_bio VALUES (6803, 1, 6273, 6803, '2016-02-16');
INSERT INTO analise_bio VALUES (6804, 1, 6274, 6804, '2016-02-16');
INSERT INTO analise_bio VALUES (6805, 1, 6275, 6805, '2016-02-16');
INSERT INTO analise_bio VALUES (6806, 1, 6276, 6806, '2016-02-16');
INSERT INTO analise_bio VALUES (6807, 1, 6277, 6807, '2016-02-16');
INSERT INTO analise_bio VALUES (6808, 1, 6278, 6808, '2016-02-16');
INSERT INTO analise_bio VALUES (6809, 1, 6279, 6809, '2016-02-16');
INSERT INTO analise_bio VALUES (6810, 1, 6280, 6810, '2016-02-16');
INSERT INTO analise_bio VALUES (6811, 1, 6281, 6811, '2016-02-16');
INSERT INTO analise_bio VALUES (6812, 1, 6282, 6812, '2016-02-16');
INSERT INTO analise_bio VALUES (6813, 1, 6283, 6813, '2016-02-16');
INSERT INTO analise_bio VALUES (6814, 1, 6284, 6814, '2016-02-16');
INSERT INTO analise_bio VALUES (6815, 1, 6285, 6815, '2016-02-16');
INSERT INTO analise_bio VALUES (6816, 1, 6286, 6816, '2016-02-16');
INSERT INTO analise_bio VALUES (6817, 1, 6287, 6817, '2016-02-16');
INSERT INTO analise_bio VALUES (6818, 1, 6288, 6818, '2016-02-16');
INSERT INTO analise_bio VALUES (6819, 1, 6289, 6819, '2016-02-16');
INSERT INTO analise_bio VALUES (6820, 1, 6290, 6820, '2016-02-16');
INSERT INTO analise_bio VALUES (6821, 1, 6291, 6821, '2016-02-16');
INSERT INTO analise_bio VALUES (6822, 1, 6292, 6822, '2016-02-16');
INSERT INTO analise_bio VALUES (6823, 1, 6293, 6823, '2016-02-16');
INSERT INTO analise_bio VALUES (6824, 1, 6294, 6824, '2016-02-16');
INSERT INTO analise_bio VALUES (6825, 1, 6295, 6825, '2016-02-16');
INSERT INTO analise_bio VALUES (6826, 1, 6296, 6826, '2016-02-16');
INSERT INTO analise_bio VALUES (6827, 1, 6297, 6827, '2016-02-16');
INSERT INTO analise_bio VALUES (6828, 1, 6298, 6828, '2016-02-16');
INSERT INTO analise_bio VALUES (6829, 1, 6299, 6829, '2016-02-16');
INSERT INTO analise_bio VALUES (6830, 1, 6300, 6830, '2016-02-16');
INSERT INTO analise_bio VALUES (6831, 1, 6301, 6831, '2016-02-16');
INSERT INTO analise_bio VALUES (6832, 1, 6302, 6832, '2016-02-16');
INSERT INTO analise_bio VALUES (6833, 1, 6303, 6833, '2016-02-16');
INSERT INTO analise_bio VALUES (6834, 1, 6304, 6834, '2016-02-16');
INSERT INTO analise_bio VALUES (6835, 1, 6305, 6835, '2016-02-16');
INSERT INTO analise_bio VALUES (6836, 1, 6306, 6836, '2016-02-16');
INSERT INTO analise_bio VALUES (6837, 1, 6307, 6837, '2016-02-16');
INSERT INTO analise_bio VALUES (6838, 1, 6308, 6838, '2016-02-16');
INSERT INTO analise_bio VALUES (6839, 1, 6309, 6839, '2016-02-16');
INSERT INTO analise_bio VALUES (6840, 1, 6310, 6840, '2016-02-16');
INSERT INTO analise_bio VALUES (6841, 1, 6311, 6841, '2016-02-16');
INSERT INTO analise_bio VALUES (6842, 1, 6312, 6842, '2016-02-16');
INSERT INTO analise_bio VALUES (6843, 1, 6313, 6843, '2016-02-16');
INSERT INTO analise_bio VALUES (6844, 1, 6314, 6844, '2016-02-16');
INSERT INTO analise_bio VALUES (6845, 1, 6315, 6845, '2016-02-16');
INSERT INTO analise_bio VALUES (6846, 1, 6316, 6846, '2016-02-16');
INSERT INTO analise_bio VALUES (6847, 1, 6317, 6847, '2016-02-16');
INSERT INTO analise_bio VALUES (6848, 1, 6318, 6848, '2016-02-16');
INSERT INTO analise_bio VALUES (6849, 1, 6319, 6849, '2016-02-16');
INSERT INTO analise_bio VALUES (6850, 1, 6320, 6850, '2016-02-16');
INSERT INTO analise_bio VALUES (6851, 1, 6321, 6851, '2016-02-16');
INSERT INTO analise_bio VALUES (6852, 1, 6322, 6852, '2016-02-16');
INSERT INTO analise_bio VALUES (6853, 1, 6323, 6853, '2016-02-16');
INSERT INTO analise_bio VALUES (6854, 1, 6324, 6854, '2016-02-16');
INSERT INTO analise_bio VALUES (6855, 1, 6325, 6855, '2016-02-16');
INSERT INTO analise_bio VALUES (6856, 1, 6326, 6856, '2016-02-16');
INSERT INTO analise_bio VALUES (6857, 1, 6327, 6857, '2016-02-16');
INSERT INTO analise_bio VALUES (6858, 1, 6328, 6858, '2016-02-16');
INSERT INTO analise_bio VALUES (6859, 1, 6329, 6859, '2016-02-16');
INSERT INTO analise_bio VALUES (6860, 1, 6330, 6860, '2016-02-16');
INSERT INTO analise_bio VALUES (6861, 1, 6331, 6861, '2016-02-16');
INSERT INTO analise_bio VALUES (6862, 1, 6332, 6862, '2016-02-16');
INSERT INTO analise_bio VALUES (6863, 1, 6333, 6863, '2016-02-16');
INSERT INTO analise_bio VALUES (6864, 1, 6334, 6864, '2016-02-16');
INSERT INTO analise_bio VALUES (6865, 1, 6335, 6865, '2016-02-16');
INSERT INTO analise_bio VALUES (6866, 1, 6336, 6866, '2016-02-16');
INSERT INTO analise_bio VALUES (6867, 1, 6337, 6867, '2016-02-16');
INSERT INTO analise_bio VALUES (6868, 1, 6338, 6868, '2016-02-16');
INSERT INTO analise_bio VALUES (6869, 1, 6339, 6869, '2016-02-16');
INSERT INTO analise_bio VALUES (6870, 1, 6340, 6870, '2016-02-16');
INSERT INTO analise_bio VALUES (6871, 1, 6341, 6871, '2016-02-16');
INSERT INTO analise_bio VALUES (6872, 1, 6342, 6872, '2016-02-16');
INSERT INTO analise_bio VALUES (6873, 1, 6343, 6873, '2016-02-16');
INSERT INTO analise_bio VALUES (6874, 1, 6344, 6874, '2016-02-16');
INSERT INTO analise_bio VALUES (6875, 1, 6345, 6875, '2016-02-16');
INSERT INTO analise_bio VALUES (6876, 1, 6346, 6876, '2016-02-16');
INSERT INTO analise_bio VALUES (6877, 1, 6347, 6877, '2016-02-16');
INSERT INTO analise_bio VALUES (6878, 1, 6348, 6878, '2016-02-16');
INSERT INTO analise_bio VALUES (6879, 1, 6349, 6879, '2016-02-16');
INSERT INTO analise_bio VALUES (6880, 1, 6350, 6880, '2016-02-16');
INSERT INTO analise_bio VALUES (6881, 1, 6351, 6881, '2016-02-16');
INSERT INTO analise_bio VALUES (6882, 1, 6352, 6882, '2016-02-16');
INSERT INTO analise_bio VALUES (6883, 1, 6353, 6883, '2016-02-16');
INSERT INTO analise_bio VALUES (6884, 1, 6354, 6884, '2016-02-16');
INSERT INTO analise_bio VALUES (6885, 1, 6355, 6885, '2016-02-16');
INSERT INTO analise_bio VALUES (6886, 1, 6356, 6886, '2016-02-16');
INSERT INTO analise_bio VALUES (6887, 1, 6357, 6887, '2016-02-16');
INSERT INTO analise_bio VALUES (6888, 1, 6358, 6888, '2016-02-16');
INSERT INTO analise_bio VALUES (6889, 1, 6359, 6889, '2016-02-16');
INSERT INTO analise_bio VALUES (6890, 1, 6360, 6890, '2016-02-16');
INSERT INTO analise_bio VALUES (6891, 1, 6361, 6891, '2016-02-16');
INSERT INTO analise_bio VALUES (6892, 1, 6362, 6892, '2016-02-16');
INSERT INTO analise_bio VALUES (6893, 1, 6363, 6893, '2016-02-16');
INSERT INTO analise_bio VALUES (6894, 1, 6364, 6894, '2016-02-16');
INSERT INTO analise_bio VALUES (6895, 1, 6365, 6895, '2016-02-16');
INSERT INTO analise_bio VALUES (6896, 1, 6366, 6896, '2016-02-16');
INSERT INTO analise_bio VALUES (6897, 1, 6367, 6897, '2016-02-16');
INSERT INTO analise_bio VALUES (6898, 1, 6368, 6898, '2016-02-16');
INSERT INTO analise_bio VALUES (6899, 1, 6369, 6899, '2016-02-16');
INSERT INTO analise_bio VALUES (6900, 1, 6370, 6900, '2016-02-16');
INSERT INTO analise_bio VALUES (6901, 1, 6371, 6901, '2016-02-16');
INSERT INTO analise_bio VALUES (6902, 1, 6372, 6902, '2016-02-16');
INSERT INTO analise_bio VALUES (6903, 1, 6373, 6903, '2016-02-16');
INSERT INTO analise_bio VALUES (6904, 1, 6374, 6904, '2016-02-16');
INSERT INTO analise_bio VALUES (6905, 1, 6375, 6905, '2016-02-16');
INSERT INTO analise_bio VALUES (6906, 1, 6376, 6906, '2016-02-16');
INSERT INTO analise_bio VALUES (6907, 1, 6377, 6907, '2016-02-16');
INSERT INTO analise_bio VALUES (6908, 1, 6378, 6908, '2016-02-16');
INSERT INTO analise_bio VALUES (6909, 1, 6379, 6909, '2016-02-16');
INSERT INTO analise_bio VALUES (6910, 1, 6380, 6910, '2016-02-16');
INSERT INTO analise_bio VALUES (6911, 1, 6381, 6911, '2016-02-16');
INSERT INTO analise_bio VALUES (6912, 1, 6382, 6912, '2016-02-16');
INSERT INTO analise_bio VALUES (6913, 1, 6383, 6913, '2016-02-16');
INSERT INTO analise_bio VALUES (6914, 1, 6384, 6914, '2016-02-16');
INSERT INTO analise_bio VALUES (6915, 1, 6385, 6915, '2016-02-16');
INSERT INTO analise_bio VALUES (6916, 1, 6386, 6916, '2016-02-16');
INSERT INTO analise_bio VALUES (6917, 1, 6387, 6917, '2016-02-16');
INSERT INTO analise_bio VALUES (6918, 1, 6388, 6918, '2016-02-16');
INSERT INTO analise_bio VALUES (6919, 1, 6389, 6919, '2016-02-16');
INSERT INTO analise_bio VALUES (6920, 1, 6390, 6920, '2016-02-16');
INSERT INTO analise_bio VALUES (6921, 1, 6391, 6921, '2016-02-16');
INSERT INTO analise_bio VALUES (6922, 1, 6392, 6922, '2016-02-16');
INSERT INTO analise_bio VALUES (6923, 1, 6393, 6923, '2016-02-16');
INSERT INTO analise_bio VALUES (6924, 1, 6394, 6924, '2016-02-16');
INSERT INTO analise_bio VALUES (6925, 1, 6395, 6925, '2016-02-16');
INSERT INTO analise_bio VALUES (6926, 1, 6396, 6926, '2016-02-16');
INSERT INTO analise_bio VALUES (6927, 1, 6397, 6927, '2016-02-16');
INSERT INTO analise_bio VALUES (6928, 1, 6398, 6928, '2016-02-16');
INSERT INTO analise_bio VALUES (6929, 1, 6399, 6929, '2016-02-16');
INSERT INTO analise_bio VALUES (6930, 1, 6400, 6930, '2016-02-16');
INSERT INTO analise_bio VALUES (6931, 1, 6401, 6931, '2016-02-16');
INSERT INTO analise_bio VALUES (6932, 1, 6402, 6932, '2016-02-16');
INSERT INTO analise_bio VALUES (6933, 1, 6403, 6933, '2016-02-16');
INSERT INTO analise_bio VALUES (6934, 1, 6404, 6934, '2016-02-16');
INSERT INTO analise_bio VALUES (6935, 1, 6405, 6935, '2016-02-16');
INSERT INTO analise_bio VALUES (6936, 1, 6406, 6936, '2016-02-16');
INSERT INTO analise_bio VALUES (6937, 1, 6407, 6937, '2016-02-16');
INSERT INTO analise_bio VALUES (6938, 1, 6408, 6938, '2016-02-16');
INSERT INTO analise_bio VALUES (6939, 1, 6409, 6939, '2016-02-16');
INSERT INTO analise_bio VALUES (6940, 1, 6410, 6940, '2016-02-16');
INSERT INTO analise_bio VALUES (6941, 1, 6411, 6941, '2016-02-16');
INSERT INTO analise_bio VALUES (6942, 1, 6412, 6942, '2016-02-16');
INSERT INTO analise_bio VALUES (6943, 1, 6413, 6943, '2016-02-16');
INSERT INTO analise_bio VALUES (6944, 1, 6414, 6944, '2016-02-16');
INSERT INTO analise_bio VALUES (6945, 1, 6415, 6945, '2016-02-16');
INSERT INTO analise_bio VALUES (6946, 1, 6416, 6946, '2016-02-16');
INSERT INTO analise_bio VALUES (6947, 1, 6417, 6947, '2016-02-16');
INSERT INTO analise_bio VALUES (6948, 1, 6418, 6948, '2016-02-16');
INSERT INTO analise_bio VALUES (6949, 1, 6419, 6949, '2016-02-16');
INSERT INTO analise_bio VALUES (6950, 1, 6420, 6950, '2016-02-16');
INSERT INTO analise_bio VALUES (6951, 1, 6421, 6951, '2016-02-16');
INSERT INTO analise_bio VALUES (6952, 1, 6422, 6952, '2016-02-16');
INSERT INTO analise_bio VALUES (6953, 1, 6423, 6953, '2016-02-16');
INSERT INTO analise_bio VALUES (6954, 1, 6424, 6954, '2016-02-16');
INSERT INTO analise_bio VALUES (6955, 1, 6425, 6955, '2016-02-16');
INSERT INTO analise_bio VALUES (6956, 1, 6426, 6956, '2016-02-16');
INSERT INTO analise_bio VALUES (6957, 1, 6427, 6957, '2016-02-16');
INSERT INTO analise_bio VALUES (6958, 1, 6428, 6958, '2016-02-16');
INSERT INTO analise_bio VALUES (6959, 1, 6429, 6959, '2016-02-16');
INSERT INTO analise_bio VALUES (6960, 1, 6430, 6960, '2016-02-16');
INSERT INTO analise_bio VALUES (6961, 1, 6431, 6961, '2016-02-16');
INSERT INTO analise_bio VALUES (6962, 1, 6432, 6962, '2016-02-16');
INSERT INTO analise_bio VALUES (6963, 1, 6433, 6963, '2016-02-16');
INSERT INTO analise_bio VALUES (6964, 1, 6434, 6964, '2016-02-16');
INSERT INTO analise_bio VALUES (6965, 1, 6435, 6965, '2016-02-16');
INSERT INTO analise_bio VALUES (6966, 1, 6436, 6966, '2016-02-16');
INSERT INTO analise_bio VALUES (6967, 1, 6437, 6967, '2016-02-16');
INSERT INTO analise_bio VALUES (6968, 1, 6438, 6968, '2016-02-16');
INSERT INTO analise_bio VALUES (6969, 1, 6439, 6969, '2016-02-16');
INSERT INTO analise_bio VALUES (6970, 1, 6440, 6970, '2016-02-16');
INSERT INTO analise_bio VALUES (6971, 1, 6441, 6971, '2016-02-16');
INSERT INTO analise_bio VALUES (6972, 1, 6442, 6972, '2016-02-16');
INSERT INTO analise_bio VALUES (6973, 1, 6443, 6973, '2016-02-16');
INSERT INTO analise_bio VALUES (6974, 1, 6444, 6974, '2016-02-16');
INSERT INTO analise_bio VALUES (6975, 1, 6445, 6975, '2016-02-16');
INSERT INTO analise_bio VALUES (6976, 1, 6446, 6976, '2016-02-16');
INSERT INTO analise_bio VALUES (6977, 1, 6447, 6977, '2016-02-16');
INSERT INTO analise_bio VALUES (6978, 1, 6448, 6978, '2016-02-16');
INSERT INTO analise_bio VALUES (6979, 1, 6449, 6979, '2016-02-16');
INSERT INTO analise_bio VALUES (6980, 1, 6450, 6980, '2016-02-16');
INSERT INTO analise_bio VALUES (6981, 1, 6451, 6981, '2016-02-16');
INSERT INTO analise_bio VALUES (7138, 1, 6608, 7138, '2016-02-17');
INSERT INTO analise_bio VALUES (7139, 1, 6609, 7139, '2016-02-17');
INSERT INTO analise_bio VALUES (7140, 1, 6610, 7140, '2016-02-17');
INSERT INTO analise_bio VALUES (7141, 1, 6611, 7141, '2016-02-17');
INSERT INTO analise_bio VALUES (7142, 1, 6612, 7142, '2016-02-17');
INSERT INTO analise_bio VALUES (7143, 1, 6613, 7143, '2016-02-17');
INSERT INTO analise_bio VALUES (7144, 1, 6614, 7144, '2016-02-17');
INSERT INTO analise_bio VALUES (7145, 1, 6615, 7145, '2016-02-17');
INSERT INTO analise_bio VALUES (7146, 1, 6616, 7146, '2016-02-17');
INSERT INTO analise_bio VALUES (7147, 1, 6617, 7147, '2016-02-17');
INSERT INTO analise_bio VALUES (7148, 1, 6618, 7148, '2016-02-17');
INSERT INTO analise_bio VALUES (7149, 1, 6619, 7149, '2016-02-17');
INSERT INTO analise_bio VALUES (7150, 1, 6620, 7150, '2016-02-17');
INSERT INTO analise_bio VALUES (7151, 1, 6621, 7151, '2016-02-17');
INSERT INTO analise_bio VALUES (7152, 1, 6622, 7152, '2016-02-17');
INSERT INTO analise_bio VALUES (7153, 1, 6623, 7153, '2016-02-17');
INSERT INTO analise_bio VALUES (7154, 1, 6624, 7154, '2016-02-17');
INSERT INTO analise_bio VALUES (7155, 1, 6625, 7155, '2016-02-17');
INSERT INTO analise_bio VALUES (7156, 1, 6626, 7156, '2016-02-17');
INSERT INTO analise_bio VALUES (7157, 1, 6627, 7157, '2016-02-17');
INSERT INTO analise_bio VALUES (7158, 1, 6628, 7158, '2016-02-17');
INSERT INTO analise_bio VALUES (7159, 1, 6629, 7159, '2016-02-17');
INSERT INTO analise_bio VALUES (7160, 1, 6630, 7160, '2016-02-17');
INSERT INTO analise_bio VALUES (7161, 1, 6631, 7161, '2016-02-17');
INSERT INTO analise_bio VALUES (7162, 1, 6632, 7162, '2016-02-17');
INSERT INTO analise_bio VALUES (7163, 1, 6633, 7163, '2016-02-17');
INSERT INTO analise_bio VALUES (7164, 1, 6634, 7164, '2016-02-17');
INSERT INTO analise_bio VALUES (7165, 1, 6635, 7165, '2016-02-17');
INSERT INTO analise_bio VALUES (7166, 1, 6636, 7166, '2016-02-17');
INSERT INTO analise_bio VALUES (7167, 1, 6637, 7167, '2016-02-17');
INSERT INTO analise_bio VALUES (7168, 1, 6638, 7168, '2016-02-17');
INSERT INTO analise_bio VALUES (7169, 1, 6639, 7169, '2016-02-17');
INSERT INTO analise_bio VALUES (7170, 1, 6640, 7170, '2016-02-17');
INSERT INTO analise_bio VALUES (7171, 1, 6641, 7171, '2016-02-17');
INSERT INTO analise_bio VALUES (7172, 1, 6642, 7172, '2016-02-17');
INSERT INTO analise_bio VALUES (7173, 1, 6643, 7173, '2016-02-17');
INSERT INTO analise_bio VALUES (7174, 1, 6644, 7174, '2016-02-17');
INSERT INTO analise_bio VALUES (7175, 1, 6645, 7175, '2016-02-17');
INSERT INTO analise_bio VALUES (7176, 1, 6646, 7176, '2016-02-17');
INSERT INTO analise_bio VALUES (7177, 1, 6647, 7177, '2016-02-17');
INSERT INTO analise_bio VALUES (7178, 1, 6648, 7178, '2016-02-17');
INSERT INTO analise_bio VALUES (7179, 1, 6649, 7179, '2016-02-17');
INSERT INTO analise_bio VALUES (7180, 1, 6650, 7180, '2016-02-17');
INSERT INTO analise_bio VALUES (7181, 1, 6651, 7181, '2016-02-17');
INSERT INTO analise_bio VALUES (7182, 1, 6652, 7182, '2016-02-17');
INSERT INTO analise_bio VALUES (7183, 1, 6653, 7183, '2016-02-17');
INSERT INTO analise_bio VALUES (7184, 1, 6654, 7184, '2016-02-17');
INSERT INTO analise_bio VALUES (7185, 1, 6655, 7185, '2016-02-17');
INSERT INTO analise_bio VALUES (7186, 1, 6656, 7186, '2016-02-17');
INSERT INTO analise_bio VALUES (7187, 1, 6657, 7187, '2016-02-17');
INSERT INTO analise_bio VALUES (7188, 1, 6658, 7188, '2016-02-17');
INSERT INTO analise_bio VALUES (7189, 1, 6659, 7189, '2016-02-17');
INSERT INTO analise_bio VALUES (7190, 1, 6660, 7190, '2016-02-17');
INSERT INTO analise_bio VALUES (7191, 1, 6661, 7191, '2016-02-17');
INSERT INTO analise_bio VALUES (7192, 1, 6662, 7192, '2016-02-17');
INSERT INTO analise_bio VALUES (7193, 1, 6663, 7193, '2016-02-17');
INSERT INTO analise_bio VALUES (7194, 1, 6664, 7194, '2016-02-17');
INSERT INTO analise_bio VALUES (7195, 1, 6665, 7195, '2016-02-17');
INSERT INTO analise_bio VALUES (7196, 1, 6666, 7196, '2016-02-17');
INSERT INTO analise_bio VALUES (7197, 1, 6667, 7197, '2016-02-17');
INSERT INTO analise_bio VALUES (7198, 1, 6668, 7198, '2016-02-17');
INSERT INTO analise_bio VALUES (7199, 1, 6669, 7199, '2016-02-17');
INSERT INTO analise_bio VALUES (7200, 1, 6670, 7200, '2016-02-17');
INSERT INTO analise_bio VALUES (7201, 1, 6671, 7201, '2016-02-17');
INSERT INTO analise_bio VALUES (7202, 1, 6672, 7202, '2016-02-17');
INSERT INTO analise_bio VALUES (7203, 1, 6673, 7203, '2016-02-17');
INSERT INTO analise_bio VALUES (7204, 1, 6674, 7204, '2016-02-17');
INSERT INTO analise_bio VALUES (7205, 1, 6675, 7205, '2016-02-17');
INSERT INTO analise_bio VALUES (7206, 1, 6676, 7206, '2016-02-17');
INSERT INTO analise_bio VALUES (7207, 1, 6677, 7207, '2016-02-17');
INSERT INTO analise_bio VALUES (7208, 1, 6678, 7208, '2016-02-17');
INSERT INTO analise_bio VALUES (7209, 1, 6679, 7209, '2016-02-17');
INSERT INTO analise_bio VALUES (7210, 1, 6680, 7210, '2016-02-17');
INSERT INTO analise_bio VALUES (7211, 1, 6681, 7211, '2016-02-17');
INSERT INTO analise_bio VALUES (7212, 1, 6682, 7212, '2016-02-17');
INSERT INTO analise_bio VALUES (7213, 1, 6683, 7213, '2016-02-17');
INSERT INTO analise_bio VALUES (7214, 1, 6684, 7214, '2016-02-17');
INSERT INTO analise_bio VALUES (7215, 1, 6685, 7215, '2016-02-17');
INSERT INTO analise_bio VALUES (7216, 1, 6686, 7216, '2016-02-17');
INSERT INTO analise_bio VALUES (7217, 1, 6687, 7217, '2016-02-17');
INSERT INTO analise_bio VALUES (7218, 1, 6688, 7218, '2016-02-17');
INSERT INTO analise_bio VALUES (7219, 1, 6689, 7219, '2016-02-17');
INSERT INTO analise_bio VALUES (7220, 1, 6690, 7220, '2016-02-17');
INSERT INTO analise_bio VALUES (7221, 1, 6691, 7221, '2016-02-17');
INSERT INTO analise_bio VALUES (7222, 1, 6692, 7222, '2016-02-17');
INSERT INTO analise_bio VALUES (7223, 1, 6693, 7223, '2016-02-17');
INSERT INTO analise_bio VALUES (7224, 1, 6694, 7224, '2016-02-17');
INSERT INTO analise_bio VALUES (7225, 1, 6695, 7225, '2016-02-17');
INSERT INTO analise_bio VALUES (7226, 1, 6696, 7226, '2016-02-17');
INSERT INTO analise_bio VALUES (7227, 1, 6697, 7227, '2016-02-17');
INSERT INTO analise_bio VALUES (7228, 1, 6698, 7228, '2016-02-17');
INSERT INTO analise_bio VALUES (7229, 1, 6699, 7229, '2016-02-17');
INSERT INTO analise_bio VALUES (7230, 1, 6700, 7230, '2016-02-17');
INSERT INTO analise_bio VALUES (7231, 1, 6701, 7231, '2016-02-17');
INSERT INTO analise_bio VALUES (7232, 1, 6702, 7232, '2016-02-17');
INSERT INTO analise_bio VALUES (7233, 1, 6703, 7233, '2016-02-17');
INSERT INTO analise_bio VALUES (7234, 1, 6704, 7234, '2016-02-17');
INSERT INTO analise_bio VALUES (7235, 1, 6705, 7235, '2016-02-17');
INSERT INTO analise_bio VALUES (7236, 1, 6706, 7236, '2016-02-17');
INSERT INTO analise_bio VALUES (7237, 1, 6707, 7237, '2016-02-17');
INSERT INTO analise_bio VALUES (7238, 1, 6708, 7238, '2016-02-17');
INSERT INTO analise_bio VALUES (7239, 1, 6709, 7239, '2016-02-17');
INSERT INTO analise_bio VALUES (7240, 1, 6710, 7240, '2016-02-17');
INSERT INTO analise_bio VALUES (7241, 1, 6711, 7241, '2016-02-17');
INSERT INTO analise_bio VALUES (7242, 1, 6712, 7242, '2016-02-17');
INSERT INTO analise_bio VALUES (7243, 1, 6713, 7243, '2016-02-17');
INSERT INTO analise_bio VALUES (7244, 1, 6714, 7244, '2016-02-17');
INSERT INTO analise_bio VALUES (7245, 1, 6715, 7245, '2016-02-17');
INSERT INTO analise_bio VALUES (7246, 1, 6716, 7246, '2016-02-17');
INSERT INTO analise_bio VALUES (7247, 1, 6717, 7247, '2016-02-17');
INSERT INTO analise_bio VALUES (7248, 1, 6718, 7248, '2016-02-17');
INSERT INTO analise_bio VALUES (7249, 1, 6719, 7249, '2016-02-17');
INSERT INTO analise_bio VALUES (7250, 1, 6720, 7250, '2016-02-17');
INSERT INTO analise_bio VALUES (7251, 1, 6721, 7251, '2016-02-17');
INSERT INTO analise_bio VALUES (7252, 1, 6722, 7252, '2016-02-17');
INSERT INTO analise_bio VALUES (7253, 1, 6723, 7253, '2016-02-17');
INSERT INTO analise_bio VALUES (7254, 1, 6724, 7254, '2016-02-17');
INSERT INTO analise_bio VALUES (7255, 1, 6725, 7255, '2016-02-17');
INSERT INTO analise_bio VALUES (7256, 1, 6726, 7256, '2016-02-17');
INSERT INTO analise_bio VALUES (7257, 1, 6727, 7257, '2016-02-17');
INSERT INTO analise_bio VALUES (7258, 1, 6728, 7258, '2016-02-17');
INSERT INTO analise_bio VALUES (7259, 1, 6729, 7259, '2016-02-17');
INSERT INTO analise_bio VALUES (7260, 1, 6730, 7260, '2016-02-17');
INSERT INTO analise_bio VALUES (7261, 1, 6731, 7261, '2016-02-17');
INSERT INTO analise_bio VALUES (7262, 1, 6732, 7262, '2016-02-17');
INSERT INTO analise_bio VALUES (7263, 1, 6733, 7263, '2016-02-17');
INSERT INTO analise_bio VALUES (7264, 1, 6734, 7264, '2016-02-17');
INSERT INTO analise_bio VALUES (7265, 1, 6735, 7265, '2016-02-17');
INSERT INTO analise_bio VALUES (7266, 1, 6736, 7266, '2016-02-17');
INSERT INTO analise_bio VALUES (7267, 1, 6737, 7267, '2016-02-17');
INSERT INTO analise_bio VALUES (7268, 1, 6738, 7268, '2016-02-17');
INSERT INTO analise_bio VALUES (7269, 1, 6739, 7269, '2016-02-17');
INSERT INTO analise_bio VALUES (7270, 1, 6740, 7270, '2016-02-17');
INSERT INTO analise_bio VALUES (7271, 1, 6741, 7271, '2016-02-17');
INSERT INTO analise_bio VALUES (7272, 1, 6742, 7272, '2016-02-17');
INSERT INTO analise_bio VALUES (7273, 1, 6743, 7273, '2016-02-17');
INSERT INTO analise_bio VALUES (7274, 1, 6744, 7274, '2016-02-17');
INSERT INTO analise_bio VALUES (7275, 1, 6745, 7275, '2016-02-17');
INSERT INTO analise_bio VALUES (7276, 1, 6746, 7276, '2016-02-17');
INSERT INTO analise_bio VALUES (7277, 1, 6747, 7277, '2016-02-17');
INSERT INTO analise_bio VALUES (7278, 1, 6748, 7278, '2016-02-17');
INSERT INTO analise_bio VALUES (7279, 1, 6749, 7279, '2016-02-17');
INSERT INTO analise_bio VALUES (7280, 1, 6750, 7280, '2016-02-17');
INSERT INTO analise_bio VALUES (7281, 1, 6751, 7281, '2016-02-17');
INSERT INTO analise_bio VALUES (7282, 1, 6752, 7282, '2016-02-17');
INSERT INTO analise_bio VALUES (7283, 1, 6753, 7283, '2016-02-17');
INSERT INTO analise_bio VALUES (7284, 1, 6754, 7284, '2016-02-17');
INSERT INTO analise_bio VALUES (7285, 1, 6755, 7285, '2016-02-17');
INSERT INTO analise_bio VALUES (7286, 1, 6756, 7286, '2016-02-17');
INSERT INTO analise_bio VALUES (7287, 1, 6757, 7287, '2016-02-17');
INSERT INTO analise_bio VALUES (7288, 1, 6758, 7288, '2016-02-17');
INSERT INTO analise_bio VALUES (7289, 1, 6759, 7289, '2016-02-17');
INSERT INTO analise_bio VALUES (7290, 1, 6760, 7290, '2016-02-17');
INSERT INTO analise_bio VALUES (7291, 1, 6761, 7291, '2016-02-17');
INSERT INTO analise_bio VALUES (7292, 1, 6762, 7292, '2016-02-17');
INSERT INTO analise_bio VALUES (7293, 1, 6763, 7293, '2016-02-17');
INSERT INTO analise_bio VALUES (7294, 1, 6764, 7294, '2016-02-17');
INSERT INTO analise_bio VALUES (7295, 1, 6765, 7295, '2016-02-17');
INSERT INTO analise_bio VALUES (7296, 1, 6766, 7296, '2016-02-17');
INSERT INTO analise_bio VALUES (7297, 1, 6767, 7297, '2016-02-17');
INSERT INTO analise_bio VALUES (7298, 1, 6768, 7298, '2016-02-17');
INSERT INTO analise_bio VALUES (7299, 1, 6769, 7299, '2016-02-17');
INSERT INTO analise_bio VALUES (7300, 1, 6770, 7300, '2016-02-17');
INSERT INTO analise_bio VALUES (7301, 1, 6771, 7301, '2016-02-17');
INSERT INTO analise_bio VALUES (7302, 1, 6772, 7302, '2016-02-17');
INSERT INTO analise_bio VALUES (7303, 1, 6773, 7303, '2016-02-17');
INSERT INTO analise_bio VALUES (7304, 1, 6774, 7304, '2016-02-17');
INSERT INTO analise_bio VALUES (7305, 1, 6775, 7305, '2016-02-17');
INSERT INTO analise_bio VALUES (7306, 1, 6776, 7306, '2016-02-17');
INSERT INTO analise_bio VALUES (7307, 1, 6777, 7307, '2016-02-17');
INSERT INTO analise_bio VALUES (7308, 1, 6778, 7308, '2016-02-17');
INSERT INTO analise_bio VALUES (7309, 1, 6779, 7309, '2016-02-17');
INSERT INTO analise_bio VALUES (7310, 1, 6780, 7310, '2016-02-17');
INSERT INTO analise_bio VALUES (7311, 1, 6781, 7311, '2016-02-17');
INSERT INTO analise_bio VALUES (7312, 1, 6782, 7312, '2016-02-17');
INSERT INTO analise_bio VALUES (7313, 1, 6783, 7313, '2016-02-17');
INSERT INTO analise_bio VALUES (7314, 1, 6784, 7314, '2016-02-17');
INSERT INTO analise_bio VALUES (7315, 1, 6785, 7315, '2016-02-17');
INSERT INTO analise_bio VALUES (7316, 1, 6786, 7316, '2016-02-17');
INSERT INTO analise_bio VALUES (7317, 1, 6787, 7317, '2016-02-17');
INSERT INTO analise_bio VALUES (7318, 1, 6788, 7318, '2016-02-17');
INSERT INTO analise_bio VALUES (7319, 1, 6789, 7319, '2016-02-17');
INSERT INTO analise_bio VALUES (7320, 1, 6790, 7320, '2016-02-17');
INSERT INTO analise_bio VALUES (7321, 1, 6791, 7321, '2016-02-17');
INSERT INTO analise_bio VALUES (7322, 1, 6792, 7322, '2016-02-17');
INSERT INTO analise_bio VALUES (7323, 1, 6793, 7323, '2016-02-17');
INSERT INTO analise_bio VALUES (7324, 1, 6794, 7324, '2016-02-17');
INSERT INTO analise_bio VALUES (7325, 1, 6795, 7325, '2016-02-17');
INSERT INTO analise_bio VALUES (7326, 1, 6796, 7326, '2016-02-17');
INSERT INTO analise_bio VALUES (7327, 1, 6797, 7327, '2016-02-17');
INSERT INTO analise_bio VALUES (7328, 1, 6798, 7328, '2016-02-17');
INSERT INTO analise_bio VALUES (7329, 1, 6799, 7329, '2016-02-17');
INSERT INTO analise_bio VALUES (7330, 1, 6800, 7330, '2016-02-17');
INSERT INTO analise_bio VALUES (7331, 1, 6801, 7331, '2016-02-17');
INSERT INTO analise_bio VALUES (7332, 1, 6802, 7332, '2016-02-17');
INSERT INTO analise_bio VALUES (7333, 1, 6803, 7333, '2016-02-17');
INSERT INTO analise_bio VALUES (7334, 1, 6804, 7334, '2016-02-17');
INSERT INTO analise_bio VALUES (7335, 1, 6805, 7335, '2016-02-17');
INSERT INTO analise_bio VALUES (7336, 1, 6806, 7336, '2016-02-17');
INSERT INTO analise_bio VALUES (7337, 1, 6807, 7337, '2016-02-17');
INSERT INTO analise_bio VALUES (7338, 1, 6808, 7338, '2016-02-17');
INSERT INTO analise_bio VALUES (7339, 1, 6809, 7339, '2016-02-17');
INSERT INTO analise_bio VALUES (7340, 1, 6810, 7340, '2016-02-17');
INSERT INTO analise_bio VALUES (7341, 1, 6811, 7341, '2016-02-17');
INSERT INTO analise_bio VALUES (7342, 1, 6812, 7342, '2016-02-17');
INSERT INTO analise_bio VALUES (7343, 1, 6813, 7343, '2016-02-17');
INSERT INTO analise_bio VALUES (7344, 1, 6814, 7344, '2016-02-17');
INSERT INTO analise_bio VALUES (7345, 1, 6815, 7345, '2016-02-17');
INSERT INTO analise_bio VALUES (7346, 1, 6816, 7346, '2016-02-17');
INSERT INTO analise_bio VALUES (7347, 1, 6817, 7347, '2016-02-17');
INSERT INTO analise_bio VALUES (7348, 1, 6818, 7348, '2016-02-17');
INSERT INTO analise_bio VALUES (7349, 1, 6819, 7349, '2016-02-17');
INSERT INTO analise_bio VALUES (7350, 1, 6820, 7350, '2016-02-17');
INSERT INTO analise_bio VALUES (7351, 1, 6821, 7351, '2016-02-17');
INSERT INTO analise_bio VALUES (7352, 1, 6822, 7352, '2016-02-17');
INSERT INTO analise_bio VALUES (7353, 1, 6823, 7353, '2016-02-17');
INSERT INTO analise_bio VALUES (7354, 1, 6824, 7354, '2016-02-17');
INSERT INTO analise_bio VALUES (7355, 1, 6825, 7355, '2016-02-17');
INSERT INTO analise_bio VALUES (7356, 1, 6826, 7356, '2016-02-17');
INSERT INTO analise_bio VALUES (7357, 1, 6827, 7357, '2016-02-17');
INSERT INTO analise_bio VALUES (7358, 1, 6828, 7358, '2016-02-17');
INSERT INTO analise_bio VALUES (7359, 1, 6829, 7359, '2016-02-17');
INSERT INTO analise_bio VALUES (7360, 1, 6830, 7360, '2016-02-17');
INSERT INTO analise_bio VALUES (7361, 1, 6831, 7361, '2016-02-17');
INSERT INTO analise_bio VALUES (7362, 1, 6832, 7362, '2016-02-17');
INSERT INTO analise_bio VALUES (7363, 1, 6833, 7363, '2016-02-17');
INSERT INTO analise_bio VALUES (7364, 1, 6834, 7364, '2016-02-17');
INSERT INTO analise_bio VALUES (7365, 1, 6835, 7365, '2016-02-17');
INSERT INTO analise_bio VALUES (7366, 1, 6836, 7366, '2016-02-17');
INSERT INTO analise_bio VALUES (7367, 1, 6837, 7367, '2016-02-17');
INSERT INTO analise_bio VALUES (7368, 1, 6838, 7368, '2016-02-17');
INSERT INTO analise_bio VALUES (7369, 1, 6839, 7369, '2016-02-17');
INSERT INTO analise_bio VALUES (7370, 1, 6840, 7370, '2016-02-17');
INSERT INTO analise_bio VALUES (7371, 1, 6841, 7371, '2016-02-17');
INSERT INTO analise_bio VALUES (7372, 1, 6842, 7372, '2016-02-17');
INSERT INTO analise_bio VALUES (7373, 1, 6843, 7373, '2016-02-17');
INSERT INTO analise_bio VALUES (7374, 1, 6844, 7374, '2016-02-17');
INSERT INTO analise_bio VALUES (7375, 1, 6845, 7375, '2016-02-17');
INSERT INTO analise_bio VALUES (7376, 1, 6846, 7376, '2016-02-17');
INSERT INTO analise_bio VALUES (7377, 1, 6847, 7377, '2016-02-17');
INSERT INTO analise_bio VALUES (7378, 1, 6848, 7378, '2016-02-17');
INSERT INTO analise_bio VALUES (7379, 1, 6849, 7379, '2016-02-17');
INSERT INTO analise_bio VALUES (7380, 1, 6850, 7380, '2016-02-17');
INSERT INTO analise_bio VALUES (7381, 1, 6851, 7381, '2016-02-17');
INSERT INTO analise_bio VALUES (7382, 1, 6852, 7382, '2016-02-17');
INSERT INTO analise_bio VALUES (7383, 1, 6853, 7383, '2016-02-17');
INSERT INTO analise_bio VALUES (7384, 1, 6854, 7384, '2016-02-17');
INSERT INTO analise_bio VALUES (7385, 1, 6855, 7385, '2016-02-17');
INSERT INTO analise_bio VALUES (7386, 1, 6856, 7386, '2016-02-17');
INSERT INTO analise_bio VALUES (7387, 1, 6857, 7387, '2016-02-17');
INSERT INTO analise_bio VALUES (7388, 1, 6858, 7388, '2016-02-17');
INSERT INTO analise_bio VALUES (7389, 1, 6859, 7389, '2016-02-17');
INSERT INTO analise_bio VALUES (7390, 1, 6860, 7390, '2016-02-17');
INSERT INTO analise_bio VALUES (7391, 1, 6861, 7391, '2016-02-17');
INSERT INTO analise_bio VALUES (7392, 1, 6862, 7392, '2016-02-17');
INSERT INTO analise_bio VALUES (7393, 1, 6863, 7393, '2016-02-17');
INSERT INTO analise_bio VALUES (7394, 1, 6864, 7394, '2016-02-17');
INSERT INTO analise_bio VALUES (7395, 1, 6865, 7395, '2016-02-17');
INSERT INTO analise_bio VALUES (7396, 1, 6866, 7396, '2016-02-17');
INSERT INTO analise_bio VALUES (7397, 1, 6867, 7397, '2016-02-17');
INSERT INTO analise_bio VALUES (7398, 1, 6868, 7398, '2016-02-17');
INSERT INTO analise_bio VALUES (7399, 1, 6869, 7399, '2016-02-17');
INSERT INTO analise_bio VALUES (7400, 1, 6870, 7400, '2016-02-17');
INSERT INTO analise_bio VALUES (7401, 1, 6871, 7401, '2016-02-17');
INSERT INTO analise_bio VALUES (7402, 1, 6872, 7402, '2016-02-17');
INSERT INTO analise_bio VALUES (7403, 1, 6873, 7403, '2016-02-17');
INSERT INTO analise_bio VALUES (7404, 1, 6874, 7404, '2016-02-17');
INSERT INTO analise_bio VALUES (7405, 1, 6875, 7405, '2016-02-17');
INSERT INTO analise_bio VALUES (7406, 1, 6876, 7406, '2016-02-17');
INSERT INTO analise_bio VALUES (7407, 1, 6877, 7407, '2016-02-17');
INSERT INTO analise_bio VALUES (7408, 1, 6878, 7408, '2016-02-17');
INSERT INTO analise_bio VALUES (7409, 1, 6879, 7409, '2016-02-17');
INSERT INTO analise_bio VALUES (7410, 1, 6880, 7410, '2016-02-17');
INSERT INTO analise_bio VALUES (7411, 1, 6881, 7411, '2016-02-17');
INSERT INTO analise_bio VALUES (7412, 1, 6882, 7412, '2016-02-17');
INSERT INTO analise_bio VALUES (7413, 1, 6883, 7413, '2016-02-17');
INSERT INTO analise_bio VALUES (7414, 1, 6884, 7414, '2016-02-17');
INSERT INTO analise_bio VALUES (7415, 1, 6885, 7415, '2016-02-17');
INSERT INTO analise_bio VALUES (7416, 1, 6886, 7416, '2016-02-17');
INSERT INTO analise_bio VALUES (7417, 1, 6887, 7417, '2016-02-17');
INSERT INTO analise_bio VALUES (7418, 1, 6888, 7418, '2016-02-17');
INSERT INTO analise_bio VALUES (7419, 1, 6889, 7419, '2016-02-17');
INSERT INTO analise_bio VALUES (7420, 1, 6890, 7420, '2016-02-17');
INSERT INTO analise_bio VALUES (7421, 1, 6891, 7421, '2016-02-17');
INSERT INTO analise_bio VALUES (7422, 1, 6892, 7422, '2016-02-17');
INSERT INTO analise_bio VALUES (7423, 1, 6893, 7423, '2016-02-17');
INSERT INTO analise_bio VALUES (7424, 1, 6894, 7424, '2016-02-17');
INSERT INTO analise_bio VALUES (7425, 1, 6895, 7425, '2016-02-17');
INSERT INTO analise_bio VALUES (7426, 1, 6896, 7426, '2016-02-17');
INSERT INTO analise_bio VALUES (7427, 1, 6897, 7427, '2016-02-17');
INSERT INTO analise_bio VALUES (7428, 1, 6898, 7428, '2016-02-17');
INSERT INTO analise_bio VALUES (7429, 1, 6899, 7429, '2016-02-17');
INSERT INTO analise_bio VALUES (7430, 1, 6900, 7430, '2016-02-17');
INSERT INTO analise_bio VALUES (7431, 1, 6901, 7431, '2016-02-17');
INSERT INTO analise_bio VALUES (7432, 1, 6902, 7432, '2016-02-17');
INSERT INTO analise_bio VALUES (7433, 1, 6903, 7433, '2016-02-17');
INSERT INTO analise_bio VALUES (7434, 1, 6904, 7434, '2016-02-17');
INSERT INTO analise_bio VALUES (7435, 1, 6905, 7435, '2016-02-17');
INSERT INTO analise_bio VALUES (7436, 1, 6906, 7436, '2016-02-17');
INSERT INTO analise_bio VALUES (7437, 1, 6907, 7437, '2016-02-17');
INSERT INTO analise_bio VALUES (7438, 1, 6908, 7438, '2016-02-17');
INSERT INTO analise_bio VALUES (7439, 1, 6909, 7439, '2016-02-17');
INSERT INTO analise_bio VALUES (7440, 1, 6910, 7440, '2016-02-17');
INSERT INTO analise_bio VALUES (7441, 1, 6911, 7441, '2016-02-17');
INSERT INTO analise_bio VALUES (7442, 1, 6912, 7442, '2016-02-17');
INSERT INTO analise_bio VALUES (7443, 1, 6913, 7443, '2016-02-17');
INSERT INTO analise_bio VALUES (7444, 1, 6914, 7444, '2016-02-17');
INSERT INTO analise_bio VALUES (7445, 1, 6915, 7445, '2016-02-17');
INSERT INTO analise_bio VALUES (7446, 1, 6916, 7446, '2016-02-17');
INSERT INTO analise_bio VALUES (7447, 1, 6917, 7447, '2016-02-17');
INSERT INTO analise_bio VALUES (7448, 1, 6918, 7448, '2016-02-17');
INSERT INTO analise_bio VALUES (7449, 1, 6919, 7449, '2016-02-17');
INSERT INTO analise_bio VALUES (7450, 1, 6920, 7450, '2016-02-17');
INSERT INTO analise_bio VALUES (7451, 1, 6921, 7451, '2016-02-17');
INSERT INTO analise_bio VALUES (7452, 1, 6922, 7452, '2016-02-17');
INSERT INTO analise_bio VALUES (7453, 1, 6923, 7453, '2016-02-17');
INSERT INTO analise_bio VALUES (7454, 1, 6924, 7454, '2016-02-17');
INSERT INTO analise_bio VALUES (7455, 1, 6925, 7455, '2016-02-17');
INSERT INTO analise_bio VALUES (7456, 1, 6926, 7456, '2016-02-17');
INSERT INTO analise_bio VALUES (7457, 1, 6927, 7457, '2016-02-17');
INSERT INTO analise_bio VALUES (7458, 1, 6928, 7458, '2016-02-17');
INSERT INTO analise_bio VALUES (7459, 1, 6929, 7459, '2016-02-17');
INSERT INTO analise_bio VALUES (7460, 1, 6930, 7460, '2016-02-17');
INSERT INTO analise_bio VALUES (7461, 1, 6931, 7461, '2016-02-17');
INSERT INTO analise_bio VALUES (7462, 1, 6932, 7462, '2016-02-17');
INSERT INTO analise_bio VALUES (7463, 1, 6933, 7463, '2016-02-17');
INSERT INTO analise_bio VALUES (7464, 1, 6934, 7464, '2016-02-17');
INSERT INTO analise_bio VALUES (7465, 1, 6935, 7465, '2016-02-17');
INSERT INTO analise_bio VALUES (7466, 1, 6936, 7466, '2016-02-17');
INSERT INTO analise_bio VALUES (7467, 1, 6937, 7467, '2016-02-17');
INSERT INTO analise_bio VALUES (7468, 1, 6938, 7468, '2016-02-17');
INSERT INTO analise_bio VALUES (7469, 1, 6939, 7469, '2016-02-17');
INSERT INTO analise_bio VALUES (7470, 1, 6940, 7470, '2016-02-17');
INSERT INTO analise_bio VALUES (7471, 1, 6941, 7471, '2016-02-17');
INSERT INTO analise_bio VALUES (7472, 1, 6942, 7472, '2016-02-17');
INSERT INTO analise_bio VALUES (7473, 1, 6943, 7473, '2016-02-17');
INSERT INTO analise_bio VALUES (7474, 1, 6944, 7474, '2016-02-17');
INSERT INTO analise_bio VALUES (7475, 1, 6945, 7475, '2016-02-17');
INSERT INTO analise_bio VALUES (7476, 1, 6946, 7476, '2016-02-17');
INSERT INTO analise_bio VALUES (7477, 1, 6947, 7477, '2016-02-17');
INSERT INTO analise_bio VALUES (7478, 1, 6948, 7478, '2016-02-17');
INSERT INTO analise_bio VALUES (7479, 1, 6949, 7479, '2016-02-17');
INSERT INTO analise_bio VALUES (7480, 1, 6950, 7480, '2016-02-17');
INSERT INTO analise_bio VALUES (7481, 1, 6951, 7481, '2016-02-17');
INSERT INTO analise_bio VALUES (7482, 1, 6952, 7482, '2016-02-17');
INSERT INTO analise_bio VALUES (7483, 1, 6953, 7483, '2016-02-17');
INSERT INTO analise_bio VALUES (7484, 1, 6954, 7484, '2016-02-17');
INSERT INTO analise_bio VALUES (7485, 1, 6955, 7485, '2016-02-17');
INSERT INTO analise_bio VALUES (7486, 1, 6956, 7486, '2016-02-17');
INSERT INTO analise_bio VALUES (7487, 1, 6957, 7487, '2016-02-17');
INSERT INTO analise_bio VALUES (7488, 1, 6958, 7488, '2016-02-17');
INSERT INTO analise_bio VALUES (7489, 1, 6959, 7489, '2016-02-17');
INSERT INTO analise_bio VALUES (7490, 1, 6960, 7490, '2016-02-17');
INSERT INTO analise_bio VALUES (7491, 1, 6961, 7491, '2016-02-17');
INSERT INTO analise_bio VALUES (7492, 1, 6962, 7492, '2016-02-17');
INSERT INTO analise_bio VALUES (7493, 1, 6963, 7493, '2016-02-17');
INSERT INTO analise_bio VALUES (7494, 1, 6964, 7494, '2016-02-17');
INSERT INTO analise_bio VALUES (7495, 1, 6965, 7495, '2016-02-17');
INSERT INTO analise_bio VALUES (7496, 1, 6966, 7496, '2016-02-17');
INSERT INTO analise_bio VALUES (7497, 1, 6967, 7497, '2016-02-17');
INSERT INTO analise_bio VALUES (7498, 1, 6968, 7498, '2016-02-17');
INSERT INTO analise_bio VALUES (7499, 1, 6969, 7499, '2016-02-17');
INSERT INTO analise_bio VALUES (7500, 1, 6970, 7500, '2016-02-17');
INSERT INTO analise_bio VALUES (7501, 1, 6971, 7501, '2016-02-17');
INSERT INTO analise_bio VALUES (7502, 1, 6972, 7502, '2016-02-17');
INSERT INTO analise_bio VALUES (7503, 1, 6973, 7503, '2016-02-17');
INSERT INTO analise_bio VALUES (7504, 1, 6974, 7504, '2016-02-17');
INSERT INTO analise_bio VALUES (7505, 1, 6975, 7505, '2016-02-17');
INSERT INTO analise_bio VALUES (7506, 1, 6976, 7506, '2016-02-17');
INSERT INTO analise_bio VALUES (7507, 1, 6977, 7507, '2016-02-17');
INSERT INTO analise_bio VALUES (7508, 1, 6978, 7508, '2016-02-17');
INSERT INTO analise_bio VALUES (7509, 1, 6979, 7509, '2016-02-17');
INSERT INTO analise_bio VALUES (7510, 1, 6980, 7510, '2016-02-17');
INSERT INTO analise_bio VALUES (7511, 1, 6981, 7511, '2016-02-17');
INSERT INTO analise_bio VALUES (7512, 1, 6982, 7512, '2016-02-17');
INSERT INTO analise_bio VALUES (7513, 1, 6983, 7513, '2016-02-17');
INSERT INTO analise_bio VALUES (7514, 1, 6984, 7514, '2016-02-17');
INSERT INTO analise_bio VALUES (7515, 1, 6985, 7515, '2016-02-17');
INSERT INTO analise_bio VALUES (7516, 1, 6986, 7516, '2016-02-17');
INSERT INTO analise_bio VALUES (7517, 1, 6987, 7517, '2016-02-17');
INSERT INTO analise_bio VALUES (7518, 1, 6988, 7518, '2016-02-17');
INSERT INTO analise_bio VALUES (7519, 1, 6989, 7519, '2016-02-17');
INSERT INTO analise_bio VALUES (7520, 1, 6990, 7520, '2016-02-17');
INSERT INTO analise_bio VALUES (7521, 1, 6991, 7521, '2016-02-17');
INSERT INTO analise_bio VALUES (7522, 1, 6992, 7522, '2016-02-17');
INSERT INTO analise_bio VALUES (7523, 1, 6993, 7523, '2016-02-17');
INSERT INTO analise_bio VALUES (7524, 1, 6994, 7524, '2016-02-17');
INSERT INTO analise_bio VALUES (7525, 1, 6995, 7525, '2016-02-17');
INSERT INTO analise_bio VALUES (7526, 1, 6996, 7526, '2016-02-17');
INSERT INTO analise_bio VALUES (7527, 1, 6997, 7527, '2016-02-17');
INSERT INTO analise_bio VALUES (7528, 1, 6998, 7528, '2016-02-17');
INSERT INTO analise_bio VALUES (7529, 1, 6999, 7529, '2016-02-17');
INSERT INTO analise_bio VALUES (7530, 1, 7000, 7530, '2016-02-17');
INSERT INTO analise_bio VALUES (7531, 1, 7001, 7531, '2016-02-17');
INSERT INTO analise_bio VALUES (7532, 1, 7002, 7532, '2016-02-17');
INSERT INTO analise_bio VALUES (7533, 1, 7003, 7533, '2016-02-17');
INSERT INTO analise_bio VALUES (7534, 1, 7004, 7534, '2016-02-17');
INSERT INTO analise_bio VALUES (7535, 1, 7005, 7535, '2016-02-17');
INSERT INTO analise_bio VALUES (7536, 1, 7006, 7536, '2016-02-17');
INSERT INTO analise_bio VALUES (7537, 1, 7007, 7537, '2016-02-17');
INSERT INTO analise_bio VALUES (7538, 1, 7008, 7538, '2016-02-17');
INSERT INTO analise_bio VALUES (7539, 1, 7009, 7539, '2016-02-17');
INSERT INTO analise_bio VALUES (7540, 1, 7010, 7540, '2016-02-17');
INSERT INTO analise_bio VALUES (7541, 1, 7011, 7541, '2016-02-17');
INSERT INTO analise_bio VALUES (7542, 1, 7012, 7542, '2016-02-17');
INSERT INTO analise_bio VALUES (7543, 1, 7013, 7543, '2016-02-17');
INSERT INTO analise_bio VALUES (7544, 1, 7014, 7544, '2016-02-17');
INSERT INTO analise_bio VALUES (7545, 1, 7015, 7545, '2016-02-17');
INSERT INTO analise_bio VALUES (7546, 1, 7016, 7546, '2016-02-17');
INSERT INTO analise_bio VALUES (7547, 1, 7017, 7547, '2016-02-17');
INSERT INTO analise_bio VALUES (7548, 1, 7018, 7548, '2016-02-17');
INSERT INTO analise_bio VALUES (7549, 1, 7019, 7549, '2016-02-17');
INSERT INTO analise_bio VALUES (7550, 1, 7020, 7550, '2016-02-17');
INSERT INTO analise_bio VALUES (7551, 1, 7021, 7551, '2016-02-17');
INSERT INTO analise_bio VALUES (7552, 1, 7022, 7552, '2016-02-17');
INSERT INTO analise_bio VALUES (7553, 1, 7023, 7553, '2016-02-17');
INSERT INTO analise_bio VALUES (7554, 1, 7024, 7554, '2016-02-17');
INSERT INTO analise_bio VALUES (7555, 1, 7025, 7555, '2016-02-17');
INSERT INTO analise_bio VALUES (7556, 1, 7026, 7556, '2016-02-17');
INSERT INTO analise_bio VALUES (7557, 1, 7027, 7557, '2016-02-17');
INSERT INTO analise_bio VALUES (7558, 1, 7028, 7558, '2016-02-17');
INSERT INTO analise_bio VALUES (7559, 1, 7029, 7559, '2016-02-17');
INSERT INTO analise_bio VALUES (7560, 1, 7030, 7560, '2016-02-17');
INSERT INTO analise_bio VALUES (7561, 1, 7031, 7561, '2016-02-17');
INSERT INTO analise_bio VALUES (7562, 1, 7032, 7562, '2016-02-17');
INSERT INTO analise_bio VALUES (7563, 1, 7033, 7563, '2016-02-17');
INSERT INTO analise_bio VALUES (7564, 1, 7034, 7564, '2016-02-17');
INSERT INTO analise_bio VALUES (7565, 1, 7035, 7565, '2016-02-17');
INSERT INTO analise_bio VALUES (7566, 1, 7036, 7566, '2016-02-17');
INSERT INTO analise_bio VALUES (7567, 1, 7037, 7567, '2016-02-17');
INSERT INTO analise_bio VALUES (7568, 1, 7038, 7568, '2016-02-17');
INSERT INTO analise_bio VALUES (7569, 1, 7039, 7569, '2016-02-17');
INSERT INTO analise_bio VALUES (7570, 1, 7040, 7570, '2016-02-17');
INSERT INTO analise_bio VALUES (7571, 1, 7041, 7571, '2016-02-17');
INSERT INTO analise_bio VALUES (7572, 1, 7042, 7572, '2016-02-17');
INSERT INTO analise_bio VALUES (7573, 1, 7043, 7573, '2016-02-17');
INSERT INTO analise_bio VALUES (7574, 1, 7044, 7574, '2016-02-17');
INSERT INTO analise_bio VALUES (7575, 1, 7045, 7575, '2016-02-17');
INSERT INTO analise_bio VALUES (7576, 1, 7046, 7576, '2016-02-17');
INSERT INTO analise_bio VALUES (7577, 1, 7047, 7577, '2016-02-17');
INSERT INTO analise_bio VALUES (7578, 1, 7048, 7578, '2016-02-17');
INSERT INTO analise_bio VALUES (7579, 1, 7049, 7579, '2016-02-17');
INSERT INTO analise_bio VALUES (7580, 1, 7050, 7580, '2016-02-17');
INSERT INTO analise_bio VALUES (7581, 1, 7051, 7581, '2016-02-17');
INSERT INTO analise_bio VALUES (7582, 1, 7052, 7582, '2016-02-17');
INSERT INTO analise_bio VALUES (7583, 1, 7053, 7583, '2016-02-17');
INSERT INTO analise_bio VALUES (7584, 1, 7054, 7584, '2016-02-17');
INSERT INTO analise_bio VALUES (7585, 1, 7055, 7585, '2016-02-17');
INSERT INTO analise_bio VALUES (7586, 1, 7056, 7586, '2016-02-17');
INSERT INTO analise_bio VALUES (7587, 1, 7057, 7587, '2016-02-17');
INSERT INTO analise_bio VALUES (7588, 1, 7058, 7588, '2016-02-17');
INSERT INTO analise_bio VALUES (7589, 1, 7059, 7589, '2016-02-17');
INSERT INTO analise_bio VALUES (7590, 1, 7060, 7590, '2016-02-17');
INSERT INTO analise_bio VALUES (7591, 1, 7061, 7591, '2016-02-17');
INSERT INTO analise_bio VALUES (7592, 1, 7062, 7592, '2016-02-17');
INSERT INTO analise_bio VALUES (7593, 1, 7063, 7593, '2016-02-17');
INSERT INTO analise_bio VALUES (7594, 1, 7064, 7594, '2016-02-17');
INSERT INTO analise_bio VALUES (7595, 1, 7065, 7595, '2016-02-17');
INSERT INTO analise_bio VALUES (7596, 1, 7066, 7596, '2016-02-17');
INSERT INTO analise_bio VALUES (7597, 1, 7067, 7597, '2016-02-17');
INSERT INTO analise_bio VALUES (7598, 1, 7068, 7598, '2016-02-17');
INSERT INTO analise_bio VALUES (7599, 1, 7069, 7599, '2016-02-17');
INSERT INTO analise_bio VALUES (7600, 1, 7070, 7600, '2016-02-17');
INSERT INTO analise_bio VALUES (7601, 1, 7071, 7601, '2016-02-17');
INSERT INTO analise_bio VALUES (7602, 1, 7072, 7602, '2016-02-17');
INSERT INTO analise_bio VALUES (7603, 1, 7073, 7603, '2016-02-17');
INSERT INTO analise_bio VALUES (7604, 1, 7074, 7604, '2016-02-17');
INSERT INTO analise_bio VALUES (7605, 1, 7075, 7605, '2016-02-17');
INSERT INTO analise_bio VALUES (7606, 1, 7076, 7606, '2016-02-17');
INSERT INTO analise_bio VALUES (7607, 1, 7077, 7607, '2016-02-17');
INSERT INTO analise_bio VALUES (7608, 1, 7078, 7608, '2016-02-17');
INSERT INTO analise_bio VALUES (7609, 1, 7079, 7609, '2016-02-17');
INSERT INTO analise_bio VALUES (7610, 1, 7080, 7610, '2016-02-17');
INSERT INTO analise_bio VALUES (7611, 1, 7081, 7611, '2016-02-17');
INSERT INTO analise_bio VALUES (7612, 1, 7082, 7612, '2016-02-17');
INSERT INTO analise_bio VALUES (7613, 1, 7083, 7613, '2016-02-17');
INSERT INTO analise_bio VALUES (7614, 1, 7084, 7614, '2016-02-17');
INSERT INTO analise_bio VALUES (7615, 1, 7085, 7615, '2016-02-17');
INSERT INTO analise_bio VALUES (7616, 1, 7086, 7616, '2016-02-17');
INSERT INTO analise_bio VALUES (7617, 1, 7087, 7617, '2016-02-17');
INSERT INTO analise_bio VALUES (7618, 1, 7088, 7618, '2016-02-17');
INSERT INTO analise_bio VALUES (7619, 1, 7089, 7619, '2016-02-17');
INSERT INTO analise_bio VALUES (7620, 1, 7090, 7620, '2016-02-17');
INSERT INTO analise_bio VALUES (7621, 1, 7091, 7621, '2016-02-17');
INSERT INTO analise_bio VALUES (7622, 1, 7092, 7622, '2016-02-17');
INSERT INTO analise_bio VALUES (7623, 1, 7093, 7623, '2016-02-17');
INSERT INTO analise_bio VALUES (7624, 1, 7094, 7624, '2016-02-17');
INSERT INTO analise_bio VALUES (7625, 1, 7095, 7625, '2016-02-17');
INSERT INTO analise_bio VALUES (7626, 1, 7096, 7626, '2016-02-17');
INSERT INTO analise_bio VALUES (7627, 1, 7097, 7627, '2016-02-17');
INSERT INTO analise_bio VALUES (7628, 1, 7098, 7628, '2016-02-17');
INSERT INTO analise_bio VALUES (7629, 1, 7099, 7629, '2016-02-17');
INSERT INTO analise_bio VALUES (7630, 1, 7100, 7630, '2016-02-17');
INSERT INTO analise_bio VALUES (7631, 1, 7101, 7631, '2016-02-17');
INSERT INTO analise_bio VALUES (7632, 1, 7102, 7632, '2016-02-17');
INSERT INTO analise_bio VALUES (7633, 1, 7103, 7633, '2016-02-17');
INSERT INTO analise_bio VALUES (7634, 1, 7104, 7634, '2016-02-17');
INSERT INTO analise_bio VALUES (7635, 1, 7105, 7635, '2016-02-17');
INSERT INTO analise_bio VALUES (7636, 1, 7106, 7636, '2016-02-17');
INSERT INTO analise_bio VALUES (7637, 1, 7107, 7637, '2016-02-17');
INSERT INTO analise_bio VALUES (7638, 1, 7108, 7638, '2016-02-17');
INSERT INTO analise_bio VALUES (7639, 1, 7109, 7639, '2016-02-17');
INSERT INTO analise_bio VALUES (7640, 1, 7110, 7640, '2016-02-17');
INSERT INTO analise_bio VALUES (7641, 1, 7111, 7641, '2016-02-17');
INSERT INTO analise_bio VALUES (7642, 1, 7112, 7642, '2016-02-17');
INSERT INTO analise_bio VALUES (7643, 1, 7113, 7643, '2016-02-17');
INSERT INTO analise_bio VALUES (7644, 1, 7114, 7644, '2016-02-17');
INSERT INTO analise_bio VALUES (7645, 1, 7115, 7645, '2016-02-17');
INSERT INTO analise_bio VALUES (7646, 1, 7116, 7646, '2016-02-17');
INSERT INTO analise_bio VALUES (7647, 1, 7117, 7647, '2016-02-17');
INSERT INTO analise_bio VALUES (7648, 1, 7118, 7648, '2016-02-17');
INSERT INTO analise_bio VALUES (7649, 1, 7119, 7649, '2016-02-17');
INSERT INTO analise_bio VALUES (7650, 1, 7120, 7650, '2016-02-17');
INSERT INTO analise_bio VALUES (7651, 1, 7121, 7651, '2016-02-17');
INSERT INTO analise_bio VALUES (7652, 1, 7122, 7652, '2016-02-17');
INSERT INTO analise_bio VALUES (7653, 1, 7123, 7653, '2016-02-17');
INSERT INTO analise_bio VALUES (7654, 1, 7124, 7654, '2016-02-17');
INSERT INTO analise_bio VALUES (7655, 1, 7125, 7655, '2016-02-17');
INSERT INTO analise_bio VALUES (7656, 1, 7126, 7656, '2016-02-17');
INSERT INTO analise_bio VALUES (7657, 1, 7127, 7657, '2016-02-17');
INSERT INTO analise_bio VALUES (7658, 1, 7128, 7658, '2016-02-17');
INSERT INTO analise_bio VALUES (7659, 1, 7129, 7659, '2016-02-17');
INSERT INTO analise_bio VALUES (7660, 1, 7130, 7660, '2016-02-17');
INSERT INTO analise_bio VALUES (7661, 1, 7131, 7661, '2016-02-17');
INSERT INTO analise_bio VALUES (7662, 1, 7132, 7662, '2016-02-17');
INSERT INTO analise_bio VALUES (7663, 1, 7133, 7663, '2016-02-17');
INSERT INTO analise_bio VALUES (7664, 1, 7134, 7664, '2016-02-17');
INSERT INTO analise_bio VALUES (7665, 1, 7135, 7665, '2016-02-17');
INSERT INTO analise_bio VALUES (7666, 1, 7136, 7666, '2016-02-17');
INSERT INTO analise_bio VALUES (7667, 1, 7137, 7667, '2016-02-17');
INSERT INTO analise_bio VALUES (7668, 1, 7138, 7668, '2016-02-17');


--
-- TOC entry 2231 (class 0 OID 107146)
-- Dependencies: 171
-- Data for Name: configuracao; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--



--
-- TOC entry 2240 (class 0 OID 107215)
-- Dependencies: 180
-- Data for Name: dados_gerais; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--



--
-- TOC entry 2233 (class 0 OID 107162)
-- Dependencies: 173
-- Data for Name: dados_taxon; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--

INSERT INTO dados_taxon VALUES (5788225, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Hyporthodus', 'Hyporthodus niveatus', '', 'SPECIES', 'Hyporthodus niveatus (Valenciennes, 1828)');
INSERT INTO dados_taxon VALUES (2357064, 'Animalia', 'Chordata', 'Actinopterygii', 'Beryciformes', 'Holocentridae', 'Myripristis', 'Myripristis jacobus', '', 'SPECIES', 'Myripristis jacobus Cuvier, 1829');
INSERT INTO dados_taxon VALUES (2384275, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Halichoeres', 'Halichoeres poeyi', '', 'SPECIES', 'Halichoeres poeyi (Steindachner, 1867)');
INSERT INTO dados_taxon VALUES (2403816, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax miliaris', '', 'SPECIES', 'Gymnothorax miliaris (Kaup, 1856)');
INSERT INTO dados_taxon VALUES (2388808, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Cephalopholis', '', '', 'GENUS', 'Cephalopholis Bloch & Schneider, 1801');
INSERT INTO dados_taxon VALUES (2396519, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacanthidae', 'Centropyge', 'Centropyge aurantonotus', '', 'SPECIES', 'Centropyge aurantonotus Burgess, 1974');
INSERT INTO dados_taxon VALUES (2404065, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax moringa', '', 'SPECIES', 'Gymnothorax moringa (Cuvier, 1829)');
INSERT INTO dados_taxon VALUES (5961709, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Seriola', 'Seriola fasciata', '', 'SPECIES', 'Seriola fasciata (Bloch, 1793)');
INSERT INTO dados_taxon VALUES (5211452, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacanthidae', 'Holacanthus', 'Holacanthus ciliaris', '', 'SPECIES', 'Holacanthus ciliaris (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2389125, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Dermatolepis', 'Dermatolepis inermis', '', 'SPECIES', 'Dermatolepis inermis (Valenciennes, 1833)');
INSERT INTO dados_taxon VALUES (2384721, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Lutjanidae', 'Rhomboplites', 'Rhomboplites aurorubens', '', 'SPECIES', 'Rhomboplites aurorubens (Cuvier, 1829)');
INSERT INTO dados_taxon VALUES (2389831, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Malacanthidae', 'Lopholatilus', 'Lopholatilus villarii', '', 'SPECIES', 'Lopholatilus villarii Miranda Ribeiro, 1915');
INSERT INTO dados_taxon VALUES (2384856, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Lutjanidae', 'Lutjanus', 'Lutjanus vivanus', '', 'SPECIES', 'Lutjanus vivanus (Cuvier, 1828)');
INSERT INTO dados_taxon VALUES (2390762, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Caranx', 'Caranx crysos', '', 'SPECIES', 'Caranx crysos (Mitchill, 1815)');
INSERT INTO dados_taxon VALUES (5961696, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Seriola', 'Seriola dumerili', '', 'SPECIES', 'Seriola dumerili (Risso, 1810)');
INSERT INTO dados_taxon VALUES (2388809, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Cephalopholis', 'Cephalopholis fulva', '', 'SPECIES', 'Cephalopholis fulva (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2407087, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Balistidae', 'Canthidermis', 'Canthidermis sufflamen', '', 'SPECIES', 'Canthidermis sufflamen (Mitchill, 1815)');
INSERT INTO dados_taxon VALUES (2393936, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Sparisoma', 'Sparisoma tuiupiranga', '', 'SPECIES', 'Sparisoma tuiupiranga Gasparini, Joyeux & Floeter, 2003');
INSERT INTO dados_taxon VALUES (2407103, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Balistidae', 'Balistes', 'Balistes vetula', '', 'SPECIES', 'Balistes vetula Linnaeus, 1758');
INSERT INTO dados_taxon VALUES (2388708, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Serranus', 'Serranus annularis', '', 'SPECIES', 'Serranus annularis (GÃ¼nther, 1880)');
INSERT INTO dados_taxon VALUES (2374069, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scombridae', 'Acanthocybium', 'Acanthocybium solandri', '', 'SPECIES', 'Acanthocybium solandri (Cuvier, 1832)');
INSERT INTO dados_taxon VALUES (5211450, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacanthidae', 'Holacanthus', 'Holacanthus tricolor', '', 'SPECIES', 'Holacanthus tricolor (Bloch, 1795)');
INSERT INTO dados_taxon VALUES (5204778, 'Animalia', 'Chordata', 'Actinopterygii', 'Beryciformes', 'Holocentridae', 'Holocentrus', 'Holocentrus adscensionis', '', 'SPECIES', 'Holocentrus adscensionis (Osbeck, 1765)');
INSERT INTO dados_taxon VALUES (2418234, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Carcharhinidae', 'Galeocerdo', 'Galeocerdo cuvier', '', 'SPECIES', 'Galeocerdo cuvier (PÃ©ron & Lesueur, 1822)');
INSERT INTO dados_taxon VALUES (5209181, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Acanthuridae', 'Acanthurus', 'Acanthurus bahianus', '', 'SPECIES', 'Acanthurus bahianus Castelnau, 1855');
INSERT INTO dados_taxon VALUES (5212213, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Chromis', 'Chromis enchrysura', '', 'SPECIES', 'Chromis enchrysura Jordan & Gilbert, 1882');
INSERT INTO dados_taxon VALUES (2384245, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Halichoeres', 'Halichoeres dimidiatus', '', 'SPECIES', 'Halichoeres dimidiatus (Agassiz, 1831)');
INSERT INTO dados_taxon VALUES (2403798, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax polygonius', '', 'SPECIES', 'Gymnothorax polygonius Poey, 1875');
INSERT INTO dados_taxon VALUES (2393901, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Sparisoma', 'Sparisoma radians', '', 'SPECIES', 'Sparisoma radians (Valenciennes, 1840)');
INSERT INTO dados_taxon VALUES (5212165, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Chromis', 'Chromis jubauna', '', 'SPECIES', 'Chromis jubauna Moura, 1995');
INSERT INTO dados_taxon VALUES (2377830, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gobiidae', 'Coryphopterus', 'Coryphopterus thrix', '', 'SPECIES', 'Coryphopterus thrix BÃ¶hlke & Robins, 1960');
INSERT INTO dados_taxon VALUES (2406748, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Monacanthidae', 'Aluterus', 'Aluterus schoepfii', '', 'SPECIES', 'Aluterus schoepfii (Walbaum, 1792)');
INSERT INTO dados_taxon VALUES (2418312, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Triakidae', 'Mustelus', 'Mustelus canis', '', 'SPECIES', 'Mustelus canis (Mitchill, 1815)');
INSERT INTO dados_taxon VALUES (2388373, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Epinephelus', 'Epinephelus morio', '', 'SPECIES', 'Epinephelus morio (Valenciennes, 1828)');
INSERT INTO dados_taxon VALUES (5209188, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Acanthuridae', 'Acanthurus', 'Acanthurus coeruleus', '', 'SPECIES', 'Acanthurus coeruleus Bloch & Schneider, 1801');
INSERT INTO dados_taxon VALUES (2376682, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gobiidae', 'Elacatinus', '', '', 'GENUS', 'Elacatinus Jordan, 1904');
INSERT INTO dados_taxon VALUES (2398843, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Stegastes', 'Stegastes pictus', '', 'SPECIES', 'Stegastes pictus (Castelnau, 1855)');
INSERT INTO dados_taxon VALUES (2389881, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Malacanthidae', 'Malacanthus', 'Malacanthus plumieri', '', 'SPECIES', 'Malacanthus plumieri (Bloch, 1786)');
INSERT INTO dados_taxon VALUES (5212222, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Chromis', 'Chromis multilineata', '', 'SPECIES', 'Chromis multilineata (Guichenot, 1853)');
INSERT INTO dados_taxon VALUES (2375993, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gobiidae', 'Lythrypnus', '', '', 'GENUS', 'Lythrypnus Jordan & Evermann, 1896');
INSERT INTO dados_taxon VALUES (2385344, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Chaetodontidae', 'Chaetodon', 'Chaetodon striatus', '', 'SPECIES', 'Chaetodon striatus Linnaeus, 1758');
INSERT INTO dados_taxon VALUES (5201123, 'Animalia', 'Chordata', 'Actinopterygii', 'Syngnathiformes', 'Syngnathidae', 'Hippocampus', 'Hippocampus reidi', '', 'SPECIES', 'Hippocampus reidi Ginsburg, 1933');
INSERT INTO dados_taxon VALUES (2393931, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Sparisoma', 'Sparisoma amplum', '', 'SPECIES', 'Sparisoma amplum (Ranzani, 1841)');
INSERT INTO dados_taxon VALUES (5212651, 'Animalia', 'Chordata', 'Actinopterygii', 'Aulopiformes', 'Synodontidae', 'Synodus', 'Synodus foetens', '', 'SPECIES', 'Synodus foetens (Linnaeus, 1766)');
INSERT INTO dados_taxon VALUES (2407732, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Tetraodontidae', 'Canthigaster', 'Canthigaster figueiredoi', '', 'SPECIES', 'Canthigaster figueiredoi Moura & Castro, 2002');
INSERT INTO dados_taxon VALUES (5209681, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Bodianus', 'Bodianus pulchellus', '', 'SPECIES', 'Bodianus pulchellus (Poey, 1860)');
INSERT INTO dados_taxon VALUES (5212237, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Chromis', 'Chromis flavicauda', '', 'SPECIES', 'Chromis flavicauda (GÃ¼nther, 1880)');
INSERT INTO dados_taxon VALUES (2390847, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Caranx', 'Caranx latus', '', 'SPECIES', 'Caranx latus Agassiz, 1831');
INSERT INTO dados_taxon VALUES (2419499, 'Animalia', 'Chordata', 'Elasmobranchii', 'Rajiformes', 'Dasyatidae', 'Dasyatis', 'Dasyatis centroura', '', 'SPECIES', 'Dasyatis centroura (Mitchill, 1815)');
INSERT INTO dados_taxon VALUES (2418109, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Carcharhinidae', 'Carcharhinus', 'Carcharhinus falciformis', '', 'SPECIES', 'Carcharhinus falciformes (MÃ¼ller & Henle, 1839)');
INSERT INTO dados_taxon VALUES (2417495, 'Animalia', 'Chordata', 'Elasmobranchii', 'Orectolobiformes', 'Ginglymostomatidae', 'Ginglymostoma', 'Ginglymostoma cirratum', '', 'SPECIES', 'Ginglymostoma cirratum (Bonnaterre, 1788)');
INSERT INTO dados_taxon VALUES (2381286, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Kyphosidae', 'Kyphosus', '', '', 'GENUS', 'Kyphosus LacepÃ¨de, 1801');
INSERT INTO dados_taxon VALUES (2389044, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Mycteroperca', 'Mycteroperca interstitialis', '', 'SPECIES', 'Mycteroperca interstitialis (Poey, 1860)');
INSERT INTO dados_taxon VALUES (2378717, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gobiidae', 'Gnatholepis', 'Gnatholepis thompsoni', '', 'SPECIES', 'Gnatholepis thompsoni Jordan, 1904');
INSERT INTO dados_taxon VALUES (2385289, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Lutjanidae', 'Ocyurus', 'Ocyurus chrysurus', '', 'SPECIES', 'Lutjanus chrysurus (Bloch, 1791)');
INSERT INTO dados_taxon VALUES (2396844, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Mullidae', 'Mulloidichthys', 'Mulloidichthys martinicus', '', 'SPECIES', 'Mulloidichthys martinicus (Cuvier, 1829)');
INSERT INTO dados_taxon VALUES (5216248, 'Animalia', 'Chordata', 'Elasmobranchii', 'Lamniformes', 'Lamnidae', 'Isurus', 'Isurus oxyrinchus', '', 'SPECIES', 'Isurus oxyrinchus Rafinesque, 1810');
INSERT INTO dados_taxon VALUES (5213455, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Monacanthidae', 'Stephanolepis', 'Stephanolepis hispidus', '', 'SPECIES', 'Stephanolepis hispidus (Linnaeus, 1766)');
INSERT INTO dados_taxon VALUES (2418052, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Carcharhinidae', 'Carcharhinus', 'Carcharhinus longimanus', '', 'SPECIES', 'Carcharhinus longimanus (Poey, 1861)');
INSERT INTO dados_taxon VALUES (5961708, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Seriola', 'Seriola lalandi', '', 'SPECIES', 'Seriola lalandi Valenciennes, 1833');
INSERT INTO dados_taxon VALUES (2387497, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Pronotogrammus', 'Pronotogrammus martinicensis', '', 'SPECIES', 'Pronotogrammus martinicensis (Guichenot, 1868)');
INSERT INTO dados_taxon VALUES (2410398, 'Animalia', 'Chordata', 'Actinopterygii', 'Polymixiiformes', 'Polymixiidae', 'Polymixia', 'Polymixia lowei', '', 'SPECIES', 'Polymixia lowei GÃ¼nther, 1859');
INSERT INTO dados_taxon VALUES (5209748, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Clepticus', 'Clepticus brasiliensis', '', 'SPECIES', 'Clepticus brasiliensis Heiser, Moura & Robertson, 2000');
INSERT INTO dados_taxon VALUES (5210100, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Pseudogramma', 'Pseudogramma gregoryi', '', 'SPECIES', 'Pseudogramma gregoryi (Breder, 1927)');
INSERT INTO dados_taxon VALUES (2374013, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scombridae', 'Thunnus', 'Thunnus albacares', '', 'SPECIES', 'Thunnus albacares (Bonnaterre, 1788)');
INSERT INTO dados_taxon VALUES (2389034, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Mycteroperca', 'Mycteroperca venenosa', '', 'SPECIES', 'Mycteroperca venenosa (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2407141, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Balistidae', 'Melichthys', 'Melichthys niger', '', 'SPECIES', 'Melichthys niger (Bloch, 1786)');
INSERT INTO dados_taxon VALUES (2396970, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Apogonidae', 'Phaeoptyx', 'Phaeoptyx pigmentaria', '', 'SPECIES', 'Phaeoptyx pigmentaria (Poey, 1860)');
INSERT INTO dados_taxon VALUES (5211723, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Apogonidae', 'Apogon', 'Apogon pseudomaculatus', '', 'SPECIES', 'Apogon pseudomaculatus Longley, 1932');
INSERT INTO dados_taxon VALUES (2397850, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Xiphiidae', 'Xiphias', 'Xiphias gladius', '', 'SPECIES', 'Xiphias gladius Linnaeus, 1758');
INSERT INTO dados_taxon VALUES (2332598, 'Animalia', 'Chordata', 'Actinopterygii', 'Syngnathiformes', 'Aulostomidae', 'Aulostomus', 'Aulostomus strigosus', '', 'SPECIES', 'Aulostomus strigosus Wheeler, 1955');
INSERT INTO dados_taxon VALUES (2401132, 'Animalia', 'Chordata', 'Actinopterygii', 'Aulopiformes', 'Synodontidae', 'Saurida', '', '', 'GENUS', 'Saurida Valenciennes in Cuvier & Valenciennes, 1850');
INSERT INTO dados_taxon VALUES (2375113, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Cirrhitidae', 'Amblycirrhitus', 'Amblycirrhitus pinos', '', 'SPECIES', 'Amblycirrhitus pinos (Mowbray, 1927)');
INSERT INTO dados_taxon VALUES (2417940, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Carcharhinidae', 'Prionace', 'Prionace glauca', '', 'SPECIES', 'Prionace glauca (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2385620, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Chaetodontidae', 'Prognathodes', 'Prognathodes brasiliensis', '', 'SPECIES', 'Prognathodes brasiliensis Burgess, 2001');
INSERT INTO dados_taxon VALUES (2406708, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Monacanthidae', 'Aluterus', 'Aluterus monoceros', '', 'SPECIES', 'Aluterus monoceros (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2381939, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Coryphaenidae', 'Coryphaena', 'Coryphaena hippurus', '', 'SPECIES', 'Coryphaena hippurus Linnaeus, 1758');
INSERT INTO dados_taxon VALUES (2393551, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Cryptotomus', 'Cryptotomus roseus', '', 'SPECIES', 'Cryptotomus roseus Cope, 1871');
INSERT INTO dados_taxon VALUES (5788047, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Chaenopsidae', 'Emblemariopsis', 'Emblemariopsis signifer', '', 'SPECIES', 'Emblemariopsis signifer (Ginsburg, 1942)');
INSERT INTO dados_taxon VALUES (5210913, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Sparidae', 'Pagrus', 'Pagrus pagrus', '', 'SPECIES', 'Pagrus pagrus (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2394277, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Sphyraenidae', 'Sphyraena', 'Sphyraena barracuda', '', 'SPECIES', 'Sphyraena barracuda (Edwards, 1771)');
INSERT INTO dados_taxon VALUES (2385404, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Chaetodontidae', 'Chaetodon', 'Chaetodon sedentarius', '', 'SPECIES', 'Chaetodon sedentarius Poey, 1860');
INSERT INTO dados_taxon VALUES (2385615, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Chaetodontidae', 'Prognathodes', 'Prognathodes guyanensis', '', 'SPECIES', 'Prognathodes guyannensis (Durand, 1960)');
INSERT INTO dados_taxon VALUES (2388747, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Serranus', 'Serranus phoebe', '', 'SPECIES', 'Serranus phoebe Poey, 1851');
INSERT INTO dados_taxon VALUES (2390537, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Alectis', 'Alectis ciliaris', '', 'SPECIES', 'Alectis ciliaris (Bloch, 1787)');
INSERT INTO dados_taxon VALUES (5213361, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Diodontidae', 'Diodon', 'Diodon holocanthus', '', 'SPECIES', 'Diodon holocanthus Linnaeus, 1758');
INSERT INTO dados_taxon VALUES (2408186, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Ostraciidae', 'Acanthostracion', 'Acanthostracion polygonius', '', 'SPECIES', 'Acanthostracion polygonius Poey, 1876');
INSERT INTO dados_taxon VALUES (2419426, 'Animalia', 'Chordata', 'Elasmobranchii', 'Rajiformes', 'Dasyatidae', 'Pteroplatytrygon', 'Pteroplatytrygon violacea', '', 'SPECIES', 'Pteroplatytrygon violacea (Bonaparte, 1832)');
INSERT INTO dados_taxon VALUES (2391064, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Decapterus', 'Decapterus macarellus', '', 'SPECIES', 'Decapterus macarellus (Cuvier, 1833)');
INSERT INTO dados_taxon VALUES (2356819, 'Animalia', 'Chordata', 'Actinopterygii', 'Beryciformes', 'Holocentridae', 'Sargocentron', 'Sargocentron bullisi', '', 'SPECIES', 'Sargocentron bullisi (Woods, 1955)');
INSERT INTO dados_taxon VALUES (5209174, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Acanthuridae', 'Acanthurus', 'Acanthurus chirurgus', '', 'SPECIES', 'Acanthurus chirurgus (Bloch, 1787)');
INSERT INTO dados_taxon VALUES (5209687, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Bodianus', 'Bodianus rufus', '', 'SPECIES', 'Bodianus rufus (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2399845, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Sciaenidae', 'Equetus', 'Equetus lanceolatus', '', 'SPECIES', 'Equetus lanceolatus (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2347492, 'Animalia', 'Chordata', 'Actinopterygii', 'Stomiiformes', 'Sternoptychidae', 'Maurolicus', 'Maurolicus stehmanni', '', 'SPECIES', 'Maurolicus stehmanni Parin & Kobyliansky, 1993');
INSERT INTO dados_taxon VALUES (2403802, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax ocellatus', '', 'SPECIES', 'Gymnothorax ocellatus Agassiz, 1831');
INSERT INTO dados_taxon VALUES (5853038, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Halichoeres', 'Halichoeres rubrovirens', '', 'SPECIES', 'Halichoeres rubrovirens Rocha, Pinheiro & Gasparini, 2010');
INSERT INTO dados_taxon VALUES (5211671, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Apogonidae', 'Apogon', 'Apogon americanus', '', 'SPECIES', 'Apogon americanus Castelnau, 1855');
INSERT INTO dados_taxon VALUES (5210446, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Elagatis', 'Elagatis bipinnulata', '', 'SPECIES', 'Elagatis bipinnulata (Quoy & Gaimard, 1825)');
INSERT INTO dados_taxon VALUES (2397724, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gempylidae', 'Lepidocybium', 'Lepidocybium flavobrunneum', '', 'SPECIES', 'Lepidocybium flavobrunneum (Smith, 1843)');
INSERT INTO dados_taxon VALUES (2396813, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Mullidae', 'Pseudupeneus', 'Pseudupeneus maculatus', '', 'SPECIES', 'Pseudupeneus maculatus (Bloch, 1793)');
INSERT INTO dados_taxon VALUES (5961682, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Seriola', 'Seriola rivoliana', '', 'SPECIES', 'Seriola rivoliana Valenciennes, 1833');
INSERT INTO dados_taxon VALUES (2397873, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Istiophoridae', 'Makaira', 'Makaira nigricans', '', 'SPECIES', 'Makaira nigricans LacepÃ¨de, 1802');
INSERT INTO dados_taxon VALUES (2384531, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Thalassoma', 'Thalassoma noronhanum', '', 'SPECIES', 'Thalassoma noronhanum (Boulenger, 1890)');
INSERT INTO dados_taxon VALUES (2388737, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Serranus', 'Serranus baldwini', '', 'SPECIES', 'Serranus baldwini (Evermann & Marsh, 1899)');
INSERT INTO dados_taxon VALUES (2350821, 'Animalia', 'Chordata', 'Actinopterygii', 'Batrachoidiformes', 'Batrachoididae', 'Porichthys', 'Porichthys porosissimus', '', 'SPECIES', 'Porichthys porosissimus (Cuvier, 1829)');
INSERT INTO dados_taxon VALUES (2334693, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Pontinus', 'Pontinus rathbuni', '', 'SPECIES', 'Pontinus rathbuni Goode & Bean, 1896');
INSERT INTO dados_taxon VALUES (2393899, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Sparisoma', 'Sparisoma frondosum', '', 'SPECIES', 'Sparisoma frondosum (Agassiz, 1831)');
INSERT INTO dados_taxon VALUES (2415317, 'Animalia', 'Chordata', 'Actinopterygii', 'Zeiformes', 'Zenionidae', 'Zenion', 'Zenion hololepis', '', 'SPECIES', 'Zenion hololepis (Goode & Bean, 1896)');
INSERT INTO dados_taxon VALUES (2387913, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Anthias', 'Anthias menezesi', '', 'SPECIES', 'Anthias menezesi Anderson & Heemstra, 1980');
INSERT INTO dados_taxon VALUES (5212673, 'Animalia', 'Chordata', 'Actinopterygii', 'Aulopiformes', 'Synodontidae', 'Synodus', 'Synodus intermedius', '', 'SPECIES', 'Synodus intermedius (Spix & Agassiz, 1829)');
INSERT INTO dados_taxon VALUES (2390836, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Caranx', 'Caranx lugubris', '', 'SPECIES', 'Caranx lugubris Poey, 1860');
INSERT INTO dados_taxon VALUES (2390989, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Caranx', 'Caranx ruber', '', 'SPECIES', 'Caranx ruber (Bloch, 1793)');
INSERT INTO dados_taxon VALUES (2403964, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax funebris', '', 'SPECIES', 'Gymnothorax funebris Ranzani, 1839');
INSERT INTO dados_taxon VALUES (2406957, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Monacanthidae', 'Cantherhines', 'Cantherhines macrocerus', '', 'SPECIES', 'Cantherhines macrocerus (Hollard, 1853)');
INSERT INTO dados_taxon VALUES (2334586, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaena', 'Scorpaena brachyptera', '', 'SPECIES', 'Scorpaena brachyptera Eschmeyer, 1965');
INSERT INTO dados_taxon VALUES (2409465, 'Animalia', 'Chordata', 'Actinopterygii', 'Pleuronectiformes', 'Cynoglossidae', 'Symphurus', 'Symphurus plagusia', '', 'SPECIES', 'Symphurus plagusia (Bloch & Schneider, 1801)');
INSERT INTO dados_taxon VALUES (2406961, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Monacanthidae', 'Cantherhines', 'Cantherhines pullus', '', 'SPECIES', 'Cantherhines pullus (Ranzani, 1842)');
INSERT INTO dados_taxon VALUES (2399906, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Sciaenidae', 'Pareques', 'Pareques acuminatus', '', 'SPECIES', 'Pareques acuminatus (Bloch & Schneider, 1801)');
INSERT INTO dados_taxon VALUES (5852347, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Sparisoma', 'Sparisoma rocha', '', 'SPECIES', 'Sparisoma rocha Pinheiro, Gasparini & Sazima, 2010');
INSERT INTO dados_taxon VALUES (2334636, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaena', 'Scorpaena dispar', '', 'SPECIES', 'Scorpaena dispar Longley & Hildebrand, 1940');
INSERT INTO dados_taxon VALUES (2404442, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Ophichthidae', 'Pseudomyrophis', 'Pseudomyrophis frio', '', 'SPECIES', 'Pseudomyrophis frio (Jordan & Davis, 1891)');
INSERT INTO dados_taxon VALUES (5213187, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Ophichthidae', 'Ophichthus', 'Ophichthus gomesii', '', 'SPECIES', 'Ophichthus gomesi (Castelnau, 1855)');
INSERT INTO dados_taxon VALUES (2391774, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Opistognathidae', 'Opistognathus', 'Opistognathus aurifrons', '', 'SPECIES', 'Opistognathus aurifrons (Jordan & Thompson, 1905)');
INSERT INTO dados_taxon VALUES (2334682, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Pontinus', 'Pontinus longispinis', '', 'SPECIES', 'Pontinus longispinis Goode & Bean, 1896');
INSERT INTO dados_taxon VALUES (2373969, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scombridae', 'Thunnus', 'Thunnus atlanticus', '', 'SPECIES', 'Thunnus atlanticus (Lesson, 1831)');
INSERT INTO dados_taxon VALUES (2383029, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Xyrichtys', '', '', 'GENUS', 'Xyrichtys Cuvier, 1814');
INSERT INTO dados_taxon VALUES (2374374, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pempheridae', 'Pempheris', 'Pempheris schomburgkii', '', 'SPECIES', 'Pempheris schomburgki MÃ¼ller & Troschel, 1848');
INSERT INTO dados_taxon VALUES (2403010, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Moringuidae', 'Moringua', 'Moringua edwardsi', '', 'SPECIES', 'Moringua edwardsi (Jordan & Bollman, 1889)');
INSERT INTO dados_taxon VALUES (2398749, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Microspathodon', 'Microspathodon chrysurus', '', 'SPECIES', 'Microspathodon chrysurus (Cuvier, 1830)');
INSERT INTO dados_taxon VALUES (2374282, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scombridae', 'Scomberomorus', 'Scomberomorus cavalla', '', 'SPECIES', 'Scomberomorus cavalla (Cuvier, 1829)');
INSERT INTO dados_taxon VALUES (2373996, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scombridae', 'Thunnus', 'Thunnus obesus', '', 'SPECIES', 'Thunnus obesus (Lowe, 1839)');
INSERT INTO dados_taxon VALUES (2383034, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Xyrichtys', 'Xyrichtys splendens', '', 'SPECIES', 'Xyrichthys splendens Castelnau, 1855');
INSERT INTO dados_taxon VALUES (2393922, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Sparisoma', 'Sparisoma axillare', '', 'SPECIES', 'Sparisoma axillare (Steindachner, 1878)');
INSERT INTO dados_taxon VALUES (2373946, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scombridae', 'Thunnus', 'Thunnus alalunga', '', 'SPECIES', 'Thunnus alalunga (Bonnaterre, 1788)');
INSERT INTO dados_taxon VALUES (2395285, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Blenniidae', 'Ophioblennius', 'Ophioblennius trinitatis', '', 'SPECIES', 'Ophioblennius trinitatis Miranda Ribeiro, 1919');
INSERT INTO dados_taxon VALUES (2400657, 'Animalia', 'Chordata', 'Actinopterygii', 'Mugiliformes', 'Mugilidae', 'Mugil', 'Mugil curvidens', '', 'SPECIES', 'Mugil curvidens Valenciennes, 1836');
INSERT INTO dados_taxon VALUES (2334560, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaena', 'Scorpaena plumieri', '', 'SPECIES', 'Scorpaena plumieri Bloch, 1789');
INSERT INTO dados_taxon VALUES (2404520, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Ophichthidae', 'Myrichthys', 'Myrichthys breviceps', '', 'SPECIES', 'Myrichthys breviceps (Richardson, 1848)');
INSERT INTO dados_taxon VALUES (2334385, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaenodes', 'Scorpaenodes caribbaeus', '', 'SPECIES', 'Scorpaenodes caribbaeus Meek & Hildebrand, 1928');
INSERT INTO dados_taxon VALUES (2403413, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Ophichthidae', 'Myrophis', '', '', 'GENUS', 'Myrophis LÃ¼tken, 1852');
INSERT INTO dados_taxon VALUES (2411479, 'Animalia', 'Chordata', 'Actinopterygii', 'Gobiesociformes', 'Gobiesocidae', 'Tomicodon', '', '', 'GENUS', 'Tomicodon Brisout de Barneville, 1846');
INSERT INTO dados_taxon VALUES (2407829, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Tetraodontidae', 'Sphoeroides', 'Sphoeroides spengleri', '', 'SPECIES', 'Sphoeroides spengleri (Bloch, 1785)');
INSERT INTO dados_taxon VALUES (2374402, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pempheridae', 'Pempheris', 'Pempheris poeyi', '', 'SPECIES', 'Pempheris poeyi Bean, 1885');
INSERT INTO dados_taxon VALUES (2404414, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Heterenchelyidae', 'Pythonichthys', 'Pythonichthys sanguineus', '', 'SPECIES', 'Pythonichthys sanguineus Poey, 1868');
INSERT INTO dados_taxon VALUES (2387710, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Rypticus', 'Rypticus saponaceus', '', 'SPECIES', 'Rypticus saponaceus (Bloch & Schneider, 1801)');
INSERT INTO dados_taxon VALUES (2391852, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Opistognathidae', 'Opistognathus', 'Opistognathus maxillosus', '', 'SPECIES', 'Opistognathus maxillosus Poey, 1860');
INSERT INTO dados_taxon VALUES (2383057, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Xyrichtys', 'Xyrichtys novacula', '', 'SPECIES', 'Xyrichtys novacula (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2401159, 'Animalia', 'Chordata', 'Actinopterygii', 'Aulopiformes', 'Synodontidae', 'Trachinocephalus', 'Trachinocephalus myops', '', 'SPECIES', 'Trachinocephalus myops (Forster, 1801)');
INSERT INTO dados_taxon VALUES (5213152, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Ophichthidae', 'Ophichthus', 'Ophichthus ophis', '', 'SPECIES', 'Ophichthus ophis (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2417522, 'Animalia', 'Chordata', 'Elasmobranchii', 'Orectolobiformes', 'Rhincodontidae', 'Rhincodon', 'Rhincodon typus', '', 'SPECIES', 'Rhincodon typus Smith, 1828');
INSERT INTO dados_taxon VALUES (2391007, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Selar', 'Selar crumenophthalmus', '', 'SPECIES', 'Selar crumenophthalmus (Bloch, 1793)');
INSERT INTO dados_taxon VALUES (2378453, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gobiidae', 'Priolepis', 'Priolepis dawsoni', '', 'SPECIES', 'Priolepis dawsoni Greenfield, 1989');
INSERT INTO dados_taxon VALUES (2334641, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaena', 'Scorpaena isthmensis', '', 'SPECIES', 'Scorpaena isthmensis Meek & Hildebrand, 1928');
INSERT INTO dados_taxon VALUES (5212691, 'Animalia', 'Chordata', 'Actinopterygii', 'Aulopiformes', 'Synodontidae', 'Synodus', 'Synodus synodus', '', 'SPECIES', 'Synodus synodus (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2389013, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Mycteroperca', 'Mycteroperca bonaci', '', 'SPECIES', 'Mycteroperca bonaci (Poey, 1860)');
INSERT INTO dados_taxon VALUES (2356977, 'Animalia', 'Chordata', 'Actinopterygii', 'Beryciformes', 'Holocentridae', 'Plectrypops', 'Plectrypops retrospinis', '', 'SPECIES', 'Plectrypops retrospinis (Guichenot, 1853)');
INSERT INTO dados_taxon VALUES (2404180, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Monopenchelys', 'Monopenchelys acuta', '', 'SPECIES', 'Monopenchelys acuta (Parr, 1930)');
INSERT INTO dados_taxon VALUES (2418789, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Sphyrnidae', 'Sphyrna', 'Sphyrna lewini', '', 'SPECIES', 'Sphyrna lewini (Griffith & Smith, 1834)');
INSERT INTO dados_taxon VALUES (2375267, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Echeneidae', 'Remora', 'Remora remora', '', 'SPECIES', 'Remora remora (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2395172, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Blenniidae', 'Scartella', 'Scartella poiti', '', 'SPECIES', 'Scartella poiti Rangel, Gasparini & GuimarÃ£es, 2004');
INSERT INTO dados_taxon VALUES (2398866, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Pomacentridae', 'Stegastes', 'Stegastes fuscus', '', 'SPECIES', 'Stegastes fuscus (Cuvier, 1830)');
INSERT INTO dados_taxon VALUES (2391355, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Uraspis', 'Uraspis secunda', '', 'SPECIES', 'Uraspis secunda (Poey, 1860)');
INSERT INTO dados_taxon VALUES (5961738, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labrisomidae', 'Malacoctenus', 'Malacoctenus brunoi', '', 'SPECIES', 'Malacoctenus brunoi GuimarÃ£es, Nunan & Gasparini, 2010');
INSERT INTO dados_taxon VALUES (4286140, 'Animalia', 'Chordata', 'Actinopterygii', 'Beloniformes', 'Belonidae', 'Platybelone', 'Platybelone argalus', '', 'SPECIES', 'Platybelone argalus (Lesueur, 1821)');
INSERT INTO dados_taxon VALUES (2347440, 'Animalia', 'Chordata', 'Actinopterygii', 'Stomiiformes', 'Gonostomatidae', 'Manducus', 'Manducus maderensis', '', 'SPECIES', 'Manducus maderensis (Johnson, 1890)');
INSERT INTO dados_taxon VALUES (2405866, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Myctophum', 'Myctophum obtusirostre', '', 'SPECIES', 'Myctophum obtusirostre TÃ¥ning, 1928');
INSERT INTO dados_taxon VALUES (2384981, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Lutjanidae', 'Lutjanus', 'Lutjanus analis', '', 'SPECIES', 'Lutjanus analis (Cuvier, 1828)');
INSERT INTO dados_taxon VALUES (2405710, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Lepidophanes', 'Lepidophanes guentheri', '', 'SPECIES', 'Lepidophanes guentheri (Goode & Bean, 1896)');
INSERT INTO dados_taxon VALUES (2384140, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Labridae', 'Halichoeres', 'Halichoeres penrosei', '', 'SPECIES', 'Halichoeres penrosei Starks, 1913');
INSERT INTO dados_taxon VALUES (2346825, 'Animalia', 'Chordata', 'Actinopterygii', 'Stomiiformes', 'Phosichthyidae', 'Pollichthys', 'Pollichthys mauli', '', 'SPECIES', 'Pollichthys mauli (Poll, 1953)');
INSERT INTO dados_taxon VALUES (2381512, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Acropomatidae', 'Synagrops', '', '', 'GENUS', 'Synagrops GÃ¼nther, 1887');
INSERT INTO dados_taxon VALUES (2395689, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Blenniidae', 'Hypleurochilus', '', '', 'GENUS', 'Hypleurochilus Gill, 1861');
INSERT INTO dados_taxon VALUES (2375045, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Priacanthidae', 'Heteropriacanthus', 'Heteropriacanthus cruentatus', '', 'SPECIES', 'Heteropriacanthus cruentatus (LacepÃ¨de, 1801)');
INSERT INTO dados_taxon VALUES (2393733, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Scaridae', 'Scarus', 'Scarus zelindae', '', 'SPECIES', 'Scarus zelindae Moura, Figueiredo & Sazima, 2001');
INSERT INTO dados_taxon VALUES (2334371, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaenodes', 'Scorpaenodes tredecimspinosus', '', 'SPECIES', 'Scorpaenodes tredecimspinosus (Metzelaar, 1919)');
INSERT INTO dados_taxon VALUES (2407041, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Balistidae', 'Xanthichthys', 'Xanthichthys ringens', '', 'SPECIES', 'Xanthichthys ringens (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2377472, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gobiidae', 'Risor', 'Risor ruber', '', 'SPECIES', 'Risor ruber (RosÃ©n, 1911)');
INSERT INTO dados_taxon VALUES (2420813, 'Animalia', 'Chordata', 'Elasmobranchii', 'Lamniformes', 'Alopiidae', 'Alopias', 'Alopias superciliosus', '', 'SPECIES', 'Alopias superciliosus Lowe, 1841');
INSERT INTO dados_taxon VALUES (2403930, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax vicinus', '', 'SPECIES', 'Gymnothorax vicinus (Castelnau, 1855)');
INSERT INTO dados_taxon VALUES (5961719, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Seriola', 'Seriola zonata', '', 'SPECIES', 'Seriola zonata (Mitchill, 1815)');
INSERT INTO dados_taxon VALUES (2418077, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Carcharhinidae', 'Carcharhinus', 'Carcharhinus signatus', '', 'SPECIES', 'Carcharhinus signatus (Poey, 1868)');
INSERT INTO dados_taxon VALUES (2418794, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Sphyrnidae', 'Sphyrna', 'Sphyrna zygaena', '', 'SPECIES', 'Sphyrna zygaena (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2403887, 'Animalia', 'Chordata', 'Actinopterygii', 'Anguilliformes', 'Muraenidae', 'Gymnothorax', 'Gymnothorax maderensis', '', 'SPECIES', 'Gymnothorax maderensis (Johnson, 1862)');
INSERT INTO dados_taxon VALUES (5216258, 'Animalia', 'Chordata', 'Elasmobranchii', 'Lamniformes', 'Lamnidae', 'Isurus', 'Isurus paucus', '', 'SPECIES', 'Isurus paucus Guitart, 1966');
INSERT INTO dados_taxon VALUES (2385140, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Lutjanidae', 'Etelis', 'Etelis oculatus', '', 'SPECIES', 'Etelis oculatus (Valenciennes, 1828)');
INSERT INTO dados_taxon VALUES (5213725, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Molidae', 'Mola', 'Mola mola', '', 'SPECIES', 'Mola mola (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (5216338, 'Animalia', 'Chordata', 'Elasmobranchii', 'Squaliformes', 'Squalidae', 'Squalus', 'Squalus mitsukurii', '', 'SPECIES', 'Squalus mitsukurii Jordan & Snyder, 1903');
INSERT INTO dados_taxon VALUES (2407107, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Balistidae', 'Balistes', 'Balistes capriscus', '', 'SPECIES', 'Balistes capriscus Gmelin, 1789');
INSERT INTO dados_taxon VALUES (2397775, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Gempylidae', 'Gempylus', 'Gempylus serpens', '', 'SPECIES', 'Gempylus serpens Cuvier, 1829');
INSERT INTO dados_taxon VALUES (2391055, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Carangidae', 'Decapterus', 'Decapterus tabl', '', 'SPECIES', 'Decapterus tabl Berry, 1968');
INSERT INTO dados_taxon VALUES (2333605, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Dactylopteridae', 'Dactylopterus', 'Dactylopterus volitans', '', 'SPECIES', 'Dactylopterus volitans (Linnaeus, 1758)');
INSERT INTO dados_taxon VALUES (2418009, 'Animalia', 'Chordata', 'Elasmobranchii', 'Carcharhiniformes', 'Carcharhinidae', 'Carcharhinus', 'Carcharhinus plumbeus', '', 'SPECIES', 'Carcharhinus plumbeus (Nardo, 1827)');
INSERT INTO dados_taxon VALUES (2389021, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Mycteroperca', 'Mycteroperca tigris', '', 'SPECIES', 'Mycteroperca tigris (Valenciennes, 1833)');
INSERT INTO dados_taxon VALUES (2388456, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Epinephelus', 'Epinephelus itajara', '', 'SPECIES', 'Epinephelus itajara (Lichtenstein, 1822)');
INSERT INTO dados_taxon VALUES (2384948, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Lutjanidae', 'Lutjanus', 'Lutjanus jocu', '', 'SPECIES', 'Lutjanus jocu (Bloch & Schneider, 1801)');
INSERT INTO dados_taxon VALUES (2368648, 'Animalia', 'Chordata', 'Actinopterygii', 'Beloniformes', 'Exocoetidae', 'Exocoetus', 'Exocoetus volitans', '', 'SPECIES', 'Exocoetus volitans Linnaeus, 1758');
INSERT INTO dados_taxon VALUES (2334557, 'Animalia', 'Chordata', 'Actinopterygii', 'Scorpaeniformes', 'Scorpaenidae', 'Scorpaena', 'Scorpaena brasiliensis', '', 'SPECIES', 'Scorpaena brasiliensis Cuvier, 1829');
INSERT INTO dados_taxon VALUES (2419569, 'Animalia', 'Chordata', 'Elasmobranchii', 'Rajiformes', 'Dasyatidae', 'Dasyatis', 'Dasyatis guttata', '', 'SPECIES', 'Dasyatis guttata (Bloch & Schneider, 1801)');
INSERT INTO dados_taxon VALUES (2368613, 'Animalia', 'Chordata', 'Actinopterygii', 'Beloniformes', 'Exocoetidae', 'Parexocoetus', 'Parexocoetus hillianus', '', 'SPECIES', 'Parexocoetus hillianus (Gosse, 1851)');
INSERT INTO dados_taxon VALUES (2407925, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Molidae', 'Masturus', 'Masturus lanceolatus', '', 'SPECIES', 'Masturus lanceolatus (LiÃ©nard, 1840)');
INSERT INTO dados_taxon VALUES (2406262, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus splendidus', '', 'SPECIES', 'Diaphus splendidus (Brauer, 1904)');
INSERT INTO dados_taxon VALUES (2406331, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus lucidus', '', 'SPECIES', 'Diaphus lucidus (Goode & Bean, 1896)');
INSERT INTO dados_taxon VALUES (2347474, 'Animalia', 'Chordata', 'Actinopterygii', 'Stomiiformes', 'Gonostomatidae', 'Diplophos', 'Diplophos taenia', '', 'SPECIES', 'Diplophos taenia GÃ¼nther, 1873');
INSERT INTO dados_taxon VALUES (2405853, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Myctophum', 'Myctophum affine', '', 'SPECIES', 'Myctophum affine (LÃ¼tken, 1892)');
INSERT INTO dados_taxon VALUES (2419178, 'Animalia', 'Chordata', 'Elasmobranchii', 'Rajiformes', 'Myliobatidae', 'Mobula', '', '', 'GENUS', 'Mobula Rafinesque, 1810');
INSERT INTO dados_taxon VALUES (2346841, 'Animalia', 'Chordata', 'Actinopterygii', 'Stomiiformes', 'Phosichthyidae', 'Vinciguerria', 'Vinciguerria nimbaria', '', 'SPECIES', 'Vinciguerria nimbaria (Jordan & Williams, 1895)');
INSERT INTO dados_taxon VALUES (2406093, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Notoscopelus', 'Notoscopelus caudispinosus', '', 'SPECIES', 'Notoscopelus caudispinosus (Johnson, 1863)');
INSERT INTO dados_taxon VALUES (2406273, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus perspicillatus', '', 'SPECIES', 'Diaphus perspicillatus (Ogilby, 1898)');
INSERT INTO dados_taxon VALUES (2406721, 'Animalia', 'Chordata', 'Actinopterygii', 'Tetraodontiformes', 'Monacanthidae', 'Aluterus', 'Aluterus scriptus', '', 'SPECIES', 'Aluterus scriptus (Osbeck, 1765)');
INSERT INTO dados_taxon VALUES (2406217, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus fragilis', '', 'SPECIES', 'Diaphus fragilis TÃ¥ning, 1928');
INSERT INTO dados_taxon VALUES (5788220, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Hyporthodus', 'Hyporthodus nigritus', '', 'SPECIES', 'Hyporthodus nigritus (Holbrook, 1855)');
INSERT INTO dados_taxon VALUES (2406285, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus brachycephalus', '', 'SPECIES', 'Diaphus brachycephalus TÃ¥ning, 1928');
INSERT INTO dados_taxon VALUES (2387887, 'Animalia', 'Chordata', 'Actinopterygii', 'Perciformes', 'Serranidae', 'Liopropoma', 'Liopropoma carmabi', '', 'SPECIES', 'Liopropoma carmabi (Randall, 1963)');
INSERT INTO dados_taxon VALUES (2406187, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus problematicus', '', 'SPECIES', 'Diaphus problematicus Parr, 1928');
INSERT INTO dados_taxon VALUES (5213302, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Hygophum', 'Hygophum reinhardtii', '', 'SPECIES', 'Hygophum reinhardtii (LÃ¼tken, 1892)');
INSERT INTO dados_taxon VALUES (2406248, 'Animalia', 'Chordata', 'Actinopterygii', 'Myctophiformes', 'Myctophidae', 'Diaphus', 'Diaphus dumerilii', '', 'SPECIES', 'Diaphus dumerilii (Bleeker, 1856)');


--
-- TOC entry 2234 (class 0 OID 107170)
-- Dependencies: 174
-- Data for Name: descritor; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--



--
-- TOC entry 2236 (class 0 OID 107186)
-- Dependencies: 176
-- Data for Name: descritor_unidade; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--



--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 182
-- Name: seq_amostra; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_amostra', 264, true);


--
-- TOC entry 2310 (class 0 OID 0)
-- Dependencies: 183
-- Name: seq_analise; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_analise', 7668, true);


--
-- TOC entry 2311 (class 0 OID 0)
-- Dependencies: 184
-- Name: seq_analise_bio; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_analise_bio', 7668, true);


--
-- TOC entry 2312 (class 0 OID 0)
-- Dependencies: 185
-- Name: seq_dados_gerais; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_dados_gerais', 1, false);


--
-- TOC entry 2313 (class 0 OID 0)
-- Dependencies: 186
-- Name: seq_dados_taxon; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_dados_taxon', 3717, true);


--
-- TOC entry 2314 (class 0 OID 0)
-- Dependencies: 187
-- Name: seq_descritor; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_descritor', 1, false);


--
-- TOC entry 2315 (class 0 OID 0)
-- Dependencies: 188
-- Name: seq_descritor_unidade; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_descritor_unidade', 1, false);


--
-- TOC entry 2316 (class 0 OID 0)
-- Dependencies: 189
-- Name: seq_taxon; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_taxon', 7138, true);


--
-- TOC entry 2317 (class 0 OID 0)
-- Dependencies: 190
-- Name: seq_unidade_medida; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_unidade_medida', 1, false);


--
-- TOC entry 2318 (class 0 OID 0)
-- Dependencies: 191
-- Name: seq_usuario; Type: SEQUENCE SET; Schema: bio; Owner: biotecmar
--

SELECT pg_catalog.setval('seq_usuario', 1, true);


--
-- TOC entry 2237 (class 0 OID 107194)
-- Dependencies: 177
-- Data for Name: taxon; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--

INSERT INTO taxon VALUES (4859, 1, 5788225, NULL);
INSERT INTO taxon VALUES (5390, 1, 5788225, NULL);
INSERT INTO taxon VALUES (5391, 1, 2357064, NULL);
INSERT INTO taxon VALUES (5392, 1, 2384275, NULL);
INSERT INTO taxon VALUES (5393, 1, 2403816, NULL);
INSERT INTO taxon VALUES (5394, 1, 2388808, NULL);
INSERT INTO taxon VALUES (5395, 1, 2396519, NULL);
INSERT INTO taxon VALUES (5396, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5397, 1, 5961709, NULL);
INSERT INTO taxon VALUES (5398, 1, 5211452, NULL);
INSERT INTO taxon VALUES (5399, 1, 2389125, NULL);
INSERT INTO taxon VALUES (5400, 1, 2384721, NULL);
INSERT INTO taxon VALUES (5401, 1, 2389831, NULL);
INSERT INTO taxon VALUES (5402, 1, 2384856, NULL);
INSERT INTO taxon VALUES (5403, 1, 2390762, NULL);
INSERT INTO taxon VALUES (5404, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5405, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5406, 1, 2407087, NULL);
INSERT INTO taxon VALUES (5407, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5408, 1, 2407103, NULL);
INSERT INTO taxon VALUES (5409, 1, 2388708, NULL);
INSERT INTO taxon VALUES (5410, 1, 2374069, NULL);
INSERT INTO taxon VALUES (5411, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5412, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5413, 1, 2418234, NULL);
INSERT INTO taxon VALUES (5414, 1, 5209181, NULL);
INSERT INTO taxon VALUES (5415, 1, 5212213, NULL);
INSERT INTO taxon VALUES (5416, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5417, 1, 2403798, NULL);
INSERT INTO taxon VALUES (5418, 1, 2393901, NULL);
INSERT INTO taxon VALUES (5419, 1, 5212165, NULL);
INSERT INTO taxon VALUES (5420, 1, 2377830, NULL);
INSERT INTO taxon VALUES (5421, 1, 2406748, NULL);
INSERT INTO taxon VALUES (5422, 1, 2418312, NULL);
INSERT INTO taxon VALUES (5423, 1, 2388373, NULL);
INSERT INTO taxon VALUES (5424, 1, 5209188, NULL);
INSERT INTO taxon VALUES (5425, 1, 2376682, NULL);
INSERT INTO taxon VALUES (5426, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5427, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5428, 1, 2376682, NULL);
INSERT INTO taxon VALUES (5429, 1, 5212222, NULL);
INSERT INTO taxon VALUES (5430, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5431, 1, 5209181, NULL);
INSERT INTO taxon VALUES (5432, 1, 2385344, NULL);
INSERT INTO taxon VALUES (5433, 1, 5201123, NULL);
INSERT INTO taxon VALUES (5434, 1, 2393931, NULL);
INSERT INTO taxon VALUES (5435, 1, 5212651, NULL);
INSERT INTO taxon VALUES (5436, 1, 2407732, NULL);
INSERT INTO taxon VALUES (5437, 1, 5209681, NULL);
INSERT INTO taxon VALUES (5438, 1, 5212237, NULL);
INSERT INTO taxon VALUES (5439, 1, 5212213, NULL);
INSERT INTO taxon VALUES (5440, 1, 2390847, NULL);
INSERT INTO taxon VALUES (5441, 1, 2419499, NULL);
INSERT INTO taxon VALUES (5442, 1, 2418234, NULL);
INSERT INTO taxon VALUES (5443, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5444, 1, 2418109, NULL);
INSERT INTO taxon VALUES (5445, 1, 2417495, NULL);
INSERT INTO taxon VALUES (5446, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5447, 1, 2381286, NULL);
INSERT INTO taxon VALUES (5448, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5449, 1, 5209188, NULL);
INSERT INTO taxon VALUES (5450, 1, 2407087, NULL);
INSERT INTO taxon VALUES (5451, 1, 2378717, NULL);
INSERT INTO taxon VALUES (5452, 1, 2385289, NULL);
INSERT INTO taxon VALUES (5453, 1, 2389831, NULL);
INSERT INTO taxon VALUES (5454, 1, 2396844, NULL);
INSERT INTO taxon VALUES (5455, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5456, 1, 5216248, NULL);
INSERT INTO taxon VALUES (5457, 1, 5213455, NULL);
INSERT INTO taxon VALUES (5458, 1, 2418052, NULL);
INSERT INTO taxon VALUES (5459, 1, 5961708, NULL);
INSERT INTO taxon VALUES (5460, 1, 2387497, NULL);
INSERT INTO taxon VALUES (5461, 1, 2410398, NULL);
INSERT INTO taxon VALUES (5462, 1, 5209748, NULL);
INSERT INTO taxon VALUES (5463, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5464, 1, 2390762, NULL);
INSERT INTO taxon VALUES (5465, 1, 5210100, NULL);
INSERT INTO taxon VALUES (5466, 1, 2374013, NULL);
INSERT INTO taxon VALUES (5467, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5468, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5469, 1, 2396970, NULL);
INSERT INTO taxon VALUES (5470, 1, 5211723, NULL);
INSERT INTO taxon VALUES (5471, 1, 2397850, NULL);
INSERT INTO taxon VALUES (5472, 1, 2332598, NULL);
INSERT INTO taxon VALUES (5473, 1, 2401132, NULL);
INSERT INTO taxon VALUES (5474, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5475, 1, 2375113, NULL);
INSERT INTO taxon VALUES (5476, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5477, 1, 2417940, NULL);
INSERT INTO taxon VALUES (5478, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5479, 1, 2407103, NULL);
INSERT INTO taxon VALUES (5480, 1, 2406708, NULL);
INSERT INTO taxon VALUES (5481, 1, 2381939, NULL);
INSERT INTO taxon VALUES (5482, 1, 2393551, NULL);
INSERT INTO taxon VALUES (5483, 1, 5788047, NULL);
INSERT INTO taxon VALUES (5484, 1, 5210913, NULL);
INSERT INTO taxon VALUES (5485, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5486, 1, 2396519, NULL);
INSERT INTO taxon VALUES (5487, 1, 2388808, NULL);
INSERT INTO taxon VALUES (5488, 1, 2385404, NULL);
INSERT INTO taxon VALUES (5489, 1, 2385615, NULL);
INSERT INTO taxon VALUES (5490, 1, 2393901, NULL);
INSERT INTO taxon VALUES (5491, 1, 2388747, NULL);
INSERT INTO taxon VALUES (5492, 1, 2390537, NULL);
INSERT INTO taxon VALUES (5493, 1, 2389125, NULL);
INSERT INTO taxon VALUES (5494, 1, 5213361, NULL);
INSERT INTO taxon VALUES (5495, 1, 2408186, NULL);
INSERT INTO taxon VALUES (5496, 1, 2374069, NULL);
INSERT INTO taxon VALUES (5497, 1, 2419426, NULL);
INSERT INTO taxon VALUES (5498, 1, 2391064, NULL);
INSERT INTO taxon VALUES (5499, 1, 2356819, NULL);
INSERT INTO taxon VALUES (5500, 1, 5209174, NULL);
INSERT INTO taxon VALUES (5501, 1, 5209687, NULL);
INSERT INTO taxon VALUES (5502, 1, 5212165, NULL);
INSERT INTO taxon VALUES (5503, 1, 2377830, NULL);
INSERT INTO taxon VALUES (5504, 1, 2399845, NULL);
INSERT INTO taxon VALUES (5505, 1, 2347492, NULL);
INSERT INTO taxon VALUES (5506, 1, 2403802, NULL);
INSERT INTO taxon VALUES (5507, 1, 2357064, NULL);
INSERT INTO taxon VALUES (5508, 1, 5211452, NULL);
INSERT INTO taxon VALUES (5509, 1, 5853038, NULL);
INSERT INTO taxon VALUES (5510, 1, 5211671, NULL);
INSERT INTO taxon VALUES (5511, 1, 5210446, NULL);
INSERT INTO taxon VALUES (5512, 1, 2397724, NULL);
INSERT INTO taxon VALUES (5513, 1, 2396813, NULL);
INSERT INTO taxon VALUES (5514, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5515, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5516, 1, 2397873, NULL);
INSERT INTO taxon VALUES (5517, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5518, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5519, 1, 2388737, NULL);
INSERT INTO taxon VALUES (5520, 1, 2350821, NULL);
INSERT INTO taxon VALUES (5521, 1, 2334693, NULL);
INSERT INTO taxon VALUES (5522, 1, 2393899, NULL);
INSERT INTO taxon VALUES (5523, 1, 2415317, NULL);
INSERT INTO taxon VALUES (5524, 1, 2387913, NULL);
INSERT INTO taxon VALUES (5525, 1, 5212673, NULL);
INSERT INTO taxon VALUES (5526, 1, 2390836, NULL);
INSERT INTO taxon VALUES (5527, 1, 2390989, NULL);
INSERT INTO taxon VALUES (5528, 1, 2403964, NULL);
INSERT INTO taxon VALUES (5529, 1, 2384856, NULL);
INSERT INTO taxon VALUES (5530, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5531, 1, 2406957, NULL);
INSERT INTO taxon VALUES (5532, 1, 2334586, NULL);
INSERT INTO taxon VALUES (5533, 1, 2409465, NULL);
INSERT INTO taxon VALUES (5534, 1, 2406961, NULL);
INSERT INTO taxon VALUES (5535, 1, 2399906, NULL);
INSERT INTO taxon VALUES (5536, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5537, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5538, 1, 5852347, NULL);
INSERT INTO taxon VALUES (5539, 1, 2334636, NULL);
INSERT INTO taxon VALUES (5540, 1, 2404442, NULL);
INSERT INTO taxon VALUES (5541, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5542, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5543, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5544, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5545, 1, 5213187, NULL);
INSERT INTO taxon VALUES (5546, 1, 5212673, NULL);
INSERT INTO taxon VALUES (5547, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5548, 1, 2391774, NULL);
INSERT INTO taxon VALUES (5549, 1, 2334682, NULL);
INSERT INTO taxon VALUES (5550, 1, 2373969, NULL);
INSERT INTO taxon VALUES (5551, 1, 2383029, NULL);
INSERT INTO taxon VALUES (5552, 1, 5210913, NULL);
INSERT INTO taxon VALUES (5553, 1, 5210100, NULL);
INSERT INTO taxon VALUES (5554, 1, 5961708, NULL);
INSERT INTO taxon VALUES (5555, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5556, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5557, 1, 2374374, NULL);
INSERT INTO taxon VALUES (5558, 1, 2403010, NULL);
INSERT INTO taxon VALUES (5559, 1, 2398749, NULL);
INSERT INTO taxon VALUES (5560, 1, 2374282, NULL);
INSERT INTO taxon VALUES (5561, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5562, 1, 2373996, NULL);
INSERT INTO taxon VALUES (5563, 1, 2383034, NULL);
INSERT INTO taxon VALUES (5564, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5565, 1, 2393922, NULL);
INSERT INTO taxon VALUES (5566, 1, 2373946, NULL);
INSERT INTO taxon VALUES (5567, 1, 2395285, NULL);
INSERT INTO taxon VALUES (5568, 1, 2400657, NULL);
INSERT INTO taxon VALUES (5569, 1, 2388747, NULL);
INSERT INTO taxon VALUES (5570, 1, 2334560, NULL);
INSERT INTO taxon VALUES (5571, 1, 2397850, NULL);
INSERT INTO taxon VALUES (5572, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5573, 1, 2404520, NULL);
INSERT INTO taxon VALUES (5574, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5575, 1, 2396970, NULL);
INSERT INTO taxon VALUES (5576, 1, 2334586, NULL);
INSERT INTO taxon VALUES (5577, 1, 2334385, NULL);
INSERT INTO taxon VALUES (5578, 1, 2403413, NULL);
INSERT INTO taxon VALUES (5579, 1, 2411479, NULL);
INSERT INTO taxon VALUES (5580, 1, 2417940, NULL);
INSERT INTO taxon VALUES (5581, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5582, 1, 2407829, NULL);
INSERT INTO taxon VALUES (5583, 1, 2374402, NULL);
INSERT INTO taxon VALUES (5584, 1, 2404414, NULL);
INSERT INTO taxon VALUES (5585, 1, 2334682, NULL);
INSERT INTO taxon VALUES (5586, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5587, 1, 2387710, NULL);
INSERT INTO taxon VALUES (5588, 1, 2391852, NULL);
INSERT INTO taxon VALUES (5589, 1, 2383057, NULL);
INSERT INTO taxon VALUES (5590, 1, 5210100, NULL);
INSERT INTO taxon VALUES (5591, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5592, 1, 2396813, NULL);
INSERT INTO taxon VALUES (5593, 1, 2401159, NULL);
INSERT INTO taxon VALUES (5594, 1, 5213152, NULL);
INSERT INTO taxon VALUES (5595, 1, 5852347, NULL);
INSERT INTO taxon VALUES (5596, 1, 2417522, NULL);
INSERT INTO taxon VALUES (5597, 1, 2391774, NULL);
INSERT INTO taxon VALUES (5598, 1, 2391007, NULL);
INSERT INTO taxon VALUES (5599, 1, 2356819, NULL);
INSERT INTO taxon VALUES (5600, 1, 2388708, NULL);
INSERT INTO taxon VALUES (5601, 1, 2378453, NULL);
INSERT INTO taxon VALUES (5602, 1, 2334641, NULL);
INSERT INTO taxon VALUES (5603, 1, 5212691, NULL);
INSERT INTO taxon VALUES (5604, 1, 2389013, NULL);
INSERT INTO taxon VALUES (5605, 1, 2356977, NULL);
INSERT INTO taxon VALUES (5606, 1, 2396844, NULL);
INSERT INTO taxon VALUES (5607, 1, 2404180, NULL);
INSERT INTO taxon VALUES (5608, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5609, 1, 2418789, NULL);
INSERT INTO taxon VALUES (5610, 1, 2357064, NULL);
INSERT INTO taxon VALUES (5611, 1, 2375267, NULL);
INSERT INTO taxon VALUES (5612, 1, 2395172, NULL);
INSERT INTO taxon VALUES (5613, 1, 2398866, NULL);
INSERT INTO taxon VALUES (5614, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5615, 1, 2393931, NULL);
INSERT INTO taxon VALUES (5616, 1, 2391355, NULL);
INSERT INTO taxon VALUES (5617, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5618, 1, 5961738, NULL);
INSERT INTO taxon VALUES (5619, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5620, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5621, 1, 4286140, NULL);
INSERT INTO taxon VALUES (5622, 1, 2397873, NULL);
INSERT INTO taxon VALUES (5623, 1, 2403964, NULL);
INSERT INTO taxon VALUES (5624, 1, 2395285, NULL);
INSERT INTO taxon VALUES (5625, 1, 2347440, NULL);
INSERT INTO taxon VALUES (5626, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5627, 1, 2405866, NULL);
INSERT INTO taxon VALUES (5628, 1, 2410398, NULL);
INSERT INTO taxon VALUES (5629, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5630, 1, 2401132, NULL);
INSERT INTO taxon VALUES (5631, 1, 2385289, NULL);
INSERT INTO taxon VALUES (5632, 1, 2384981, NULL);
INSERT INTO taxon VALUES (5633, 1, 2405710, NULL);
INSERT INTO taxon VALUES (5634, 1, 2396970, NULL);
INSERT INTO taxon VALUES (5635, 1, 2384140, NULL);
INSERT INTO taxon VALUES (5636, 1, 2387710, NULL);
INSERT INTO taxon VALUES (5637, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5638, 1, 2356819, NULL);
INSERT INTO taxon VALUES (5639, 1, 2388747, NULL);
INSERT INTO taxon VALUES (5640, 1, 5853038, NULL);
INSERT INTO taxon VALUES (5641, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5642, 1, 5852347, NULL);
INSERT INTO taxon VALUES (5643, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5644, 1, 2398866, NULL);
INSERT INTO taxon VALUES (5645, 1, 2398749, NULL);
INSERT INTO taxon VALUES (5646, 1, 2381286, NULL);
INSERT INTO taxon VALUES (5647, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5648, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5649, 1, 2346825, NULL);
INSERT INTO taxon VALUES (5650, 1, 2391774, NULL);
INSERT INTO taxon VALUES (5651, 1, 2396813, NULL);
INSERT INTO taxon VALUES (5652, 1, 5212691, NULL);
INSERT INTO taxon VALUES (5653, 1, 2381512, NULL);
INSERT INTO taxon VALUES (5654, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5655, 1, 2384856, NULL);
INSERT INTO taxon VALUES (5656, 1, 2395689, NULL);
INSERT INTO taxon VALUES (5657, 1, 2393931, NULL);
INSERT INTO taxon VALUES (5658, 1, 2403798, NULL);
INSERT INTO taxon VALUES (5659, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5660, 1, 2375045, NULL);
INSERT INTO taxon VALUES (5661, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5662, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5663, 1, 2393733, NULL);
INSERT INTO taxon VALUES (5664, 1, 2393899, NULL);
INSERT INTO taxon VALUES (5665, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5666, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5667, 1, 2356977, NULL);
INSERT INTO taxon VALUES (5668, 1, 2389013, NULL);
INSERT INTO taxon VALUES (5669, 1, 5211452, NULL);
INSERT INTO taxon VALUES (5670, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5671, 1, 2396844, NULL);
INSERT INTO taxon VALUES (5672, 1, 2357064, NULL);
INSERT INTO taxon VALUES (5673, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5674, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5675, 1, 5961709, NULL);
INSERT INTO taxon VALUES (5676, 1, 5212673, NULL);
INSERT INTO taxon VALUES (5677, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5678, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5679, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5680, 1, 2334636, NULL);
INSERT INTO taxon VALUES (5681, 1, 2334371, NULL);
INSERT INTO taxon VALUES (5682, 1, 2383029, NULL);
INSERT INTO taxon VALUES (5683, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5684, 1, 2407041, NULL);
INSERT INTO taxon VALUES (5685, 1, 2391774, NULL);
INSERT INTO taxon VALUES (5686, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5687, 1, 2334693, NULL);
INSERT INTO taxon VALUES (5688, 1, 2377472, NULL);
INSERT INTO taxon VALUES (5689, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5690, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5691, 1, 2388708, NULL);
INSERT INTO taxon VALUES (5692, 1, 2410398, NULL);
INSERT INTO taxon VALUES (5693, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5694, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5695, 1, 5852347, NULL);
INSERT INTO taxon VALUES (5696, 1, 5210100, NULL);
INSERT INTO taxon VALUES (5697, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5698, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5699, 1, 2391852, NULL);
INSERT INTO taxon VALUES (5700, 1, 2388737, NULL);
INSERT INTO taxon VALUES (5701, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5702, 1, 2378453, NULL);
INSERT INTO taxon VALUES (5703, 1, 2420813, NULL);
INSERT INTO taxon VALUES (5704, 1, 5788225, NULL);
INSERT INTO taxon VALUES (5705, 1, 2407103, NULL);
INSERT INTO taxon VALUES (5706, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5707, 1, 2373969, NULL);
INSERT INTO taxon VALUES (5708, 1, 2406708, NULL);
INSERT INTO taxon VALUES (5709, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5710, 1, 2418789, NULL);
INSERT INTO taxon VALUES (5711, 1, 5213361, NULL);
INSERT INTO taxon VALUES (5712, 1, 5216248, NULL);
INSERT INTO taxon VALUES (5713, 1, 2403930, NULL);
INSERT INTO taxon VALUES (5714, 1, 5961719, NULL);
INSERT INTO taxon VALUES (5715, 1, 2418077, NULL);
INSERT INTO taxon VALUES (5716, 1, 2418794, NULL);
INSERT INTO taxon VALUES (5717, 1, 2403887, NULL);
INSERT INTO taxon VALUES (5718, 1, 2397850, NULL);
INSERT INTO taxon VALUES (5719, 1, 5216258, NULL);
INSERT INTO taxon VALUES (5720, 1, 2385140, NULL);
INSERT INTO taxon VALUES (5721, 1, 2389125, NULL);
INSERT INTO taxon VALUES (5722, 1, 5213725, NULL);
INSERT INTO taxon VALUES (5723, 1, 2384721, NULL);
INSERT INTO taxon VALUES (5724, 1, 5216338, NULL);
INSERT INTO taxon VALUES (5725, 1, 2390762, NULL);
INSERT INTO taxon VALUES (5726, 1, 2389831, NULL);
INSERT INTO taxon VALUES (5727, 1, 2403798, NULL);
INSERT INTO taxon VALUES (5728, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5729, 1, 2407107, NULL);
INSERT INTO taxon VALUES (5730, 1, 2397873, NULL);
INSERT INTO taxon VALUES (5731, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5732, 1, 2397775, NULL);
INSERT INTO taxon VALUES (5733, 1, 2381939, NULL);
INSERT INTO taxon VALUES (5734, 1, 2407087, NULL);
INSERT INTO taxon VALUES (5735, 1, 2391055, NULL);
INSERT INTO taxon VALUES (5736, 1, 2333605, NULL);
INSERT INTO taxon VALUES (5737, 1, 2418312, NULL);
INSERT INTO taxon VALUES (5738, 1, 2418109, NULL);
INSERT INTO taxon VALUES (5739, 1, 2418009, NULL);
INSERT INTO taxon VALUES (5740, 1, 2374069, NULL);
INSERT INTO taxon VALUES (5741, 1, 2397724, NULL);
INSERT INTO taxon VALUES (5742, 1, 2403802, NULL);
INSERT INTO taxon VALUES (5743, 1, 2418234, NULL);
INSERT INTO taxon VALUES (5744, 1, 2384856, NULL);
INSERT INTO taxon VALUES (5745, 1, 2389021, NULL);
INSERT INTO taxon VALUES (5746, 1, 2417940, NULL);
INSERT INTO taxon VALUES (5747, 1, 2388747, NULL);
INSERT INTO taxon VALUES (5748, 1, 2383057, NULL);
INSERT INTO taxon VALUES (5749, 1, 2407829, NULL);
INSERT INTO taxon VALUES (5750, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5751, 1, 2393931, NULL);
INSERT INTO taxon VALUES (5752, 1, 2395172, NULL);
INSERT INTO taxon VALUES (5753, 1, 2398866, NULL);
INSERT INTO taxon VALUES (5754, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5755, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5756, 1, 2387710, NULL);
INSERT INTO taxon VALUES (5757, 1, 2407041, NULL);
INSERT INTO taxon VALUES (5758, 1, 2418789, NULL);
INSERT INTO taxon VALUES (5759, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5760, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5761, 1, 2396813, NULL);
INSERT INTO taxon VALUES (5762, 1, 2393922, NULL);
INSERT INTO taxon VALUES (5763, 1, 2356819, NULL);
INSERT INTO taxon VALUES (5764, 1, 2391007, NULL);
INSERT INTO taxon VALUES (5765, 1, 2417495, NULL);
INSERT INTO taxon VALUES (5766, 1, 2375045, NULL);
INSERT INTO taxon VALUES (5767, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5768, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5769, 1, 2381286, NULL);
INSERT INTO taxon VALUES (5770, 1, 2388456, NULL);
INSERT INTO taxon VALUES (5771, 1, 2417495, NULL);
INSERT INTO taxon VALUES (5772, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5773, 1, 2384275, NULL);
INSERT INTO taxon VALUES (5774, 1, 5853038, NULL);
INSERT INTO taxon VALUES (5775, 1, 2396844, NULL);
INSERT INTO taxon VALUES (5776, 1, 2378717, NULL);
INSERT INTO taxon VALUES (5777, 1, 5210100, NULL);
INSERT INTO taxon VALUES (5778, 1, 2388708, NULL);
INSERT INTO taxon VALUES (5779, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5780, 1, 5210446, NULL);
INSERT INTO taxon VALUES (5781, 1, 2396970, NULL);
INSERT INTO taxon VALUES (5782, 1, 4286140, NULL);
INSERT INTO taxon VALUES (5783, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5784, 1, 2398749, NULL);
INSERT INTO taxon VALUES (5785, 1, 2389125, NULL);
INSERT INTO taxon VALUES (5786, 1, 2384948, NULL);
INSERT INTO taxon VALUES (5787, 1, 2391774, NULL);
INSERT INTO taxon VALUES (5788, 1, 2357064, NULL);
INSERT INTO taxon VALUES (5789, 1, 2378453, NULL);
INSERT INTO taxon VALUES (5790, 1, 2398866, NULL);
INSERT INTO taxon VALUES (5791, 1, 2387710, NULL);
INSERT INTO taxon VALUES (5792, 1, 5212237, NULL);
INSERT INTO taxon VALUES (5793, 1, 2399906, NULL);
INSERT INTO taxon VALUES (5794, 1, 5212222, NULL);
INSERT INTO taxon VALUES (5795, 1, 2368648, NULL);
INSERT INTO taxon VALUES (5796, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5797, 1, 2376682, NULL);
INSERT INTO taxon VALUES (5798, 1, 2394277, NULL);
INSERT INTO taxon VALUES (5799, 1, 2403964, NULL);
INSERT INTO taxon VALUES (5800, 1, 2334557, NULL);
INSERT INTO taxon VALUES (5801, 1, 2419569, NULL);
INSERT INTO taxon VALUES (5802, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5803, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5804, 1, 5213187, NULL);
INSERT INTO taxon VALUES (5805, 1, 2377830, NULL);
INSERT INTO taxon VALUES (5806, 1, 2368613, NULL);
INSERT INTO taxon VALUES (5807, 1, 5211452, NULL);
INSERT INTO taxon VALUES (5808, 1, 5212165, NULL);
INSERT INTO taxon VALUES (5809, 1, 2396813, NULL);
INSERT INTO taxon VALUES (5810, 1, 2399845, NULL);
INSERT INTO taxon VALUES (5811, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5812, 1, 2334636, NULL);
INSERT INTO taxon VALUES (5813, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5814, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5815, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5816, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5817, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5818, 1, 2373946, NULL);
INSERT INTO taxon VALUES (5819, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5820, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5821, 1, 2407732, NULL);
INSERT INTO taxon VALUES (5822, 1, 2373969, NULL);
INSERT INTO taxon VALUES (5823, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5824, 1, 2384140, NULL);
INSERT INTO taxon VALUES (5825, 1, 5213152, NULL);
INSERT INTO taxon VALUES (5826, 1, 5853038, NULL);
INSERT INTO taxon VALUES (5827, 1, 2381939, NULL);
INSERT INTO taxon VALUES (5828, 1, 2397724, NULL);
INSERT INTO taxon VALUES (5829, 1, 2407103, NULL);
INSERT INTO taxon VALUES (5830, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5831, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5832, 1, 2374013, NULL);
INSERT INTO taxon VALUES (5833, 1, 2388808, NULL);
INSERT INTO taxon VALUES (5834, 1, 2393551, NULL);
INSERT INTO taxon VALUES (5835, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5836, 1, 2407087, NULL);
INSERT INTO taxon VALUES (5837, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5838, 1, 2377830, NULL);
INSERT INTO taxon VALUES (5839, 1, 2407041, NULL);
INSERT INTO taxon VALUES (5840, 1, 2376682, NULL);
INSERT INTO taxon VALUES (5841, 1, 5853038, NULL);
INSERT INTO taxon VALUES (5842, 1, 2377830, NULL);
INSERT INTO taxon VALUES (5843, 1, 2385620, NULL);
INSERT INTO taxon VALUES (5844, 1, 2396519, NULL);
INSERT INTO taxon VALUES (5845, 1, 2407925, NULL);
INSERT INTO taxon VALUES (5846, 1, 2384981, NULL);
INSERT INTO taxon VALUES (5847, 1, 2406957, NULL);
INSERT INTO taxon VALUES (5848, 1, 2403930, NULL);
INSERT INTO taxon VALUES (5849, 1, 5212237, NULL);
INSERT INTO taxon VALUES (5850, 1, 2384856, NULL);
INSERT INTO taxon VALUES (5851, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5852, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5853, 1, 2405710, NULL);
INSERT INTO taxon VALUES (5854, 1, 2397850, NULL);
INSERT INTO taxon VALUES (5855, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5856, 1, 2384531, NULL);
INSERT INTO taxon VALUES (5857, 1, 2406262, NULL);
INSERT INTO taxon VALUES (5858, 1, 2391055, NULL);
INSERT INTO taxon VALUES (5859, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5860, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5861, 1, 2390847, NULL);
INSERT INTO taxon VALUES (5862, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5863, 1, 2406331, NULL);
INSERT INTO taxon VALUES (5864, 1, 2384721, NULL);
INSERT INTO taxon VALUES (5865, 1, 2403964, NULL);
INSERT INTO taxon VALUES (5866, 1, 2403964, NULL);
INSERT INTO taxon VALUES (5867, 1, 2347474, NULL);
INSERT INTO taxon VALUES (5868, 1, 2397724, NULL);
INSERT INTO taxon VALUES (5869, 1, 2405853, NULL);
INSERT INTO taxon VALUES (5870, 1, 2419178, NULL);
INSERT INTO taxon VALUES (5871, 1, 2407107, NULL);
INSERT INTO taxon VALUES (5872, 1, 2418312, NULL);
INSERT INTO taxon VALUES (5873, 1, 2418312, NULL);
INSERT INTO taxon VALUES (5874, 1, 2346841, NULL);
INSERT INTO taxon VALUES (5875, 1, 2407732, NULL);
INSERT INTO taxon VALUES (5876, 1, 2406093, NULL);
INSERT INTO taxon VALUES (5877, 1, 2407041, NULL);
INSERT INTO taxon VALUES (5878, 1, 5209188, NULL);
INSERT INTO taxon VALUES (5879, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5880, 1, 2406273, NULL);
INSERT INTO taxon VALUES (5881, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5882, 1, 2390989, NULL);
INSERT INTO taxon VALUES (5883, 1, 2391055, NULL);
INSERT INTO taxon VALUES (5884, 1, 2406721, NULL);
INSERT INTO taxon VALUES (5885, 1, 2388737, NULL);
INSERT INTO taxon VALUES (5886, 1, 2381939, NULL);
INSERT INTO taxon VALUES (5887, 1, 2334636, NULL);
INSERT INTO taxon VALUES (5888, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5889, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5890, 1, 2406217, NULL);
INSERT INTO taxon VALUES (5891, 1, 2346825, NULL);
INSERT INTO taxon VALUES (5892, 1, 2388747, NULL);
INSERT INTO taxon VALUES (5893, 1, 2375045, NULL);
INSERT INTO taxon VALUES (5894, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5895, 1, 5788220, NULL);
INSERT INTO taxon VALUES (5896, 1, 2407141, NULL);
INSERT INTO taxon VALUES (5897, 1, 2406285, NULL);
INSERT INTO taxon VALUES (5898, 1, 5961682, NULL);
INSERT INTO taxon VALUES (5899, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5900, 1, 2389125, NULL);
INSERT INTO taxon VALUES (5901, 1, 2387887, NULL);
INSERT INTO taxon VALUES (5902, 1, 2403930, NULL);
INSERT INTO taxon VALUES (5903, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5904, 1, 2383057, NULL);
INSERT INTO taxon VALUES (5905, 1, 2405866, NULL);
INSERT INTO taxon VALUES (5906, 1, 2406187, NULL);
INSERT INTO taxon VALUES (5907, 1, 5213302, NULL);
INSERT INTO taxon VALUES (5908, 1, 2417940, NULL);
INSERT INTO taxon VALUES (5909, 1, 2407103, NULL);
INSERT INTO taxon VALUES (5910, 1, 2390836, NULL);
INSERT INTO taxon VALUES (5911, 1, 2390762, NULL);
INSERT INTO taxon VALUES (5912, 1, 2388808, NULL);
INSERT INTO taxon VALUES (5913, 1, 2404180, NULL);
INSERT INTO taxon VALUES (5914, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5915, 1, 5209174, NULL);
INSERT INTO taxon VALUES (5916, 1, 2388708, NULL);
INSERT INTO taxon VALUES (5917, 1, 5209181, NULL);
INSERT INTO taxon VALUES (5918, 1, 5209748, NULL);
INSERT INTO taxon VALUES (5919, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5920, 1, 2406248, NULL);
INSERT INTO taxon VALUES (5921, 1, 5788225, NULL);
INSERT INTO taxon VALUES (5922, 1, 2357064, NULL);
INSERT INTO taxon VALUES (5923, 1, 2384275, NULL);
INSERT INTO taxon VALUES (5924, 1, 2403816, NULL);
INSERT INTO taxon VALUES (5925, 1, 2388808, NULL);
INSERT INTO taxon VALUES (5926, 1, 2396519, NULL);
INSERT INTO taxon VALUES (5927, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5928, 1, 5961709, NULL);
INSERT INTO taxon VALUES (5929, 1, 5211452, NULL);
INSERT INTO taxon VALUES (5930, 1, 2389125, NULL);
INSERT INTO taxon VALUES (5931, 1, 2384721, NULL);
INSERT INTO taxon VALUES (5932, 1, 2389831, NULL);
INSERT INTO taxon VALUES (5933, 1, 2384856, NULL);
INSERT INTO taxon VALUES (5934, 1, 2390762, NULL);
INSERT INTO taxon VALUES (5935, 1, 5961696, NULL);
INSERT INTO taxon VALUES (5936, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5937, 1, 2407087, NULL);
INSERT INTO taxon VALUES (5938, 1, 2393936, NULL);
INSERT INTO taxon VALUES (5939, 1, 2407103, NULL);
INSERT INTO taxon VALUES (5940, 1, 2388708, NULL);
INSERT INTO taxon VALUES (5941, 1, 2374069, NULL);
INSERT INTO taxon VALUES (5942, 1, 5211450, NULL);
INSERT INTO taxon VALUES (5943, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5944, 1, 2418234, NULL);
INSERT INTO taxon VALUES (5945, 1, 5209181, NULL);
INSERT INTO taxon VALUES (5946, 1, 5212213, NULL);
INSERT INTO taxon VALUES (5947, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5948, 1, 2403798, NULL);
INSERT INTO taxon VALUES (5949, 1, 2393901, NULL);
INSERT INTO taxon VALUES (5950, 1, 5212165, NULL);
INSERT INTO taxon VALUES (5951, 1, 2377830, NULL);
INSERT INTO taxon VALUES (5952, 1, 2406748, NULL);
INSERT INTO taxon VALUES (5953, 1, 2418312, NULL);
INSERT INTO taxon VALUES (5954, 1, 2388373, NULL);
INSERT INTO taxon VALUES (5955, 1, 5209188, NULL);
INSERT INTO taxon VALUES (5956, 1, 2376682, NULL);
INSERT INTO taxon VALUES (5957, 1, 2398843, NULL);
INSERT INTO taxon VALUES (5958, 1, 2389881, NULL);
INSERT INTO taxon VALUES (5959, 1, 2376682, NULL);
INSERT INTO taxon VALUES (5960, 1, 5212222, NULL);
INSERT INTO taxon VALUES (5961, 1, 2375993, NULL);
INSERT INTO taxon VALUES (5962, 1, 5209181, NULL);
INSERT INTO taxon VALUES (5963, 1, 2385344, NULL);
INSERT INTO taxon VALUES (5964, 1, 5201123, NULL);
INSERT INTO taxon VALUES (5965, 1, 2393931, NULL);
INSERT INTO taxon VALUES (5966, 1, 5212651, NULL);
INSERT INTO taxon VALUES (5967, 1, 2407732, NULL);
INSERT INTO taxon VALUES (5968, 1, 5209681, NULL);
INSERT INTO taxon VALUES (5969, 1, 5212237, NULL);
INSERT INTO taxon VALUES (5970, 1, 5212213, NULL);
INSERT INTO taxon VALUES (5971, 1, 2390847, NULL);
INSERT INTO taxon VALUES (5972, 1, 2419499, NULL);
INSERT INTO taxon VALUES (5973, 1, 2418234, NULL);
INSERT INTO taxon VALUES (5974, 1, 5204778, NULL);
INSERT INTO taxon VALUES (5975, 1, 2418109, NULL);
INSERT INTO taxon VALUES (5976, 1, 2417495, NULL);
INSERT INTO taxon VALUES (5977, 1, 2388809, NULL);
INSERT INTO taxon VALUES (5978, 1, 2381286, NULL);
INSERT INTO taxon VALUES (5979, 1, 2389044, NULL);
INSERT INTO taxon VALUES (5980, 1, 5209188, NULL);
INSERT INTO taxon VALUES (5981, 1, 2407087, NULL);
INSERT INTO taxon VALUES (5982, 1, 2378717, NULL);
INSERT INTO taxon VALUES (5983, 1, 2385289, NULL);
INSERT INTO taxon VALUES (5984, 1, 2389831, NULL);
INSERT INTO taxon VALUES (5985, 1, 2396844, NULL);
INSERT INTO taxon VALUES (5986, 1, 2384245, NULL);
INSERT INTO taxon VALUES (5987, 1, 5216248, NULL);
INSERT INTO taxon VALUES (5988, 1, 5213455, NULL);
INSERT INTO taxon VALUES (5989, 1, 2418052, NULL);
INSERT INTO taxon VALUES (5990, 1, 5961708, NULL);
INSERT INTO taxon VALUES (5991, 1, 2387497, NULL);
INSERT INTO taxon VALUES (5992, 1, 2410398, NULL);
INSERT INTO taxon VALUES (5993, 1, 5209748, NULL);
INSERT INTO taxon VALUES (5994, 1, 2404065, NULL);
INSERT INTO taxon VALUES (5995, 1, 2390762, NULL);
INSERT INTO taxon VALUES (5996, 1, 5210100, NULL);
INSERT INTO taxon VALUES (5997, 1, 2374013, NULL);
INSERT INTO taxon VALUES (5998, 1, 2389034, NULL);
INSERT INTO taxon VALUES (5999, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6000, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6001, 1, 5211723, NULL);
INSERT INTO taxon VALUES (6002, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6003, 1, 2332598, NULL);
INSERT INTO taxon VALUES (6004, 1, 2401132, NULL);
INSERT INTO taxon VALUES (6005, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6006, 1, 2375113, NULL);
INSERT INTO taxon VALUES (6007, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6008, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6009, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6010, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6011, 1, 2406708, NULL);
INSERT INTO taxon VALUES (6012, 1, 2381939, NULL);
INSERT INTO taxon VALUES (6013, 1, 2393551, NULL);
INSERT INTO taxon VALUES (6014, 1, 5788047, NULL);
INSERT INTO taxon VALUES (6015, 1, 5210913, NULL);
INSERT INTO taxon VALUES (6016, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6017, 1, 2396519, NULL);
INSERT INTO taxon VALUES (6018, 1, 2388808, NULL);
INSERT INTO taxon VALUES (6019, 1, 2385404, NULL);
INSERT INTO taxon VALUES (6020, 1, 2385615, NULL);
INSERT INTO taxon VALUES (6021, 1, 2393901, NULL);
INSERT INTO taxon VALUES (6022, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6023, 1, 2390537, NULL);
INSERT INTO taxon VALUES (6024, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6025, 1, 5213361, NULL);
INSERT INTO taxon VALUES (6026, 1, 2408186, NULL);
INSERT INTO taxon VALUES (6027, 1, 2374069, NULL);
INSERT INTO taxon VALUES (6028, 1, 2419426, NULL);
INSERT INTO taxon VALUES (6029, 1, 2391064, NULL);
INSERT INTO taxon VALUES (6030, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6031, 1, 5209174, NULL);
INSERT INTO taxon VALUES (6032, 1, 5209687, NULL);
INSERT INTO taxon VALUES (6033, 1, 5212165, NULL);
INSERT INTO taxon VALUES (6034, 1, 2377830, NULL);
INSERT INTO taxon VALUES (6035, 1, 2399845, NULL);
INSERT INTO taxon VALUES (6036, 1, 2347492, NULL);
INSERT INTO taxon VALUES (6037, 1, 2403802, NULL);
INSERT INTO taxon VALUES (6038, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6039, 1, 5211452, NULL);
INSERT INTO taxon VALUES (6040, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6041, 1, 5211671, NULL);
INSERT INTO taxon VALUES (6042, 1, 5210446, NULL);
INSERT INTO taxon VALUES (6043, 1, 2397724, NULL);
INSERT INTO taxon VALUES (6044, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6045, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6046, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6047, 1, 2397873, NULL);
INSERT INTO taxon VALUES (6048, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6049, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6050, 1, 2388737, NULL);
INSERT INTO taxon VALUES (6051, 1, 2350821, NULL);
INSERT INTO taxon VALUES (6052, 1, 2334693, NULL);
INSERT INTO taxon VALUES (6053, 1, 2393899, NULL);
INSERT INTO taxon VALUES (6054, 1, 2415317, NULL);
INSERT INTO taxon VALUES (6055, 1, 2387913, NULL);
INSERT INTO taxon VALUES (6056, 1, 5212673, NULL);
INSERT INTO taxon VALUES (6057, 1, 2390836, NULL);
INSERT INTO taxon VALUES (6058, 1, 2390989, NULL);
INSERT INTO taxon VALUES (6059, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6060, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6061, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6062, 1, 2406957, NULL);
INSERT INTO taxon VALUES (6063, 1, 2334586, NULL);
INSERT INTO taxon VALUES (6064, 1, 2409465, NULL);
INSERT INTO taxon VALUES (6065, 1, 2406961, NULL);
INSERT INTO taxon VALUES (6066, 1, 2399906, NULL);
INSERT INTO taxon VALUES (6067, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6068, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6069, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6070, 1, 2334636, NULL);
INSERT INTO taxon VALUES (6071, 1, 2404442, NULL);
INSERT INTO taxon VALUES (6072, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6073, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6074, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6075, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6076, 1, 5213187, NULL);
INSERT INTO taxon VALUES (6077, 1, 5212673, NULL);
INSERT INTO taxon VALUES (6078, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6079, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6080, 1, 2334682, NULL);
INSERT INTO taxon VALUES (6081, 1, 2373969, NULL);
INSERT INTO taxon VALUES (6082, 1, 2383029, NULL);
INSERT INTO taxon VALUES (6083, 1, 5210913, NULL);
INSERT INTO taxon VALUES (6084, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6085, 1, 5961708, NULL);
INSERT INTO taxon VALUES (6086, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6087, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6088, 1, 2374374, NULL);
INSERT INTO taxon VALUES (6089, 1, 2403010, NULL);
INSERT INTO taxon VALUES (6090, 1, 2398749, NULL);
INSERT INTO taxon VALUES (6091, 1, 2374282, NULL);
INSERT INTO taxon VALUES (6092, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6093, 1, 2373996, NULL);
INSERT INTO taxon VALUES (6094, 1, 2383034, NULL);
INSERT INTO taxon VALUES (6095, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6096, 1, 2393922, NULL);
INSERT INTO taxon VALUES (6097, 1, 2373946, NULL);
INSERT INTO taxon VALUES (6098, 1, 2395285, NULL);
INSERT INTO taxon VALUES (6099, 1, 2400657, NULL);
INSERT INTO taxon VALUES (6100, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6101, 1, 2334560, NULL);
INSERT INTO taxon VALUES (6102, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6103, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6104, 1, 2404520, NULL);
INSERT INTO taxon VALUES (6105, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6106, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6107, 1, 2334586, NULL);
INSERT INTO taxon VALUES (6108, 1, 2334385, NULL);
INSERT INTO taxon VALUES (6109, 1, 2403413, NULL);
INSERT INTO taxon VALUES (6110, 1, 2411479, NULL);
INSERT INTO taxon VALUES (6111, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6112, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6113, 1, 2407829, NULL);
INSERT INTO taxon VALUES (6114, 1, 2374402, NULL);
INSERT INTO taxon VALUES (6115, 1, 2404414, NULL);
INSERT INTO taxon VALUES (6116, 1, 2334682, NULL);
INSERT INTO taxon VALUES (6117, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6118, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6119, 1, 2391852, NULL);
INSERT INTO taxon VALUES (6120, 1, 2383057, NULL);
INSERT INTO taxon VALUES (6121, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6122, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6123, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6124, 1, 2401159, NULL);
INSERT INTO taxon VALUES (6125, 1, 5213152, NULL);
INSERT INTO taxon VALUES (6126, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6127, 1, 2417522, NULL);
INSERT INTO taxon VALUES (6128, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6129, 1, 2391007, NULL);
INSERT INTO taxon VALUES (6130, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6131, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6132, 1, 2378453, NULL);
INSERT INTO taxon VALUES (6133, 1, 2334641, NULL);
INSERT INTO taxon VALUES (6134, 1, 5212691, NULL);
INSERT INTO taxon VALUES (6135, 1, 2389013, NULL);
INSERT INTO taxon VALUES (6136, 1, 2356977, NULL);
INSERT INTO taxon VALUES (6137, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6138, 1, 2404180, NULL);
INSERT INTO taxon VALUES (6139, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6140, 1, 2418789, NULL);
INSERT INTO taxon VALUES (6141, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6142, 1, 2375267, NULL);
INSERT INTO taxon VALUES (6143, 1, 2395172, NULL);
INSERT INTO taxon VALUES (6144, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6145, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6146, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6147, 1, 2391355, NULL);
INSERT INTO taxon VALUES (6148, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6149, 1, 5961738, NULL);
INSERT INTO taxon VALUES (6150, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6151, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6152, 1, 4286140, NULL);
INSERT INTO taxon VALUES (6153, 1, 2397873, NULL);
INSERT INTO taxon VALUES (6154, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6155, 1, 2395285, NULL);
INSERT INTO taxon VALUES (6156, 1, 2347440, NULL);
INSERT INTO taxon VALUES (6157, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6158, 1, 2405866, NULL);
INSERT INTO taxon VALUES (6159, 1, 2410398, NULL);
INSERT INTO taxon VALUES (6160, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6161, 1, 2401132, NULL);
INSERT INTO taxon VALUES (6162, 1, 2385289, NULL);
INSERT INTO taxon VALUES (6163, 1, 2384981, NULL);
INSERT INTO taxon VALUES (6164, 1, 2405710, NULL);
INSERT INTO taxon VALUES (6165, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6166, 1, 2384140, NULL);
INSERT INTO taxon VALUES (6167, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6168, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6169, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6170, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6171, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6172, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6173, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6174, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6175, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6176, 1, 2398749, NULL);
INSERT INTO taxon VALUES (6177, 1, 2381286, NULL);
INSERT INTO taxon VALUES (6178, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6179, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6180, 1, 2346825, NULL);
INSERT INTO taxon VALUES (6181, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6182, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6183, 1, 5212691, NULL);
INSERT INTO taxon VALUES (6184, 1, 2381512, NULL);
INSERT INTO taxon VALUES (6185, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6186, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6187, 1, 2395689, NULL);
INSERT INTO taxon VALUES (6188, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6189, 1, 2403798, NULL);
INSERT INTO taxon VALUES (6190, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6191, 1, 2375045, NULL);
INSERT INTO taxon VALUES (6192, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6193, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6194, 1, 2393733, NULL);
INSERT INTO taxon VALUES (6195, 1, 2393899, NULL);
INSERT INTO taxon VALUES (6196, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6197, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6198, 1, 2356977, NULL);
INSERT INTO taxon VALUES (6199, 1, 2389013, NULL);
INSERT INTO taxon VALUES (6200, 1, 5211452, NULL);
INSERT INTO taxon VALUES (6201, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6202, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6203, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6204, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6205, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6206, 1, 5961709, NULL);
INSERT INTO taxon VALUES (6207, 1, 5212673, NULL);
INSERT INTO taxon VALUES (6208, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6209, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6210, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6211, 1, 2334636, NULL);
INSERT INTO taxon VALUES (6212, 1, 2334371, NULL);
INSERT INTO taxon VALUES (6213, 1, 2383029, NULL);
INSERT INTO taxon VALUES (6214, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6215, 1, 2407041, NULL);
INSERT INTO taxon VALUES (6216, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6217, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6218, 1, 2334693, NULL);
INSERT INTO taxon VALUES (6219, 1, 2377472, NULL);
INSERT INTO taxon VALUES (6220, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6221, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6222, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6223, 1, 2410398, NULL);
INSERT INTO taxon VALUES (6224, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6225, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6226, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6227, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6228, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6229, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6230, 1, 2391852, NULL);
INSERT INTO taxon VALUES (6231, 1, 2388737, NULL);
INSERT INTO taxon VALUES (6232, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6233, 1, 2378453, NULL);
INSERT INTO taxon VALUES (6234, 1, 2420813, NULL);
INSERT INTO taxon VALUES (6235, 1, 5788225, NULL);
INSERT INTO taxon VALUES (6236, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6237, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6238, 1, 2373969, NULL);
INSERT INTO taxon VALUES (6239, 1, 2406708, NULL);
INSERT INTO taxon VALUES (6240, 1, 2388809, NULL);
INSERT INTO taxon VALUES (6241, 1, 2418789, NULL);
INSERT INTO taxon VALUES (6242, 1, 5213361, NULL);
INSERT INTO taxon VALUES (6243, 1, 5216248, NULL);
INSERT INTO taxon VALUES (6244, 1, 2403930, NULL);
INSERT INTO taxon VALUES (6245, 1, 5961719, NULL);
INSERT INTO taxon VALUES (6246, 1, 2418077, NULL);
INSERT INTO taxon VALUES (6247, 1, 2418794, NULL);
INSERT INTO taxon VALUES (6248, 1, 2403887, NULL);
INSERT INTO taxon VALUES (6249, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6250, 1, 5216258, NULL);
INSERT INTO taxon VALUES (6251, 1, 2385140, NULL);
INSERT INTO taxon VALUES (6252, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6253, 1, 5213725, NULL);
INSERT INTO taxon VALUES (6254, 1, 2384721, NULL);
INSERT INTO taxon VALUES (6255, 1, 5216338, NULL);
INSERT INTO taxon VALUES (6256, 1, 2390762, NULL);
INSERT INTO taxon VALUES (6257, 1, 2389831, NULL);
INSERT INTO taxon VALUES (6258, 1, 2403798, NULL);
INSERT INTO taxon VALUES (6259, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6260, 1, 2407107, NULL);
INSERT INTO taxon VALUES (6261, 1, 2397873, NULL);
INSERT INTO taxon VALUES (6262, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6263, 1, 2397775, NULL);
INSERT INTO taxon VALUES (6264, 1, 2381939, NULL);
INSERT INTO taxon VALUES (6265, 1, 2407087, NULL);
INSERT INTO taxon VALUES (6266, 1, 2391055, NULL);
INSERT INTO taxon VALUES (6267, 1, 2333605, NULL);
INSERT INTO taxon VALUES (6268, 1, 2418312, NULL);
INSERT INTO taxon VALUES (6269, 1, 2418109, NULL);
INSERT INTO taxon VALUES (6270, 1, 2418009, NULL);
INSERT INTO taxon VALUES (6271, 1, 2374069, NULL);
INSERT INTO taxon VALUES (6272, 1, 2397724, NULL);
INSERT INTO taxon VALUES (6273, 1, 2403802, NULL);
INSERT INTO taxon VALUES (6274, 1, 2418234, NULL);
INSERT INTO taxon VALUES (6275, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6276, 1, 2389021, NULL);
INSERT INTO taxon VALUES (6277, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6278, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6279, 1, 2383057, NULL);
INSERT INTO taxon VALUES (6280, 1, 2407829, NULL);
INSERT INTO taxon VALUES (6281, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6282, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6283, 1, 2395172, NULL);
INSERT INTO taxon VALUES (6284, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6285, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6286, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6287, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6288, 1, 2407041, NULL);
INSERT INTO taxon VALUES (6289, 1, 2418789, NULL);
INSERT INTO taxon VALUES (6290, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6291, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6292, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6293, 1, 2393922, NULL);
INSERT INTO taxon VALUES (6294, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6295, 1, 2391007, NULL);
INSERT INTO taxon VALUES (6296, 1, 2417495, NULL);
INSERT INTO taxon VALUES (6297, 1, 2375045, NULL);
INSERT INTO taxon VALUES (6298, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6299, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6300, 1, 2381286, NULL);
INSERT INTO taxon VALUES (6301, 1, 2388456, NULL);
INSERT INTO taxon VALUES (6302, 1, 2417495, NULL);
INSERT INTO taxon VALUES (6303, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6304, 1, 2384275, NULL);
INSERT INTO taxon VALUES (6305, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6306, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6307, 1, 2378717, NULL);
INSERT INTO taxon VALUES (6308, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6309, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6310, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6311, 1, 5210446, NULL);
INSERT INTO taxon VALUES (6312, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6313, 1, 4286140, NULL);
INSERT INTO taxon VALUES (6314, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6315, 1, 2398749, NULL);
INSERT INTO taxon VALUES (6316, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6317, 1, 2384948, NULL);
INSERT INTO taxon VALUES (6318, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6319, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6320, 1, 2378453, NULL);
INSERT INTO taxon VALUES (6321, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6322, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6323, 1, 5212237, NULL);
INSERT INTO taxon VALUES (6324, 1, 2399906, NULL);
INSERT INTO taxon VALUES (6325, 1, 5212222, NULL);
INSERT INTO taxon VALUES (6326, 1, 2368648, NULL);
INSERT INTO taxon VALUES (6327, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6328, 1, 2376682, NULL);
INSERT INTO taxon VALUES (6329, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6330, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6331, 1, 2334557, NULL);
INSERT INTO taxon VALUES (6332, 1, 2419569, NULL);
INSERT INTO taxon VALUES (6333, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6334, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6335, 1, 5213187, NULL);
INSERT INTO taxon VALUES (6336, 1, 2377830, NULL);
INSERT INTO taxon VALUES (6337, 1, 2368613, NULL);
INSERT INTO taxon VALUES (6338, 1, 5211452, NULL);
INSERT INTO taxon VALUES (6339, 1, 5212165, NULL);
INSERT INTO taxon VALUES (6340, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6341, 1, 2399845, NULL);
INSERT INTO taxon VALUES (6342, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6343, 1, 2334636, NULL);
INSERT INTO taxon VALUES (6344, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6345, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6346, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6347, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6348, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6349, 1, 2373946, NULL);
INSERT INTO taxon VALUES (6350, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6351, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6352, 1, 2407732, NULL);
INSERT INTO taxon VALUES (6353, 1, 2373969, NULL);
INSERT INTO taxon VALUES (6354, 1, 2388809, NULL);
INSERT INTO taxon VALUES (6355, 1, 2384140, NULL);
INSERT INTO taxon VALUES (6356, 1, 5213152, NULL);
INSERT INTO taxon VALUES (6357, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6358, 1, 2381939, NULL);
INSERT INTO taxon VALUES (6359, 1, 2397724, NULL);
INSERT INTO taxon VALUES (6360, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6361, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6362, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6363, 1, 2374013, NULL);
INSERT INTO taxon VALUES (6364, 1, 2388808, NULL);
INSERT INTO taxon VALUES (6365, 1, 2393551, NULL);
INSERT INTO taxon VALUES (6366, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6367, 1, 2407087, NULL);
INSERT INTO taxon VALUES (6368, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6369, 1, 2377830, NULL);
INSERT INTO taxon VALUES (6370, 1, 2407041, NULL);
INSERT INTO taxon VALUES (6371, 1, 2376682, NULL);
INSERT INTO taxon VALUES (6372, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6373, 1, 2377830, NULL);
INSERT INTO taxon VALUES (6374, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6375, 1, 2396519, NULL);
INSERT INTO taxon VALUES (6376, 1, 2407925, NULL);
INSERT INTO taxon VALUES (6377, 1, 2384981, NULL);
INSERT INTO taxon VALUES (6378, 1, 2406957, NULL);
INSERT INTO taxon VALUES (6379, 1, 2403930, NULL);
INSERT INTO taxon VALUES (6380, 1, 5212237, NULL);
INSERT INTO taxon VALUES (6381, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6382, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6383, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6384, 1, 2405710, NULL);
INSERT INTO taxon VALUES (6385, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6386, 1, 2388809, NULL);
INSERT INTO taxon VALUES (6387, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6388, 1, 2406262, NULL);
INSERT INTO taxon VALUES (6389, 1, 2391055, NULL);
INSERT INTO taxon VALUES (6390, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6391, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6392, 1, 2390847, NULL);
INSERT INTO taxon VALUES (6393, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6394, 1, 2406331, NULL);
INSERT INTO taxon VALUES (6395, 1, 2384721, NULL);
INSERT INTO taxon VALUES (6396, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6397, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6398, 1, 2347474, NULL);
INSERT INTO taxon VALUES (6399, 1, 2397724, NULL);
INSERT INTO taxon VALUES (6400, 1, 2405853, NULL);
INSERT INTO taxon VALUES (6401, 1, 2419178, NULL);
INSERT INTO taxon VALUES (6402, 1, 2407107, NULL);
INSERT INTO taxon VALUES (6403, 1, 2418312, NULL);
INSERT INTO taxon VALUES (6404, 1, 2418312, NULL);
INSERT INTO taxon VALUES (6405, 1, 2346841, NULL);
INSERT INTO taxon VALUES (6406, 1, 2407732, NULL);
INSERT INTO taxon VALUES (6407, 1, 2406093, NULL);
INSERT INTO taxon VALUES (6408, 1, 2407041, NULL);
INSERT INTO taxon VALUES (6409, 1, 5209188, NULL);
INSERT INTO taxon VALUES (6410, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6411, 1, 2406273, NULL);
INSERT INTO taxon VALUES (6412, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6413, 1, 2390989, NULL);
INSERT INTO taxon VALUES (6414, 1, 2391055, NULL);
INSERT INTO taxon VALUES (6415, 1, 2406721, NULL);
INSERT INTO taxon VALUES (6416, 1, 2388737, NULL);
INSERT INTO taxon VALUES (6417, 1, 2381939, NULL);
INSERT INTO taxon VALUES (6418, 1, 2334636, NULL);
INSERT INTO taxon VALUES (6419, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6420, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6421, 1, 2406217, NULL);
INSERT INTO taxon VALUES (6422, 1, 2346825, NULL);
INSERT INTO taxon VALUES (6423, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6424, 1, 2375045, NULL);
INSERT INTO taxon VALUES (6425, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6426, 1, 5788220, NULL);
INSERT INTO taxon VALUES (6427, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6428, 1, 2406285, NULL);
INSERT INTO taxon VALUES (6429, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6430, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6431, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6432, 1, 2387887, NULL);
INSERT INTO taxon VALUES (6433, 1, 2403930, NULL);
INSERT INTO taxon VALUES (6434, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6435, 1, 2383057, NULL);
INSERT INTO taxon VALUES (6436, 1, 2405866, NULL);
INSERT INTO taxon VALUES (6437, 1, 2406187, NULL);
INSERT INTO taxon VALUES (6438, 1, 5213302, NULL);
INSERT INTO taxon VALUES (6439, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6440, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6441, 1, 2390836, NULL);
INSERT INTO taxon VALUES (6442, 1, 2390762, NULL);
INSERT INTO taxon VALUES (6443, 1, 2388808, NULL);
INSERT INTO taxon VALUES (6444, 1, 2404180, NULL);
INSERT INTO taxon VALUES (6445, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6446, 1, 5209174, NULL);
INSERT INTO taxon VALUES (6447, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6448, 1, 5209181, NULL);
INSERT INTO taxon VALUES (6449, 1, 5209748, NULL);
INSERT INTO taxon VALUES (6450, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6451, 1, 2406248, NULL);
INSERT INTO taxon VALUES (6608, 1, 5788225, NULL);
INSERT INTO taxon VALUES (6609, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6610, 1, 2384275, NULL);
INSERT INTO taxon VALUES (6611, 1, 2403816, NULL);
INSERT INTO taxon VALUES (6612, 1, 2388808, NULL);
INSERT INTO taxon VALUES (6613, 1, 2396519, NULL);
INSERT INTO taxon VALUES (6614, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6615, 1, 5961709, NULL);
INSERT INTO taxon VALUES (6616, 1, 5211452, NULL);
INSERT INTO taxon VALUES (6617, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6618, 1, 2384721, NULL);
INSERT INTO taxon VALUES (6619, 1, 2389831, NULL);
INSERT INTO taxon VALUES (6620, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6621, 1, 2390762, NULL);
INSERT INTO taxon VALUES (6622, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6623, 1, 2388809, NULL);
INSERT INTO taxon VALUES (6624, 1, 2407087, NULL);
INSERT INTO taxon VALUES (6625, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6626, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6627, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6628, 1, 2374069, NULL);
INSERT INTO taxon VALUES (6629, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6630, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6631, 1, 2418234, NULL);
INSERT INTO taxon VALUES (6632, 1, 5209181, NULL);
INSERT INTO taxon VALUES (6633, 1, 5212213, NULL);
INSERT INTO taxon VALUES (6634, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6635, 1, 2403798, NULL);
INSERT INTO taxon VALUES (6636, 1, 2393901, NULL);
INSERT INTO taxon VALUES (6637, 1, 5212165, NULL);
INSERT INTO taxon VALUES (6638, 1, 2377830, NULL);
INSERT INTO taxon VALUES (6639, 1, 2406748, NULL);
INSERT INTO taxon VALUES (6640, 1, 2418312, NULL);
INSERT INTO taxon VALUES (6641, 1, 2388373, NULL);
INSERT INTO taxon VALUES (6642, 1, 5209188, NULL);
INSERT INTO taxon VALUES (6643, 1, 2376682, NULL);
INSERT INTO taxon VALUES (6644, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6645, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6646, 1, 2376682, NULL);
INSERT INTO taxon VALUES (6647, 1, 5212222, NULL);
INSERT INTO taxon VALUES (6648, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6649, 1, 5209181, NULL);
INSERT INTO taxon VALUES (6650, 1, 2385344, NULL);
INSERT INTO taxon VALUES (6651, 1, 5201123, NULL);
INSERT INTO taxon VALUES (6652, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6653, 1, 5212651, NULL);
INSERT INTO taxon VALUES (6654, 1, 2407732, NULL);
INSERT INTO taxon VALUES (6655, 1, 5209681, NULL);
INSERT INTO taxon VALUES (6656, 1, 5212237, NULL);
INSERT INTO taxon VALUES (6657, 1, 5212213, NULL);
INSERT INTO taxon VALUES (6658, 1, 2390847, NULL);
INSERT INTO taxon VALUES (6659, 1, 2419499, NULL);
INSERT INTO taxon VALUES (6660, 1, 2418234, NULL);
INSERT INTO taxon VALUES (6661, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6662, 1, 2418109, NULL);
INSERT INTO taxon VALUES (6663, 1, 2417495, NULL);
INSERT INTO taxon VALUES (6664, 1, 2388809, NULL);
INSERT INTO taxon VALUES (6665, 1, 2381286, NULL);
INSERT INTO taxon VALUES (6666, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6667, 1, 5209188, NULL);
INSERT INTO taxon VALUES (6668, 1, 2407087, NULL);
INSERT INTO taxon VALUES (6669, 1, 2378717, NULL);
INSERT INTO taxon VALUES (6670, 1, 2385289, NULL);
INSERT INTO taxon VALUES (6671, 1, 2389831, NULL);
INSERT INTO taxon VALUES (6672, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6673, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6674, 1, 5216248, NULL);
INSERT INTO taxon VALUES (6675, 1, 5213455, NULL);
INSERT INTO taxon VALUES (6676, 1, 2418052, NULL);
INSERT INTO taxon VALUES (6677, 1, 5961708, NULL);
INSERT INTO taxon VALUES (6678, 1, 2387497, NULL);
INSERT INTO taxon VALUES (6679, 1, 2410398, NULL);
INSERT INTO taxon VALUES (6680, 1, 5209748, NULL);
INSERT INTO taxon VALUES (6681, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6682, 1, 2390762, NULL);
INSERT INTO taxon VALUES (6683, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6684, 1, 2374013, NULL);
INSERT INTO taxon VALUES (6685, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6686, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6687, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6688, 1, 5211723, NULL);
INSERT INTO taxon VALUES (6689, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6690, 1, 2332598, NULL);
INSERT INTO taxon VALUES (6691, 1, 2401132, NULL);
INSERT INTO taxon VALUES (6692, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6693, 1, 2375113, NULL);
INSERT INTO taxon VALUES (6694, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6695, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6696, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6697, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6698, 1, 2406708, NULL);
INSERT INTO taxon VALUES (6699, 1, 2381939, NULL);
INSERT INTO taxon VALUES (6700, 1, 2393551, NULL);
INSERT INTO taxon VALUES (6701, 1, 5788047, NULL);
INSERT INTO taxon VALUES (6702, 1, 5210913, NULL);
INSERT INTO taxon VALUES (6703, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6704, 1, 2396519, NULL);
INSERT INTO taxon VALUES (6705, 1, 2388808, NULL);
INSERT INTO taxon VALUES (6706, 1, 2385404, NULL);
INSERT INTO taxon VALUES (6707, 1, 2385615, NULL);
INSERT INTO taxon VALUES (6708, 1, 2393901, NULL);
INSERT INTO taxon VALUES (6709, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6710, 1, 2390537, NULL);
INSERT INTO taxon VALUES (6711, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6712, 1, 5213361, NULL);
INSERT INTO taxon VALUES (6713, 1, 2408186, NULL);
INSERT INTO taxon VALUES (6714, 1, 2374069, NULL);
INSERT INTO taxon VALUES (6715, 1, 2419426, NULL);
INSERT INTO taxon VALUES (6716, 1, 2391064, NULL);
INSERT INTO taxon VALUES (6717, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6718, 1, 5209174, NULL);
INSERT INTO taxon VALUES (6719, 1, 5209687, NULL);
INSERT INTO taxon VALUES (6720, 1, 5212165, NULL);
INSERT INTO taxon VALUES (6721, 1, 2377830, NULL);
INSERT INTO taxon VALUES (6722, 1, 2399845, NULL);
INSERT INTO taxon VALUES (6723, 1, 2347492, NULL);
INSERT INTO taxon VALUES (6724, 1, 2403802, NULL);
INSERT INTO taxon VALUES (6725, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6726, 1, 5211452, NULL);
INSERT INTO taxon VALUES (6727, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6728, 1, 5211671, NULL);
INSERT INTO taxon VALUES (6729, 1, 5210446, NULL);
INSERT INTO taxon VALUES (6730, 1, 2397724, NULL);
INSERT INTO taxon VALUES (6731, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6732, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6733, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6734, 1, 2397873, NULL);
INSERT INTO taxon VALUES (6735, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6736, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6737, 1, 2388737, NULL);
INSERT INTO taxon VALUES (6738, 1, 2350821, NULL);
INSERT INTO taxon VALUES (6739, 1, 2334693, NULL);
INSERT INTO taxon VALUES (6740, 1, 2393899, NULL);
INSERT INTO taxon VALUES (6741, 1, 2415317, NULL);
INSERT INTO taxon VALUES (6742, 1, 2387913, NULL);
INSERT INTO taxon VALUES (6743, 1, 5212673, NULL);
INSERT INTO taxon VALUES (6744, 1, 2390836, NULL);
INSERT INTO taxon VALUES (6745, 1, 2390989, NULL);
INSERT INTO taxon VALUES (6746, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6747, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6748, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6749, 1, 2406957, NULL);
INSERT INTO taxon VALUES (6750, 1, 2334586, NULL);
INSERT INTO taxon VALUES (6751, 1, 2409465, NULL);
INSERT INTO taxon VALUES (6752, 1, 2406961, NULL);
INSERT INTO taxon VALUES (6753, 1, 2399906, NULL);
INSERT INTO taxon VALUES (6754, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6755, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6756, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6757, 1, 2334636, NULL);
INSERT INTO taxon VALUES (6758, 1, 2404442, NULL);
INSERT INTO taxon VALUES (6759, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6760, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6761, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6762, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6763, 1, 5213187, NULL);
INSERT INTO taxon VALUES (6764, 1, 5212673, NULL);
INSERT INTO taxon VALUES (6765, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6766, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6767, 1, 2334682, NULL);
INSERT INTO taxon VALUES (6768, 1, 2373969, NULL);
INSERT INTO taxon VALUES (6769, 1, 2383029, NULL);
INSERT INTO taxon VALUES (6770, 1, 5210913, NULL);
INSERT INTO taxon VALUES (6771, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6772, 1, 5961708, NULL);
INSERT INTO taxon VALUES (6773, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6774, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6775, 1, 2374374, NULL);
INSERT INTO taxon VALUES (6776, 1, 2403010, NULL);
INSERT INTO taxon VALUES (6777, 1, 2398749, NULL);
INSERT INTO taxon VALUES (6778, 1, 2374282, NULL);
INSERT INTO taxon VALUES (6779, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6780, 1, 2373996, NULL);
INSERT INTO taxon VALUES (6781, 1, 2383034, NULL);
INSERT INTO taxon VALUES (6782, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6783, 1, 2393922, NULL);
INSERT INTO taxon VALUES (6784, 1, 2373946, NULL);
INSERT INTO taxon VALUES (6785, 1, 2395285, NULL);
INSERT INTO taxon VALUES (6786, 1, 2400657, NULL);
INSERT INTO taxon VALUES (6787, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6788, 1, 2334560, NULL);
INSERT INTO taxon VALUES (6789, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6790, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6791, 1, 2404520, NULL);
INSERT INTO taxon VALUES (6792, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6793, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6794, 1, 2334586, NULL);
INSERT INTO taxon VALUES (6795, 1, 2334385, NULL);
INSERT INTO taxon VALUES (6796, 1, 2403413, NULL);
INSERT INTO taxon VALUES (6797, 1, 2411479, NULL);
INSERT INTO taxon VALUES (6798, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6799, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6800, 1, 2407829, NULL);
INSERT INTO taxon VALUES (6801, 1, 2374402, NULL);
INSERT INTO taxon VALUES (6802, 1, 2404414, NULL);
INSERT INTO taxon VALUES (6803, 1, 2334682, NULL);
INSERT INTO taxon VALUES (6804, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6805, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6806, 1, 2391852, NULL);
INSERT INTO taxon VALUES (6807, 1, 2383057, NULL);
INSERT INTO taxon VALUES (6808, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6809, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6810, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6811, 1, 2401159, NULL);
INSERT INTO taxon VALUES (6812, 1, 5213152, NULL);
INSERT INTO taxon VALUES (6813, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6814, 1, 2417522, NULL);
INSERT INTO taxon VALUES (6815, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6816, 1, 2391007, NULL);
INSERT INTO taxon VALUES (6817, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6818, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6819, 1, 2378453, NULL);
INSERT INTO taxon VALUES (6820, 1, 2334641, NULL);
INSERT INTO taxon VALUES (6821, 1, 5212691, NULL);
INSERT INTO taxon VALUES (6822, 1, 2389013, NULL);
INSERT INTO taxon VALUES (6823, 1, 2356977, NULL);
INSERT INTO taxon VALUES (6824, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6825, 1, 2404180, NULL);
INSERT INTO taxon VALUES (6826, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6827, 1, 2418789, NULL);
INSERT INTO taxon VALUES (6828, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6829, 1, 2375267, NULL);
INSERT INTO taxon VALUES (6830, 1, 2395172, NULL);
INSERT INTO taxon VALUES (6831, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6832, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6833, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6834, 1, 2391355, NULL);
INSERT INTO taxon VALUES (6835, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6836, 1, 5961738, NULL);
INSERT INTO taxon VALUES (6837, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6838, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6839, 1, 4286140, NULL);
INSERT INTO taxon VALUES (6840, 1, 2397873, NULL);
INSERT INTO taxon VALUES (6841, 1, 2403964, NULL);
INSERT INTO taxon VALUES (6842, 1, 2395285, NULL);
INSERT INTO taxon VALUES (6843, 1, 2347440, NULL);
INSERT INTO taxon VALUES (6844, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6845, 1, 2405866, NULL);
INSERT INTO taxon VALUES (6846, 1, 2410398, NULL);
INSERT INTO taxon VALUES (6847, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6848, 1, 2401132, NULL);
INSERT INTO taxon VALUES (6849, 1, 2385289, NULL);
INSERT INTO taxon VALUES (6850, 1, 2384981, NULL);
INSERT INTO taxon VALUES (6851, 1, 2405710, NULL);
INSERT INTO taxon VALUES (6852, 1, 2396970, NULL);
INSERT INTO taxon VALUES (6853, 1, 2384140, NULL);
INSERT INTO taxon VALUES (6854, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6855, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6856, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6857, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6858, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6859, 1, 2384245, NULL);
INSERT INTO taxon VALUES (6860, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6861, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6862, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6863, 1, 2398749, NULL);
INSERT INTO taxon VALUES (6864, 1, 2381286, NULL);
INSERT INTO taxon VALUES (6865, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6866, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6867, 1, 2346825, NULL);
INSERT INTO taxon VALUES (6868, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6869, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6870, 1, 5212691, NULL);
INSERT INTO taxon VALUES (6871, 1, 2381512, NULL);
INSERT INTO taxon VALUES (6872, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6873, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6874, 1, 2395689, NULL);
INSERT INTO taxon VALUES (6875, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6876, 1, 2403798, NULL);
INSERT INTO taxon VALUES (6877, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6878, 1, 2375045, NULL);
INSERT INTO taxon VALUES (6879, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6880, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6881, 1, 2393733, NULL);
INSERT INTO taxon VALUES (6882, 1, 2393899, NULL);
INSERT INTO taxon VALUES (6883, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6884, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6885, 1, 2356977, NULL);
INSERT INTO taxon VALUES (6886, 1, 2389013, NULL);
INSERT INTO taxon VALUES (6887, 1, 5211452, NULL);
INSERT INTO taxon VALUES (6888, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6889, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6890, 1, 2357064, NULL);
INSERT INTO taxon VALUES (6891, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6892, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6893, 1, 5961709, NULL);
INSERT INTO taxon VALUES (6894, 1, 5212673, NULL);
INSERT INTO taxon VALUES (6895, 1, 2389881, NULL);
INSERT INTO taxon VALUES (6896, 1, 2389044, NULL);
INSERT INTO taxon VALUES (6897, 1, 2375993, NULL);
INSERT INTO taxon VALUES (6898, 1, 2334636, NULL);
INSERT INTO taxon VALUES (6899, 1, 2334371, NULL);
INSERT INTO taxon VALUES (6900, 1, 2383029, NULL);
INSERT INTO taxon VALUES (6901, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6902, 1, 2407041, NULL);
INSERT INTO taxon VALUES (6903, 1, 2391774, NULL);
INSERT INTO taxon VALUES (6904, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6905, 1, 2334693, NULL);
INSERT INTO taxon VALUES (6906, 1, 2377472, NULL);
INSERT INTO taxon VALUES (6907, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6908, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6909, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6910, 1, 2410398, NULL);
INSERT INTO taxon VALUES (6911, 1, 5961696, NULL);
INSERT INTO taxon VALUES (6912, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6913, 1, 5852347, NULL);
INSERT INTO taxon VALUES (6914, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6915, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6916, 1, 2393936, NULL);
INSERT INTO taxon VALUES (6917, 1, 2391852, NULL);
INSERT INTO taxon VALUES (6918, 1, 2388737, NULL);
INSERT INTO taxon VALUES (6919, 1, 2389034, NULL);
INSERT INTO taxon VALUES (6920, 1, 2378453, NULL);
INSERT INTO taxon VALUES (6921, 1, 2420813, NULL);
INSERT INTO taxon VALUES (6922, 1, 5788225, NULL);
INSERT INTO taxon VALUES (6923, 1, 2407103, NULL);
INSERT INTO taxon VALUES (6924, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6925, 1, 2373969, NULL);
INSERT INTO taxon VALUES (6926, 1, 2406708, NULL);
INSERT INTO taxon VALUES (6927, 1, 2388809, NULL);
INSERT INTO taxon VALUES (6928, 1, 2418789, NULL);
INSERT INTO taxon VALUES (6929, 1, 5213361, NULL);
INSERT INTO taxon VALUES (6930, 1, 5216248, NULL);
INSERT INTO taxon VALUES (6931, 1, 2403930, NULL);
INSERT INTO taxon VALUES (6932, 1, 5961719, NULL);
INSERT INTO taxon VALUES (6933, 1, 2418077, NULL);
INSERT INTO taxon VALUES (6934, 1, 2418794, NULL);
INSERT INTO taxon VALUES (6935, 1, 2403887, NULL);
INSERT INTO taxon VALUES (6936, 1, 2397850, NULL);
INSERT INTO taxon VALUES (6937, 1, 5216258, NULL);
INSERT INTO taxon VALUES (6938, 1, 2385140, NULL);
INSERT INTO taxon VALUES (6939, 1, 2389125, NULL);
INSERT INTO taxon VALUES (6940, 1, 5213725, NULL);
INSERT INTO taxon VALUES (6941, 1, 2384721, NULL);
INSERT INTO taxon VALUES (6942, 1, 5216338, NULL);
INSERT INTO taxon VALUES (6943, 1, 2390762, NULL);
INSERT INTO taxon VALUES (6944, 1, 2389831, NULL);
INSERT INTO taxon VALUES (6945, 1, 2403798, NULL);
INSERT INTO taxon VALUES (6946, 1, 2404065, NULL);
INSERT INTO taxon VALUES (6947, 1, 2407107, NULL);
INSERT INTO taxon VALUES (6948, 1, 2397873, NULL);
INSERT INTO taxon VALUES (6949, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6950, 1, 2397775, NULL);
INSERT INTO taxon VALUES (6951, 1, 2381939, NULL);
INSERT INTO taxon VALUES (6952, 1, 2407087, NULL);
INSERT INTO taxon VALUES (6953, 1, 2391055, NULL);
INSERT INTO taxon VALUES (6954, 1, 2333605, NULL);
INSERT INTO taxon VALUES (6955, 1, 2418312, NULL);
INSERT INTO taxon VALUES (6956, 1, 2418109, NULL);
INSERT INTO taxon VALUES (6957, 1, 2418009, NULL);
INSERT INTO taxon VALUES (6958, 1, 2374069, NULL);
INSERT INTO taxon VALUES (6959, 1, 2397724, NULL);
INSERT INTO taxon VALUES (6960, 1, 2403802, NULL);
INSERT INTO taxon VALUES (6961, 1, 2418234, NULL);
INSERT INTO taxon VALUES (6962, 1, 2384856, NULL);
INSERT INTO taxon VALUES (6963, 1, 2389021, NULL);
INSERT INTO taxon VALUES (6964, 1, 2417940, NULL);
INSERT INTO taxon VALUES (6965, 1, 2388747, NULL);
INSERT INTO taxon VALUES (6966, 1, 2383057, NULL);
INSERT INTO taxon VALUES (6967, 1, 2407829, NULL);
INSERT INTO taxon VALUES (6968, 1, 5961682, NULL);
INSERT INTO taxon VALUES (6969, 1, 2393931, NULL);
INSERT INTO taxon VALUES (6970, 1, 2395172, NULL);
INSERT INTO taxon VALUES (6971, 1, 2398866, NULL);
INSERT INTO taxon VALUES (6972, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6973, 1, 2394277, NULL);
INSERT INTO taxon VALUES (6974, 1, 2387710, NULL);
INSERT INTO taxon VALUES (6975, 1, 2407041, NULL);
INSERT INTO taxon VALUES (6976, 1, 2418789, NULL);
INSERT INTO taxon VALUES (6977, 1, 2384531, NULL);
INSERT INTO taxon VALUES (6978, 1, 2385620, NULL);
INSERT INTO taxon VALUES (6979, 1, 2396813, NULL);
INSERT INTO taxon VALUES (6980, 1, 2393922, NULL);
INSERT INTO taxon VALUES (6981, 1, 2356819, NULL);
INSERT INTO taxon VALUES (6982, 1, 2391007, NULL);
INSERT INTO taxon VALUES (6983, 1, 2417495, NULL);
INSERT INTO taxon VALUES (6984, 1, 2375045, NULL);
INSERT INTO taxon VALUES (6985, 1, 2407141, NULL);
INSERT INTO taxon VALUES (6986, 1, 2398843, NULL);
INSERT INTO taxon VALUES (6987, 1, 2381286, NULL);
INSERT INTO taxon VALUES (6988, 1, 2388456, NULL);
INSERT INTO taxon VALUES (6989, 1, 2417495, NULL);
INSERT INTO taxon VALUES (6990, 1, 5204778, NULL);
INSERT INTO taxon VALUES (6991, 1, 2384275, NULL);
INSERT INTO taxon VALUES (6992, 1, 5853038, NULL);
INSERT INTO taxon VALUES (6993, 1, 2396844, NULL);
INSERT INTO taxon VALUES (6994, 1, 2378717, NULL);
INSERT INTO taxon VALUES (6995, 1, 5210100, NULL);
INSERT INTO taxon VALUES (6996, 1, 2388708, NULL);
INSERT INTO taxon VALUES (6997, 1, 5211450, NULL);
INSERT INTO taxon VALUES (6998, 1, 5210446, NULL);
INSERT INTO taxon VALUES (6999, 1, 2396970, NULL);
INSERT INTO taxon VALUES (7000, 1, 4286140, NULL);
INSERT INTO taxon VALUES (7001, 1, 2389034, NULL);
INSERT INTO taxon VALUES (7002, 1, 2398749, NULL);
INSERT INTO taxon VALUES (7003, 1, 2389125, NULL);
INSERT INTO taxon VALUES (7004, 1, 2384948, NULL);
INSERT INTO taxon VALUES (7005, 1, 2391774, NULL);
INSERT INTO taxon VALUES (7006, 1, 2357064, NULL);
INSERT INTO taxon VALUES (7007, 1, 2378453, NULL);
INSERT INTO taxon VALUES (7008, 1, 2398866, NULL);
INSERT INTO taxon VALUES (7009, 1, 2387710, NULL);
INSERT INTO taxon VALUES (7010, 1, 5212237, NULL);
INSERT INTO taxon VALUES (7011, 1, 2399906, NULL);
INSERT INTO taxon VALUES (7012, 1, 5212222, NULL);
INSERT INTO taxon VALUES (7013, 1, 2368648, NULL);
INSERT INTO taxon VALUES (7014, 1, 2384245, NULL);
INSERT INTO taxon VALUES (7015, 1, 2376682, NULL);
INSERT INTO taxon VALUES (7016, 1, 2394277, NULL);
INSERT INTO taxon VALUES (7017, 1, 2403964, NULL);
INSERT INTO taxon VALUES (7018, 1, 2334557, NULL);
INSERT INTO taxon VALUES (7019, 1, 2419569, NULL);
INSERT INTO taxon VALUES (7020, 1, 2375993, NULL);
INSERT INTO taxon VALUES (7021, 1, 2389881, NULL);
INSERT INTO taxon VALUES (7022, 1, 5213187, NULL);
INSERT INTO taxon VALUES (7023, 1, 2377830, NULL);
INSERT INTO taxon VALUES (7024, 1, 2368613, NULL);
INSERT INTO taxon VALUES (7025, 1, 5211452, NULL);
INSERT INTO taxon VALUES (7026, 1, 5212165, NULL);
INSERT INTO taxon VALUES (7027, 1, 2396813, NULL);
INSERT INTO taxon VALUES (7028, 1, 2399845, NULL);
INSERT INTO taxon VALUES (7029, 1, 2385620, NULL);
INSERT INTO taxon VALUES (7030, 1, 2334636, NULL);
INSERT INTO taxon VALUES (7031, 1, 2375993, NULL);
INSERT INTO taxon VALUES (7032, 1, 2384531, NULL);
INSERT INTO taxon VALUES (7033, 1, 2393936, NULL);
INSERT INTO taxon VALUES (7034, 1, 5204778, NULL);
INSERT INTO taxon VALUES (7035, 1, 5211450, NULL);
INSERT INTO taxon VALUES (7036, 1, 2373946, NULL);
INSERT INTO taxon VALUES (7037, 1, 2398843, NULL);
INSERT INTO taxon VALUES (7038, 1, 2384245, NULL);
INSERT INTO taxon VALUES (7039, 1, 2407732, NULL);
INSERT INTO taxon VALUES (7040, 1, 2373969, NULL);
INSERT INTO taxon VALUES (7041, 1, 2388809, NULL);
INSERT INTO taxon VALUES (7042, 1, 2384140, NULL);
INSERT INTO taxon VALUES (7043, 1, 5213152, NULL);
INSERT INTO taxon VALUES (7044, 1, 5853038, NULL);
INSERT INTO taxon VALUES (7045, 1, 2381939, NULL);
INSERT INTO taxon VALUES (7046, 1, 2397724, NULL);
INSERT INTO taxon VALUES (7047, 1, 2407103, NULL);
INSERT INTO taxon VALUES (7048, 1, 2384531, NULL);
INSERT INTO taxon VALUES (7049, 1, 2389881, NULL);
INSERT INTO taxon VALUES (7050, 1, 2374013, NULL);
INSERT INTO taxon VALUES (7051, 1, 2388808, NULL);
INSERT INTO taxon VALUES (7052, 1, 2393551, NULL);
INSERT INTO taxon VALUES (7053, 1, 5961682, NULL);
INSERT INTO taxon VALUES (7054, 1, 2407087, NULL);
INSERT INTO taxon VALUES (7055, 1, 2385620, NULL);
INSERT INTO taxon VALUES (7056, 1, 2377830, NULL);
INSERT INTO taxon VALUES (7057, 1, 2407041, NULL);
INSERT INTO taxon VALUES (7058, 1, 2376682, NULL);
INSERT INTO taxon VALUES (7059, 1, 5853038, NULL);
INSERT INTO taxon VALUES (7060, 1, 2377830, NULL);
INSERT INTO taxon VALUES (7061, 1, 2385620, NULL);
INSERT INTO taxon VALUES (7062, 1, 2396519, NULL);
INSERT INTO taxon VALUES (7063, 1, 2407925, NULL);
INSERT INTO taxon VALUES (7064, 1, 2384981, NULL);
INSERT INTO taxon VALUES (7065, 1, 2406957, NULL);
INSERT INTO taxon VALUES (7066, 1, 2403930, NULL);
INSERT INTO taxon VALUES (7067, 1, 5212237, NULL);
INSERT INTO taxon VALUES (7068, 1, 2384856, NULL);
INSERT INTO taxon VALUES (7069, 1, 2389044, NULL);
INSERT INTO taxon VALUES (7070, 1, 2389881, NULL);
INSERT INTO taxon VALUES (7071, 1, 2405710, NULL);
INSERT INTO taxon VALUES (7072, 1, 2397850, NULL);
INSERT INTO taxon VALUES (7073, 1, 2388809, NULL);
INSERT INTO taxon VALUES (7074, 1, 2384531, NULL);
INSERT INTO taxon VALUES (7075, 1, 2406262, NULL);
INSERT INTO taxon VALUES (7076, 1, 2391055, NULL);
INSERT INTO taxon VALUES (7077, 1, 2398843, NULL);
INSERT INTO taxon VALUES (7078, 1, 5211450, NULL);
INSERT INTO taxon VALUES (7079, 1, 2390847, NULL);
INSERT INTO taxon VALUES (7080, 1, 2389034, NULL);
INSERT INTO taxon VALUES (7081, 1, 2406331, NULL);
INSERT INTO taxon VALUES (7082, 1, 2384721, NULL);
INSERT INTO taxon VALUES (7083, 1, 2403964, NULL);
INSERT INTO taxon VALUES (7084, 1, 2403964, NULL);
INSERT INTO taxon VALUES (7085, 1, 2347474, NULL);
INSERT INTO taxon VALUES (7086, 1, 2397724, NULL);
INSERT INTO taxon VALUES (7087, 1, 2405853, NULL);
INSERT INTO taxon VALUES (7088, 1, 2419178, NULL);
INSERT INTO taxon VALUES (7089, 1, 2407107, NULL);
INSERT INTO taxon VALUES (7090, 1, 2418312, NULL);
INSERT INTO taxon VALUES (7091, 1, 2418312, NULL);
INSERT INTO taxon VALUES (7092, 1, 2346841, NULL);
INSERT INTO taxon VALUES (7093, 1, 2407732, NULL);
INSERT INTO taxon VALUES (7094, 1, 2406093, NULL);
INSERT INTO taxon VALUES (7095, 1, 2407041, NULL);
INSERT INTO taxon VALUES (7096, 1, 5209188, NULL);
INSERT INTO taxon VALUES (7097, 1, 2384245, NULL);
INSERT INTO taxon VALUES (7098, 1, 2406273, NULL);
INSERT INTO taxon VALUES (7099, 1, 5204778, NULL);
INSERT INTO taxon VALUES (7100, 1, 2390989, NULL);
INSERT INTO taxon VALUES (7101, 1, 2391055, NULL);
INSERT INTO taxon VALUES (7102, 1, 2406721, NULL);
INSERT INTO taxon VALUES (7103, 1, 2388737, NULL);
INSERT INTO taxon VALUES (7104, 1, 2381939, NULL);
INSERT INTO taxon VALUES (7105, 1, 2334636, NULL);
INSERT INTO taxon VALUES (7106, 1, 2389881, NULL);
INSERT INTO taxon VALUES (7107, 1, 2393936, NULL);
INSERT INTO taxon VALUES (7108, 1, 2406217, NULL);
INSERT INTO taxon VALUES (7109, 1, 2346825, NULL);
INSERT INTO taxon VALUES (7110, 1, 2388747, NULL);
INSERT INTO taxon VALUES (7111, 1, 2375045, NULL);
INSERT INTO taxon VALUES (7112, 1, 5961682, NULL);
INSERT INTO taxon VALUES (7113, 1, 5788220, NULL);
INSERT INTO taxon VALUES (7114, 1, 2407141, NULL);
INSERT INTO taxon VALUES (7115, 1, 2406285, NULL);
INSERT INTO taxon VALUES (7116, 1, 5961682, NULL);
INSERT INTO taxon VALUES (7117, 1, 5204778, NULL);
INSERT INTO taxon VALUES (7118, 1, 2389125, NULL);
INSERT INTO taxon VALUES (7119, 1, 2387887, NULL);
INSERT INTO taxon VALUES (7120, 1, 2403930, NULL);
INSERT INTO taxon VALUES (7121, 1, 2404065, NULL);
INSERT INTO taxon VALUES (7122, 1, 2383057, NULL);
INSERT INTO taxon VALUES (7123, 1, 2405866, NULL);
INSERT INTO taxon VALUES (7124, 1, 2406187, NULL);
INSERT INTO taxon VALUES (7125, 1, 5213302, NULL);
INSERT INTO taxon VALUES (7126, 1, 2417940, NULL);
INSERT INTO taxon VALUES (7127, 1, 2407103, NULL);
INSERT INTO taxon VALUES (7128, 1, 2390836, NULL);
INSERT INTO taxon VALUES (7129, 1, 2390762, NULL);
INSERT INTO taxon VALUES (7130, 1, 2388808, NULL);
INSERT INTO taxon VALUES (7131, 1, 2404180, NULL);
INSERT INTO taxon VALUES (7132, 1, 2404065, NULL);
INSERT INTO taxon VALUES (7133, 1, 5209174, NULL);
INSERT INTO taxon VALUES (7134, 1, 2388708, NULL);
INSERT INTO taxon VALUES (7135, 1, 5209181, NULL);
INSERT INTO taxon VALUES (7136, 1, 5209748, NULL);
INSERT INTO taxon VALUES (7137, 1, 5961696, NULL);
INSERT INTO taxon VALUES (7138, 1, 2406248, NULL);


--
-- TOC entry 2235 (class 0 OID 107178)
-- Dependencies: 175
-- Data for Name: unidade_medida; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--



--
-- TOC entry 2232 (class 0 OID 107154)
-- Dependencies: 172
-- Data for Name: usuario; Type: TABLE DATA; Schema: bio; Owner: biotecmar
--

INSERT INTO usuario VALUES (1, 'admin', 'Administrador', '202cb962ac59075b964b07152d234b70', NULL);


SET search_path = biotecmar, pg_catalog;

--
-- TOC entry 2252 (class 0 OID 187147)
-- Dependencies: 192
-- Data for Name: abiotic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2253 (class 0 OID 187152)
-- Dependencies: 193
-- Data for Name: area; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2254 (class 0 OID 187157)
-- Dependencies: 194
-- Data for Name: ator; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO ator VALUES (1, 'admin', 'Administrador', '202cb962ac59075b964b07152d234b70');


--
-- TOC entry 2255 (class 0 OID 187165)
-- Dependencies: 195
-- Data for Name: benthic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2256 (class 0 OID 187170)
-- Dependencies: 196
-- Data for Name: biotic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2230 (class 0 OID 74392)
-- Dependencies: 170
-- Data for Name: configuracao; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO configuracao VALUES ('gerenciador', '1.0');


--
-- TOC entry 2258 (class 0 OID 187177)
-- Dependencies: 198
-- Data for Name: contact; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO contact VALUES (1, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (2, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (3, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (4, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (5, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (6, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (7, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (8, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (9, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (10, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (11, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (12, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (13, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (14, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (15, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (16, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (17, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (18, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (19, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.595', 'crawler.gbif.org', NULL, 'Stephan', 377406, 'Hennekens', '2016-07-14 13:50:47.595', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (20, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.599', 'crawler.gbif.org', NULL, 'Stephan', 377407, 'Hennekens', '2016-07-14 13:50:47.599', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (21, NULL, 'NETHERLANDS', '2016-07-14 13:50:47.603', 'crawler.gbif.org', NULL, 'Stephan', 377408, 'Hennekens', '2016-07-14 13:50:47.603', 'crawler.gbif.org', 'Alterra, Wageningen UR', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (22, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.646', 'dataset-updater cli', NULL, 'Stamatina', 467009, 'Nikolopoulou', '2016-08-26 05:55:17.646', 'dataset-updater cli', 'Hellenic Center for Marine Research', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (23, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.65', 'dataset-updater cli', NULL, 'Irini', 467010, 'Tsikopoulou', '2016-08-26 05:55:17.65', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (24, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.653', 'dataset-updater cli', NULL, 'Irini', 467011, 'Tsikopoulou', '2016-08-26 05:55:17.653', 'dataset-updater cli', 'University of Crete', NULL, false, NULL, 'USER', 1);
INSERT INTO contact VALUES (25, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.656', 'dataset-updater cli', NULL, 'Irini', 467012, 'Tsikopoulou', '2016-08-26 05:55:17.656', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (26, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.646', 'dataset-updater cli', NULL, 'Stamatina', 467009, 'Nikolopoulou', '2016-08-26 05:55:17.646', 'dataset-updater cli', 'Hellenic Center for Marine Research', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (27, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.65', 'dataset-updater cli', NULL, 'Irini', 467010, 'Tsikopoulou', '2016-08-26 05:55:17.65', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (28, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.653', 'dataset-updater cli', NULL, 'Irini', 467011, 'Tsikopoulou', '2016-08-26 05:55:17.653', 'dataset-updater cli', 'University of Crete', NULL, false, NULL, 'USER', 1);
INSERT INTO contact VALUES (29, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.656', 'dataset-updater cli', NULL, 'Irini', 467012, 'Tsikopoulou', '2016-08-26 05:55:17.656', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (30, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.646', 'dataset-updater cli', NULL, 'Stamatina', 467009, 'Nikolopoulou', '2016-08-26 05:55:17.646', 'dataset-updater cli', 'Hellenic Center for Marine Research', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (31, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.65', 'dataset-updater cli', NULL, 'Irini', 467010, 'Tsikopoulou', '2016-08-26 05:55:17.65', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (32, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.653', 'dataset-updater cli', NULL, 'Irini', 467011, 'Tsikopoulou', '2016-08-26 05:55:17.653', 'dataset-updater cli', 'University of Crete', NULL, false, NULL, 'USER', 1);
INSERT INTO contact VALUES (33, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.656', 'dataset-updater cli', NULL, 'Irini', 467012, 'Tsikopoulou', '2016-08-26 05:55:17.656', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (34, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.646', 'dataset-updater cli', NULL, 'Stamatina', 467009, 'Nikolopoulou', '2016-08-26 05:55:17.646', 'dataset-updater cli', 'Hellenic Center for Marine Research', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (35, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.65', 'dataset-updater cli', NULL, 'Irini', 467010, 'Tsikopoulou', '2016-08-26 05:55:17.65', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (36, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.653', 'dataset-updater cli', NULL, 'Irini', 467011, 'Tsikopoulou', '2016-08-26 05:55:17.653', 'dataset-updater cli', 'University of Crete', NULL, false, NULL, 'USER', 1);
INSERT INTO contact VALUES (37, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.656', 'dataset-updater cli', NULL, 'Irini', 467012, 'Tsikopoulou', '2016-08-26 05:55:17.656', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);
INSERT INTO contact VALUES (38, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.646', 'dataset-updater cli', NULL, 'Stamatina', 467009, 'Nikolopoulou', '2016-08-26 05:55:17.646', 'dataset-updater cli', 'Hellenic Center for Marine Research', NULL, true, NULL, 'ORIGINATOR', 1);
INSERT INTO contact VALUES (39, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.65', 'dataset-updater cli', NULL, 'Irini', 467010, 'Tsikopoulou', '2016-08-26 05:55:17.65', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'METADATA_AUTHOR', 1);
INSERT INTO contact VALUES (40, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.653', 'dataset-updater cli', NULL, 'Irini', 467011, 'Tsikopoulou', '2016-08-26 05:55:17.653', 'dataset-updater cli', 'University of Crete', NULL, false, NULL, 'USER', 1);
INSERT INTO contact VALUES (41, 'HERAKLION', 'GREECE', '2016-08-26 05:55:17.656', 'dataset-updater cli', NULL, 'Irini', 467012, 'Tsikopoulou', '2016-08-26 05:55:17.656', 'dataset-updater cli', 'University of Crete', NULL, true, NULL, 'ADMINISTRATIVE_POINT_OF_CONTACT', 1);


--
-- TOC entry 2319 (class 0 OID 0)
-- Dependencies: 197
-- Name: contact_id_contato_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('contact_id_contato_seq', 41, true);


--
-- TOC entry 2259 (class 0 OID 187186)
-- Dependencies: 199
-- Data for Name: dataset; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO dataset VALUES (1, NULL, 'marine, harvested by iOBIS', NULL, '2016-05-24 09:11:18.494', '96d7ceab-ce9f-4c8a-8d3a-448a5637094a', '2016-07-10 19:00:00', NULL, '45adf020-a40b-4530-bbc0-0242daa4bd6c', 'This is a historical dataset that was published in 1939 by H. Harant and concerns of the faunistic report on the Ascidiacea collected during the floristical and faunistical survey of Adolf Steuer on the coasts near Alexandria mainly with the vessel “El Hoot”. This dataset contains occurrence data of Ascidiacea in the coasts of Alexandria, Egypt. Temporal coverage for this dataset is not described in the historical paper but only in the preliminary report of the expedition. Thus, it is assumed that the sample collection was done in the autumn of 1933 (beggining from the end of August to end of November).The digitization of this dataset was done by LifewatchGreece team.', NULL, false, NULL, 'http://www.synbiosys.alterra.nl/lvd', '21c0f0d1-6791-42db-af8e-556dcabca9b1', 'ENGLISH', '2016-08-30 10:27:12.496', 'KyleB', 0, NULL, 'Digitization of Historical Dataset-Egypt Expedition', '2016-07-10 19:00:00', '96d7ceab-ce9f-4c8a-8d3a-448a5637094a', NULL, NULL, NULL, 'Harant H. 1939. Les fonds de peche pres d''Alexandrie. Ascidiacea (Cartes 1-5). Notes et Memoirs No 28. Institut fouad 1er d'' Hydrobiologie et de peche, Egypt', 'SAMPLING_EVENT', '45adf020-a40b-4530-bbc0-0242daa4bd6c');


--
-- TOC entry 2261 (class 0 OID 187196)
-- Dependencies: 201
-- Data for Name: email; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO email VALUES (19, 'stephan.hennekens@wur.nl', 19);
INSERT INTO email VALUES (20, 'stephan.hennekens@wur.nl', 20);
INSERT INTO email VALUES (21, 'stephan.hennekens@wur.nl', 21);
INSERT INTO email VALUES (22, 'snikolo@hcmr.gr', 22);
INSERT INTO email VALUES (23, 'fellow_irene@yahoo.gr', 23);
INSERT INTO email VALUES (24, 'fellow_irene@yahoo.gr', 24);
INSERT INTO email VALUES (25, 'fellow_irene@yahoo.gr', 25);
INSERT INTO email VALUES (26, 'snikolo@hcmr.gr', 26);
INSERT INTO email VALUES (27, 'fellow_irene@yahoo.gr', 27);
INSERT INTO email VALUES (28, 'fellow_irene@yahoo.gr', 28);
INSERT INTO email VALUES (29, 'fellow_irene@yahoo.gr', 29);
INSERT INTO email VALUES (30, 'snikolo@hcmr.gr', 30);
INSERT INTO email VALUES (31, 'fellow_irene@yahoo.gr', 31);
INSERT INTO email VALUES (32, 'fellow_irene@yahoo.gr', 32);
INSERT INTO email VALUES (33, 'fellow_irene@yahoo.gr', 33);
INSERT INTO email VALUES (34, 'snikolo@hcmr.gr', 34);
INSERT INTO email VALUES (35, 'fellow_irene@yahoo.gr', 35);
INSERT INTO email VALUES (36, 'fellow_irene@yahoo.gr', 36);
INSERT INTO email VALUES (37, 'fellow_irene@yahoo.gr', 37);
INSERT INTO email VALUES (38, 'snikolo@hcmr.gr', 38);
INSERT INTO email VALUES (39, 'fellow_irene@yahoo.gr', 39);
INSERT INTO email VALUES (40, 'fellow_irene@yahoo.gr', 40);
INSERT INTO email VALUES (41, 'fellow_irene@yahoo.gr', 41);


--
-- TOC entry 2320 (class 0 OID 0)
-- Dependencies: 200
-- Name: email_id_email_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('email_id_email_seq', 41, true);


--
-- TOC entry 2263 (class 0 OID 187204)
-- Dependencies: 203
-- Data for Name: endereco; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2321 (class 0 OID 0)
-- Dependencies: 202
-- Name: endereco_id_endereco_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('endereco_id_endereco_seq', 1, false);


--
-- TOC entry 2283 (class 0 OID 187304)
-- Dependencies: 223
-- Data for Name: evento; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO evento VALUES (1, 200, NULL, 31.12, 29.66, '1933-11-08 00:00:00', '651', NULL, NULL, 'Halimeda,Caulerpa, brown algae,sand, stones', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (2, 200, NULL, 31.22, 29.89, '1933-11-15 00:00:00', '689', NULL, NULL, 'Caulerpa, Halimeda, Posidonia, Dasycladus', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (3, 200, NULL, 31.34, 29.90, '1933-09-06 00:00:00', '718', NULL, NULL, 'muddy, Halimeda, Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (4, 200, NULL, 31.16, 29.80, '1933-11-06 00:00:00', '793', NULL, NULL, 'stony, Caulerpa, Halimeda, Sargassum, Posidonia', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (5, 200, NULL, 31.15, 29.80, '1933-11-05 00:00:00', '785', NULL, NULL, 'Caulerpa, Posidonia', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (6, 200, NULL, 31.22, 29.88, '1933-09-21 00:00:00', '705', NULL, NULL, 'Stony,  Caulerpa, Halimeda', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (7, 200, NULL, 31.14, 29.80, '1933-09-20 00:00:00', '699', NULL, NULL, 'Caulerpa, Posidonia,Amphioxus, brown algae', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (8, 200, NULL, 31.22, 29.89, '1933-11-05 00:00:00', '775', NULL, NULL, 'stony, sandy, Caulerpa, Halimeda', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (9, 200, NULL, 31.21, 29.89, '1933-09-27 00:00:00', '721', NULL, NULL, 'coarse sand with stones and very little mud, Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (10, 200, NULL, 31.23, 29.88, '1933-11-05 00:00:00', '776', NULL, NULL, 'Caulerpa ,stones, Halimeda', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (11, 200, NULL, 31.20, 29.86, '1933-11-05 00:00:00', '777', NULL, NULL, 'Caulerpa, Halimeda, Posidonia,Stony, brown algae', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (12, 200, NULL, 31.35, 29.89, '1933-11-04 00:00:00', '771', NULL, NULL, 'Caulerpa, Halimeda,Mud', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (13, 200, NULL, 31.21, 29.89, '1933-09-11 00:00:00', '742', NULL, NULL, 'Caulerpa, Codium,Sand', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (14, 200, NULL, 31.14, 29.83, '1933-11-14 00:00:00', '674', NULL, NULL, 'stony, sandy, Caulerpa, Halimeda, Posidonia', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (15, 200, NULL, 31.21, 29.91, '1933-10-04 00:00:00', '724', NULL, NULL, 'shallow sandy, Codium, Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (16, 200, NULL, 31.32, 29.96, '1933-11-04 00:00:00', '772', NULL, NULL, 'Mud, Caulerpa, bottom with Enteropneustes', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (17, 200, NULL, 31.21, 29.87, '1933-10-10 00:00:00', '845', NULL, NULL, 'crags, Caulerpa, Halimeda,brown algae', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (18, 200, NULL, 31.12, 29.73, '1933-11-08 00:00:00', '647', NULL, NULL, 'coarse sand, Amphioxus sand, Halimeda, Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (19, 200, NULL, 31.22, 29.66, '1933-11-11 00:00:00', '660', NULL, NULL, 'Caulerpa, Halimeda,sand, mud, brown algae', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (20, 200, NULL, 31.22, 29.91, '1933-09-25 00:00:00', '719', NULL, NULL, 'stones, Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (21, 200, NULL, 31.17, 29.80, '1933-11-15 00:00:00', '685', NULL, NULL, 'Halimeda,stony, Amphioxus bottom', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (22, 200, NULL, 31.15, 29.83, '1933-11-14 00:00:00', '673', NULL, NULL, 'Posidonia, Caulerpa,rough sand, little mud, Amphioxus bottom', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (23, 200, NULL, 31.16, 29.84, '1933-11-14 00:00:00', '682', NULL, NULL, 'Caulerpa, Posidonia,stones, Amphioxus bottom, rough sand', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (24, 200, NULL, 31.37, 29.86, '1933-09-24 00:00:00', '712', NULL, NULL, 'mud with mollusc shells', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (25, 200, NULL, 31.28, 29.96, '1933-10-07 00:00:00', '726', NULL, NULL, 'Caulerpa, Posidonia, Halimeda,rough sand with Stones, Amphioxus, brown algae', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (26, 1300, NULL, 31.21, 29.89, NULL, '803', NULL, NULL, 'Ulva and coralline zone,Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (27, 800, NULL, 31.19, 29.87, NULL, '850', NULL, NULL, NULL, NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (28, 200, NULL, 31.24, 29.85, '1933-11-02 00:00:00', '764', NULL, NULL, 'Sand, mud,  Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (29, 200, NULL, 31.17, 29.84, '1933-11-07 00:00:00', '795', NULL, NULL, 'fine sand, Posidonia, Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (30, 200, NULL, 31.19, 29.84, '1933-11-07 00:00:00', '796', NULL, NULL, 'stones,sand,Posidonia, Caulerpa, Halimeda', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');
INSERT INTO evento VALUES (31, 200, NULL, 31.21, 29.90, '1933-10-04 00:00:00', '725', NULL, NULL, 'sand with Caulerpa', NULL, NULL, 'There are no specific informations about sampling method.By the Preliminary Report seems to be the same as the whole expedition-dredge with an opening of 20x70 cm (1400 cm2).Depth is measured in fathom=1.8288 metres.All the excursions were one day trip. For work near the coast a small rowing boat was available. References: Steuer A. 1935. The fishery grounds near Alexandria. 1. Preliminary Report, Notes and Memoirs No 8. Fisheries Research Directorate, Egypt.');


--
-- TOC entry 2322 (class 0 OID 0)
-- Dependencies: 222
-- Name: evento_id_evento_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('evento_id_evento_seq', 31, true);


--
-- TOC entry 2264 (class 0 OID 187210)
-- Dependencies: 204
-- Data for Name: fish_assembly_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO fish_assembly_analysis VALUES (1, NULL, 5, 1, 8);
INSERT INTO fish_assembly_analysis VALUES (2, NULL, 4, 1, 24);
INSERT INTO fish_assembly_analysis VALUES (3, NULL, 15, 2, 1);
INSERT INTO fish_assembly_analysis VALUES (4, NULL, 26, 2, 2);
INSERT INTO fish_assembly_analysis VALUES (5, NULL, 24, 2, 4);
INSERT INTO fish_assembly_analysis VALUES (6, NULL, 27, 2, 7);
INSERT INTO fish_assembly_analysis VALUES (7, NULL, 26, 2, 10);
INSERT INTO fish_assembly_analysis VALUES (8, NULL, 6, 2, 12);
INSERT INTO fish_assembly_analysis VALUES (9, NULL, 17, 2, 14);
INSERT INTO fish_assembly_analysis VALUES (10, NULL, 25, 2, 15);
INSERT INTO fish_assembly_analysis VALUES (11, NULL, 30, 2, 21);
INSERT INTO fish_assembly_analysis VALUES (12, NULL, 26, 2, 22);
INSERT INTO fish_assembly_analysis VALUES (13, NULL, 7, 2, 23);
INSERT INTO fish_assembly_analysis VALUES (14, NULL, 31, 2, 27);
INSERT INTO fish_assembly_analysis VALUES (15, NULL, 13, 2, 28);
INSERT INTO fish_assembly_analysis VALUES (16, NULL, 26, 2, 29);
INSERT INTO fish_assembly_analysis VALUES (17, NULL, 25, 2, 33);
INSERT INTO fish_assembly_analysis VALUES (18, NULL, 8, 3, 6);
INSERT INTO fish_assembly_analysis VALUES (19, NULL, 3, 4, 36);
INSERT INTO fish_assembly_analysis VALUES (20, NULL, 23, 5, 5);
INSERT INTO fish_assembly_analysis VALUES (21, NULL, 29, 5, 13);
INSERT INTO fish_assembly_analysis VALUES (22, NULL, 14, 5, 16);
INSERT INTO fish_assembly_analysis VALUES (23, NULL, 14, 5, 32);
INSERT INTO fish_assembly_analysis VALUES (24, NULL, 9, 6, 35);
INSERT INTO fish_assembly_analysis VALUES (25, NULL, 19, 7, 34);
INSERT INTO fish_assembly_analysis VALUES (26, NULL, 10, 8, 17);
INSERT INTO fish_assembly_analysis VALUES (27, NULL, 20, 8, 20);
INSERT INTO fish_assembly_analysis VALUES (28, NULL, 21, 9, 18);
INSERT INTO fish_assembly_analysis VALUES (29, NULL, 12, 10, 3);
INSERT INTO fish_assembly_analysis VALUES (30, NULL, 2, 11, 25);
INSERT INTO fish_assembly_analysis VALUES (31, NULL, 11, 12, 30);
INSERT INTO fish_assembly_analysis VALUES (32, NULL, 11, 12, 31);
INSERT INTO fish_assembly_analysis VALUES (33, NULL, 18, 13, 37);
INSERT INTO fish_assembly_analysis VALUES (34, NULL, 28, 14, 11);
INSERT INTO fish_assembly_analysis VALUES (35, NULL, 28, 14, 26);
INSERT INTO fish_assembly_analysis VALUES (36, NULL, 22, 15, 9);
INSERT INTO fish_assembly_analysis VALUES (37, NULL, 16, 16, 19);
INSERT INTO fish_assembly_analysis VALUES (38, NULL, 1, 17, 38);


--
-- TOC entry 2323 (class 0 OID 0)
-- Dependencies: 224
-- Name: fish_assembly_analysis_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('fish_assembly_analysis_id_seq', 38, true);


--
-- TOC entry 2266 (class 0 OID 187217)
-- Dependencies: 206
-- Data for Name: geospatial_coverage; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO geospatial_coverage VALUES (1, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (2, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (3, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (4, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (5, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (6, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (7, false, 56.341999999999999, 11.714, 48.457999999999998, 3.0550000000000002, 1);
INSERT INTO geospatial_coverage VALUES (8, false, 31.472999999999999, 30.425999999999998, 31.053999999999998, 29.658999999999999, 1);
INSERT INTO geospatial_coverage VALUES (9, false, 31.472999999999999, 30.425999999999998, 31.053999999999998, 29.658999999999999, 1);
INSERT INTO geospatial_coverage VALUES (10, false, 31.472999999999999, 30.425999999999998, 31.053999999999998, 29.658999999999999, 1);
INSERT INTO geospatial_coverage VALUES (11, false, 31.472999999999999, 30.425999999999998, 31.053999999999998, 29.658999999999999, 1);
INSERT INTO geospatial_coverage VALUES (12, false, 31.472999999999999, 30.425999999999998, 31.053999999999998, 29.658999999999999, 1);


--
-- TOC entry 2324 (class 0 OID 0)
-- Dependencies: 205
-- Name: geospatial_coverage_id_geospatial_coverage_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('geospatial_coverage_id_geospatial_coverage_seq', 12, true);


--
-- TOC entry 2325 (class 0 OID 0)
-- Dependencies: 225
-- Name: id_dataset_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('id_dataset_seq', 1, true);


--
-- TOC entry 2267 (class 0 OID 187223)
-- Dependencies: 207
-- Data for Name: metagenome_functional_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2268 (class 0 OID 187231)
-- Dependencies: 208
-- Data for Name: metagenome_taxonomic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2269 (class 0 OID 187236)
-- Dependencies: 209
-- Data for Name: metagenomic_analysis; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2271 (class 0 OID 187246)
-- Dependencies: 211
-- Data for Name: pagina_contato; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2326 (class 0 OID 0)
-- Dependencies: 210
-- Name: pagina_contato_id_pagina_contato_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('pagina_contato_id_pagina_contato_seq', 1, false);


--
-- TOC entry 2273 (class 0 OID 187254)
-- Dependencies: 213
-- Data for Name: posicao_contato; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO posicao_contato VALUES (1, NULL, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (2, NULL, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (3, NULL, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (4, 10, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (5, 13, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (6, 16, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (7, 19, 'Scientific researcher');
INSERT INTO posicao_contato VALUES (8, 22, 'Data Manager');
INSERT INTO posicao_contato VALUES (9, 23, 'Data Manager');
INSERT INTO posicao_contato VALUES (10, 24, 'Data Manager');
INSERT INTO posicao_contato VALUES (11, 25, 'Data Manager');
INSERT INTO posicao_contato VALUES (12, 26, 'Data Manager');
INSERT INTO posicao_contato VALUES (13, 27, 'Data Manager');
INSERT INTO posicao_contato VALUES (14, 28, 'Data Manager');
INSERT INTO posicao_contato VALUES (15, 29, 'Data Manager');
INSERT INTO posicao_contato VALUES (16, 30, 'Data Manager');
INSERT INTO posicao_contato VALUES (17, 31, 'Data Manager');
INSERT INTO posicao_contato VALUES (18, 32, 'Data Manager');
INSERT INTO posicao_contato VALUES (19, 33, 'Data Manager');
INSERT INTO posicao_contato VALUES (20, 34, 'Data Manager');
INSERT INTO posicao_contato VALUES (21, 35, 'Data Manager');
INSERT INTO posicao_contato VALUES (22, 36, 'Data Manager');
INSERT INTO posicao_contato VALUES (23, 37, 'Data Manager');
INSERT INTO posicao_contato VALUES (24, 38, 'Data Manager');
INSERT INTO posicao_contato VALUES (25, 39, 'Data Manager');
INSERT INTO posicao_contato VALUES (26, 40, 'Data Manager');
INSERT INTO posicao_contato VALUES (27, 41, 'Data Manager');


--
-- TOC entry 2327 (class 0 OID 0)
-- Dependencies: 212
-- Name: posicao_contato_id_posicao_contato_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('posicao_contato_id_posicao_contato_seq', 27, true);


--
-- TOC entry 2274 (class 0 OID 187260)
-- Dependencies: 214
-- Data for Name: reference_db; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2275 (class 0 OID 187265)
-- Dependencies: 215
-- Data for Name: sample; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO sample VALUES (1, 8.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (2, NULL, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (3, 20.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (4, 62.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (5, 7.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (6, 10.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (7, 64.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (8, 13.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (9, 24.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (10, 69.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (11, 18.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (12, 9.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (13, 19.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (14, 37.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (15, 11.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (16, 42.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);
INSERT INTO sample VALUES (17, 26.00, '2016-07-10', NULL, NULL, NULL, NULL, 1, NULL);


--
-- TOC entry 2328 (class 0 OID 0)
-- Dependencies: 226
-- Name: sample_id_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('sample_id_seq', 17, true);


--
-- TOC entry 2276 (class 0 OID 187273)
-- Dependencies: 216
-- Data for Name: sample_type; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2277 (class 0 OID 187278)
-- Dependencies: 217
-- Data for Name: taxon; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO taxon VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Botryllus leachi', 'Botryllus leachi', NULL, NULL);
INSERT INTO taxon VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Botryllus leachi', 'Botryllus leachi', NULL, NULL);
INSERT INTO taxon VALUES (3, 'Ascidiacea', 'Corellidae', 'Phlebobranchia', NULL, 'Animalia', 'Phlebobranchia', 'Chordata', 'Corella parallelogramma', 'Corella parallelogramma', NULL, NULL);
INSERT INTO taxon VALUES (4, 'Ascidiacea', 'Pyuridae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Microcosmus sulcatus', 'Microcosmus sulcatus', NULL, NULL);
INSERT INTO taxon VALUES (5, 'Ascidiacea', 'Pyuridae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Microcosmus sulcatus', 'Microcosmus sulcatus', NULL, NULL);
INSERT INTO taxon VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Distaplia magnilarva', 'Distaplia magnilarva', NULL, NULL);
INSERT INTO taxon VALUES (7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Molgula helleri', 'Molgula helleri', NULL, NULL);
INSERT INTO taxon VALUES (8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Diplosoma gelatinosum', 'Diplosoma gelatinosum', NULL, NULL);
INSERT INTO taxon VALUES (9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Diplosoma gelatinosum', 'Diplosoma gelatinosum', NULL, NULL);
INSERT INTO taxon VALUES (10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Diplosoma gelatinosum', 'Diplosoma gelatinosum', NULL, NULL);
INSERT INTO taxon VALUES (11, 'Ascidiacea', 'Molgulidae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Molgula oculata', 'Molgula oculata', NULL, NULL);
INSERT INTO taxon VALUES (12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Didemnum perforatum', 'Didemnum perforatum', NULL, NULL);
INSERT INTO taxon VALUES (13, 'Ascidiacea', 'Didemnidae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Polysyncraton lacazei', 'Polysyncraton lacazei', NULL, NULL);
INSERT INTO taxon VALUES (14, 'Ascidiacea', 'Didemnidae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Polysyncraton lacazei', 'Polysyncraton lacazei', NULL, NULL);
INSERT INTO taxon VALUES (15, 'Ascidiacea', 'Ascidiidae', 'Phlebobranchia', NULL, 'Animalia', 'Phlebobranchia', 'Chordata', 'Phallusia fumigata', 'Phallusia fumigata', NULL, NULL);
INSERT INTO taxon VALUES (16, 'Ascidiacea', 'Perophoridae', 'Phlebobranchia', NULL, 'Animalia', 'Phlebobranchia', 'Chordata', 'Ecteinascidia turbinata', 'Ecteinascidia turbinata', NULL, NULL);
INSERT INTO taxon VALUES (17, 'Ascidiacea', 'Pyuridae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Halocynthia papillosa', 'Halocynthia papillosa', NULL, NULL);
INSERT INTO taxon VALUES (18, 'Ascidiacea', 'Pyuridae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Halocynthia papillosa', 'Halocynthia papillosa', NULL, NULL);
INSERT INTO taxon VALUES (19, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Aplidium griseum', 'Aplidium griseum', NULL, NULL);
INSERT INTO taxon VALUES (20, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Trididemnum graphicum', 'Trididemnum graphicum', NULL, NULL);
INSERT INTO taxon VALUES (21, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Polycitor (Clavelina) nana', 'Polycitor (Clavelina) nana', NULL, NULL);
INSERT INTO taxon VALUES (22, 'Ascidiacea', 'Styelidae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Styela plicata', 'Styela plicata', NULL, NULL);
INSERT INTO taxon VALUES (23, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ascidia aspersa', 'Ascidia aspersa', NULL, NULL);
INSERT INTO taxon VALUES (24, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ascidia aspersa', 'Ascidia aspersa', NULL, NULL);
INSERT INTO taxon VALUES (25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Ascidia aspersa', 'Ascidia aspersa', NULL, NULL);
INSERT INTO taxon VALUES (26, 'Ascidiacea', 'Styelidae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Botryllus schlosseri', 'Botryllus schlosseri', NULL, NULL);
INSERT INTO taxon VALUES (27, 'Ascidiacea', 'Styelidae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Botryllus schlosseri', 'Botryllus schlosseri', NULL, NULL);
INSERT INTO taxon VALUES (28, 'Ascidiacea', 'Styelidae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Polycarpa pomaria', 'Polycarpa pomaria', NULL, NULL);
INSERT INTO taxon VALUES (29, 'Ascidiacea', 'Pyuridae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Pyura momus', 'Pyura momus', NULL, NULL);
INSERT INTO taxon VALUES (30, 'Ascidiacea', 'Styelidae', 'Stolidobranchia', NULL, 'Animalia', 'Stolidobranchia', 'Chordata', 'Styela partita', 'Styela partita', NULL, NULL);
INSERT INTO taxon VALUES (31, 'Ascidiacea', 'Polycitoridae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Cystodytes dellachiajei', 'Cystodytes dellachiajei', NULL, NULL);
INSERT INTO taxon VALUES (32, 'Ascidiacea', 'Polycitoridae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Cystodytes dellachiajei', 'Cystodytes dellachiajei', NULL, NULL);
INSERT INTO taxon VALUES (33, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Cystodites dellechiajei', 'Cystodites dellechiajei', NULL, NULL);
INSERT INTO taxon VALUES (34, 'Ascidiacea', 'Clavelinidae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Clavelina', 'Clavelina', NULL, NULL);
INSERT INTO taxon VALUES (35, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Pyura savignyi', 'Pyura savignyi', NULL, NULL);
INSERT INTO taxon VALUES (36, 'Ascidiacea', 'Diazonidae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Rhopalaea', 'Rhopalaea', NULL, NULL);
INSERT INTO taxon VALUES (37, 'Ascidiacea', 'Diazonidae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Rhopalaea', 'Rhopalaea', NULL, NULL);
INSERT INTO taxon VALUES (38, 'Ascidiacea', 'Diazonidae', 'Aplousobranchia', NULL, 'Animalia', 'Aplousobranchia', 'Chordata', 'Rhopalaea', 'Rhopalaea', NULL, NULL);


--
-- TOC entry 2329 (class 0 OID 0)
-- Dependencies: 227
-- Name: taxon_id_taxon_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('taxon_id_taxon_seq', 38, true);


--
-- TOC entry 2279 (class 0 OID 187288)
-- Dependencies: 219
-- Data for Name: telefone; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--



--
-- TOC entry 2330 (class 0 OID 0)
-- Dependencies: 218
-- Name: telefone_id_telefone_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('telefone_id_telefone_seq', 1, false);


--
-- TOC entry 2281 (class 0 OID 187296)
-- Dependencies: 221
-- Data for Name: temporal_coverage; Type: TABLE DATA; Schema: biotecmar; Owner: biotecmar
--

INSERT INTO temporal_coverage VALUES (1, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (2, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (3, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (4, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (5, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (6, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (7, '1867-12-31-2015-11-10;', 1);
INSERT INTO temporal_coverage VALUES (8, 'autumn of 1933;', 1);
INSERT INTO temporal_coverage VALUES (9, 'autumn of 1933;', 1);
INSERT INTO temporal_coverage VALUES (10, 'autumn of 1933;', 1);
INSERT INTO temporal_coverage VALUES (11, 'autumn of 1933;', 1);
INSERT INTO temporal_coverage VALUES (12, 'autumn of 1933;', 1);


--
-- TOC entry 2331 (class 0 OID 0)
-- Dependencies: 220
-- Name: temporal_coverage_id_temporal_coverage_seq; Type: SEQUENCE SET; Schema: biotecmar; Owner: biotecmar
--

SELECT pg_catalog.setval('temporal_coverage_id_temporal_coverage_seq', 12, true);


SET search_path = bio, pg_catalog;

--
-- TOC entry 2041 (class 2606 OID 107227)
-- Name: analise_bio_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise_bio
    ADD CONSTRAINT analise_bio_pk PRIMARY KEY (id_analise_bio);


--
-- TOC entry 2037 (class 2606 OID 107214)
-- Name: analise_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise
    ADD CONSTRAINT analise_pk PRIMARY KEY (id_analise);


--
-- TOC entry 2021 (class 2606 OID 107153)
-- Name: configuracao_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY configuracao
    ADD CONSTRAINT configuracao_pk PRIMARY KEY (nom_configuracao);


--
-- TOC entry 2039 (class 2606 OID 107222)
-- Name: dados_gerais_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY dados_gerais
    ADD CONSTRAINT dados_gerais_pk PRIMARY KEY (id_dados_gerais);


--
-- TOC entry 2025 (class 2606 OID 107169)
-- Name: dados_taxon_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY dados_taxon
    ADD CONSTRAINT dados_taxon_pk PRIMARY KEY (taxonkey);


--
-- TOC entry 2027 (class 2606 OID 107177)
-- Name: descritor_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY descritor
    ADD CONSTRAINT descritor_pk PRIMARY KEY (id_descritor);


--
-- TOC entry 2031 (class 2606 OID 107193)
-- Name: descritor_unidade_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY descritor_unidade
    ADD CONSTRAINT descritor_unidade_pk PRIMARY KEY (id_descritor_unidade);


--
-- TOC entry 2035 (class 2606 OID 107209)
-- Name: pk_amostra; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY amostra
    ADD CONSTRAINT pk_amostra PRIMARY KEY (id_amostra);


--
-- TOC entry 2033 (class 2606 OID 107201)
-- Name: taxon_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT taxon_pk PRIMARY KEY (id_taxon);


--
-- TOC entry 2029 (class 2606 OID 107185)
-- Name: unidade_medida_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY unidade_medida
    ADD CONSTRAINT unidade_medida_pk PRIMARY KEY (id_unidade_medida);


--
-- TOC entry 2023 (class 2606 OID 107161)
-- Name: usuario_pk; Type: CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY usuario
    ADD CONSTRAINT usuario_pk PRIMARY KEY (id_usuario);


SET search_path = biotecmar, pg_catalog;

--
-- TOC entry 2043 (class 2606 OID 187151)
-- Name: abiotic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY abiotic_analysis
    ADD CONSTRAINT abiotic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2045 (class 2606 OID 187156)
-- Name: area_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- TOC entry 2047 (class 2606 OID 187164)
-- Name: ator_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY ator
    ADD CONSTRAINT ator_pkey PRIMARY KEY (id);


--
-- TOC entry 2049 (class 2606 OID 187169)
-- Name: benthic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY benthic_analysis
    ADD CONSTRAINT benthic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2051 (class 2606 OID 187174)
-- Name: biotic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY biotic_analysis
    ADD CONSTRAINT biotic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2053 (class 2606 OID 187185)
-- Name: contact_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id_contato);


--
-- TOC entry 2055 (class 2606 OID 187193)
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (id_dataset);


--
-- TOC entry 2057 (class 2606 OID 187201)
-- Name: email_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id_email);


--
-- TOC entry 2059 (class 2606 OID 187209)
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 2087 (class 2606 OID 187312)
-- Name: evento_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id_evento);


--
-- TOC entry 2061 (class 2606 OID 187214)
-- Name: fish_assembly_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT fish_assembly_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2063 (class 2606 OID 187222)
-- Name: geospatial_coverage_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY geospatial_coverage
    ADD CONSTRAINT geospatial_coverage_pkey PRIMARY KEY (id_geospatial_coverage);


--
-- TOC entry 2065 (class 2606 OID 187230)
-- Name: metagenome_functional_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT metagenome_functional_analysis_pkey PRIMARY KEY (function, id, reference_db_id);


--
-- TOC entry 2067 (class 2606 OID 187235)
-- Name: metagenome_taxonomic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_taxonomic_analysis
    ADD CONSTRAINT metagenome_taxonomic_analysis_pkey PRIMARY KEY (id, taxon);


--
-- TOC entry 2069 (class 2606 OID 187243)
-- Name: metagenomic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenomic_analysis
    ADD CONSTRAINT metagenomic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2071 (class 2606 OID 187251)
-- Name: pagina_contato_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY pagina_contato
    ADD CONSTRAINT pagina_contato_pkey PRIMARY KEY (id_pagina_contato);


--
-- TOC entry 2073 (class 2606 OID 187259)
-- Name: posicao_contato_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY posicao_contato
    ADD CONSTRAINT posicao_contato_pkey PRIMARY KEY (id_posicao_contato);


--
-- TOC entry 2075 (class 2606 OID 187264)
-- Name: reference_db_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY reference_db
    ADD CONSTRAINT reference_db_pkey PRIMARY KEY (id);


--
-- TOC entry 2077 (class 2606 OID 187272)
-- Name: sample_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (id);


--
-- TOC entry 2079 (class 2606 OID 187277)
-- Name: sample_type_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample_type
    ADD CONSTRAINT sample_type_pkey PRIMARY KEY (type);


--
-- TOC entry 2081 (class 2606 OID 187285)
-- Name: taxon_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (id_taxon);


--
-- TOC entry 2083 (class 2606 OID 187293)
-- Name: telefone_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (id_telefone);


--
-- TOC entry 2085 (class 2606 OID 187301)
-- Name: temporal_coverage_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY temporal_coverage
    ADD CONSTRAINT temporal_coverage_pkey PRIMARY KEY (id_temporal_coverage);


--
-- TOC entry 2019 (class 2606 OID 74396)
-- Name: unique_nom_configuracao; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY configuracao
    ADD CONSTRAINT unique_nom_configuracao UNIQUE (nom_configuracao);


SET search_path = bio, pg_catalog;

--
-- TOC entry 2096 (class 2606 OID 107364)
-- Name: amostra_analise_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise
    ADD CONSTRAINT amostra_analise_fk FOREIGN KEY (id_amostra) REFERENCES amostra(id_amostra);


--
-- TOC entry 2101 (class 2606 OID 107374)
-- Name: analise_analise_bio_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise_bio
    ADD CONSTRAINT analise_analise_bio_fk FOREIGN KEY (id_analise) REFERENCES analise(id_analise);


--
-- TOC entry 2098 (class 2606 OID 107389)
-- Name: analise_dados_gerais_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY dados_gerais
    ADD CONSTRAINT analise_dados_gerais_fk FOREIGN KEY (id_analise) REFERENCES analise(id_analise);


--
-- TOC entry 2093 (class 2606 OID 107460)
-- Name: dados_taxon_taxon_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT dados_taxon_taxon_fk FOREIGN KEY (taxonkey) REFERENCES dados_taxon(taxonkey);


--
-- TOC entry 2090 (class 2606 OID 107409)
-- Name: descritor_descritor_unidade_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY descritor_unidade
    ADD CONSTRAINT descritor_descritor_unidade_fk FOREIGN KEY (id_descritor) REFERENCES descritor(id_descritor);


--
-- TOC entry 2099 (class 2606 OID 107394)
-- Name: descritor_unidade_dados_gerais_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY dados_gerais
    ADD CONSTRAINT descritor_unidade_dados_gerais_fk FOREIGN KEY (id_descritor_unidade) REFERENCES descritor_unidade(id_descritor_unidade);


--
-- TOC entry 2102 (class 2606 OID 107379)
-- Name: taxon_analise_bio_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise_bio
    ADD CONSTRAINT taxon_analise_bio_fk FOREIGN KEY (id_taxon) REFERENCES taxon(id_taxon);


--
-- TOC entry 2091 (class 2606 OID 107414)
-- Name: unidade_medida_descritor_unidade_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY descritor_unidade
    ADD CONSTRAINT unidade_medida_descritor_unidade_fk FOREIGN KEY (id_unidade_medida) REFERENCES unidade_medida(id_unidade_medida);


--
-- TOC entry 2095 (class 2606 OID 107359)
-- Name: usuario_amostra_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY amostra
    ADD CONSTRAINT usuario_amostra_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2103 (class 2606 OID 107384)
-- Name: usuario_analise_bio_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise_bio
    ADD CONSTRAINT usuario_analise_bio_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2097 (class 2606 OID 107369)
-- Name: usuario_analise_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY analise
    ADD CONSTRAINT usuario_analise_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2100 (class 2606 OID 107399)
-- Name: usuario_dados_gerais_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY dados_gerais
    ADD CONSTRAINT usuario_dados_gerais_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2088 (class 2606 OID 107404)
-- Name: usuario_descritor_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY descritor
    ADD CONSTRAINT usuario_descritor_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2092 (class 2606 OID 107419)
-- Name: usuario_descritor_unidade_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY descritor_unidade
    ADD CONSTRAINT usuario_descritor_unidade_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2094 (class 2606 OID 107465)
-- Name: usuario_taxon_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT usuario_taxon_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


--
-- TOC entry 2089 (class 2606 OID 107434)
-- Name: usuario_unidade_medida_fk; Type: FK CONSTRAINT; Schema: bio; Owner: biotecmar
--

ALTER TABLE ONLY unidade_medida
    ADD CONSTRAINT usuario_unidade_medida_fk FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario);


SET search_path = biotecmar, pg_catalog;

--
-- TOC entry 2104 (class 2606 OID 187313)
-- Name: fk1318e98e80a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY abiotic_analysis
    ADD CONSTRAINT fk1318e98e80a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2122 (class 2606 OID 187403)
-- Name: fk18fe8842745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk18fe8842745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2106 (class 2606 OID 187323)
-- Name: fk67a5759b80a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY biotic_analysis
    ADD CONSTRAINT fk67a5759b80a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2123 (class 2606 OID 187408)
-- Name: fk6a99560b61e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY temporal_coverage
    ADD CONSTRAINT fk6a99560b61e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2116 (class 2606 OID 187373)
-- Name: fk73aba9c2a2031df0; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_taxonomic_analysis
    ADD CONSTRAINT fk73aba9c2a2031df0 FOREIGN KEY (id_meta_analysis) REFERENCES metagenomic_analysis(id);


--
-- TOC entry 2108 (class 2606 OID 187333)
-- Name: fk882344422745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY email
    ADD CONSTRAINT fk882344422745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2110 (class 2606 OID 187343)
-- Name: fk92a10b0856d78cc6; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT fk92a10b0856d78cc6 FOREIGN KEY (id_taxon) REFERENCES taxon(id_taxon);


--
-- TOC entry 2112 (class 2606 OID 187353)
-- Name: fk92a10b0880a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT fk92a10b0880a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2120 (class 2606 OID 187393)
-- Name: fk938591c461e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT fk938591c461e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2121 (class 2606 OID 187398)
-- Name: fk938591c4a07c9a8; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT fk938591c4a07c9a8 FOREIGN KEY (type) REFERENCES sample_type(type);


--
-- TOC entry 2111 (class 2606 OID 187348)
-- Name: fk_fish_evento; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY fish_assembly_analysis
    ADD CONSTRAINT fk_fish_evento FOREIGN KEY (id_evento) REFERENCES evento(id_evento);


--
-- TOC entry 2115 (class 2606 OID 187368)
-- Name: fka3056e2f6f43b287; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT fka3056e2f6f43b287 FOREIGN KEY (reference_db_id) REFERENCES reference_db(id);


--
-- TOC entry 2114 (class 2606 OID 187363)
-- Name: fka3056e2fa2031df0; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT fka3056e2fa2031df0 FOREIGN KEY (id_meta_analysis) REFERENCES metagenomic_analysis(id);


--
-- TOC entry 2107 (class 2606 OID 187328)
-- Name: fka6bc8b4661e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fka6bc8b4661e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2117 (class 2606 OID 187378)
-- Name: fkb248d51280a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenomic_analysis
    ADD CONSTRAINT fkb248d51280a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2105 (class 2606 OID 187318)
-- Name: fkb7cd565c80a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY benthic_analysis
    ADD CONSTRAINT fkb7cd565c80a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2109 (class 2606 OID 187338)
-- Name: fkb9d4e5632745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fkb9d4e5632745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2113 (class 2606 OID 187358)
-- Name: fkd3341a3a61e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY geospatial_coverage
    ADD CONSTRAINT fkd3341a3a61e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2119 (class 2606 OID 187388)
-- Name: fke2f0752d2745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY posicao_contato
    ADD CONSTRAINT fke2f0752d2745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2118 (class 2606 OID 187383)
-- Name: fkfc8d608b2745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY pagina_contato
    ADD CONSTRAINT fkfc8d608b2745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


-- Completed on 2016-09-08 22:10:54

--
-- PostgreSQL database dump complete
--

