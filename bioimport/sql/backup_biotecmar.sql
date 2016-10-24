
--
-- TOC entry 7 (class 2615 OID 21291)
-- Name: biotecmar; Type: SCHEMA; Schema: -; Owner: biotecmar
--

CREATE SCHEMA biotecmar;


ALTER SCHEMA biotecmar OWNER TO biotecmar;

SET search_path = biotecmar, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 21292)
-- Name: abiotic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 185 (class 1259 OID 21878)
-- Name: area; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 186 (class 1259 OID 21883)
-- Name: ator; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE ator (
    id bigint NOT NULL,
    login character varying(255) NOT NULL,
    nome character varying(255) NOT NULL,
    senha character varying(255) NOT NULL
);


ALTER TABLE ator OWNER TO biotecmar;

--
-- TOC entry 175 (class 1259 OID 21304)
-- Name: benthic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE benthic_analysis (
    id integer NOT NULL,
    relative_abundance numeric(19,2),
    taxon character varying(255),
    id_sample bigint
);


ALTER TABLE benthic_analysis OWNER TO biotecmar;

--
-- TOC entry 176 (class 1259 OID 21307)
-- Name: biotic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 177 (class 1259 OID 21310)
-- Name: configuracao; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE configuracao (
    nom_configuracao character varying(100),
    valor_configuracao character varying(200)
);


ALTER TABLE configuracao OWNER TO biotecmar;

--
-- TOC entry 188 (class 1259 OID 21893)
-- Name: contact; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 187 (class 1259 OID 21891)
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
-- TOC entry 2247 (class 0 OID 0)
-- Dependencies: 187
-- Name: contact_id_contato_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE contact_id_contato_seq OWNED BY contact.id_contato;


--
-- TOC entry 189 (class 1259 OID 21902)
-- Name: dataset; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE dataset (
    id_dataset bigint NOT NULL,
    abbreviation text,
    additionalinfo text,
    alias text,
    created timestamp without time zone,
    create_by character varying(255),
    data_alt timestamp without time zone,
    deleted timestamp without time zone,
    descricao character varying(255),
    description text,
    duplicate_of_dataset_key character varying(255),
    external_ boolean,
    geographic_coverage_desc character varying(255),
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
    title text,
    type_ character varying(255),
    uuid character varying(255)
);


ALTER TABLE dataset OWNER TO biotecmar;

--
-- TOC entry 191 (class 1259 OID 21912)
-- Name: email; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE email (
    id_email bigint NOT NULL,
    email character varying(255),
    id_contato bigint
);


ALTER TABLE email OWNER TO biotecmar;

--
-- TOC entry 190 (class 1259 OID 21910)
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
-- TOC entry 2248 (class 0 OID 0)
-- Dependencies: 190
-- Name: email_id_email_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE email_id_email_seq OWNED BY email.id_email;


--
-- TOC entry 193 (class 1259 OID 21920)
-- Name: endereco; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE endereco (
    id_endereco bigint NOT NULL,
    endereco character varying(255),
    id_contato bigint
);


ALTER TABLE endereco OWNER TO biotecmar;

--
-- TOC entry 192 (class 1259 OID 21918)
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
-- TOC entry 2249 (class 0 OID 0)
-- Dependencies: 192
-- Name: endereco_id_endereco_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE endereco_id_endereco_seq OWNED BY endereco.id_endereco;


--
-- TOC entry 195 (class 1259 OID 21928)
-- Name: evento; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE evento (
    id_evento bigint NOT NULL,
    coord_uncertainty_meters integer,
    country_code character varying(255),
    decimal_latitude numeric(19,2),
    decimal_longitude numeric(19,2),
    depth numeric(19,2),
    event_date timestamp without time zone,
    event_id character varying(255),
    foot_print_wkt text,
    geodetic_datum character varying(255),
    habitat text,
    sample_size_unit text,
    sample_size_value text,
    sampling_protocol text,
    id_dataset bigint
);


ALTER TABLE evento OWNER TO biotecmar;

--
-- TOC entry 194 (class 1259 OID 21926)
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
-- TOC entry 2250 (class 0 OID 0)
-- Dependencies: 194
-- Name: evento_id_evento_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE evento_id_evento_seq OWNED BY evento.id_evento;


