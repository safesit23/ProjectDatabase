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
insert into Taxonomy values('T0006','Cypecosenprinodon sis','algae mineral rock fragments','DesThe Pecos pupfish can usually be found and seems to thrive in saline bodies of water that contain a limited number of other fish species. It occasionally lives in fresher waters, but that is uncommon in such habitats. In the saline habitats, populations can be very dense.');
insert into Taxonomy values('T0007','Anableps (Anablepidae)','Insects','There are three species in the genus Anableps.The species found in the James R. Record Aquarium is Anableps anableps.  The genus belongs to the order Cyprinodontes, small, often colorful livebearing fish with complex behaviors.  The famous desert pupfish is also in this order.  Anableps is found in coastal waters from the Yucatan peninsula to the equator.');
insert into Taxonomy values('T0008','Gobioides broussonetti','Chopped Fish, Prawns','Dragon Fish live in brackish water. This means that the water is a mix of salt and fresh water. They are very peaceful even though they sometimes might appear to be lethal predators. This fish is really ugly but it is still very interesting, almost charming.');
insert into Taxonomy values('T0009','Parabuteo unicinctus','rabbits, birds, and lizards.','Medium size: about 18 inches. Weight is about 565-2000 g. Long tail and broad wings. Its color is dark brown with sienna shoulders, underwings and thighs.White feathers under the tail. (Grossman, Hamlet 281).');
insert into Taxonomy values('T0010','Stephanoaetus coronatus',' large snake','The Crowned Eagle is very seldom seen inside the forest. Most of the time they perch on trees that overlook glades or water-holes. The normally perch in the early morning and evening so they can catch their prey off guard.  Much of their time is devoted to soaring over the forest awaiting their prey, which is normally a monkey that is feeding on tree-tops');
insert into Taxonomy values('T0011','Circus cyaneus','insects, small reptiles, amphibians, rodents','The Northern Harrier is a slender bird with long wings, a long tail, yellow legs, an owl-like facial disk, a conspicuous white rump (that shows easily in flight), and yellow eyes.  Its wing span is 44 inches wide and the bird is between 17-24 inches in length.');
insert into Taxonomy values('T0012','Spizaetus nipalensis','white field mice','The mountain hawk eagle is one of the most voracious raptors in the world. They sit upon a concealed perch high in the forrest to observe the unsuspecting ground quarry, then move down to a lower branch to make a short and fast swoop');
insert into Taxonomy values('T0013','Cygnus atratus','Aquatic vegetation and tidal grasses and grains','”Atratus” translates into “dressed in black.” Therefore, the body plumage of the black swan is black with white distal secondary and primary feathers on the wings that can be seen only when the bird is in flight.');
insert into Taxonomy values('T0014','Anodorhynchus hyacinthinus','Various nuts','Hyacinths live in the wild as mated pairs and remain constant from season to season.They also live in family groups that consist of the parents and their offspring.  The Hyacinth are seasonal breeders, breeding after the rainy season.  The rainy season is usually from August and December.');
insert into Taxonomy values('T0015','Ara militaris','herbivore diet','Military Macaws inhabit an area from Mexico southward, especially Colombia, northwestern Venezuela, northern Peru, and eastern Ecuador.  They can live in pairs, in families, or in flocks as large as forty.');
insert into Taxonomy values('T0016','Phascolarctos cinerus adustrus','Eucalyptus','Koalas are said to be very lazy, but when it comes to getting food, they can climb 150 feet to the top of an Eucalyptus tree and leap from one to another. These "pouched animals" are very quick tempered and very muscular. The Aboriginal meaning of Koala is "no water." Koalas have the ability to drink, but they seldom do.');
insert into Taxonomy values('T0017','Macropus euginii','Eucalyptus flowers and grasses','There are many different species of wallabies, but the dama wallaby are just a little different from the rest.  They are mostly nocturnal animals in the wild, but they do forage and catch some sun during the day.  They have small front legs having five digits with a sharp claw.');
insert into Taxonomy values('T0018','Canis rufus','bone or muscle meat once a week','Red Wolves generally roam in small packs usually consisting of an adult pair and their offspring.  Red wolves can breed as early as their second year and have 3 to 5 pups each.  In order for the red wolves to survive in the wild they need anywhere from 10 and 100 square miles of habitat to hunt and live');
insert into Taxonomy values('T0019','Canis latrans','Omnivorous, mostly mammalian','Coloration varies from grayish brown to a yellowish gray. The throat and belly are whitish and the tail is half the body length of the coyote. The tail is bottled shaped with a black tip. Coyotes are smaller than gray wolves but larger than foxes.');
insert into Taxonomy values('T0020','Canis lupus baileyi','dried dog food','Mexican wolves are the smallest subspecies of gray wolves. They form small packs composed of family units of 4-5 animals. Both parents and other pack members would bring food to the young. Mexican wolves breed about once a year.');
insert into Taxonomy values('T0021','Ursus americanus','Omnivore','Black bears are very successful animals with no natural enemies except other bears and man. Black bears are tolerant of other black bears, but occasionally skirmish over territory and food. Grizzlies and black bears do not get along and often avoid one another.');
insert into Taxonomy values('T0022','Lutra canadensis','crayfish, frogs, turtles, some birds','The River Otter is the largest member of the Mustelidae family with a body that is long and slender, whiskers, a very unique nose, and small ears.  The upper part of the body is a dark brown and the underside is either gray or brown.');
insert into Taxonomy values('T0023','Alligator mississipiensis','carnivore diet','Alligators do not truely hibernate, but they do undergo periods of dormancy in cold weather.  They are known to search out caves in the banks of waterways and use them as dens.');
insert into Taxonomy values('T0024','Gavialis gangeticus','carnivore diet (fish)','The gavial is a timid animal, yet the very young individuals are more sociable. It reproduces by means of hard-shelled eggs laid in nests built by the female. It has been said that a skull of a gavial is strongly suggestive of a frying pan, the snout forming the handle.');
insert into Taxonomy values('T0025','Crocodylus mindorensis','N/A','Once considered to be a subspecies of the New Guinea Crocodile, the Philippine Crocodile is only found in the Philippine islands.  The Philippine Crocodile does not get as big as some of the saltwater crocodiles that are indigenous to the same area.');
insert into Taxonomy values('T0026','Osteolaemus tetraspas','rodents, fish, and meat','The term crocodilian is applied to any of the order Crocodilia alligators, caimans, and gavials, as well as true crocodiles. There are about 20 species of living crocodilians, all of which are lizardlike, egg-laying carnivores. The Dwarf Crocodile, known as the Broadfronted crocodile, or scientifically  Osteolaemus tetraspis comes from Africa');
insert into Taxonomy values('T0027','Eretmochelys imbricata','a small fish','MASS: on average 45 kilograms.BODY LENGTH: small to medium sized WEIGHT: Hawksbill Sea turtles can weigh up to 270 pounds and can grow an outer shell (carapace) length of around 3 feet. As newborn hatchlings these turtles weigh less than half of an ounce and contain a small carapace length of 1-1/2 inches.');
insert into Taxonomy values('T0028','Chelus fimbriatus.','Fishes, water plants','The Matamata is one of the largest freshwater turtles.  An adult age turtle could reach a shell size of 18 inches.  Its flat head is connected to a long neck which presents many protuberances, warts and ridges.  Its scutes have a conical shape and they are determine by well formed symmetrical rings.');
insert into Taxonomy values('T0029','Chamaeleo [furcifer] pardalis','wax worms, meal worm','The chameleons live two to three years in the wild.  In captivity they can live five to seven years depending on how well they are taken care of.Chameleons, in captivity, most likely will not drink out of a bowl of water.  The chameleon needs to see moving water to actually drink it.  Therefore, it can easily dehydrate which would result in kidney failure and in the end he would die.');
insert into Taxonomy values('T0030','Malacochersus tornieri','Fed fruit salad and lettuce','Pancake tortoises are small and flat with a thin, flexible shell. The shell is normally 6 to 7 inches long and an inch or so high. On the legs, they have bigger scales with points that project downward and outward.');
insert into Taxonomy values('T0031','Corucia zebrata','N/A','Only species in the skink family with a prehensile tail.They are also ovoviviparous, which means their reproduction system is that in which the young hatch just before, while, or shortly after the eggs are laid.They typically only give birth to one live young. ');
insert into Taxonomy values('T0032','Tiliqua rugosus','Omnivorous, including insect','It is one of the more larger lizards of this genre. It has a large pyramidal head. The head almost looks like the tail. You can be fooled sometimes by a quick glance on which end is which. This is a feature that will set this lizard all by it self from the many skinks. The trunk is is very long and thick and flattened.');
insert into Taxonomy values('T0033','Varanus salvator','mice',' Water monitors are widespread over a large geographical area. In some areas such as India and the Philippine Islands they are becoming scarce through unsustainable use. Other areas, however, such as the Andamen and Nicobar islands, Sri Lanka, Southern China, Malaysia, and Borneo have large populations of water monitors. Water monitors');
insert into Taxonomy values('T0034','Varanus griseus','reptiles, crabs, scorpions, snails','These lizards are brownish-yellow with crossbands on the body and tail. The number of crossbands depends on subspecies, but ranges from 3-8 on the body and 8-28 on the tail.There are three subspecies of the Varanus griseus: caspius (Caspian desert monitor), griseus (western desert monitor, and koniecznyi (Thar desert monitor).');
insert into Taxonomy values('T0035','Lycaon pictus','Carnivorous diet','Wild dogs have a highly developed social structure.  They live in packs that vary from 10 to 15 animals, including males, females, and young.  Their packs are nomadic, and they roam across a range of 1 to 30 miles a day.  Members of the pack cooperate when hunting and raising their young.  Normally, only the highest ranking male and female breed.  However, other pack members help protect and raise the pups.');
insert into Taxonomy values('T0036','Acinonyx jubatus','Carnivorous Diet','"Cheetah" comes from a Hindi word meaning "spotted one."  Two groups exist in wild populations: the family group and males.  Males, often siblings, form a group of 2 or 3; rarely 1 will live alone.  This group will live and hunt together for life and claims a range which may overlap several female territories.  Male territories may be as large as 300 square miles.  Young females, however, usually occupy the same range as their mother although all females are solitary except when they have a litter.');
insert into Taxonomy values('T0037','Phacochoerus aethiopicus','bulbs, roots, and carrion','Warthogs live in small groups called sounders, which usually consists of one or two females and their young.  Adult boars may sometimes join the group, but usually remain solitary.  Most warthogs are active during the day and graze mainly on grasses and herbs.  They tend to live in abandoned aardvark dens.  When entering their dens, the young climb down first followed by adults, who usually enter backwards to avoid predator attacks.');
insert into Taxonomy values('T0038','Vulpes zerda','Omnivore','The fennec fox weighs about 0.7–1.6 kg (1.5–3.5 lb), with a body length of between 24–41 cm (9–16 in); it is around 20.3 cm (8 in) tall. It is the smallest species of canid in the world. The tail has a black tip and is 18–31 cm (7–12 in) long, while the ears can be between 10–15 cm (3.9–5.9 in) long.');
insert into Taxonomy values('T0039','Hippopotamus amphibius','Herbivore diet','The Hippopotamus is an extremely fat animal, with a round body, short, stocky legs, and a large head. Female Hippos are usually slightly smaller than the male Hippos. The male Hippo can grow up to twelve feet long and five feet high, and can weigh up to 8,000 pounds. The female Hippo, however, is slightly smaller. The Hippo body is a brownish-gray color on top, and paler on the underside, with pink areas on the face.');
insert into Taxonomy values('T0040','Oreotragus oreotragus','folivore,frugivore,fruit,fruit','Klipspringers avoid populated areas, such as the Cape Peninsula and parts of the Karoo. Otherwise, they are common in unprotected areas where settlement has not occurred and livestock is not present.');


