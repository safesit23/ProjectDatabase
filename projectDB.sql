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
insert into Taxonomy values('T0006','Cyprinodon pecosensis','algae & mineral,rock fragments.','DesThe Pecos pupfish can usually be found and seems to thrive in saline bodies of water that contain a limited number of other fish species. It occasionally lives in fresher waters, but that is uncommon in such habitats. In the saline habitats, populations can be very dense.');
insert into Taxonomy values('T0007','Anableps (Anablepidae)','Insects','There are three species in the genus Anableps.The species found in the James R. Record Aquarium is Anableps anableps.  The genus belongs to the order Cyprinodontes, small, often colorful livebearing fish with complex behaviors.  The famous desert pupfish is also in this order.  Anableps is found in coastal waters from the Yucatan peninsula to the equator.');
insert into Taxonomy values('T0008','Gobioides broussonetti','Chopped Fish, Prawns','Dragon Fish live in brackish water. This means that the water is a mix of salt and fresh water. They are very peaceful even though they sometimes might appear to be lethal predators. This fish is really ugly but it is still very interesting, almost charming.');
insert into Taxonomy values('T0009','Parabuteo unicinctus','The Harris Hawk feeds on hares, rabbits, birds, and lizards.','Medium size: about 18 inches. Weight is about 565-2000 g. Long tail and broad wings. Its color is dark brown with sienna shoulders, underwings and thighs.White feathers under the tail. (Grossman, Hamlet 281).');
insert into Taxonomy values('T0010','Stephanoaetus coronatus','Varanus lizards or large snakes, including venomous species.','The Crowned Eagle is very seldom seen inside the forest. Most of the time they perch on trees that overlook glades or water-holes. The normally perch in the early morning and evening so they can catch their prey off guard.  Much of their time is devoted to soaring over the forest awaiting their prey, which is normally a monkey that is feeding on tree-tops');
insert into Taxonomy values('T0011','Circus cyaneus','insects, small reptiles, amphibians, rodents','The Northern Harrier is a slender bird with long wings, a long tail, yellow legs, an owl-like facial disk, a conspicuous white rump (that shows easily in flight), and yellow eyes.  Its wing span is 44 inches wide and the bird is between 17-24 inches in length.');
insert into Taxonomy values('T0012','Spizaetus nipalensis','This raptors diet in the zoo consists of white field mice','The mountain hawk eagle is one of the most voracious raptors in the world. They sit upon a concealed perch high in the forrest to observe the unsuspecting ground quarry, then move down to a lower branch to make a short and fast swoop');
insert into Taxonomy values('T0013','Cygnus atratus','Aquatic vegetation and tidal grasses and grains','”Atratus” translates into “dressed in black.” Therefore, the body plumage of the black swan is black with white distal secondary and primary feathers on the wings that can be seen only when the bird is in flight.');
insert into Taxonomy values('T0014','Anodorhynchus hyacinthinus','Various nuts','Hyacinths live in the wild as mated pairs and remain constant from season to season.They also live in family groups that consist of the parents and their offspring.  The Hyacinth are seasonal breeders, breeding after the rainy season.  The rainy season is usually from August and December.');


-- Insert data to Staff Table by Ryan //zookeeper 29 vet 7 information 10 cleaner 13 Manager 1
insert into STAFF values(1001,'Nutnrong Yukittichai','F','0860240993','Manager',50000);
insert into STAFF values(1002,'Roronoa Zoro','M','0880174765','Zookeeper',12000); --Zookeeper 29
insert into STAFF values(1003,'Nico Robin','F','0803742891','Information',10000); --Infromation 10
insert into STAFF values(1004,'Monkey Luffy','M','0828599562','Vet',30000); --Vet 7
insert into STAFF values(1005,'Vinsmoke Sanji','M','0844612172','Zookeeper',12000);
insert into STAFF values(1006,'Tony Chopper','M','0855680441','Cleaner',11000); --Cleaner 3