--
-- TOC entry 210 (class 1259 OID 22066)
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
-- TOC entry 197 (class 1259 OID 21939)
-- Name: geospatial_coverage; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 196 (class 1259 OID 21937)
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
-- TOC entry 2251 (class 0 OID 0)
-- Dependencies: 196
-- Name: geospatial_coverage_id_geospatial_coverage_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE geospatial_coverage_id_geospatial_coverage_seq OWNED BY geospatial_coverage.id_geospatial_coverage;


--
-- TOC entry 211 (class 1259 OID 22068)
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
-- TOC entry 199 (class 1259 OID 21947)
-- Name: measurement_facts; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE measurement_facts (
    id_measurement_facts bigint NOT NULL,
    event_id character varying(255),
    measurement_id character varying(255),
    measurement_type character varying(255),
    measurement_type_id character varying(255),
    measurement_unit character varying(255),
    measurement_unit_id character varying(255),
    measurement_value character varying(255),
    occurrence_id character varying(255),
    id_evento bigint,
    id_occurrence integer
);


ALTER TABLE measurement_facts OWNER TO biotecmar;

--
-- TOC entry 198 (class 1259 OID 21945)
-- Name: measurement_facts_id_measurement_facts_seq; Type: SEQUENCE; Schema: biotecmar; Owner: biotecmar
--

CREATE SEQUENCE measurement_facts_id_measurement_facts_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE measurement_facts_id_measurement_facts_seq OWNER TO biotecmar;

--
-- TOC entry 2252 (class 0 OID 0)
-- Dependencies: 198
-- Name: measurement_facts_id_measurement_facts_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE measurement_facts_id_measurement_facts_seq OWNED BY measurement_facts.id_measurement_facts;


--
-- TOC entry 178 (class 1259 OID 21362)
-- Name: metagenome_functional_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE metagenome_functional_analysis (
    function character varying(255) NOT NULL,
    id integer NOT NULL,
    reference_db_id character varying(255) NOT NULL,
    id_meta_analysis integer
);


ALTER TABLE metagenome_functional_analysis OWNER TO biotecmar;

--
-- TOC entry 179 (class 1259 OID 21368)
-- Name: metagenome_taxonomic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE metagenome_taxonomic_analysis (
    id integer NOT NULL,
    taxon character varying(255) NOT NULL,
    abundance numeric(19,2),
    id_meta_analysis integer
);


ALTER TABLE metagenome_taxonomic_analysis OWNER TO biotecmar;

--
-- TOC entry 180 (class 1259 OID 21371)
-- Name: metagenomic_analysis; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE metagenomic_analysis (
    id integer NOT NULL,
    external_id character varying(255),
    fasta_file_url character varying(255),
    id_sample bigint
);


ALTER TABLE metagenomic_analysis OWNER TO biotecmar;

--
-- TOC entry 200 (class 1259 OID 21956)
-- Name: occurrence; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE occurrence (
    id bigint NOT NULL,
    abundance numeric(19,2),
    occurrence_id character varying(255),
    id_evento bigint,
    id_taxon bigint
);


ALTER TABLE occurrence OWNER TO biotecmar;

--
-- TOC entry 202 (class 1259 OID 21963)
-- Name: pagina_contato; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE pagina_contato (
    id_pagina_contato bigint NOT NULL,
    id_contato bigint,
    pagina character varying(255)
);


ALTER TABLE pagina_contato OWNER TO biotecmar;

--
-- TOC entry 201 (class 1259 OID 21961)
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
-- TOC entry 2253 (class 0 OID 0)
-- Dependencies: 201
-- Name: pagina_contato_id_pagina_contato_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE pagina_contato_id_pagina_contato_seq OWNED BY pagina_contato.id_pagina_contato;


--
-- TOC entry 204 (class 1259 OID 21971)
-- Name: posicao_contato; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE posicao_contato (
    id_posicao_contato bigint NOT NULL,
    id_contato bigint,
    posicao character varying(255)
);


ALTER TABLE posicao_contato OWNER TO biotecmar;

--
-- TOC entry 203 (class 1259 OID 21969)
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
-- TOC entry 2254 (class 0 OID 0)
-- Dependencies: 203
-- Name: posicao_contato_id_posicao_contato_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE posicao_contato_id_posicao_contato_seq OWNED BY posicao_contato.id_posicao_contato;


--
-- TOC entry 181 (class 1259 OID 21390)
-- Name: reference_db; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE reference_db (
    id character varying(255) NOT NULL
);


ALTER TABLE reference_db OWNER TO biotecmar;

--
-- TOC entry 182 (class 1259 OID 21393)
-- Name: sample; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 183 (class 1259 OID 21399)
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
-- TOC entry 184 (class 1259 OID 21401)
-- Name: sample_type; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE sample_type (
    type character varying(255) NOT NULL
);


