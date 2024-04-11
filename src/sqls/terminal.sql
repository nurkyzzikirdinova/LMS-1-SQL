Last login: Thu Apr 11 18:46:49 on ttys000
/Library/PostgreSQL/16/scripts/runpsql.sh; exit
nurkyzzikirdinova@MacBook-Air-Nurkyz ~ % /Library/PostgreSQL/16/scripts/runpsql.sh; exit
Server [localhost]:
Database [postgres]: sql_task
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (16.2)
Type "help" for help.

sql_task=#
sql_task=# create table sweets ( id serial primary key, name_sweet  varchar(50)  not null, composition varchar(255) not null, price  int);
CREATE TABLE
    sql_task=#
    sql_task=# alter table sweets add column country_sweets varchar(50) not null;
ALTER TABLE
    sql_task=# alter table sweets add constraint sw_price check (price > 10);
ALTER TABLE
    sql_task=# insert into sweets(name_sweet, composition, price, country_sweets) values ('macaron', 'egg, sugar, milk, almond flour', 11, 'France'), ('madlen', 'nut, egg, sugar, milk, almond flour, chocolate', 20, 'Italy'),('cake', 'vanilla, egg, sugar, milk, flour', 13, 'Japan');
INSERT 0 3
sql_task=# create table confectioner ( id  serial primary key,  name_confectioner varchar(50) not null, status varchar(50) not null, experience_year   int, creation_id int references sweets (id));
CREATE TABLE
    sql_task=# alter table confectioner rename status to position;
ALTER TABLE
    sql_task=# insert into confectioner(name_confectioner, position, experience_year, creation_id) values ('Ayim Azamatova', 'Macaron', 2, 1), ('Ainaz Salamatova', 'Madlen', 5, 3),('Zarian Salamatova', 'Cake', 3, 2);
INSERT 0 3
sql_task=# create table coffee_house ( id  serial primary key, name_coffee_house varchar, location varchar(50) not null, since int, sweets_id int references sweets (id),confectioner_id   int references confectioner (id));
CREATE TABLE
    sql_task=# alter table coffee_house alter column name_coffee_house set not null;
ALTER TABLE
    sql_task=# alter table coffee_house  add column founder_name varchar not null;
ALTER TABLE
    sql_task=# insert into coffee_house (name_coffee_house, location, since, founder_name, sweets_id, confectioner_id) values ('Mishkoffee', 'Bishkek', 2020, 'Nur Salieva', 1, 1),('Polly', 'Osh', 2012, 'Baitur Saparaliev', 2, 3),('Big coffee', 'Bishkek', 2009, 'Nurislam Sariev', 3, 2);
INSERT 0 3
sql_task=# create table ingredients ( id  serial primary key,  name varchar(50) not null, quantity int  not null );
CREATE TABLE
    sql_task=# alter table ingredients add column expiration_date date;
ALTER TABLE
    sql_task=# insert into ingredients (name, quantity, expiration_date)values ('Sugar', 5, '2024-06-30'), ('Flour', 7, '2024-09-15'), ('Milk', 2, '2024-05-10');
INSERT 0 3
sql_task=# create table coffee ( id serial primary key,  name  varchar(50)   not null, country   varchar(50)   not null, roast_level    varchar(20)   not null,  price decimal(5, 2) not null,ingredients_id int references ingredients (id));
CREATE TABLE
    sql_task=# insert into coffee (name, country, roast_level, price, ingredients_id) values ('Espresso', 'Italy', 'dark', 3.20, 1), ('Americano', 'USA', 'medium', 4.02, 3), ('Latte', 'France', 'light', 8.50, 1);
INSERT 0 3
sql_task=# create table library ( id  serial primary key, name varchar(50)  not null,  location varchar(100) not null);
CREATE TABLE
    sql_task=# alter table library add column established_year int not null;
ALTER TABLE
    sql_task=# insert into library (name, location, established_year) values ('Alykul Osmonov', 'street Aliev 23', 1995), ('City library', 'street Samaganov 321', 2018);
INSERT 0 2
sql_task=# create table books (  id   serial primary key, title  varchar(100) not null, author  varchar(100) not null, genre  varchar(50)  not null,  library_id int references library (id));
CREATE TABLE
    sql_task=# insert into books (title, author, genre, library_id) values ('Rapunzel', 'Fedor', 'Classic', 1),  ('Cinderella', 'Harper Lee', 'Fiction', 1), ('1984', 'George Orwell', 'Dystopian', 2);
INSERT 0 3
sql_task=# create table readers ( id serial primary key, name  varchar(50) not null,  age  int  not null, library_id int references library (id));
CREATE TABLE
    sql_task=# alter table readers add column education varchar not null;
ALTER TABLE
    sql_task=# insert into readers (name, age, library_id, education) values ('Alice', 19, 1, 'Manas'), ('Begai', 21, 2, 'AIU'),('Nur', 20, 1, 'UCA');
INSERT 0 3
sql_task=#
sql_task=# create table administration( id  serial primary key, name varchar(50)  not null, position varchar(100) not null,library_id int references library (id));
CREATE TABLE
    sql_task=# alter table administration add column department varchar(50) not null;
ALTER TABLE
    sql_task=# insert into administration (name, position, department, library_id) values ('Janar Salamatova', 'Book service', 'Stock', 2),('Elima Alieva', 'Media', 'SMM', 1),('Ali Elimov', 'Director', 'operations', 2);
INSERT 0 3
sql_task=#
