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
--insert into Taxonomy values(TaxonomyId,TaxonomyName,Food,Description)
insert into Taxonomy values('T0001','Potamotrygon motoro','Waterworm,Red worm,Small shrimp','The motoro is one of three main species of the Potamotrygonidae family. The three main genera of freshwater stingrays from South America are Potamotrygon');
insert into Taxonomy values('T0002','Chiloscyllium punctatum','shrimp,crab','Chiloscyllium punctatum is a bamboo shark in the family Hemiscylliidae found in the Indo-West Pacific from Japan to northern Australia');
insert into Taxonomy values('T0003','Ginglymostoma cirratum','Frozen fish mackerel, smelt, and herring','Ginglymostoma cirratum is an elasmobranch fish within the family Ginglymostomatidae. They are directly targeted in some fisheries and considered as bycatch in others');
insert into Taxonomy values('T0004','Protopterus annectens','krill','There are four African lungfish species. The P.anncetens, however is the most common in aquariums.They are considered to be fearless and they will attack almost anything that moves');
insert into Taxonomy values('T0005','Sciaenops ocellatus','shrimp, crustaceans, small fish, meal',' The Redfish is notorious as a bottom feeding animal.  However, it can also be seen on the surface, feeding on schools of fingerling baitfish.  It prefers shallow grass beds and and structures where small fish and crustaceans are abundant');


-- Insert data to Staff Table by Ryan //zookeeper 29 vet 7 information 10 cleaner 13 Manager 1
insert into STAFF values(1001,'Nutnrong','F','0860240993','Manager',50000);
insert into STAFF values(1002,'Zoro','M','0880174765','Zookeeper',12000); --Zookeeper 29
insert into STAFF values(1003,'Nami','F','0803742891','Information',10000); --Infromation 10
insert into STAFF values(1004,'Luffy','M','0828599562','Vet',30000); --Vet 7
insert into STAFF values(1005,'Sanji','M','0844612172','Zookeeper',12000);
insert into STAFF values(1006,'Franky','M','0855680441','Cleaner',11000); --Cleaner 3

insert into STAFF values(1007,'Amaan','F','0866040046','Zookeeper',12000);
insert into STAFF values(1008,'Zayyan','F','0892758161','Information',10000);
insert into STAFF values(1009,'Rares','F','0802142004','Zookeeper',12000);
insert into STAFF values(1010,'Valerie','F','0832319706','Vet',30000);
insert into STAFF values(1011,'Kody','M','0825274252','Vet',30000);
insert into STAFF values(1012,'Amy','F','0890268960','Zookeeper',12000);
insert into STAFF values(1013,'Shivani','F','0832570948','Vet',30000);
insert into STAFF values(1014,'Ilayda','F','0837218341','Zookeeper',12000);
insert into STAFF values(1015,'Zubair','F','0837943345','Zookeeper',12000);
insert into STAFF values(1016,'Elisabeth','F','0853921893','Vet',30000);
insert into STAFF values(1017,'Dexter','M','0875652638','Zookeeper',12000);
insert into STAFF values(1018,'Dominykas','M','0876652247','Information',10000);
insert into STAFF values(1019,'Mikaeel','F','0884692062','Zookeeper',12000);
insert into STAFF values(1020,'Kester','M','0863950124','Information',10000);

insert into STAFF values(1021,'Pia','M','0867592276','Vet',30000);
insert into STAFF values(1022,'Varun','M','0858119997','Cleaner',11000);
insert into STAFF values(1023,'Jarrod','M','0845070224','Cleaner',11000);
insert into STAFF values(1024,'Saskia','M','0883242924','Vet',30000);
insert into STAFF values(1025,'Ayda','F','0845490987','Zookeeper',12000);
insert into STAFF values(1026,'Eamonn','M','0841774291','Cleaner',11000);
insert into STAFF values(1027,'Elissa','F','0882355829','Zookeeper',12000);
insert into STAFF values(1028,'Alessio','M','0874380317','Cleaner',11000);
insert into STAFF values(1029,'Nylah','F','0897094801','Zookeeper',12000);
insert into STAFF values(1030,'Kristina','F','0882526614','Information',10000);

insert into STAFF values(1031,'Stan','M','0890734191','Zookeeper',12000);
insert into STAFF values(1032,'Isaak','M','0812792649','Cleaner',11000);
insert into STAFF values(1033,'Eman','M','0811846961','Information',10000);
insert into STAFF values(1034,'Cari','F','0899996786','Zookeeper',12000);
insert into STAFF values(1035,'Antoni','M','0816791685','Cleaner',11000);
insert into STAFF values(1036,'Lexi','F','0826565714','Zookeeper',12000);
insert into STAFF values(1037,'Braiden','M','0885970985','Information',10000);
insert into STAFF values(1038,'Rufus','M','0889662487','Zookeeper',12000);
insert into STAFF values(1039,'Hania','F','0884903834','Zookeeper',12000);
insert into STAFF values(1040,'Mirza','F','0816287350','Information',10000);

insert into STAFF values(1041,'Aniela','F','0875282325','Zookeeper',12000);
insert into STAFF values(1042,'Amirah','F','0862459790','Cleaner',11000);
insert into STAFF values(1043,'Faizaan','M','0858699822','Information',10000);
insert into STAFF values(1044,'Huseyin','M','0802071829','Zookeeper',12000);
insert into STAFF values(1045,'Arandeep','M','0871164428','Information',10000);
insert into STAFF values(1046,'Giselle','F','0823507883','Zookeeper',12000);
insert into STAFF values(1047,'Rose','F','0806925039','Zookeeper',12000);
insert into STAFF values(1048,'Willem','M','0856014472','Cleaner',11000);
insert into STAFF values(1049,'Mimi','F','0873525003','Cleaner',11000);
insert into STAFF values(1050,'Iylah','M','0845411057','Cleaner',11000);

