-- ----------------------- DROP TABLE ----------------------- 
drop table TAXONOMY cascade constraints;
drop table STAFF cascade constraints;
drop table ZONE cascade constraints;
drop table AREA cascade constraints;
drop table MANAGEMENT cascade constraints;
drop table ANIMAL cascade constraints;

-- ----------------------- CREATE TABLE -----------------------

-- Create Taxonomy Table by Nut
create table Taxonomy(
TaxonomyId varchar2(5),
TaxonomyName varchar2(100)  not null,
Food varchar2(50)   not null,
Description varchar2(2000)  not null,
CONSTRAINT taxonomy_taxonomyid_pk PRIMARY KEY (TaxonomyId)
);


-- Create Staff Table by Ryan
create table STAFF(
    staffid     Number(5),
    staffname   Varchar2(90)     not null,
    gender      char(1)          not null,
    tel         varchar2(10),
    position    varchar2(50),
    salary      Number(8)        not null,

    CONSTRAINT  staff_staffid_pk PRIMARY KEY (staffid),
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
    areasize    varchar2(20)    not null,
    zoneid		varchar2(5),
    zonename    varchar2(80)    not null,

    CONSTRAINT  area_areaid_pk  PRIMARY KEY (areaid),
    CONSTRAINT  area_zoneid_fk  FOREIGN KEY (zoneid) REFERENCES ZONE
);

-- Create Management Table by Safe
create table MANAGEMENT(
    areaid		varchar2(6),
    staffid     number(5),

    CONSTRAINT  management_id_pk  PRIMARY KEY (areaid,staffid),
    CONSTRAINT  management_areaid_fk  FOREIGN KEY (areaid) REFERENCES AREA,
    CONSTRAINT  management_staffid_fk  FOREIGN KEY (staffid) REFERENCES STAFF
);

-- Create Animal Table by Run
create table Animal (
    AnimalId    varchar2(5),
    AnimalName  varchar2(40),
    Age         number(3),
    Gender      char(1),
    DOB         date,
    Type        varchar2(40) not null,
    Symthom     varchar2(100),
    AreaId      varchar2(60) not null,
    TaxonomyId  varchar2(50) not null,

    CONSTRAINT Animal_PK primary key(AnimalId,AnimalName),
    CONSTRAINT Animal_AreaId_FK1 FOREIGN KEY (AreaId) REFERENCES Area(AreaId),
    CONSTRAINT Animal_TaxonomyId_FK2 FOREIGN KEY (TaxonomyId) REFERENCES Taxonomy(TaxonomyId),
    CONSTRAINT Animal_Gender_check check(Gender in ('M', 'F'))
);


-- ----------------------- INSERT DATA -----------------------

-- Insert data to Taxonomy Table by Nut
insert into Taxonomy values('T0001','Potamotrygon motoro','Waterworm,
Red worm,Small shrimp','The motoro is one of three main species of the Potamotrygonidae family. The three main genera of freshwater stingrays from South America are Potamotrygon')

-- Insert data to Staff Table by Ryan
insert into STAFF (staffid,staffname,gender, tel, position, salary) values('1001','Nutnrong','G','0123456789','Manager','50,000');
insert into STAFF (staffid,staffname,gender, tel, position, salary) values('1002','Zoro','M','1234567890','Zookeeper','12,000');
insert into STAFF (staffid,staffname,gender, tel, position, salary) values('1003','Nami','G','1123456789','Information','10,000');
insert into STAFF (staffid,staffname,gender, tel, position, salary) values('1004','Luffy','M','1112345678','Vet','30,000');
insert into STAFF (staffid,staffname,gender, tel, position, salary) values('1005','Sanji','M','1111234567','Zookeeper','12,000');
insert into STAFF (staffid,staffname,gender, tel, position, salary) values('1006','Franky','M','1111123456','Cleaner','11,000');


-- Insert data to Zone Table by Safe
--insert into ZONE values(zoneid,zonename,zonedetails,zonesize)
insert into ZONE values('Z0001','AquaZone','This zone is Aqua','200 sq.m.');
insert into ZONE values('Z0002','BirdZone','This zone is Bird','800 sq.m.');
insert into ZONE values('Z0003','WildZone','This zone is Wild','1200 sq.m.');
insert into ZONE values('Z0004','ReptileZone','This zone is Reptile','200 sq.m.');
insert into ZONE values('Z0005','AfricaZone','This zone is Africa','2000 sq.m.');

-- Insert data to Area Table by Safe
--insert into AREA values(areaid,areaname,zoneid,areaname)
insert into AREA values('AR1001','10 sq.m.','Z0001','AquaZone');
insert into AREA values('AR1002','20 sq.m.','Z0001','AquaZone');

insert into AREA values('AR2001','600 sq.m.','Z0002','BirdZone');
insert into AREA values('AR2002','200 sq.m.','Z0002','BirdZone');

-- Insert data to Management Table by Safe
--insert into Management values(areaid,staffid)
insert into MANAGEMENT values ('AR1001','1002');
insert into MANAGEMENT values ('AR1002','1002');
insert into MANAGEMENT values ('AR1001','1006');

-- Insert data to Animal Table by Run
--https://whozoo.org/listodate.htm
--    AnimalId, AnimalName, Age, Gender, DOB, date, Type, Symthom, AreaId, TaxonomyId
INSERT into Animal values ("AN001","Aby","1","M","15-3-2017","Motoro Ray",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN002","Arm","1","F","15-3-2017","Motoro Ray",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN003","Aod","1","F","10-1-2017","Motoro Ray",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN004","Dee","3","M","15-3-2016","Banded Cat Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN005","Doo","3","F","11-7-2016","Banded Cat Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN006","Bunny","2","F","10-10-2017","Nurse Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN007","Bee","2","F","10-10-2017","Nurse Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN008","Boo","2","M","01-03-2017","Nurse Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN009","Bye","5","M","01-10-2014","Nurse Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN010","Bi","4","F","08-12-2015","Nurse Shark",NULL,"AR1001",TaxonomyId);
INSERT into Animal values ("AN010","Bike","6","M","08-12-2013","Nurse Shark",NULL,"AR1001",TaxonomyId);

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