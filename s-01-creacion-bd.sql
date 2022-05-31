--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      none
-- Project :      ModelRelacional_2.DM1
-- Author :       amaury
--
-- Date Created : Monday, May 30, 2022 20:18:56
-- Target DBMS : Oracle 11g
--

-- 
-- TABLE: CARGO_TARJETA 
--

CREATE TABLE CARGO_TARJETA(
    FOLIO_OPERACION    VARCHAR2(8)      NOT NULL,
    IMPORTE            NUMBER(10, 3)    NOT NULL,
    FECHA              DATE             NOT NULL,
    NUMERO_TARJETA     NUMBER(16, 0)    NOT NULL,
    CONSTRAINT PK5 PRIMARY KEY (FOLIO_OPERACION)
)
;



-- 
-- TABLE: CATALOGO_BANCO_I 
--

CREATE TABLE CATALOGO_BANCO_I(
    CATALOGO_BANCO_I_ID    NUMBER(3, 0)    NOT NULL,
    NOMBRE                 VARCHAR2(60)    NOT NULL,
    CONSTRAINT PK18_1 PRIMARY KEY (CATALOGO_BANCO_I_ID)
)
;



-- 
-- TABLE: CATBANCO 
--

CREATE TABLE CATBANCO(
    BANCO_ID    NUMBER(3, 0)    NOT NULL,
    NOMBRE      VARCHAR2(60)    NOT NULL,
    CONSTRAINT PK18 PRIMARY KEY (BANCO_ID)
)
;



-- 
-- TABLE: CUENTA_INVERSIONISTA 
--

CREATE TABLE CUENTA_INVERSIONISTA(
    CUENTA_INVERSIONISTA_ID    NUMBER(38, 0)    NOT NULL,
    CLABE                      NUMBER(18, 0)    NOT NULL,
    TITULAR                    VARCHAR2(80)     NOT NULL,
    CATALOGO_BANCO_I_ID        NUMBER(3, 0)     NOT NULL,
    GANANCIA_MENSUAL_ID        NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK17_1 PRIMARY KEY (CUENTA_INVERSIONISTA_ID)
)
;



-- 
-- TABLE: CUENTA_SOLICITANTE 
--

CREATE TABLE CUENTA_SOLICITANTE(
    CUENTA_SOLICITANTE_ID    NUMBER(38, 0)    NOT NULL,
    CLABE                    NUMBER(18, 0)    NOT NULL,
    TITULAR                  VARCHAR2(80)     NOT NULL,
    BANCO_ID                 NUMBER(3, 0)     NOT NULL,
    USUARIO_ID               NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK17 PRIMARY KEY (CUENTA_SOLICITANTE_ID)
)
;



-- 
-- TABLE: GANANCIA_MENSUAL 
--

CREATE TABLE GANANCIA_MENSUAL(
    GANANCIA_MENSUAL_ID    NUMBER(38, 0)    NOT NULL,
    GANANCIA_MENSUAL       NUMBER(38, 0),
    IMPORTE_TOTAL          NUMBER(38, 0),
    FECHA_DEPOSITO         DATE,
    RECIBO_DEPOSITO        BLOB,
    PAGO_ANUAL             NUMBER(38, 0),
    USUARIO_ID             NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK23 PRIMARY KEY (GANANCIA_MENSUAL_ID)
)
;



-- 
-- TABLE: HISTORICO_STATUS_PRESTAMO 
--

CREATE TABLE HISTORICO_STATUS_PRESTAMO(
    HISTORICO_STATUS_PRESTAMO_ID    NUMBER(5, 0)     NOT NULL,
    FECHA_STATUS                    DATE             NOT NULL,
    MONTO_SOLICITADO                NUMBER(9, 2)     NOT NULL,
    FECHA_SOLICITUD                 DATE             NOT NULL,
    STATUS_SOLICITUD_ID             NUMBER(3, 0)     NOT NULL,
    PRESTAMO_ID                     NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK13 PRIMARY KEY (HISTORICO_STATUS_PRESTAMO_ID)
)
;



-- 
-- TABLE: INVERSIONISTA 
--

CREATE TABLE INVERSIONISTA(
    USUARIO_ID          NUMBER(38, 0)    NOT NULL,
    MONTO_MENSUAL       NUMBER(9, 2)     NOT NULL,
    DIACARGO_TARJETA    NUMBER(2, 0)     NOT NULL,
    HABILITADO          NUMBER(1, 0)     NOT NULL,
    PUNTAJE_TOTAL       NUMBER(2, 0)     NOT NULL,
    ES_REVISOR          NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK2 PRIMARY KEY (USUARIO_ID)
)
;