ALTER TABLE sample_type OWNER TO biotecmar;

--
-- TOC entry 205 (class 1259 OID 21977)
-- Name: taxon; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
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
-- TOC entry 212 (class 1259 OID 22070)
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
-- TOC entry 207 (class 1259 OID 21987)
-- Name: telefone; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE telefone (
    id_telefone bigint NOT NULL,
    id_contato bigint,
    telefone character varying(255)
);


ALTER TABLE telefone OWNER TO biotecmar;

--
-- TOC entry 206 (class 1259 OID 21985)
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
-- TOC entry 2255 (class 0 OID 0)
-- Dependencies: 206
-- Name: telefone_id_telefone_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE telefone_id_telefone_seq OWNED BY telefone.id_telefone;


--
-- TOC entry 209 (class 1259 OID 21995)
-- Name: temporal_coverage; Type: TABLE; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

CREATE TABLE temporal_coverage (
    id_temporal_coverage bigint NOT NULL,
    temporal_format character varying(255),
    id_dataset bigint
);


ALTER TABLE temporal_coverage OWNER TO biotecmar;

--
-- TOC entry 208 (class 1259 OID 21993)
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
-- TOC entry 2256 (class 0 OID 0)
-- Dependencies: 208
-- Name: temporal_coverage_id_temporal_coverage_seq; Type: SEQUENCE OWNED BY; Schema: biotecmar; Owner: biotecmar
--

ALTER SEQUENCE temporal_coverage_id_temporal_coverage_seq OWNED BY temporal_coverage.id_temporal_coverage;


--
-- TOC entry 2053 (class 2604 OID 21896)
-- Name: id_contato; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY contact ALTER COLUMN id_contato SET DEFAULT nextval('contact_id_contato_seq'::regclass);


--
-- TOC entry 2054 (class 2604 OID 21915)
-- Name: id_email; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY email ALTER COLUMN id_email SET DEFAULT nextval('email_id_email_seq'::regclass);


--
-- TOC entry 2055 (class 2604 OID 21923)
-- Name: id_endereco; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY endereco ALTER COLUMN id_endereco SET DEFAULT nextval('endereco_id_endereco_seq'::regclass);


--
-- TOC entry 2056 (class 2604 OID 21931)
-- Name: id_evento; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY evento ALTER COLUMN id_evento SET DEFAULT nextval('evento_id_evento_seq'::regclass);


--
-- TOC entry 2057 (class 2604 OID 21942)
-- Name: id_geospatial_coverage; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY geospatial_coverage ALTER COLUMN id_geospatial_coverage SET DEFAULT nextval('geospatial_coverage_id_geospatial_coverage_seq'::regclass);


--
-- TOC entry 2058 (class 2604 OID 21950)
-- Name: id_measurement_facts; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY measurement_facts ALTER COLUMN id_measurement_facts SET DEFAULT nextval('measurement_facts_id_measurement_facts_seq'::regclass);


--
-- TOC entry 2059 (class 2604 OID 21966)
-- Name: id_pagina_contato; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY pagina_contato ALTER COLUMN id_pagina_contato SET DEFAULT nextval('pagina_contato_id_pagina_contato_seq'::regclass);


--
-- TOC entry 2060 (class 2604 OID 21974)
-- Name: id_posicao_contato; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY posicao_contato ALTER COLUMN id_posicao_contato SET DEFAULT nextval('posicao_contato_id_posicao_contato_seq'::regclass);


--
-- TOC entry 2061 (class 2604 OID 21990)
-- Name: id_telefone; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY telefone ALTER COLUMN id_telefone SET DEFAULT nextval('telefone_id_telefone_seq'::regclass);


--
-- TOC entry 2062 (class 2604 OID 21998)
-- Name: id_temporal_coverage; Type: DEFAULT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY temporal_coverage ALTER COLUMN id_temporal_coverage SET DEFAULT nextval('temporal_coverage_id_temporal_coverage_seq'::regclass);


--
-- TOC entry 2064 (class 2606 OID 21433)
-- Name: abiotic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY abiotic_analysis
    ADD CONSTRAINT abiotic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2084 (class 2606 OID 21882)
-- Name: area_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY area
    ADD CONSTRAINT area_pkey PRIMARY KEY (id);


--
-- TOC entry 2086 (class 2606 OID 21890)
-- Name: ator_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY ator
    ADD CONSTRAINT ator_pkey PRIMARY KEY (id);


