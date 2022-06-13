--@Autor 1: Raymundo Dominguez Chavez
--@Autor 2: Amaury Ramirez Quiroz
--@Fecha creación: 06 Junio 2022
--@Descripción: Creacion tablespaces



-- A 5 AÑOS 


CREATE bigfile tablespace tbs_usuario
  datafile '/unam-bda/d14/app/oracle/oradata/DORAPROY/usuario01.dbf' size 2g
    autoextend ON NEXT 150m maxsize 3g 
  extent management LOCAL autoallocate 
  segment space management AUTO;

CREATE tablespace tbs_inversionista
  datafile '/unam-bda/d15/app/oracle/oradata/DORAPROY/inversionista01.dbf' size 250m
    autoextend ON NEXT 30m maxsize 500m 
  extent management LOCAL autoallocate 
  segment space management auto;

CREATE bigfile tablespace tbs_solicitantePrestamo
  datafile '/unam-bda/d16/app/oracle/oradata/DORAPROY/prestamo01.dbf' size 1g
    autoextend ON NEXT 100m maxsize 2g 
  extent management LOCAL autoallocate 
  segment space management AUTO;

CREATE tablespace tbs_pago
  datafile '/unam-bda/d17/app/oracle/oradata/DORAPROY/pago01.dbf' size 150m
    autoextend ON NEXT 50m maxsize 400m
  segment space management AUTO;

CREATE tablespace tbs_cuentaSolicitante_encrypt
  datafile '/unam-bda/d18/app/oracle/oradata/DORAPROY/cuentabanco01.dbf' size 50m
    autoextend ON NEXT 10m maxsize 150m 
    encryption using 'aes256' encrypt
  extent management LOCAL autoallocate 
  segment space management AUTO;

CREATE tablespace tbs_cuentaInversionista_encrypt
  datafile '/unam-bda/d19/app/oracle/oradata/DORAPROY/cuentabanco02.dbf' size 200m
    autoextend ON NEXT 25m maxsize 500m 
    encryption using 'aes256' encrypt
  extent management LOCAL autoallocate 
  segment space management AUTO;

CREATE tablespace tbs_blob_mod1
  datafile '/unam-bda/d20/app/oracle/oradata/DORAPROY/blobmodulo01.dbf' size 1g
    autoextend ON NEXT 100m maxsize 2g 
  extent management LOCAL autoallocate 
  segment space management AUTO;

CREATE tablespace tbs_blob_mod2
  datafile '/unam-bda/d21/app/oracle/oradata/DORAPROY/blobmodulo02.dbf' size 3g
    autoextend ON NEXT 200m maxsize 5g 
  extent management LOCAL autoallocate 
  segment space management AUTO;

CREATE tablespace tbs_indexes
  datafile '/unam-bda/d22/app/oracle/oradata/DORAPROY/indexes01.dbf' size 200m
    autoextend ON NEXT 20m maxsize 400m 
  extent management LOCAL autoallocate 
  segment space management AUTO;

ALTER TABLESPACE tbs_usuario ADD DATAFILE  '/unam-bda/d14/app/oracle/oradata/DORAPROY/usuario01.dbf' SIZE 100M;

ALTER TABLESPACE tbs_inversionista ADD DATAFILE '/unam-bda/d15/app/oracle/oradata/DORAPROY/inversionista01.dbf' SIZE 100M;

ALTER TABLESPACE tbs_solicitantePrestamo ADD DATAFILE '/unam-bda/d16/app/oracle/oradata/DORAPROY/prestamo01.dbf' SIZE 100M;

ALTER TABLESPACE tbs_pago ADD DATAFILE '/unam-bda/d17/app/oracle/oradata/DORAPROY/pago01.dbf' SIZE 100M;

ALTER TABLESPACE tbs_cuentaSolicitante_encrypt ADD DATAFILE '/unam-bda/d18/app/oracle/oradata/DORAPROY/cuentabanco01.dbf' SIZE 100M;

ALTER TABLESPACE tbs_cuentaInversionista_encrypt ADD DATAFILE '/unam-bda/d19/app/oracle/oradata/DORAPROY/cuentabanco02.dbf' SIZE 100M;

ALTER TABLESPACE tbs_blob_mod1 ADD DATAFILE '/unam-bda/d20/app/oracle/oradata/DORAPROY/blobmodulo01.dbf'  SIZE 100M;

ALTER TABLESPACE tbs_blob_mod2 ADD DATAFILE '/unam-bda/d21/app/oracle/oradata/DORAPROY/blobmodulo02.dbf'  SIZE 100M;

ALTER TABLESPACE tbs_indexes ADD DATAFILE '/unam-bda/d22/app/oracle/oradata/DORAPROY/indexes01.dbf' SIZE 100M;


--A 10 AÑOS

-- CREATE bigfile tablespace tbs_usuario
--   datafile '/unam-bda/d14/app/oracle/oradata/DORAPROY/usuario01.dbf' size 5g
--     autoextend ON NEXT 250m maxsize 10g 
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

-- CREATE tablespace tbs_inversionista
--   datafile '/unam-bda/d15/app/oracle/oradata/DORAPROY/inversionista01.dbf' size 500m
--     autoextend ON NEXT 50m maxsize 1g 
--   extent management LOCAL autoallocate 
--   segment space management auto;

-- CREATE bigfile tablespace tbs_solicitantePrestamo
--   datafile '/unam-bda/d16/app/oracle/oradata/DORAPROY/prestamo01.dbf' size 2g
--     autoextend ON NEXT 100m maxsize 4g 
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

-- CREATE tablespace tbs_pago
--   datafile '/unam-bda/d17/app/oracle/oradata/DORAPROY/pago01.dbf' size 300m
--     autoextend ON NEXT 50m maxsize 800m 
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

-- CREATE tablespace tbs_cuentaSolicitante_encrypt
--   datafile '/unam-bda/d18/app/oracle/oradata/DORAPROY/cuentabanco01.dbf' size 100m
--     autoextend ON NEXT 20m maxsize 300m 
--     encryption using 'aes256' encrypt
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

-- CREATE tablespace tbs_cuentaInversionista_encrypt
--   datafile '/unam-bda/d19/app/oracle/oradata/DORAPROY/cuentabanco02.dbf' size 400m
--     autoextend ON NEXT 50m maxsize 600m 
--     encryption using 'aes256' encrypt
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

-- CREATE tablespace tbs_blob_mod1
--   datafile '/unam-bda/d20/app/oracle/oradata/DORAPROY/blobmodulo01.dbf' size 2g
--     autoextend ON NEXT 100m maxsize 4g 
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

--   CREATE tablespace tbs_blob_mod2
--   datafile '/unam-bda/d20/app/oracle/oradata/DORAPROY/blobmodulo02.dbf' size 10g
--     autoextend ON NEXT 250m maxsize 15g 
--     encryption using 'aes256' encrypt
--   extent management LOCAL autoallocate 
--   segment space management AUTO;

CREATE tablespace tbs_prueba
  datafile '/unam-bda/d19/app/oracle/oradata/DORAPROY/cuentabanco02.dbf' size 200m
    autoextend ON NEXT 25m maxsize 500m 
    encryption using 'aes256' encrypt
  extent management LOCAL autoallocate 
  segment space management AUTO;