-- Insert data to Staff Table by Ryan //zookeeper 45 vet 14 information 13 cleaner 27 Manager 1
insert into STAFF values(1001,'Nutnrong Yukittichai','F','0860240993','Manager',50000);
insert into STAFF values(1002,'Roronoa Zoro','M','0880174765','Zookeeper',12000);
insert into STAFF values(1003,'Nico Robin','F','0803742891','Information',10000);
insert into STAFF values(1004,'Monkey Luffy','M','0828599562','Vet',30000);
insert into STAFF values(1005,'Vinsmoke Sanji','M','0844612172','Zookeeper',12000);
insert into STAFF values(1006,'Tony Chopper','M','0855680441','Cleaner',11000);

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
insert into STAFF values(1022,'Varun Lynn','M','0858119997','Cleaner',9900);
insert into STAFF values(1023,'Jarrod Mckay','M','0845070224','Cleaner',10200);
insert into STAFF values(1024,'Saskia Sweet','M','0883242924','Vet',30000);
insert into STAFF values(1025,'Ayda Farmer','F','0845490987','Zookeeper',12000);
insert into STAFF values(1026,'Eamonn Rigby','M','0841774291','Cleaner',11050);
insert into STAFF values(1027,'Elissa Stark','F','0882355829','Zookeeper',12000);
insert into STAFF values(1028,'Alessio Hall','M','0874380317','Cleaner',11100);
insert into STAFF values(1029,'Nylah Rooney','F','0897094801','Zookeeper',12000);
insert into STAFF values(1030,'Kristina Langley','F','0882526614','Information',11400);