-- 
-- TABLE: OCUPACION 
--

CREATE TABLE OCUPACION(
    OCUPACION_ID    NUMBER(300, 0)    NOT NULL,
    OCUPACION       VARCHAR2(50)      NOT NULL,
    CONSTRAINT PK19 PRIMARY KEY (OCUPACION_ID)
)
;



-- 
-- TABLE: PAGO_PRESTAMO 
--

CREATE TABLE PAGO_PRESTAMO(
    PAGO_PRESTAMO_ID     NUMBER(38, 0)    NOT NULL,
    FECHA_PAGO           DATE             NOT NULL,
    COMPROBANTE_PAGO     BLOB,
    CALIFICACION         NUMBER(1, 0),
    IMPORTE_PAGO         NUMBER(6, 0)     NOT NULL,
    FECHA_MAXIMA_PAGO    DATE             NOT NULL,
    PRESTAMO_ID          NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK14 PRIMARY KEY (PAGO_PRESTAMO_ID)
)
;



-- 
-- TABLE: PERFIL_ANUAL 
--

CREATE TABLE PERFIL_ANUAL(
    PERFIL_ANUAL_ID         NUMBER(38, 0)    NOT NULL,
    PAGO_TIEMPO_ANTICIPO    NUMBER(38, 0),
    PRESTAMO_SOLICITADO     NUMBER(38, 0),
    PRESTAMO_AUTORIZADO     NUMBER(38, 0),
    PRESTAMO_RECHAZADO      NUMBER(38, 0),
    PAGO_DESTIEMPO          NUMBER(38, 0),
    USUARIO_ID              NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK20 PRIMARY KEY (PERFIL_ANUAL_ID)
)
;



-- 
-- TABLE: PRESTAMO 
--

CREATE TABLE PRESTAMO(
    PRESTAMO_ID            NUMBER(38, 0)    NOT NULL,
    PORCENTAGE_INTERES     NUMBER(3, 1)     NOT NULL,
    FECHA_SOLICITUD        DATE             NOT NULL,
    MONTO_SOLICITADO       NUMBER(9, 2)     NOT NULL,
    NUMERO_PAGOS           NUMBER(2, 0)     NOT NULL,
    MODO_PAGO              NUMBER(1, 0)     NOT NULL,
    USUARIO_ID             NUMBER(38, 0)    NOT NULL,
    STATUS_SOLICITUD_ID    NUMBER(3, 0)     NOT NULL,
    FECHA_STATUS           DATE             NOT NULL,
    CONSTRAINT PK7 PRIMARY KEY (PRESTAMO_ID)
)
;



-- 
-- TABLE: PRESTAMO_VOTO 
--

CREATE TABLE PRESTAMO_VOTO(
    USUARIO_ID            NUMBER(38, 0)    NOT NULL,
    PRESTAMO_ID           NUMBER(38, 0)    NOT NULL,
    VOTO_OBTENIDO         NUMBER(1, 0),
    FECHA_VOTO            DATE,
    JUSTIFICACION_VOTO    VARCHAR2(120),
    CONSTRAINT PK9 PRIMARY KEY (USUARIO_ID, PRESTAMO_ID)
)
;



-- 
-- TABLE: PUNTAJE_INVERSIONISTA 
--

CREATE TABLE PUNTAJE_INVERSIONISTA(
    USUARIO_ID          NUMBER(38, 0)    NOT NULL,
    PRESTAMO_ID         NUMBER(38, 0)    NOT NULL,
    PUNTOS_NEGATIVOS    NUMBER(2, 0)     NOT NULL,
    PUNTOS_FECHA        DATE             NOT NULL,
    DESCRIPCION         VARCHAR2(150)    NOT NULL,
    CONSTRAINT PK21 PRIMARY KEY (USUARIO_ID, PRESTAMO_ID)
)
;



-- 
-- TABLE: SOLICITANTE 
--