--
-- TOC entry 2066 (class 2606 OID 21439)
-- Name: benthic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY benthic_analysis
    ADD CONSTRAINT benthic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2068 (class 2606 OID 21441)
-- Name: biotic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY biotic_analysis
    ADD CONSTRAINT biotic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2088 (class 2606 OID 21901)
-- Name: contact_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id_contato);


--
-- TOC entry 2090 (class 2606 OID 21909)
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (id_dataset);


--
-- TOC entry 2092 (class 2606 OID 21917)
-- Name: email_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY email
    ADD CONSTRAINT email_pkey PRIMARY KEY (id_email);


--
-- TOC entry 2094 (class 2606 OID 21925)
-- Name: endereco_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT endereco_pkey PRIMARY KEY (id_endereco);


--
-- TOC entry 2096 (class 2606 OID 21936)
-- Name: evento_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT evento_pkey PRIMARY KEY (id_evento);


--
-- TOC entry 2098 (class 2606 OID 21944)
-- Name: geospatial_coverage_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY geospatial_coverage
    ADD CONSTRAINT geospatial_coverage_pkey PRIMARY KEY (id_geospatial_coverage);


--
-- TOC entry 2100 (class 2606 OID 21955)
-- Name: measurement_facts_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY measurement_facts
    ADD CONSTRAINT measurement_facts_pkey PRIMARY KEY (id_measurement_facts);


--
-- TOC entry 2072 (class 2606 OID 21457)
-- Name: metagenome_functional_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT metagenome_functional_analysis_pkey PRIMARY KEY (function, id, reference_db_id);


--
-- TOC entry 2074 (class 2606 OID 21459)
-- Name: metagenome_taxonomic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY metagenome_taxonomic_analysis
    ADD CONSTRAINT metagenome_taxonomic_analysis_pkey PRIMARY KEY (id, taxon);


--
-- TOC entry 2076 (class 2606 OID 21461)
-- Name: metagenomic_analysis_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY metagenomic_analysis
    ADD CONSTRAINT metagenomic_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 2102 (class 2606 OID 22076)
-- Name: occurrence_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY occurrence
    ADD CONSTRAINT occurrence_pkey PRIMARY KEY (id);


--
-- TOC entry 2104 (class 2606 OID 21968)
-- Name: pagina_contato_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY pagina_contato
    ADD CONSTRAINT pagina_contato_pkey PRIMARY KEY (id_pagina_contato);


--
-- TOC entry 2106 (class 2606 OID 21976)
-- Name: posicao_contato_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY posicao_contato
    ADD CONSTRAINT posicao_contato_pkey PRIMARY KEY (id_posicao_contato);


--
-- TOC entry 2078 (class 2606 OID 21469)
-- Name: reference_db_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY reference_db
    ADD CONSTRAINT reference_db_pkey PRIMARY KEY (id);


--
-- TOC entry 2080 (class 2606 OID 21471)
-- Name: sample_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (id);


--
-- TOC entry 2082 (class 2606 OID 21473)
-- Name: sample_type_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY sample_type
    ADD CONSTRAINT sample_type_pkey PRIMARY KEY (type);


--
-- TOC entry 2108 (class 2606 OID 21984)
-- Name: taxon_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY taxon
    ADD CONSTRAINT taxon_pkey PRIMARY KEY (id_taxon);


--
-- TOC entry 2110 (class 2606 OID 21992)
-- Name: telefone_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT telefone_pkey PRIMARY KEY (id_telefone);


--
-- TOC entry 2112 (class 2606 OID 22000)
-- Name: temporal_coverage_pkey; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY temporal_coverage
    ADD CONSTRAINT temporal_coverage_pkey PRIMARY KEY (id_temporal_coverage);


--
-- TOC entry 2070 (class 2606 OID 21481)
-- Name: unique_nom_configuracao; Type: CONSTRAINT; Schema: biotecmar; Owner: biotecmar; Tablespace: 
--

ALTER TABLE ONLY configuracao
    ADD CONSTRAINT unique_nom_configuracao UNIQUE (nom_configuracao);


--
-- TOC entry 2113 (class 2606 OID 21482)
-- Name: fk1318e98e80a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY abiotic_analysis
    ADD CONSTRAINT fk1318e98e80a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2132 (class 2606 OID 22056)
-- Name: fk18fe8842745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY telefone
    ADD CONSTRAINT fk18fe8842745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2127 (class 2606 OID 22077)
