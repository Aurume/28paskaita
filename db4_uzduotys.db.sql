BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "customer" (
	"id"	INTEGER NOT NULL UNIQUE,
	"f_name"	TEXT,
	"l_name"	TEXT,
	"email"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "status" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product" (
	"id"	INTEGER NOT NULL UNIQUE,
	"name"	TEXT,
	"price"	REAL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product_order" (
	"order_id"	INTEGER NOT NULL UNIQUE,
	"product_id"	INTEGER,
	"quantity"	INTEGER,
	PRIMARY KEY("order_id" AUTOINCREMENT),
	FOREIGN KEY("order_id") REFERENCES "order_"("id")
);
CREATE TABLE IF NOT EXISTS "order_" (
	"id"	INTEGER NOT NULL UNIQUE,
	"customer_id"	INTEGER,
	"date_"	TEXT,
	"status_id"	INTEGER,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("id") REFERENCES "product_order"("order_id")
);
INSERT INTO "customer" VALUES (1,'Ona','Onaitė','one@gmail.com');
INSERT INTO "customer" VALUES (2,'Jonas','Jonaitis','jonis@gmail.com');
INSERT INTO "customer" VALUES (3,'Jurga','Jurgytė','jurge@gmail.com');
INSERT INTO "customer" VALUES (4,'Ilona','Varnauskė','iva@gmail.com');
INSERT INTO "customer" VALUES (5,'Jokūbas','Bernauskas','jober@gmail.com');
INSERT INTO "status" VALUES (1,'patvirtintas');
INSERT INTO "status" VALUES (2,'vykdomas');
INSERT INTO "status" VALUES (3,'įvykdytas');
INSERT INTO "status" VALUES (4,'atmestas');
INSERT INTO "product" VALUES (1,'Stalas',180.0);
INSERT INTO "product" VALUES (2,'Kėdė',50.0);
INSERT INTO "product" VALUES (3,'Lempa',120.0);
INSERT INTO "product" VALUES (4,'Kompiuteris',820.0);
INSERT INTO "product" VALUES (5,'Ausinės',220.0);
INSERT INTO "product" VALUES (6,'Tušinukas',2.0);
INSERT INTO "product" VALUES (7,'Kalendorius',12.0);
INSERT INTO "product_order" VALUES (1,1,2);
INSERT INTO "product_order" VALUES (2,2,3);
INSERT INTO "product_order" VALUES (3,3,1);
INSERT INTO "product_order" VALUES (4,4,4);
INSERT INTO "product_order" VALUES (5,5,5);
INSERT INTO "order_" VALUES (1,2,'2020-02-20',2);
INSERT INTO "order_" VALUES (2,3,'2010-02-20',1);
INSERT INTO "order_" VALUES (3,4,'2019-02-20',4);
INSERT INTO "order_" VALUES (4,5,'2019-02-20',3);
INSERT INTO "order_" VALUES (5,1,'2019-02-20',3);
COMMIT;