insert into STAFF values(1031,'Stan Haas','M','0890734191','Zookeeper',12000);
insert into STAFF values(1032,'Isaak Piper','M','0812792649','Cleaner',11000);
insert into STAFF values(1033,'Eman Heath','M','0811846961','Information',10000);
insert into STAFF values(1034,'Cari Booker','F','0899996786','Zookeeper',12500);
insert into STAFF values(1035,'Antoni Choi','M','0816791685','Cleaner',11000);
insert into STAFF values(1036,'Lexi Romero','F','0826565714','Zookeeper',12900);
insert into STAFF values(1037,'Braiden Oakley','M','0885970985','Information',10000);
insert into STAFF values(1038,'Rufus Schwartz','M','0889662487','Zookeeper',12100);
insert into STAFF values(1039,'Hania Gill','F','0884903834','Zookeeper',12400);
insert into STAFF values(1040,'Mirza Powers','F','0816287350','Information',10900);

insert into STAFF values(1041,'Aniela Chang','F','0875282325','Zookeeper',12000);
insert into STAFF values(1042,'Amirah Stein','F','0862459790','Cleaner',11000);
insert into STAFF values(1043,'Faizaan Bains','M','0858699822','Information',10000);
insert into STAFF values(1044,'Huseyin Nichols','M','0802071829','Zookeeper',12000);
insert into STAFF values(1045,'Arandeep Povey','M','0871164428','Information',10000);
insert into STAFF values(1046,'Giselle Ray','F','0823507883','Zookeeper',12200);
insert into STAFF values(1047,'Rose Velazquez','F','0806925039','Zookeeper',12000);
insert into STAFF values(1048,'Willem Pena','M','0856014472','Cleaner',11000);
insert into STAFF values(1049,'Mimi Levy','F','0873525003','Cleaner',11000);
insert into STAFF values(1050,'Iylah Chambers','M','0845411057','Cleaner',11000);

insert into STAFF values(1051,'Billy Plummer','M','0862220721','Zookeeper',12400);
insert into STAFF values(1052,'Taliyah Lennon','M','0876534837','Cleaner',11000);
insert into STAFF values(1053,'Tobi Mcdermott','M','0899788530','Zookeeper',12000);
insert into STAFF values(1054,'Aliesha Drummond','F','0894342841','Cleaner',11000);
insert into STAFF values(1055,'Sanaya Mcleod','F','0837635947','Zookeeper',12000);
insert into STAFF values(1056,'Tatiana Reynolds','F','0868221662','Zookeeper',12000);
insert into STAFF values(1057,'Tim Reilly','M','0851683933','Zookeeper',12000);
insert into STAFF values(1058,'Habiba Jensen','M','0832328991','Zookeeper',12000);
insert into STAFF values(1059,'Cynthia Mansell','M','0832531110','Zookeeper',12000);
insert into STAFF values(1060,'Beverly Ridley','F','0856481240','Zookeeper',12500);

insert into STAFF values(1061,'Daniella Lim','F','0819157429','Vet',30500);
insert into STAFF values(1062,'Evie-Mae Castro','F','0817803287','Zookeeper',12000);
insert into STAFF values(1063,'Ahmet Marriott','F','0815788154','Information',10000);
insert into STAFF values(1064,'Matei Bridges','M','0864766093','Vet',31500);
insert into STAFF values(1065,'Karolina Naylor','F','0839220342','Zookeeper',12000);
insert into STAFF values(1066,'Ricardo Gilmour','M','0873909195','Cleaner',11000);
insert into STAFF values(1067,'Elwood Vu','M','0879429009','Vet',30800);
insert into STAFF values(1068,'Ace Velasquez','M','0890032119','Zookeeper',12000);
insert into STAFF values(1069,'Anis Derrick','F','0846271575','Information',10400);
insert into STAFF values(1070,'Terence Wolfe','M','0850344074','Zookeeper',12100);

insert into STAFF values(1071,'Lance Hodgson','M','0855233812','Cleaner',11000);
insert into STAFF values(1072,'Hughie Denton','M','0850837954','Zookeeper',12000);
insert into STAFF values(1073,'Ayat Kaiser','M','0820611920','Cleaner',11000);
insert into STAFF values(1074,'Nikkita Andersen','F','0864892627','Vet',30000);
insert into STAFF values(1075,'Priya Mccarthy','M','0839098148','Cleaner',11000);
insert into STAFF values(1076,'Monet Haigh','M','0844049058','Vet',30000);
insert into STAFF values(1077,'Olivia Goodwin','F','0896133895','Cleaner',11000);
insert into STAFF values(1078,'Sami Gates','M','0880763262','Zookeeper',12000);
insert into STAFF values(1079,'Claire Whitworth','F','0872423060','Vet',30000);
insert into STAFF values(1080,'Rihanna Donald','F','0848136397','Information',11900);

