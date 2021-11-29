drop database if exists bookdb;
drop role if exists bookadmin;
drop role if exists bookuser;
create database bookdb;

DO
$do$
begin 
	if not exists (
		select 
		from pg_roles 
		where rolname='bookadmin'
	) then
	create role bookadmin with login password 'root';
	END if;
END
$do$;

DO
$do$
begin 
	if not exists (
		select 
		from pg_roles 
		where rolname='bookuser'
	) then
	create role bookuser with login password 'root';
	END if;
END
$do$;