insert into STAFF values(1007,'Amaan Senior','F','0866040046','Zookeeper',12000);
insert into STAFF values(1008,'Zayyan Bruce','F','0892758161','Information',10000);
insert into STAFF values(1009,'Rares Harrington','F','0802142004','Zookeeper',12000);
insert into STAFF values(1010,'Valerie Hamer','F','0832319706','Vet',30000);
insert into STAFF values(1011,'Kody Bannister','M','0825274252','Vet',30000);
insert into STAFF values(1012,'Amy Pearce','F','0890268960','Zookeeper',12000);
insert into STAFF values(1013,'Shivani Robinson','F','0832570948','Vet',30000);
insert into STAFF values(1014,'Ilayda Stokes','F','0837218341','Zookeeper',12000);
insert into STAFF values(1015,'Zubair Greenaway','F','0837943345','Zookeeper',12000);
insert into STAFF values(1016,'Elisabeth Harding','F','0853921893','Vet',30000);
insert into STAFF values(1017,'Dexter Barry','M','0875652638','Zookeeper',12000);
insert into STAFF values(1018,'Dominykas Dunn','M','0876652247','Information',10000);
insert into STAFF values(1019,'Mikaeel Wicks','F','0884692062','Zookeeper',12000);
insert into STAFF values(1020,'Kester Mcfarland','M','0863950124','Information',10000);

insert into STAFF values(1021,'Pia Frye','M','0867592276','Vet',30000);
insert into STAFF values(1022,'Varun Lynn','M','0858119997','Cleaner',11000);
insert into STAFF values(1023,'Jarrod Mckay','M','0845070224','Cleaner',11000);
insert into STAFF values(1024,'Saskia Sweet','M','0883242924','Vet',30000);
insert into STAFF values(1025,'Ayda Farmer','F','0845490987','Zookeeper',12000);
insert into STAFF values(1026,'Eamonn Rigby','M','0841774291','Cleaner',11000);
insert into STAFF values(1027,'Elissa Stark','F','0882355829','Zookeeper',12000);
insert into STAFF values(1028,'Alessio Hall','M','0874380317','Cleaner',11000);
insert into STAFF values(1029,'Nylah Rooney','F','0897094801','Zookeeper',12000);
insert into STAFF values(1030,'Kristina Langley','F','0882526614','Information',10000);

insert into STAFF values(1031,'Stan Haas','M','0890734191','Zookeeper',12000);
insert into STAFF values(1032,'Isaak Piper','M','0812792649','Cleaner',11000);
insert into STAFF values(1033,'Eman Heath','M','0811846961','Information',10000);
insert into STAFF values(1034,'Cari Booker','F','0899996786','Zookeeper',12000);
insert into STAFF values(1035,'Antoni Choi','M','0816791685','Cleaner',11000);
insert into STAFF values(1036,'Lexi Romero','F','0826565714','Zookeeper',12000);
insert into STAFF values(1037,'Braiden Oakley','M','0885970985','Information',10000);
insert into STAFF values(1038,'Rufus Schwartz','M','0889662487','Zookeeper',12000);
insert into STAFF values(1039,'Hania Gill','F','0884903834','Zookeeper',12000);
insert into STAFF values(1040,'Mirza Powers','F','0816287350','Information',10000);

insert into STAFF values(1041,'Aniela Chang','F','0875282325','Zookeeper',12000);
insert into STAFF values(1042,'Amirah Stein','F','0862459790','Cleaner',11000);
insert into STAFF values(1043,'Faizaan Bains','M','0858699822','Information',10000);
insert into STAFF values(1044,'Huseyin Nichols','M','0802071829','Zookeeper',12000);
insert into STAFF values(1045,'Arandeep Povey','M','0871164428','Information',10000);
insert into STAFF values(1046,'Giselle Ray','F','0823507883','Zookeeper',12000);
insert into STAFF values(1047,'Rose Velazquez','F','0806925039','Zookeeper',12000);
insert into STAFF values(1048,'Willem Pena','M','0856014472','Cleaner',11000);
insert into STAFF values(1049,'Mimi Levy','F','0873525003','Cleaner',11000);
insert into STAFF values(1050,'Iylah Chambers','M','0845411057','Cleaner',11000);