insert into STAFF values(1081,'Rachael Santos','M','0860635991','Zookeeper',12000);
insert into STAFF values(1082,'Russell Ireland','F','0817369959','Cleaner',11000);
insert into STAFF values(1083,'Shauna Zavala','F','0866543421','Cleaner',11000);
insert into STAFF values(1084,'Elina Blackburn','F','0890814574','Vet',30000); --1
insert into STAFF values(1085,'Fearne Walters','F','0837336656','Zookeeper',12000);
insert into STAFF values(1086,'Lynda Brady','F','0813778172','Zookeeper',12000);
insert into STAFF values(1087,'Tyreese Hunt','M','0836480268','Cleaner',11000);
insert into STAFF values(1088,'Joel Pennington','M','0850043721','Zookeeper',12000);
insert into STAFF values(1089,'Noah Lancaster','M','0859363403','Cleaner',11000);
insert into STAFF values(1090,'Evie Merritt','F','0813495318','Zookeeper',12000);

insert into STAFF values(1091,'Lindsay Sharp','F','0842683349','Zookeeper',12000);
insert into STAFF values(1092,'Ayaana Salazar','F','0851999224','Cleaner',11000);
insert into STAFF values(1093,'Montana Gutierrez','F','0844850519','Cleaner',11000);
insert into STAFF values(1094,'Bea Mccaffrey','M','0849010190','Zookeeper',12000);
insert into STAFF values(1095,'Bronte Ritter','M','0855055018','Cleaner',11000);
insert into STAFF values(1096,'Sahib Blanchard','M','0889245777','Zookeeper',12000);
insert into STAFF values(1097,'Farzana Brooks','F','0884086048','Cleaner',11000);
insert into STAFF values(1098,'Maisha Murillo','F','0812007034','Zookeeper',12000);
insert into STAFF values(1099,'Dionne Ryder','M','0809602432','Cleaner',11000);
insert into STAFF values(1100,'Chantal Norton','F','0871821359','Zookeeper',12000);






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
insert into AREA values('AR2006','1000 sq.m.','Z0002','BirdZone');

insert into AREA values('AR3001','4000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3002','3200 sq.m.','Z0003','WildZone');
insert into AREA values('AR3003','5500 sq.m.','Z0003','WildZone');
insert into AREA values('AR3004','12000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3005','6300 sq.m.','Z0003','WildZone');
insert into AREA values('AR3006','20000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3007','8000 sq.m.','Z0003','WildZone');
insert into AREA values('AR3008','5000 sq.m.','Z0003','WildZone');

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

insert into AREA values('AR5001','6500 sq.m.','Z0005','AfricaZone');
insert into AREA values('AR5002','4800 sq.m.','Z0005','AfricaZone');
insert into AREA values('AR5003','7700 sq.m.','Z0005','AfricaZone');
insert into AREA values('AR5004','14500 sq.m.','Z0005','AfricaZone');
insert into AREA values('AR5005','8200 sq.m.','Z0005','AfricaZone');
insert into AREA values('AR5006','6300 sq.m.','Z0005','AfricaZone');

-- Insert data to Management Table by Safe
--insert into Management values(areaid,staffid)
--ZOOKEEPER
insert into MANAGEMENT values ('AR1001','1002');
insert into MANAGEMENT values ('AR1001','1005');
insert into MANAGEMENT values ('AR1001','1007');
insert into MANAGEMENT values ('AR1002','1009');
insert into MANAGEMENT values ('AR1003','1009');
insert into MANAGEMENT values ('AR1004','1012');
insert into MANAGEMENT values ('AR1005','1014');

insert into MANAGEMENT values ('AR2001','1015');
insert into MANAGEMENT values ('AR2002','1015');
insert into MANAGEMENT values ('AR2003','1017');
insert into MANAGEMENT values ('AR2003','1019');
insert into MANAGEMENT values ('AR2004','1025');
insert into MANAGEMENT values ('AR2005','1027');
insert into MANAGEMENT values ('AR2006','1029');

insert into MANAGEMENT values ('AR3001','1031');
insert into MANAGEMENT values ('AR3002','1034');
insert into MANAGEMENT values ('AR3003','1034');
insert into MANAGEMENT values ('AR3004','1036');
insert into MANAGEMENT values ('AR3004','1038');
insert into MANAGEMENT values ('AR3004','1039');
insert into MANAGEMENT values ('AR3004','1041');
insert into MANAGEMENT values ('AR3005','1031');
insert into MANAGEMENT values ('AR3006','1044');
insert into MANAGEMENT values ('AR3006','1046');
insert into MANAGEMENT values ('AR3006','1047');
insert into MANAGEMENT values ('AR3006','1051');
insert into MANAGEMENT values ('AR3006','1053');
insert into MANAGEMENT values ('AR3007','1031');
insert into MANAGEMENT values ('AR3008','1034');

insert into MANAGEMENT values ('AR4001','1055');
insert into MANAGEMENT values ('AR4002','1055');
insert into MANAGEMENT values ('AR4003','1056');
insert into MANAGEMENT values ('AR4003','1057');
insert into MANAGEMENT values ('AR4004','1058');
insert into MANAGEMENT values ('AR4005','1059');
insert into MANAGEMENT values ('AR4006','1060');
insert into MANAGEMENT values ('AR4007','1062');
insert into MANAGEMENT values ('AR4008','1065');
insert into MANAGEMENT values ('AR4009','1068');
insert into MANAGEMENT values ('AR4010','1068');
insert into MANAGEMENT values ('AR4011','1070');
insert into MANAGEMENT values ('AR4012','1070');
insert into MANAGEMENT values ('AR4013','1072');

