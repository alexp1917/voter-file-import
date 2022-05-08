-- https://dba.stackexchange.com/a/152383
drop database if exists fve;
create database if not exists fve CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
use fve;

\. src/main/sql/schema.sql
\. src/main/sql/import.sql