insert into STAFF values(1051,'Billy Plummer','M','0862220721','Zookeeper',12000);
insert into STAFF values(1052,'Taliyah Lennon','M','0876534837','Cleaner',11000);
insert into STAFF values(1053,'Tobi Mcdermott','M','0899788530','Zookeeper',12000);
insert into STAFF values(1054,'Aliesha Drummond','F','0894342841','Cleaner',11000);
insert into STAFF values(1055,'Sanaya Mcleod','F','0837635947','Zookeeper',12000);
insert into STAFF values(1056,'Tatiana Reynolds','F','0868221662','Zookeeper',12000);
insert into STAFF values(1057,'Tim Reilly','M','0851683933','Zookeeper',12000);
insert into STAFF values(1058,'Habiba Jensen','M','0832328991','Zookeeper',12000);
insert into STAFF values(1059,'Cynthia Mansell','M','0832531110','Zookeeper',12000);
insert into STAFF values(1060,'Beverly Ridley','F','0856481240','Zookeeper',12000);


-- Insert data to Zone Table by Safe
--insert into ZONE values(zoneid,zonename,zonedetails,zonesize)
insert into ZONE values('Z0001','AquaZone','This zone is Aqua','8 acre');
insert into ZONE values('Z0002','BirdZone','This zone is Bird','5 acre');
insert into ZONE values('Z0003','WildZone','This zone is Wild','40 acre');
insert into ZONE values('Z0004','ReptileZone','This zone is Reptile','6 acre');
insert into ZONE values('Z0005','AfricaZone','This zone is Africa','30 acre');

-- Insert data to Area Table by Safe
--1 acre = 1600 sq.m.
--insert into AREA values(areaid,areaname,zoneid,areaname)
insert into AREA values('AR1001','4000 sq.m.','Z0001','AquaZone');
insert into AREA values('AR1002','2000 sq.m.','Z0001','AquaZone');
insert into AREA values('AR1003','3500 sq.m.','Z0001','AquaZone');
insert into AREA values('AR1004','1500 sq.m.','Z0001','AquaZone');
insert into AREA values('AR1005','1800 sq.m.','Z0001','AquaZone');

insert into AREA values('AR2001','1500 sq.m.','Z0002','BirdZone');
insert into AREA values('AR2002','500 sq.m.','Z0002','BirdZone');
insert into AREA values('AR2003','3000 sq.m.','Z0002','BirdZone');
insert into AREA values('AR2004','1200 sq.m.','Z0002','BirdZone');
insert into AREA values('AR2005','800 sq.m.','Z0002','BirdZone');
insert into AREA values('AR2005','1000 sq.m.','Z0002','BirdZone');

insert into AREA values('AR3001','4000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3002','3200 sq.m.','Z0003','WildZone');
insert into AREA values('AR3003','5500 sq.m.','Z0003','WildZone');
insert into AREA values('AR3004','12000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3005','6300 sq.m.','Z0003','WildZone');
insert into AREA values('AR3006','20000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3007','8000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3007','5000 sq.m.','Z0003','WildZone');

insert into AREA values('AR4001','1000 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4002','700 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4003','2000 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4004','850 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4005','650 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4006','400 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4007','940 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4008','360 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4009','400 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4010','680 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4011','930 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4012','330 sq.m.','Z0004','ReptileZone');
insert into AREA values('AR4013','360 sq.m.','Z0004','ReptileZone');

-- Insert data to Management Table by Safe
--insert into Management values(areaid,staffid)
insert into MANAGEMENT values ('AR1001','1002');
insert into MANAGEMENT values ('AR1002','1002');
insert into MANAGEMENT values ('AR1001','1006');

-- Insert data to Animal Table by Run
--https://whozoo.org/listodate.htm
--                      AnimalId, AnimalName, Age, Gender, DOB, Type, Symthom, AreaId, TaxonomyId
INSERT into Animal values ('AN001','Aby',1,'M','15-MAR-2017','Motoro Ray','Birdflu','AR1001','T0001');
INSERT into Animal values ('AN002','Arm',1,'F','15-MAR-2017','Motoro Ray',NULL,'AR1001','T0001');
INSERT into Animal values ('AN003','Aod',1,'F','10-JAN-2017','Motoro Ray',NULL,'AR1001','T0001');
INSERT into Animal values ('AN004','Dee',3,'M','15-MAR-2016','Banded Cat Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN005','Doo',3,'F','11-JUL-2016','Banded Cat Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN006','Bunny',2,'F','10-OCT-2017','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN007','Bee',2,'F','10-OCT-2017','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN008','Boo',2,'M','01-MAR-2017','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN009','Bye',5,'M','01-OCT-2014','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN010','Bi',4,'F','08-DEC-2015','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN011','Bike',6,'M','08-DEC-2013','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN012','Byte',6,'F','08-DEC-2013','Nurse Shark',NULL,'AR1001','T0001');
INSERT into Animal values ('AN013','Elena',4,'M','22-NOV-2015','Slender African Lungfish',NULL,'AR1001','T0001');
INSERT into Animal values ('AN014','Volodya',6,'M','22-NOV-2015','Slender African Lungfish',NULL,'AR1001','T0001');
INSERT into Animal values ('AN015','Anita',6,'M','22-NOV-2017','Slender African Lungfish',NULL,'AR1001','T0001');