insert into MANAGEMENT values ('AR5001','1078');
insert into MANAGEMENT values ('AR5002','1081');
insert into MANAGEMENT values ('AR5003','1085');
insert into MANAGEMENT values ('AR5004','1086');
insert into MANAGEMENT values ('AR5005','1088');
insert into MANAGEMENT values ('AR5005','1090');
insert into MANAGEMENT values ('AR5005','1091');
insert into MANAGEMENT values ('AR5005','1094');
insert into MANAGEMENT values ('AR5005','1096');
insert into MANAGEMENT values ('AR5006','1098');
insert into MANAGEMENT values ('AR5006','1100');

--CLEANER
insert into MANAGEMENT values ('AR1001','1006');
insert into MANAGEMENT values ('AR1001','1022');
insert into MANAGEMENT values ('AR1002','1023');
insert into MANAGEMENT values ('AR1003','1023');
insert into MANAGEMENT values ('AR1004','1026');
insert into MANAGEMENT values ('AR1005','1026');

insert into MANAGEMENT values ('AR2001','1028');
insert into MANAGEMENT values ('AR2002','1028');
insert into MANAGEMENT values ('AR2003','1032');
insert into MANAGEMENT values ('AR2003','1035');
insert into MANAGEMENT values ('AR2004','1042');
insert into MANAGEMENT values ('AR2005','1048');
insert into MANAGEMENT values ('AR2006','1048');

insert into MANAGEMENT values ('AR3001','1049');
insert into MANAGEMENT values ('AR3002','1049');
insert into MANAGEMENT values ('AR3003','1049');
insert into MANAGEMENT values ('AR3004','1050');
insert into MANAGEMENT values ('AR3004','1052');
insert into MANAGEMENT values ('AR3004','1054');
insert into MANAGEMENT values ('AR3005','1066');
insert into MANAGEMENT values ('AR3006','1071');
insert into MANAGEMENT values ('AR3006','1073');
insert into MANAGEMENT values ('AR3006','1075');
insert into MANAGEMENT values ('AR3007','1066');
insert into MANAGEMENT values ('AR3008','1075');

insert into MANAGEMENT values ('AR4001','1077');
insert into MANAGEMENT values ('AR4002','1077');
insert into MANAGEMENT values ('AR4003','1082');
insert into MANAGEMENT values ('AR4003','1083');
insert into MANAGEMENT values ('AR4004','1087');
insert into MANAGEMENT values ('AR4005','1087');
insert into MANAGEMENT values ('AR4006','1087');
insert into MANAGEMENT values ('AR4007','1087');
insert into MANAGEMENT values ('AR4008','1089');
insert into MANAGEMENT values ('AR4009','1089');
insert into MANAGEMENT values ('AR4010','1092');
insert into MANAGEMENT values ('AR4011','1092');
insert into MANAGEMENT values ('AR4012','1093');
insert into MANAGEMENT values ('AR4013','1093');

insert into MANAGEMENT values ('AR5001','1095');
insert into MANAGEMENT values ('AR5002','1095');
insert into MANAGEMENT values ('AR5003','1095');
insert into MANAGEMENT values ('AR5004','1095');
insert into MANAGEMENT values ('AR5005','1097');
insert into MANAGEMENT values ('AR5006','1099');

-- Insert data to Animal Table by Run
--https://whozoo.org/listodate.htm
--                      AnimalId, AnimalName, Age, Gender, DOB, Type, Symthom, AreaId, TaxonomyId

--AquaZone
INSERT into Animal values ('AN001','Aby',1,'M','15-MAR-2017','Motoro Ray','Fishflu','AR1001','T0001');
INSERT into Animal values ('AN002','Arm',1,'F','15-MAR-2017','Motoro Ray',NULL,'AR1001','T0001');
INSERT into Animal values ('AN003','Aod',1,'F','10-JAN-2017','Motoro Ray',NULL,'AR1001','T0001');

INSERT into Animal values ('AN004','Dee',3,'M','15-MAR-2016','Banded Cat Shark',NULL,'AR1001','T0002');
INSERT into Animal values ('AN005','Doo',3,'F','11-JUL-2016','Banded Cat Shark',NULL,'AR1001','T0002');

INSERT into Animal values ('AN006','Bunny',2,'F','10-OCT-2017','Nurse Shark',NULL,'AR1002','T0003');
INSERT into Animal values ('AN007','Bee',2,'F','10-OCT-2017','Nurse Shark',NULL,'AR1002','T0003');
INSERT into Animal values ('AN008','Boo',2,'M','01-MAR-2017','Nurse Shark',NULL,'AR1002','T0003');
INSERT into Animal values ('AN009','Bye',5,'M','01-OCT-2014','Nurse Shark',NULL,'AR1002','T0003');
INSERT into Animal values ('AN010','Bi',4,'F','08-DEC-2015','Nurse Shark',NULL,'AR1002','T0003');
INSERT into Animal values ('AN011','Bike',6,'M','08-DEC-2013','Nurse Shark',NULL,'AR1002','T0003');
INSERT into Animal values ('AN012','Byte',6,'F','08-DEC-2013','Nurse Shark',NULL,'AR1002','T0003');

INSERT into Animal values ('AN013','Elena',4,'M','22-NOV-2015','Slender African Lungfish',NULL,'AR1003','T0004');
INSERT into Animal values ('AN014','Volodya',6,'M','22-NOV-2015','Slender African Lungfish',NULL,'AR1003','T0004');
INSERT into Animal values ('AN015','Anita',6,'M','22-NOV-2017','Slender African Lungfish',NULL,'AR1003','T0004');

INSERT into Animal values ('AN016','Jamie',5,'M','02-OCT-2014','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN017','Wallis',5,'F','08-NOV-2014','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN018','Kelvin',1,'M','14-AUG-2018','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN019','Chelsea',1,'M','14-AUG-2018','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN020','Halle',1,'F','14-AUG-2018','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN021','Marvyn',1,'F','14-AUG-2018','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN022','Sela',1,'F','14-AUG-2018','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN023','Gerrard',1,'M','14-AUG-2018','Redfish',NULL,'AR1003','T0005');
INSERT into Animal values ('AN024','Belle',1,'F','14-AUG-2018','Redfish',NULL,'AR1003','T0005');