-- Name: fk55c0a8eae07f13b0; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY measurement_facts
    ADD CONSTRAINT fk55c0a8eae07f13b0 FOREIGN KEY (id_occurrence) REFERENCES occurrence(id);


--
-- TOC entry 2115 (class 2606 OID 21497)
-- Name: fk67a5759b80a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY biotic_analysis
    ADD CONSTRAINT fk67a5759b80a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2133 (class 2606 OID 22061)
-- Name: fk6a99560b61e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY temporal_coverage
    ADD CONSTRAINT fk6a99560b61e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2118 (class 2606 OID 21507)
-- Name: fk73aba9c2a2031df0; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_taxonomic_analysis
    ADD CONSTRAINT fk73aba9c2a2031df0 FOREIGN KEY (id_meta_analysis) REFERENCES metagenomic_analysis(id);


--
-- TOC entry 2124 (class 2606 OID 22016)
-- Name: fk7cc5fd2f61e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY evento
    ADD CONSTRAINT fk7cc5fd2f61e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2122 (class 2606 OID 22006)
-- Name: fk882344422745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY email
    ADD CONSTRAINT fk882344422745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2120 (class 2606 OID 21522)
-- Name: fk938591c4a07c9a8; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT fk938591c4a07c9a8 FOREIGN KEY (type) REFERENCES sample_type(type);


--
-- TOC entry 2129 (class 2606 OID 22041)
-- Name: fk_fish_evento; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY occurrence
    ADD CONSTRAINT fk_fish_evento FOREIGN KEY (id_evento) REFERENCES evento(id_evento);


--
-- TOC entry 2126 (class 2606 OID 22031)
-- Name: fk_measurement_evento; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY measurement_facts
    ADD CONSTRAINT fk_measurement_evento FOREIGN KEY (id_evento) REFERENCES evento(id_evento);


--
-- TOC entry 2116 (class 2606 OID 21537)
-- Name: fka3056e2f6f43b287; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT fka3056e2f6f43b287 FOREIGN KEY (reference_db_id) REFERENCES reference_db(id);


--
-- TOC entry 2117 (class 2606 OID 21542)
-- Name: fka3056e2fa2031df0; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenome_functional_analysis
    ADD CONSTRAINT fka3056e2fa2031df0 FOREIGN KEY (id_meta_analysis) REFERENCES metagenomic_analysis(id);


--
-- TOC entry 2121 (class 2606 OID 22001)
-- Name: fka6bc8b4661e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT fka6bc8b4661e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2128 (class 2606 OID 22036)
-- Name: fkab5968eb56d78cc6; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY occurrence
    ADD CONSTRAINT fkab5968eb56d78cc6 FOREIGN KEY (id_taxon) REFERENCES taxon(id_taxon);


--
-- TOC entry 2119 (class 2606 OID 21562)
-- Name: fkb248d51280a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY metagenomic_analysis
    ADD CONSTRAINT fkb248d51280a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2114 (class 2606 OID 21567)
-- Name: fkb7cd565c80a66262; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY benthic_analysis
    ADD CONSTRAINT fkb7cd565c80a66262 FOREIGN KEY (id_sample) REFERENCES sample(id);


--
-- TOC entry 2123 (class 2606 OID 22011)
-- Name: fkb9d4e5632745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY endereco
    ADD CONSTRAINT fkb9d4e5632745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2125 (class 2606 OID 22021)
-- Name: fkd3341a3a61e25b82; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY geospatial_coverage
    ADD CONSTRAINT fkd3341a3a61e25b82 FOREIGN KEY (id_dataset) REFERENCES dataset(id_dataset);


--
-- TOC entry 2131 (class 2606 OID 22051)
-- Name: fke2f0752d2745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY posicao_contato
    ADD CONSTRAINT fke2f0752d2745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


--
-- TOC entry 2130 (class 2606 OID 22046)
-- Name: fkfc8d608b2745b4fc; Type: FK CONSTRAINT; Schema: biotecmar; Owner: biotecmar
--

ALTER TABLE ONLY pagina_contato
    ADD CONSTRAINT fkfc8d608b2745b4fc FOREIGN KEY (id_contato) REFERENCES contact(id_contato);


-- Completed on 2016-10-24 12:24:44 BRST

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump complete
--


INSERT INTO ator VALUES (1, 'admin', 'Administrador', '202cb962ac59075b964b07152d234b70');
