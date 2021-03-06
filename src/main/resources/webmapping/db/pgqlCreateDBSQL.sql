CREATE DATABASE OPENGDSMOBILE_DB
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;
       
CREATE EXTENSION postgis;


CREATE TABLE "REALTIMEINFO"
(
  "SUBJECT" character varying(50),
  "USER_ID" character varying(50) NOT NULL,
  "SESSION" character(50),
  CONSTRAINT "REALTIMEINFO_pkey" PRIMARY KEY ("USER_ID")
)
