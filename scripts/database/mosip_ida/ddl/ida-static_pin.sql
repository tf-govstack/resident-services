-- create table section -----------------------------------------------------------
-- schema 		: ida			- Id-Authentication 
-- table 		: static_pin	- Static pin to authonticate user
-- table alias  : spin

-- schemas section -----------------------------------------------------------------

-- create schema if ida schema for Id-Authentication schema not exists
create schema if not exists ida
;

-- table section --------------------------------------------------------------------
create table ida.static_pin (
	
	uin  	character varying(28) not null,  			-- UIN of indivisuals and referenced from idrepo database
	pin 	character varying(64) not null,				-- Static PIN of an Indivisuals, Created by user using resident portal
	
	is_active 	boolean not null,
	cr_by 		character varying(32) not null,
	cr_dtimes 	timestamp not null,
	upd_by  	character varying (32),
	upd_dtimes timestamp,
	is_deleted 	boolean,
	del_dtimes timestamp
	
)
;

-- keys section --------------------------------------------------------------------------
alter table ida.static_pin add constraint pk_spin_id primary key (uin)
 ;

-- indexes section ------------------------------------------------------------------------
-- create index idx_spin_<colX> on ida.static_pin(ColX)
-- ;

-- comments section ------------------------------------------------------------------------ 
comment on table ida.static_pin is 'To store generated list of static pin for Authentication'
;
comment on column ida.static_pin.pin is 'Static pin generated by the system for authentication'
;