CREATE TABLE SOLICITANTE(
    USUARIO_ID               NUMBER(38, 0)     NOT NULL,
    IDUSUARIOAVAL            NUMBER(38, 0),
    IDENTIFICACI�N           BLOB              NOT NULL,
    COMPROBANTE_DOMICILIO    BLOB              NOT NULL,
    FOTO                     BLOB              NOT NULL,
    DIRECCION                VARCHAR2(100)     NOT NULL,
    SITIO_WEB                VARCHAR2(120)     NOT NULL,
    OCUPACION_ID             NUMBER(300, 0)    NOT NULL,
    CONSTRAINT PK3 PRIMARY KEY (USUARIO_ID)
)
;



-- 
-- TABLE: STATUS_SOLICITUD 
--

CREATE TABLE STATUS_SOLICITUD(
    STATUS_SOLICITUD_ID    NUMBER(3, 0)     NOT NULL,
    DESCRIPCION            VARCHAR2(200)    NOT NULL,
    TIPO                   VARCHAR2(20)     NOT NULL,
    CONSTRAINT PK12 PRIMARY KEY (STATUS_SOLICITUD_ID)
)
;



-- 
-- TABLE: TARJETA 
--

CREATE TABLE TARJETA(
    NUMERO_TARJETA      NUMBER(16, 0)    NOT NULL,
    MES                 NUMBER(2, 0)     NOT NULL,
    NUMERO_SEGURIDAD    NUMBER(3, 0)     NOT NULL,
    A�O                 NUMBER(4, 0)     NOT NULL,
    USUARIO_ID          NUMBER(38, 0)    NOT NULL,
    CONSTRAINT PK4 PRIMARY KEY (NUMERO_TARJETA)
)
;



-- 
-- TABLE: USUARIO 
--

CREATE TABLE USUARIO(
    USUARIO_ID          NUMBER(38, 0)    NOT NULL,
    NOMBRE_USUARIO      VARCHAR2(40)     NOT NULL,
    PASSWORD            VARCHAR2(20)     NOT NULL,
    NOMBRE              VARCHAR2(30)     NOT NULL,
    AP_PATERNO          VARCHAR2(30)     NOT NULL,
    AP_MATERNO          VARCHAR2(30)     NOT NULL,
    CURP                VARCHAR2(18)     NOT NULL,
    RFC                 VARCHAR2(13)     NOT NULL,
    FECHA_NACIMINETO    DATE             NOT NULL,
    ES_SOLICITANTE      NUMBER(1, 0)     NOT NULL,
    ES_INVERSOR         NUMBER(1, 0)     NOT NULL,
    CONSTRAINT PK1 PRIMARY KEY (USUARIO_ID)
)
;



-- 
-- TABLE: USUARIO_COMENTARIO 
--

CREATE TABLE USUARIO_COMENTARIO(
    USUARIO_COMENTARIO_ID    NUMBER(38, 0)    NOT NULL,
    USUARIO_COMENTADO        NUMBER(38, 0)    NOT NULL,
    USUARIO_ID               NUMBER(38, 0)    NOT NULL,
    COMENTARIO               VARCHAR2(150)    NOT NULL,
    CONSTRAINT PK27 PRIMARY KEY (USUARIO_COMENTARIO_ID)
)
;



-- 
-- TABLE: CARGO_TARJETA 
--

ALTER TABLE CARGO_TARJETA ADD CONSTRAINT RefTARJETA101 
    FOREIGN KEY (NUMERO_TARJETA)
    REFERENCES TARJETA(NUMERO_TARJETA)
;


-- 
-- TABLE: CUENTA_INVERSIONISTA 
--

ALTER TABLE CUENTA_INVERSIONISTA ADD CONSTRAINT RefGANANCIA_MENSUAL341 
    FOREIGN KEY (GANANCIA_MENSUAL_ID)
    REFERENCES GANANCIA_MENSUAL(GANANCIA_MENSUAL_ID)
;

ALTER TABLE CUENTA_INVERSIONISTA ADD CONSTRAINT RefCATALOGO_BANCO_I351 
    FOREIGN KEY (CATALOGO_BANCO_I_ID)
    REFERENCES CATALOGO_BANCO_I(CATALOGO_BANCO_I_ID)
;


-- 
-- TABLE: CUENTA_SOLICITANTE 
--

ALTER TABLE CUENTA_SOLICITANTE ADD CONSTRAINT RefCATBANCO241 
    FOREIGN KEY (BANCO_ID)
    REFERENCES CATBANCO(BANCO_ID)
;

ALTER TABLE CUENTA_SOLICITANTE ADD CONSTRAINT RefSOLICITANTE361 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES SOLICITANTE(USUARIO_ID)
;


