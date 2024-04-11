create database sql_task;
--Table 1
create table flower_market
(
    id              serial primary key,
    market_name     varchar(20)  not null,
    location        varchar(100) not null,
    flower_id       int references flowers (id),
    foundation_year int,
    florist_id      int references florists (id),
    founder_name    varchar
);

alter table flower_market
drop column foundation_year;

insert into flower_market (market_name, location, flower_id, florist_id, founder_name)
values ('flowerbar', 'Bishkek', 3, 5, 'Sezim Alieva'),
       ('flowerbar', 'Bishkek', 2, 7, 'Sapar Sagynov'),
       ('flowerbar', 'Bishkek', 4, 6, 'Nur Akylova'),
       ('flowerbar', 'Bishkek', 1, 4, 'Samira Arnisova');


--Table 2
create table flowers
(
    id          serial primary key,
    flower_name varchar(20),
    age         int,
    color       varchar
);
alter table flowers
    alter column flower_name set not null;
alter table flowers
    alter column color set not null;
alter table flowers
drop age;
alter table flowers
    add column date_planted date;
alter table flowers
    add column price int check ( price > 1);

insert into flowers (flower_name, color, date_planted, price)
values ('Lily', 'white', '2023-12-2', 100),
       ('Rose', 'red', '2022-2-13', 150),
       ('Pion', 'pink', '2019-3-31', 500),
       ('Papa†ya', 'yellow', '2020-2-15', 200);


--Table 3
create table florists
(
    id           serial primary key,
    florist_name varchar(50),
    age          int check (age >= 18),
    flower_id    int references flowers (id)
);
alter table florists
    add column experience_year int check ( experience_year >= 2 );
alter table florists
    alter florist_name set not null;


insert into florists (florist_name, age, flower_id, experience_year)
values ('Zhamal', 20, 1, 3),
       ('Aizuu', 25, 2, 5),
       ('Azamat', 30, 3, 6),
       ('Sezim', 22, 4, 2);

--Table 4
create table owner_fw
(
    id            serial primary key,
    founder_name  varchar(50) not null,
    date_of_birth timestamp,
    company_name  varchar     not null
);

insert into owner_fw(founder_name, date_of_birth, company_name)
values ('Nurkyz', '2004-07-04', 'nz-flower'),
       ('Nuriza', '2000-06-13', 'FlowerBar'),
       ('Nargiza', '2001-12-21', 'SAF'),
       ('Nisa', '2002-01-08', 'Opinoion_flower');


--Table 5
create table humans
(
    id           serial primary key,
    name_human   varchar,
    status_human varchar(50) not null
);
alter table humans
    alter name_human set not null;
insert into humans(name_human, status_human)
values ('Ali', 'customer'),
       ('Samat', 'verndor'),
       ('Ermek', 'customer'),
       ('Aiza', 'florist'),
       ('Aiana', 'startaper');


--Table 6
create table companies
(
    id              serial primary key,
    name_of_company varchar,
    since           int,
    owner_id        int references owner_fw (id)
);

alter table companies
    alter name_of_company set not null;
insert into companies(name_of_company, since, owner_id)
values ('nz_flower', 2024, 1),
       ('FlowerBar', 2023, 2),
       ('SAF', 2020, 3),
       ('Opinoion_flower', 2019, 4);


--Table 7

create table employees
(
    id            serial primary key,
    name_employee varchar(50) not null,
    age           int,
    position      varchar     not null,
    company_id    int references companies (id)
);
alter table employees
    rename position to position_emp;
insert into employees(name_employee, age, position_emp, company_id)
values ('Demir', 19, 'ptotection', 1),
       ('Selim', 23, 'manager', 3),
       ('Elmir', 21, 'smm', 4);


--Table 8
create table tech_markets
(
    id                serial primary key,
    name_tech_markets varchar not null,
    since             int,
    owmer_id          int references owner_fw (id),
    humans_id         int references humans (id)
);

insert into tech_markets(name_tech_markets, since, owmer_id, humans_id)
values ('Tech_house', 2005, 3, 1),
       ('Enter', 2019, 2, 3),
       ('Technik', 2003, 1, 4),
       ('Eldik_technik', 2010, 4, 2);

--Table 9
create table laptops
(
    id             serial primary key,
    brand          varchar not null,
    model          varchar not null,
    tech_market_id int references tech_markets (id)
);

insert into laptops (brand, model, tech_market_id)
values ('Apple', 'Mac Air 2022', 1),
       ('Samsumg', 'AISam', 3),
       ('HP', '360', 2),
       ('ElG', 'Colorit', 4);

--Table 10
create table phones
(
    id             serial primary key,
    brand          varchar not null,
    model          varchar not null,
    price          int,
    tech_market_id int references tech_markets (id)

);
alter table phones
    add constraint check_price check (price > 150);

insert into phones(brand, model, price, tech_market_id)
values ('Apple', 'Iphone 13', 600, 2),
       ('Apple', 'Iphone 14', 700, 1),
       ('Mi', 'RedMi 9 Note', 350, 3),
       ('Apple', 'Iphone 11', 500, 4);

--Table 11
create table accessories
(
    id         serial primary key,
    brand      varchar not null,
    model_name varchar not null,
    price      int,
    made_in    varchar not null
);
insert into accessories(brand, model_name, price, made_in)
values ('Shine', 'aux 12 S', 2, 'China'),
       ('Carmen', 'airPods', 3, 'Vietnam'),
       ('Marc', 'charger 20WT', 2, 'Indonesia'),
       ('Samir', 'display', 4, 'Singapore'),
       ('Cen', 'charger 40WT', 5, 'USA'),
       ('Sun', 'usb d2', 2, 'China');
