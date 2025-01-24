-- CREATE DATABASE crowdfunding_db;


DROP TABLE IF EXISTS campaign_tb;
DROP TABLE IF EXISTS countries_tb;   
DROP TABLE IF EXISTS contacts_tb;  
DROP TABLE IF EXISTS subcategory_tb;  
DROP TABLE IF EXISTS category_tb; 


CREATE TABLE category_tb (
  "category_id" varchar(10) PRIMARY KEY,
  "category" varchar(255) NOT NULL
);

CREATE TABLE subcategory_tb (
  "subcategory_id" varchar(10) PRIMARY KEY,
  "subcategory" varchar(255) NOT NULL
);

CREATE TABLE contacts_tb (
  "contact_id" int PRIMARY KEY,
  "first_name" varchar(50) NOT NULL,
  "last_name" varchar(50),
  "email" varchar(255) NOT NULL
);

CREATE TABLE countries_tb (
  "country" char(2) PRIMARY KEY,
  "currency" char(3) NOT NULL
);

CREATE TABLE campaign_tb (
  "cf_id" int PRIMARY KEY,
  "contact_id" int,
  "company_name" varchar(255),
  "description" text,
  "goal" float NOT NULL,
  "pledged" float NOT NULL,
  "outcome" varchar(10) NOT NULL,
  "backers_count" int NOT NULL,
  "country" char(2),
  "currency" char(3),
  "launch_date" date NOT NULL,
  "end_date" date NOT NULL,
  "category_id" varchar(10) NOT NULL,
  "subcategory_id" varchar(10) NOT NULL,
  FOREIGN KEY (contact_id) REFERENCES contacts_tb (contact_id),
  FOREIGN KEY (country) REFERENCES countries_tb (country),
  FOREIGN KEY (category_id) REFERENCES category_tb (category_id),
  FOREIGN KEY (subcategory_id) REFERENCES subcategory_tb (subcategory_id)
);

-- COPY category_tb FROM '/category_tb.csv' DELIMITER ',' CSV HEADER;
-- COPY subcategory_tb FROM '/subcategory_tb.csv' DELIMITER ',' CSV HEADER;
-- COPY campaign_tb FROM '/campaign_tb.csv' DELIMITER ',' CSV HEADER;
-- COPY contacts_tb FROM '/contacts_tb.csv' DELIMITER ',' CSV HEADER;
-- COPY countries_tb FROM '/countries_tb.csv' DELIMITER ',' CSV HEADER;