INSERT into Animal values ('AN025','Caelan',4,'M','10-JAN-2015','Pecos Pupfish',NULL,'AR1004','T0006');
INSERT into Animal values ('AN026','Darden',4,'F','14-OCT-2015','Pecos Pupfish',NULL,'AR1004','T0006');
INSERT into Animal values ('AN027','June',1,'F','18-SEP-2018','Pecos Pupfish',NULL,'AR1004','T0006');
INSERT into Animal values ('AN028','Terra',1,'F','18-SEP-2018','Pecos Pupfish',NULL,'AR1004','T0006');
INSERT into Animal values ('AN029','Sue',1,'F','18-SEP-2018','Pecos Pupfish',NULL,'AR1004','T0006');
INSERT into Animal values ('AN030','Cathy',1,'M','18-SEP-2018','Pecos Pupfish',NULL,'AR1004','T0006');

INSERT into Animal values ('AN031','Justina',1,'M','10-MAR-2018','Four Eyed Fish',NULL,'AR1005','T0007');
INSERT into Animal values ('AN032','Lottie',3,'F','21-FEB-2016','Four Eyed Fish',NULL,'AR1005','T0007');
INSERT into Animal values ('AN033','Madoline',1,'F','11-SEP-2018','Four Eyed Fish',NULL,'AR1005','T0007');

INSERT into Animal values ('AN034','Vikki',7,'M','08-AUG-2012','Dragon Fish',NULL,'AR1005','T0008');
INSERT into Animal values ('AN035','Dwayne',6,'F','17-SEP-2013','Dragon Fish',NULL,'AR1005','T0008');
INSERT into Animal values ('AN036','Lexa',2,'F','11-JAN-2018','Dragon Fish',NULL,'AR1005','T0008');
INSERT into Animal values ('AN037','Becky',2,'F','12-JAN-2018','Dragon Fish',NULL,'AR1005','T0008');

--BirdZone
INSERT into Animal values ('AN038','Rosemary',10,'F','12-JAN-2009','Harris Hawk',NULL,'AR2001','T0009');
INSERT into Animal values ('AN039','Diamond',8,'M','12-JAN-2011','Harris Hawk',NULL,'AR2001','T0009');

INSERT into Animal values ('AN040','Kieron',8,'F','30-AUG-2011','Crowned Eagle',NULL,'AR2001','T0010');

INSERT into Animal values ('AN041','Stirling',2,'M','31-JAN-2017','Northern Harrier',NULL,'AR2002','T0011');

INSERT into Animal values ('AN042','Jamey',2,'M','03-FEB-2017','Mountain hawk eagle',NULL,'AR2002','T0012');
INSERT into Animal values ('AN043','Lauressa',1,'F','30-JUL-2018','Mountain hawk eagle','Birdflu','AR2002','T0012');

INSERT into Animal values ('AN044','Vin',8,'F','30-NOV-2011','Black Swan',NULL,'AR2003','T0013');
INSERT into Animal values ('AN045','Clover',8,'M','30-SEP-2011','Black Swan',NULL,'AR2003','T0013');
INSERT into Animal values ('AN046','Zackery',2,'M','28-APR-2017','Black Swan',NULL,'AR2003','T0013');
INSERT into Animal values ('AN047','Esmaralda',2,'M','26-OCT-2017','Black Swan',NULL,'AR2003','T0013');

INSERT into Animal values ('AN048','Gene',9,'M','24-DEC-2010','Hyacinth Macaw',NULL,'AR2004','T0014');
INSERT into Animal values ('AN049','Clay',8,'M','08-MAY-2011','Hyacinth Macaw',NULL,'AR2004','T0014');
INSERT into Animal values ('AN050','Hyacinth',4,'F','06-FEB-2015','Hyacinth Macaw',NULL,'AR2004','T0014');

INSERT into Animal values ('AN051','Aye',4,'F','06-FEB-2015','Military Macaw',NULL,'AR2005','T0015');
INSERT into Animal values ('AN052','Aoy',4,'F','06-FEB-2015','Military Macaw',NULL,'AR2005','T0015');

--WildZone
INSERT into Animal values ('AN053','Hallam',10,'F','06-FEB-2009','Koala',NULL,'AR3001','T0016');
INSERT into Animal values ('AN054','Hallam',9,'M','17-JAN-2010','Koala','Broken leg','AR3001','T0016');

INSERT into Animal values ('AN055','Cheryl',4,'M','25-OCT-2015','Dama Wallaby',NULL,'AR3002','T0017');
INSERT into Animal values ('AN056','Lyric',4,'F','07-MAR-2015','Dama Wallaby',NULL,'AR3002','T0017');

INSERT into Animal values ('AN057','Jonelle',7,'M','14-NOV-2012','Red Wolf',NULL,'AR3003','T0018');
INSERT into Animal values ('AN058','Brooke',7,'M','25-FEB-2012','Red Wolf',NULL,'AR3003','T0018');
INSERT into Animal values ('AN059','Carolina',4,'M','30-APR-2015','Red Wolf',NULL,'AR3003','T0018');
INSERT into Animal values ('AN060','Newton',4,'F','10-MAY-2015','Red Wolf',NULL,'AR3003','T0018');

INSERT into Animal values ('AN061','Idella',2,'F','11-FEB-2017','Coyote',NULL,'AR3004','T0019');
INSERT into Animal values ('AN062','Dalton',2,'F','02-FEB-2017','Coyote',NULL,'AR3004','T0019');

INSERT into Animal values ('AN063','Eliana',9,'M','12-OCT-2010','Mexican Wolf',NULL,'AR3005','T0020');
INSERT into Animal values ('AN064','Loreen',10,'M','25-DEC-2009','Mexican Wolf',NULL,'AR3005','T0020');

INSERT into Animal values ('AN065','Maya',8,'M','28-JUN-2011','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN066','Kenyon',7,'F','29-MAY-2012','American Black Bear',NULL,'AR3006','T0021');

