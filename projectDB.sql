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
create table STAFF(
    staffid     Number(5),
    staffname   Varchar2(90)     not null,
    gender      char(1)          not null,
    tel         varchar2(10),
    position    varchar2(50),
    salary      Number(8)        not null,

    CONSTRAINT  staff_staffid_pk PRIMARY KEY (staffid)
    CONSTRAINT  staff_gender_ck check (gender = 'M' or gender = 'F')
);


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
create table Animal (
    AnimalId varchar2(5),
    AnimalName varchar2(40) not null,
    Age number(3),
    Gender char(1) ['M','F'],
    DOB date,
    Type varchar2(40) not null,
    Symthom varchar2(100),
    AreaId varchar2(60) not null,
    TaxonomyId varchar2(50) not null
    CONSTRAINT Animal_PK primary key(AnimalId,AnimalName),
    CONSTRAINT Animal_AreaId_FK1 FOREIGN KEY (AreaId) REFERENCES Area(AreaId),
    CONSTRAINT Animal_TaxonomyId_FK2 FOREIGN KEY (TaxonomyId) REFERENCES Taxonomy(TaxonomyId),
    CONSTRAINT Animal_Gender_check check(Gender in ('M', 'F'))
);


-- ----------------------- INSERT DATA -----------------------

-- Insert data to Taxonomy Table by Nut


-- Insert data to Staff Table by Ryan


-- Insert data to Zone Table by Safe
insert into ZONE values('zoneid','zonename','zonedetails','zonesize');

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