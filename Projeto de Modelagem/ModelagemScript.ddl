-- Gerado por Oracle SQL Developer Data Modeler 21.2.0.183.1957
--   em:        2021-11-14 13:47:04 BRT
--   site:      Oracle Database 21c
--   tipo:      Oracle Database 21c



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_agua (
    cd_agua             INTEGER NOT NULL,
    cd_usuario          INTEGER NOT NULL,
    qtd_agua_ml         INTEGER NOT NULL,
    date_historico_agua DATE NOT NULL,
    cd_pessoa           INTEGER NOT NULL
);

ALTER TABLE t_agua ADD CONSTRAINT t_agua_pk PRIMARY KEY ( cd_agua );

CREATE TABLE t_comer (
    cd_comer            INTEGER NOT NULL,
    cd_usuario          INTEGER NOT NULL,
    cd_comida           INTEGER NOT NULL,
    qntd_comida_grama   INTEGER NOT NULL,
    dt_historico_comida DATE NOT NULL,
    cd_pessoa           INTEGER NOT NULL
);

ALTER TABLE t_comer ADD CONSTRAINT t_comer_pk PRIMARY KEY ( cd_comer );

CREATE TABLE t_comida (
    cd_comida              INTEGER NOT NULL,
    nm_comida              VARCHAR2(40) NOT NULL,
    exibir_foto            BLOB NOT NULL,
    vl_caloria_grama       FLOAT(4) NOT NULL,
    qtd_carboidratos_grama FLOAT(4) NOT NULL,
    qtd_proteina_grama     FLOAT(4) NOT NULL,
    qtd_gordura_grama      FLOAT(4) NOT NULL
);

ALTER TABLE t_comida ADD CONSTRAINT t_comida_pk PRIMARY KEY ( cd_comida );

CREATE TABLE t_endereco (
    cd_endereco INTEGER NOT NULL,
    cd_pessoa   INTEGER NOT NULL,
    ds_cidade   VARCHAR2(255) NOT NULL,
    ds_rua      VARCHAR2(255) NOT NULL,
    ds_cep      VARCHAR2(255),
    ds_estado   VARCHAR2(255),
    ds_bloco    VARCHAR2(20)
);

CREATE UNIQUE INDEX t_endereco__idx ON
    t_endereco (
        cd_pessoa
    ASC );

ALTER TABLE t_endereco ADD CONSTRAINT t_endereco_pk PRIMARY KEY ( cd_endereco );

CREATE TABLE t_exercicio_info (
    cd_exercicio_info INTEGER NOT NULL,
    tp_exercicio      VARCHAR2(40) NOT NULL,
    nm_exercicio      VARCHAR2(40) NOT NULL,
    vl_caloria_min    FLOAT(4) NOT NULL
);

ALTER TABLE t_exercicio_info ADD CONSTRAINT t_exercicio_info_pk PRIMARY KEY ( cd_exercicio_info );

CREATE TABLE t_exercitar (
    cd_exercitar              INTEGER NOT NULL,
    cd_exercicio_info         INTEGER NOT NULL,
    cd_usuario                INTEGER NOT NULL,
    temp_treino               DATE NOT NULL,
    date_historico_exercicios DATE NOT NULL,
    cd_pessoa                 INTEGER NOT NULL
);

ALTER TABLE t_exercitar ADD CONSTRAINT t_exercitar_pk PRIMARY KEY ( cd_exercitar );

CREATE TABLE t_historico_peso_altura (
    cd_historico_peso   INTEGER NOT NULL,
    cd_usuario          INTEGER NOT NULL,
    dt_atualizacao_peso DATE NOT NULL,
    vl_peso             FLOAT NOT NULL,
    vl_altura           FLOAT NOT NULL,
    cd_pessoa           INTEGER NOT NULL
);

ALTER TABLE t_historico_peso_altura ADD CONSTRAINT t_historico_peso_altura_pk PRIMARY KEY ( cd_historico_peso );

CREATE TABLE t_nutricionista (
    cd_pessoa    INTEGER NOT NULL,
    exibir_foto  BLOB NOT NULL,
    doc_crn      VARCHAR2(40) NOT NULL,
    dt_inscricao DATE NOT NULL
);

ALTER TABLE t_nutricionista ADD CONSTRAINT t_nutricionista_pk PRIMARY KEY ( cd_pessoa );

CREATE TABLE t_personal (
    doc_cref     VARCHAR2(50) NOT NULL,
    dt_inscricao DATE NOT NULL,
    cd_pessoa    INTEGER NOT NULL
);

ALTER TABLE t_personal ADD CONSTRAINT t_personal_pk PRIMARY KEY ( cd_pessoa );

CREATE TABLE t_pessoa (
    cd_pessoa     INTEGER NOT NULL,
    nm_usuario    VARCHAR2(60) NOT NULL,
    pass_usuario  VARCHAR2(30) NOT NULL,
    vl_datanasc   DATE NOT NULL,
    email_usuario VARCHAR2(100) NOT NULL,
    ds_sexo       VARCHAR2(40) NOT NULL
);

ALTER TABLE t_pessoa ADD CONSTRAINT t_pessoa_pk PRIMARY KEY ( cd_pessoa );

CREATE TABLE t_rede_social (
    cd_rede_social INTEGER NOT NULL,
    cd_usuario     INTEGER NOT NULL,
    tp_rede_social VARCHAR2(20) NOT NULL,
    cd_pessoa      INTEGER NOT NULL
);

ALTER TABLE t_rede_social ADD CONSTRAINT t_rede_social_pk PRIMARY KEY ( cd_rede_social );