INSERT into Animal values ('AN067','Joandra',4,'M','24-JUN-2015','RIVER OTTER',NULL,'AR3007','T0022');
INSERT into Animal values ('AN068','Hayley',4,'F','04-JUN-2015','RIVER OTTER',NULL,'AR3007','T0022');

--ReptileZone
INSERT into Animal values ('AN069','Marylyn',8,'F','14-OCT-2011','American alligator',NULL,'AR4001','T0023');
INSERT into Animal values ('AN070','Deven',1,'M','14-DEC-2018','American alligator',NULL,'AR4001','T0023');
INSERT into Animal values ('AN071','Cody',1,'F','10-JAN-2018','American alligator',NULL,'AR4001','T0023');

INSERT into Animal values ('AN072','Sera',1,'M','10-JAN-2018','Gharial',NULL,'AR4002','T0024');
INSERT into Animal values ('AN073','Lorrin',1,'F','04-JAN-2018','Gharial',NULL,'AR4002','T0024');

INSERT into Animal values ('AN074','Frances',4,'M','08-AUG-2014','Philippine crocodile',NULL,'AR4003','T0025');
INSERT into Animal values ('AN075','Thorburn',4,'F','09-AUG-2014','Philippine crocodile',NULL,'AR4003','T0025');

INSERT into Animal values ('AN076','Colby',4,'M','12-AUG-2015','Dwarf crocodile',NULL,'AR4004','T0026');
INSERT into Animal values ('AN077','Harding',4,'F','10-MAR-2015','Dwarf crocodile',NULL,'AR4004','T0026');

INSERT into Animal values ('AN078','Leo',8,'M','14-FEB-2011','Hawksbill sea turtle',NULL,'AR4005','T0027');
INSERT into Animal values ('AN079','Danielle',8,'F','08-MAR-2011','Hawksbill sea turtle',NULL,'AR4005','T0027');
INSERT into Animal values ('AN080','Tibby',7,'M','04-SEP-2012','Hawksbill sea turtle',NULL,'AR4005','T0027');
INSERT into Animal values ('AN081','Lyndi',7,'M','12-SEP-2012','Hawksbill sea turtle',NULL,'AR4005','T0027');
INSERT into Animal values ('AN082','Lydia',7,'F','12-SEP-2012','Hawksbill sea turtle',NULL,'AR4005','T0027');

INSERT into Animal values ('AN083','Verity',3,'M','16-AUG-2016','Matamata turtle',NULL,'AR4006','T0028');
INSERT into Animal values ('AN084','Ora',3,'F','24-OCT-2016','Matamata turtle',NULL,'AR4006','T0028');
INSERT into Animal values ('AN085','Hank',3,'F','15-SEP-2016','Matamata turtle',NULL,'AR4006','T0028');

INSERT into Animal values ('AN086','Rosemarie',1,'M','22-SEP-2018','Panther chameleon',NULL,'AR4007','T0029');
INSERT into Animal values ('AN087','Blaze',1,'M','23-NOV-2018','Panther chameleon',NULL,'AR4007','T0029');

INSERT into Animal values ('AN088','Tom',10,'M','25-AUG-2009','Pancake tortoise',NULL,'AR4008','T0030');
INSERT into Animal values ('AN089','Eleanor',1,'F','28-AUG-2018','Pancake tortoise',NULL,'AR4008','T0030');

INSERT into Animal values ('AN090','Kristin',9,'M','10-AUG-2010','Solomon Island skink',NULL,'AR4009','T0031');

INSERT into Animal values ('AN091','Alanis',5,'F','15-NOV-2014','Shingleback skink','flu','AR4010','T0032');
INSERT into Animal values ('AN092','Petra',2,'M','05-DEC-2017','Shingleback skink',NULL,'AR4010','T0032');
INSERT into Animal values ('AN093','Clem',1,'F','15-DEC-2018','Shingleback skink',NULL,'AR4010','T0032');

INSERT into Animal values ('AN094','Chet',4,'F','01-FEB-2015','Water monitor',NULL,'AR4011','T0033');

INSERT into Animal values ('AN095','Hatty',5,'F','01-JAN-2014','Desert Monitor',NULL,'AR4012','T0034');