-- 
-- TABLE: GANANCIA_MENSUAL 
--

ALTER TABLE GANANCIA_MENSUAL ADD CONSTRAINT RefINVERSIONISTA461 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES INVERSIONISTA(USUARIO_ID)
;


-- 
-- TABLE: HISTORICO_STATUS_PRESTAMO 
--

ALTER TABLE HISTORICO_STATUS_PRESTAMO ADD CONSTRAINT RefSTATUS_SOLICITUD171 
    FOREIGN KEY (STATUS_SOLICITUD_ID)
    REFERENCES STATUS_SOLICITUD(STATUS_SOLICITUD_ID)
;

ALTER TABLE HISTORICO_STATUS_PRESTAMO ADD CONSTRAINT RefPRESTAMO181 
    FOREIGN KEY (PRESTAMO_ID)
    REFERENCES PRESTAMO(PRESTAMO_ID)
;


-- 
-- TABLE: INVERSIONISTA 
--

ALTER TABLE INVERSIONISTA ADD CONSTRAINT RefUSUARIO31 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
;


-- 
-- TABLE: PAGO_PRESTAMO 
--

ALTER TABLE PAGO_PRESTAMO ADD CONSTRAINT RefPRESTAMO231 
    FOREIGN KEY (PRESTAMO_ID)
    REFERENCES PRESTAMO(PRESTAMO_ID)
;


-- 
-- TABLE: PERFIL_ANUAL 
--

ALTER TABLE PERFIL_ANUAL ADD CONSTRAINT RefSOLICITANTE291 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES SOLICITANTE(USUARIO_ID)
;


-- 
-- TABLE: PRESTAMO 
--

ALTER TABLE PRESTAMO ADD CONSTRAINT RefSOLICITANTE151 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES SOLICITANTE(USUARIO_ID)
;

ALTER TABLE PRESTAMO ADD CONSTRAINT RefSTATUS_SOLICITUD221 
    FOREIGN KEY (STATUS_SOLICITUD_ID)
    REFERENCES STATUS_SOLICITUD(STATUS_SOLICITUD_ID)
;


-- 
-- TABLE: PRESTAMO_VOTO 
--

ALTER TABLE PRESTAMO_VOTO ADD CONSTRAINT RefINVERSIONISTA131 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES INVERSIONISTA(USUARIO_ID)
;

ALTER TABLE PRESTAMO_VOTO ADD CONSTRAINT RefPRESTAMO141 
    FOREIGN KEY (PRESTAMO_ID)
    REFERENCES PRESTAMO(PRESTAMO_ID)
;


-- 
-- TABLE: PUNTAJE_INVERSIONISTA 
--

ALTER TABLE PUNTAJE_INVERSIONISTA ADD CONSTRAINT RefPRESTAMO_VOTO371 
    FOREIGN KEY (USUARIO_ID, PRESTAMO_ID)
    REFERENCES PRESTAMO_VOTO(USUARIO_ID, PRESTAMO_ID)
;


-- 
-- TABLE: SOLICITANTE 
--

ALTER TABLE SOLICITANTE ADD CONSTRAINT RefUSUARIO41 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
;

ALTER TABLE SOLICITANTE ADD CONSTRAINT RefOCUPACION261 
    FOREIGN KEY (OCUPACION_ID)
    REFERENCES OCUPACION(OCUPACION_ID)
;

ALTER TABLE SOLICITANTE ADD CONSTRAINT RefSOLICITANTE281 
    FOREIGN KEY (IDUSUARIOAVAL)
    REFERENCES SOLICITANTE(USUARIO_ID)
;


-- 
-- TABLE: TARJETA 
--

ALTER TABLE TARJETA ADD CONSTRAINT RefINVERSIONISTA91 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES INVERSIONISTA(USUARIO_ID)
;


-- 
-- TABLE: USUARIO_COMENTARIO 
--

ALTER TABLE USUARIO_COMENTARIO ADD CONSTRAINT RefUSUARIO431 
    FOREIGN KEY (USUARIO_ID)
    REFERENCES USUARIO(USUARIO_ID)
;

ALTER TABLE USUARIO_COMENTARIO ADD CONSTRAINT RefUSUARIO451 
    FOREIGN KEY (USUARIO_COMENTADO)
    REFERENCES USUARIO(USUARIO_ID)
;