insert into STAFF values(1051,'Billy','M','0862220721','Zookeeper',12000);
insert into STAFF values(1052,'Taliyah','M','0876534837','Cleaner',11000);
insert into STAFF values(1053,'Tobi','M','0899788530','Zookeeper',12000);
insert into STAFF values(1054,'Aliesha','F','0894342841','Cleaner',11000);
insert into STAFF values(1055,'Sanaya','F','0837635947','Zookeeper',12000);
insert into STAFF values(1056,'Tatiana','F','0868221662','Zookeeper',12000);
insert into STAFF values(1057,'Tim','M','0851683933','Zookeeper',12000);
insert into STAFF values(1058,'Habiba','M','0832328991','Zookeeper',12000);
insert into STAFF values(1059,'Cynthia','M','0832531110','Zookeeper',12000);
insert into STAFF values(1060,'Beverly','F','0856481240','Zookeeper',12000);


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
--                      AnimalId, AnimalName, Age, Gender, DOB, Type, Symthom, AreaId, TaxonomyId
INSERT into Animal values ('AN001','Aby',1,'M','15-03-2017','Motoro Ray',NULL,'AR1001','T0001');
INSERT into Animal values ('AN002','Arm',1,'F','15-03-2017','Motoro Ray',NULL,'AR1001','T0001');
INSERT into Animal values ('AN003','Aod',1,'F','10-01-2017','Motoro Ray',NULL,'AR1001','T0001');
INSERT into Animal values ('AN004','Dee',3,'M','15-03-2016','Banded Cat Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN005','Doo',3,'F','11-07-2016','Banded Cat Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN006','Bunny',2,'F','10-10-2017','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN007','Bee',2,'F','10-10-2017','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN008','Boo',2,'M','01-03-2017','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN009','Bye',5,'M','01-10-2014','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN010','Bi',4,'F','08-12-2015','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN011','Bike',6,'M','08-12-2013','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN012','Byte',6,'F','08-12-2013','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN013','Elena',4,'M','22-11-2015','Slender African Lungfish',NULL,'AR1001','T0001');
INSERT into Animal values ('AN014','Volodya',6,'M','22-11-2015','Slender African Lungfish',NULL,'AR1001','T0001');
INSERT into Animal values ('AN015','Anita',6,'M','22-11-2017','Slender African Lungfish',NULL,'AR1001','T0001');


INSERT into Animal values ('AN016','Jamie',5,'M','02-10-2014','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN017','Wallis',5,'F','08-11-2014','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN018','Kelvin',1,'M','14-08-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN019','Chelsea',1,'M','14-08-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN020','Halle',1,'F','14-08-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN021','Marvyn',1,'F','14-08-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN022','Sela',1,'F','14-08-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN023','Gerrard',1,'M','14-08-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN024','Belle',1,'F','14-08-2018','Redfish',NULL,'AR1002','T0001');

INSERT into Animal values ('AN025','Caelan',4,'M','10-01-2015','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN026','Darden',4,'F','14-10-2015','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN027','June',1,'F','18-09-2018','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN028','Terra',1,'F','18-09-2018','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN029','Sue',1,'F','18-09-2018','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN030','Cathy',1,'M','18-09-2018','Pecos Pupfish',NULL,'AR1002','T0001');

INSERT into Animal values ('AN031','Justina',1,'M','10-03-2018','Four Eyed Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN032','Lottie',3,'F','21-02-2016','Four Eyed Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN033','Madoline',1,'F','11-09-2018','Four Eyed Fish',NULL,'AR1002','T0001');

INSERT into Animal values ('AN034','Vikki',7,'M','08-08-2012','Dragon Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN035','Dwayne',6,'F','17-09-2013','Dragon Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN036','Lexa',2,'F','11-01-2018','Dragon Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN037','Becky',2,'F','12-01-2018','Dragon Fish',NULL,'AR1002','T0001');


INSERT into Animal values ('AN038','Rosemary',10,'F','12-01-2009','Harris Hawk',NULL,'AR2001','T0001');
INSERT into Animal values ('AN039','Diamond',8,'M','12-01-2011','Harris Hawk',NULL,'AR2001','T0001');

INSERT into Animal values ('AN040','Kieron',8,'F','30-08-2011','Crowned Eagle',NULL,'AR2001','T0001');

INSERT into Animal values ('AN041','Stirling',2,'M','31-01-2017','Northern Harrier',NULL,'AR2001','T0001');

INSERT into Animal values ('AN042','Jamey',2,'M','03-02-2017','Mountain hawk eagle',NULL,'AR2001','T0001');
INSERT into Animal values ('AN043','Lauressa',1,'F','30-07-2018','Mountain hawk eagle',NULL,'AR2001','T0001');

INSERT into Animal values ('AN044','Vin',8,'F','30-11-2011','Black Swan',NULL,'AR2001','T0001');
INSERT into Animal values ('AN045','Clover',8,'M','30-09-2011','Black Swan',NULL,'AR2001','T0001');
INSERT into Animal values ('AN046','Zackery',2,'M','28-04-2017','Black Swan',NULL,'AR2001','T0001');
INSERT into Animal values ('AN047','Esmaralda',2,'M','26-10-2017','Black Swan',NULL,'AR2001','T0001');

INSERT into Animal values ('AN048','Gene',9,'M','24-12-2010','Hyacinth Macaw',NULL,'AR2001','T0001');
INSERT into Animal values ('AN049','Clay',8,'M','08-05-2011','Hyacinth Macaw',NULL,'AR2001','T0001');
INSERT into Animal values ('AN050','Hyacinth',4,'F','06-02-2015','Hyacinth Macaw',NULL,'AR2001','T0001');

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