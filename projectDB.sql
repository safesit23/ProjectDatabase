-- ----------------------- DROP TABLE ----------------------- 
drop table TAXONOMY cascade constraints;
drop table STAFF cascade constraints;
drop table ZONE cascade constraints;
drop table AREA cascade constraints;
drop table MANAGEMENT cascade constraints;
drop table ANIMAL cascade constraints;

-- ----------------------- CREATE TABLE -----------------------

-- Create Taxonomy Table by Nut


-- Create Staff Table by Ryan


-- Create Zone Table by Safe
create table ZONE(
    zoneid		varchar2(5),
    zonename    varchar2(80)    not null,
    zonedetails varchar2(200)   not null,
    zonesize    varchar2(20)    not null,

    CONSTRAINT  zone_zoneid_pk  PRIMARY KEY (zoneid)
);

-- Create Area Table by Safe
create table AREA(
    areaid		varchar2(6),
    zonesize    varchar2(20)    not null,
    zoneid		varchar2(5),
    zonename    varchar2(80)    not null,

    CONSTRAINT  area_arzid_pk  PRIMARY KEY (areaid,zoneid),
    CONSTRAINT  area_zoneid_fk  FOREIGN KEY (zoneid) REFERENCES ZONE
);

-- Create Management Table by Safe
create table MANAGEMENT(
    areaid		varchar2(6),
    zoneid		varchar2(5),
    staffid     number(5),

    CONSTRAINT  management_id_pk  PRIMARY KEY (areaid,zoneid,staffid),
    CONSTRAINT  management_areaid_fk  FOREIGN KEY (areaid) REFERENCES AREA,
    CONSTRAINT  management_zoneid_fk  FOREIGN KEY (zoneid) REFERENCES ZONE,
    CONSTRAINT  management_staffid_fk  FOREIGN KEY (staffid) REFERENCES STAFF
);

-- Create Animal Table by Run


-- ----------------------- INSERT DATA -----------------------

-- Insert data to Taxonomy Table by Nut


-- Insert data to Staff Table by Ryan


-- Insert data to Zone Table by Safe


-- Insert data to Area Table by Safe


-- Insert data to Management Table by Safe


-- Insert data to Animal Table by Run

-- ----------------------- CREATE INDEX -----------------------

-- Taxonomy Table by Nut


-- Staff Table by Ryan


-- Zone Table by Safe


-- Area Table by Safe


-- Management Table by Safe


-- Animal Table by Run


-- ----------------------- CREATE ROLE -----------------------

-- staff role by Ryan

-- vet role by Safe

-- zookeeper role by Nut

-- manager	role by Run

-- ----------------------- CREATE USER -----------------------

-- staff user by Ryan

-- vet user by Safe

-- zookeeper user by Nut

-- manager	user by Run

-- ----------------------- SQL STATEMENT -----------------------