INSERT into Animal values ('AN016','Jamie',5,'M','02-OCT-2014','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN017','Wallis',5,'F','08-NOV-2014','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN018','Kelvin',1,'M','14-AUG-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN019','Chelsea',1,'M','14-AUG-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN020','Halle',1,'F','14-AUG-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN021','Marvyn',1,'F','14-AUG-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN022','Sela',1,'F','14-AUG-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN023','Gerrard',1,'M','14-AUG-2018','Redfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN024','Belle',1,'F','14-AUG-2018','Redfish',NULL,'AR1002','T0001');

INSERT into Animal values ('AN025','Caelan',4,'M','10-JAN-2015','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN026','Darden',4,'F','14-OCT-2015','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN027','June',1,'F','18-SEP-2018','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN028','Terra',1,'F','18-SEP-2018','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN029','Sue',1,'F','18-SEP-2018','Pecos Pupfish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN030','Cathy',1,'M','18-SEP-2018','Pecos Pupfish',NULL,'AR1002','T0001');

INSERT into Animal values ('AN031','Justina',1,'M','10-MAR-2018','Four Eyed Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN032','Lottie',3,'F','21-FEB-2016','Four Eyed Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN033','Madoline',1,'F','11-SEP-2018','Four Eyed Fish',NULL,'AR1002','T0001');

INSERT into Animal values ('AN034','Vikki',7,'M','08-AUG-2012','Dragon Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN035','Dwayne',6,'F','17-SEP-2013','Dragon Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN036','Lexa',2,'F','11-JAN-2018','Dragon Fish',NULL,'AR1002','T0001');
INSERT into Animal values ('AN037','Becky',2,'F','12-JAN-2018','Dragon Fish',NULL,'AR1002','T0001');


INSERT into Animal values ('AN038','Rosemary',10,'F','12-JAN-2009','Harris Hawk',NULL,'AR2001','T0001');
INSERT into Animal values ('AN039','Diamond',8,'M','12-JAN-2011','Harris Hawk',NULL,'AR2001','T0001');

INSERT into Animal values ('AN040','Kieron',8,'F','30-AUG-2011','Crowned Eagle',NULL,'AR2001','T0001');

INSERT into Animal values ('AN041','Stirling',2,'M','31-JAN-2017','Northern Harrier',NULL,'AR2001','T0001');

INSERT into Animal values ('AN042','Jamey',2,'M','03-FEB-2017','Mountain hawk eagle',NULL,'AR2001','T0001');
INSERT into Animal values ('AN043','Lauressa',1,'F','30-JUL-2018','Mountain hawk eagle',NULL,'AR2001','T0001');

INSERT into Animal values ('AN044','Vin',8,'F','30-NOV-2011','Black Swan',NULL,'AR2001','T0001');
INSERT into Animal values ('AN045','Clover',8,'M','30-SEP-2011','Black Swan',NULL,'AR2001','T0001');
INSERT into Animal values ('AN046','Zackery',2,'M','28-APR-2017','Black Swan',NULL,'AR2001','T0001');
INSERT into Animal values ('AN047','Esmaralda',2,'M','26-OCT-2017','Black Swan',NULL,'AR2001','T0001');

INSERT into Animal values ('AN048','Gene',9,'M','24-DEC-2010','Hyacinth Macaw',NULL,'AR2001','T0001');
INSERT into Animal values ('AN049','Clay',8,'M','08-MAY-2011','Hyacinth Macaw',NULL,'AR2001','T0001');
INSERT into Animal values ('AN050','Hyacinth',4,'F','06-FEB-2015','Hyacinth Macaw',NULL,'AR2001','T0001');

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