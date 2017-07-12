CREATE DATABASE OPENGDSMOBILEDATA
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;
       
CREATE EXTENSION postgis;


CREATE TABLE "REALTIMEINFO"
(
  subject character varying(50),
  userid character varying(50) NOT NULL,
  session character(50),
  CONSTRAINT "REALTIMEINFO_pkey" PRIMARY KEY (userid)
)

CREATE TABLE "OPENDATACOLLECT"
(
  "PROVIDER" character varying(50),
  "URL" character varying(100),
  "EP" character varying(200),
  "TIME" integer,
  "STATUS" boolean,
  "COMMENT" character varying(500),
  "NAME" character varying(50) NOT NULL,
  "KEYS" character varying(100),
  "TYPE" character varying(50),
  "VISNAME" character varying(100),
  CONSTRAINT "NAME" PRIMARY KEY ("NAME")
)