--AfricaZone from (https://www.edreams.com/blog/animals-in-africa-from-a-to-z/)
INSERT into Animal values ('AN096','Bethany',11,'M','11-OCT-2008','African wild dog',NULL,'AR5001','T0035');
INSERT into Animal values ('AN097','Lynne',11,'F','11-JAN-2008','African wild dog',NULL,'AR5001','T0035');

INSERT into Animal values ('AN098','Lenore',14,'F','12-AUG-2005','Cheetah',NULL,'AR5002','T0036');
INSERT into Animal values ('AN099','Jazmine',14,'M','14-AUG-2005','Cheetah',NULL,'AR5002','T0036');

INSERT into Animal values ('AN100','Elle',6,'F','11-JAN-2013','Desert Warthog','pink eye','AR5003','T0037');
INSERT into Animal values ('AN101','Messiah',5,'M','01-JAN-2014','Desert Warthog',NULL,'AR5003','T0037');

INSERT into Animal values ('AN102','Maynerd',7,'F','05-FEB-2012','Fennec Fox',NULL,'AR5004','T0038');

INSERT into Animal values ('AN103','Bertina',15,'M','30-OCT-2004','Hippo',NULL,'AR5005','T0039');
INSERT into Animal values ('AN104','Franklin',12,'F','28-DEC-2007','Hippo',NULL,'AR5005','T0039');
INSERT into Animal values ('AN105','Arthur',11,'F','28-DEC-2008','Hippo',NULL,'AR5005','T0039');
INSERT into Animal values ('AN106','Leola',4,'F','15-NOV-2015','Hippo',NULL,'AR5005','T0039');

INSERT into Animal values ('AN107','Justice',10,'M','01-MAY-2009','Klipspringer',NULL,'AR5006','T0040');

INSERT into Animal values ('AN108','Orrell',7,'F','29-MAY-2012','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN109','Reynard',7,'M','29-MAY-2012','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN110','Britton',7,'F','29-MAY-2012','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN111','Chad',2,'M','31-JAN-2017','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN112','Shannah',2,'M','31-JAN-2017','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN113','Cherokee',2,'M','31-JAN-2017','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN114','Vanessa',2,'F','31-JAN-2017','American Black Bear',NULL,'AR3006','T0021');
INSERT into Animal values ('AN115','Deitra',2,'M','31-JAN-2017','American Black Bear',NULL,'AR3006','T0021');

INSERT into Animal values ('AN116','Phillida',7,'F','11-FEB-2012','Fennec Fox',NULL,'AR5004','T0038');--
INSERT into Animal values ('AN117','Charlotte',7,'F','11-FEB-2012','Fennec Fox',NULL,'AR5004','T0038');
INSERT into Animal values ('AN118','Daly',4,'M','03-MAY-2015','Fennec Fox',NULL,'AR5004','T0038');
INSERT into Animal values ('AN119','Rodge',2,'M','11-JAN-2017','Fennec Fox',NULL,'AR5004','T0038');
INSERT into Animal values ('AN120','Siena',2,'M','11-JAN-2017','Fennec Fox',NULL,'AR5004','T0038');
INSERT into Animal values ('AN121','Lyn',2,'M','11-JAN-2017','Fennec Fox',NULL,'AR5004','T0038');
INSERT into Animal values ('AN122','Dixie',1,'M','01-OCT-2018','Fennec Fox',NULL,'AR5004','T0038');
INSERT into Animal values ('AN123','Cade',1,'F','01-OCT-2018','Fennec Fox',NULL,'AR5004','T0038');

-- ----------------------- CREATE INDEX -----------------------
--drop
drop index staff_ps_idx;
drop index area_zonename_idx;
drop index idx_animal_type;

create bitmap index staff_ps_idx on staff(position,salary);
create bitmap index area_zonename_idx on AREA(zonename);
create index idx_animal_type on Animal(type);

-- ----------------------- CREATE ROLE -----------------------
-- drop role
drop role role_zoomanager;
drop role role_zoostaff;
drop role role_zoovet;
drop role role_zookeeper;

-- staff role by Ryan
create role role_zoostaff;
grant create session to role_zoostaff;
grant select on staff to role_zoostaff;
grant select on area to role_zoostaff;
grant select on zone to role_zoostaff;

-- vet role by Safe
create role role_zoovet;
grant create session to role_zoovet;
grant select on ANIMAL to role_zoovet;
grant select on TAXONOMY to role_zoovet;
grant select on AREA to role_zoovet;
grant select on ZONE to role_zoovet;
grant update(Symthom) on ANIMAL to role_zoovet;

-- zookeeper role by Nut
create role role_zookeeper;
grant create session to role_zookeeper;
grant select,insert,update,delete on ANIMAL to role_zookeeper;
grant select,insert,update,delete on AREA to role_zookeeper;
grant select,insert,update,delete on zone to role_zookeeper;
grant select,insert,update,delete on TAXONOMY to role_zookeeper;

-- manager	role by Run
create role role_zoomanager;
grant role_zoostaff to role_zoomanager;
grant select, insert, update, delete on staff to role_zoomanager;
grant select, insert, update, delete on TAXONOMY to role_zoomanager;
grant select, insert, update, delete on MANAGEMENT to role_zoomanager;
grant insert, update, delete on ANIMAL to role_zoomanager;
grant insert, update, delete on AREA to role_zoomanager;
grant insert, update, delete on ZONE to role_zoomanager;

-- ----------------------- CREATE USER -----------------------
--drop user
drop user zoostaff001 cascade;
drop user zoostaff002 cascade;
drop user zoostaff003 cascade;
drop user zoostaff004 cascade;
drop user zoostaff005 cascade;
drop user zoostaff006 cascade;
drop user zoomanager001 cascade;

-- staff user by Ryan
create user zoostaff001
identified by staff123;

create user zoostaff002
identified by staff123;

grant role_zoostaff to zoostaff001;
grant role_zoostaff to zoostaff002;

-- vet user by Safe
create user zoostaff003
identified by zoo1234;

create user zoostaff004
identified by zoo1234;

grant role_zoovet to zoostaff003;
grant role_zoovet to zoostaff004;

-- zookeeper user by Nut
create user zoostaff005
identified by zoozoonarukaroinukzoozoo;

create user zoostaff006
identified by zoozoonarukaroinukzoozoo;

grant role_zookeeper to zoostaff005;
grant role_zookeeper to zoostaff006;

-- manager	user by Run
create user zoomanager001
identified by manager1234;

grant role_zoomanager to zoomanager001;

-- ----------------------- SQL STATEMENT -----------------------
--Transaction 1 (Manager) --Use index
set PAGESIZE 100
select position, count(staffid)as "Number of Staff", min(salary) as "Minimum Salary", max(salary) as "Maximum Salary"
from staff group by position
Order by count(staffid);

--Transaction 2 (Manager) --Use index
set PAGESIZE 100
Select a.zoneName,a.areaid ,s.staffid, s.staffName
From Area a join Management m on a.areaId = m.areaId join Staff s on m.staffId = s.staffId
Where a.zoneName = 'WildZone';

--Transaction 3 (Zookeeper)
set PAGESIZE 100
Select ar.zoneName, Count(an.animalid) as "Number of Animal"
From Animal an join Area ar on an.areaId = ar.areaId
Group by ar.zoneName
Having count(an.animalid) > 20;

--Transaction 4 (Zookeeper)
set PAGESIZE 100
Select DISTINCT(an.type), t.taxonomyName, t.Food, t.description
From Taxonomy t join Animal an on t.taxonomyId = an.taxonomyId
Where an.type like 'Gh%';

--Transaction 5 (Vet)
set PAGESIZE 100
select animalid, animalname, symthom from animal 
where symthom is not null;

--Transaction 6 (Info,Center) --Use index
set PAGESIZE 100
Select an.type, ar.areaId, ar.zoneName
from Animal an join Area ar on an.areaId = ar.areaId
where an.type = 'Cheetah';

--Transaction 7 (Vet)
Update Animal
set symthom = 'Fishflu'
where AnimalID = 'AN002';