CREATE TABLE t_skills_nutri (
    cd_skill   INTEGER NOT NULL,
    cd_usuario INTEGER NOT NULL,
    tp_skill   VARCHAR2(40) NOT NULL,
    nm_skill   VARCHAR2(40) NOT NULL,
    nvl_skill  INTEGER NOT NULL,
    cd_pessoa  INTEGER NOT NULL
);

ALTER TABLE t_skills_nutri ADD CONSTRAINT t_skills_nutri_pk PRIMARY KEY ( cd_skill );

CREATE TABLE t_skills_personal (
    cd_skill_personal INTEGER NOT NULL,
    tp_skill          VARCHAR2(40) NOT NULL,
    nm_skill          VARCHAR2(40) NOT NULL,
    nvl_skill         INTEGER NOT NULL,
    cd_pessoa         INTEGER NOT NULL
);

ALTER TABLE t_skills_personal ADD CONSTRAINT t_skills_personal_pk PRIMARY KEY ( cd_skill_personal );

CREATE TABLE t_telefone (
    cd_telefone INTEGER NOT NULL,
    cd_pessoa   INTEGER NOT NULL,
    tp_telefone VARCHAR2(20),
    nr_telefone VARCHAR2(30) NOT NULL
);

CREATE UNIQUE INDEX t_telefone__idx ON
    t_telefone (
        cd_pessoa
    ASC );

ALTER TABLE t_telefone ADD CONSTRAINT t_telefone_pk PRIMARY KEY ( cd_telefone );

CREATE TABLE t_usuario (
    cd_pessoa INTEGER NOT NULL
);

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( cd_pessoa );

ALTER TABLE t_nutricionista
    ADD CONSTRAINT relation_1 FOREIGN KEY ( cd_pessoa )
        REFERENCES t_pessoa ( cd_pessoa );

ALTER TABLE t_comer
    ADD CONSTRAINT relation_10 FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_pessoa );

ALTER TABLE t_comer
    ADD CONSTRAINT relation_11 FOREIGN KEY ( cd_comida )
        REFERENCES t_comida ( cd_comida );

ALTER TABLE t_agua
    ADD CONSTRAINT relation_12 FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_pessoa );

ALTER TABLE t_rede_social
    ADD CONSTRAINT relation_18 FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_pessoa );

ALTER TABLE t_personal
    ADD CONSTRAINT relation_19 FOREIGN KEY ( cd_pessoa )
        REFERENCES t_pessoa ( cd_pessoa );

ALTER TABLE t_usuario
    ADD CONSTRAINT relation_2 FOREIGN KEY ( cd_pessoa )
        REFERENCES t_pessoa ( cd_pessoa );

ALTER TABLE t_skills_personal
    ADD CONSTRAINT relation_20 FOREIGN KEY ( cd_pessoa )
        REFERENCES t_personal ( cd_pessoa );

ALTER TABLE t_telefone
    ADD CONSTRAINT relation_4 FOREIGN KEY ( cd_pessoa )
        REFERENCES t_pessoa ( cd_pessoa );

ALTER TABLE t_endereco
    ADD CONSTRAINT relation_5 FOREIGN KEY ( cd_pessoa )
        REFERENCES t_pessoa ( cd_pessoa );

ALTER TABLE t_skills_nutri
    ADD CONSTRAINT relation_6 FOREIGN KEY ( cd_usuario )
        REFERENCES t_nutricionista ( cd_pessoa );

ALTER TABLE t_exercitar
    ADD CONSTRAINT relation_7 FOREIGN KEY ( cd_exercicio_info )
        REFERENCES t_exercicio_info ( cd_exercicio_info );

ALTER TABLE t_exercitar
    ADD CONSTRAINT relation_8 FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_pessoa );

ALTER TABLE t_historico_peso_altura
    ADD CONSTRAINT relation_9 FOREIGN KEY ( cd_usuario )
        REFERENCES t_usuario ( cd_pessoa );

CREATE OR REPLACE TRIGGER fkntm_t_skills_personal BEFORE
    UPDATE OF cd_pessoa ON t_skills_personal
BEGIN
    raise_application_error(-20225, 'Non Transferable FK constraint  on table T_SKILLS_PERSONAL is violated');
END;
/

CREATE OR REPLACE TRIGGER arc_arc_3_t_usuario BEFORE
    INSERT OR UPDATE OF cd_pessoa ON t_usuario
    FOR EACH ROW
DECLARE
    d INTEGER;
BEGIN
    SELECT
        a.cd_pessoa
    INTO d
    FROM
        t_pessoa a
    WHERE
        a.cd_pessoa = :new.cd_pessoa;

    IF ( d IS NULL OR d <> 1 ) THEN
        raise_application_error(-20223,
                               'FK Relation_2 in Table T_USUARIO violates Arc constraint on Table T_PESSOA - discriminator column cd_pessoa doesn''t have value 1');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_arc_3_t_nutricionista BEFORE
    INSERT OR UPDATE OF cd_pessoa ON t_nutricionista
    FOR EACH ROW
DECLARE
    d INTEGER;
BEGIN
    SELECT
        a.cd_pessoa
    INTO d
    FROM
        t_pessoa a
    WHERE
        a.cd_pessoa = :new.cd_pessoa;

    IF ( d IS NULL OR d <> 1 ) THEN
        raise_application_error(-20223,
                               'FK Relation_1 in Table T_NUTRICIONISTA violates Arc constraint on Table T_PESSOA - discriminator column cd_pessoa doesn''t have value 1');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             2
-- ALTER TABLE                             29
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           3
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
