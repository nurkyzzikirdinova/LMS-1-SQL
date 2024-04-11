create table countries(
                          id serial primary key,
                          country_name varchar(50) not null,
                          population int,
                          language varchar (50) not null
);
insert into countries(country_name,population, 	language )
values ('Kyrgyzstan', 7000000 , 'kyrgyz'),
       ('Turkey', 22000 , 'turkish'),
       ('USA', 200000000 , 'english'),
       ('Kazakstan', 15000000 , 'kazak');

create table cities (
                        id serial primary key,
                        city_name varchar(50) not null,
                        population int,
                        location_tour varchar not null,
                        city_hall varchar(50) not null,
                        country_id int references countries(id)
);
insert into cities (city_name , population,location_tour, city_hall,country_id)
values ('Bishkek', 2000000, 'Garden park', 'Aibek Zhunushaliev', 1),
       ('Izmir', 80000000, 'Cesme', 'Tunch Soyer', 2),
       ('Chicago', 800000000, 'Millenium park', 'Brandon Johnson', 3),
       ('Astan', 3000000, 'Astana arena', 'Ersin Otebaev', 4);

create table hall(
                     id serial primary key,
                     name_hall varchar not null,
                     age int,
                     education varchar not null,
                     city_id int references cities(id)
);
alter table hall add column date_start date;
insert into hall (name_hall, age,education, city_id, date_start)
values ('Aibek Zhunushaliev', 36, 'AIU', 1, '2023-12-10'),
       ('Brandon Johnson', 45, 'FIU', 3,'2024-01-12'),
       ('Tunch Soyer', 48, 'ITU', 2, '2020-09-13'),
       ('Ersin Otebaev', 57, 'ITU', 4, '2018-08-19');



create table attractions(
                            id serial primary key,
                            name_attractions varchar not null,
                            city_id int references cities(id),
);

alter table attractions add column season varchar;
alter table attractions add column admission varchar;
insert into attractions(name_attractions,city_id, season,admission )
values ('Victory park', 1, 'all', 'free'),
       ('Long park', 3, 'all', 'free'),
       ('Gardenya', 2, 'all', 'paid'),
       ('Lake', 4, 'only summer', 'paid');


create table houses (
                        id serial primary key,
                        address varchar(150),
                        count_rooms int,
                        count_floors int,
                        price int
);
alter table houses alter column address set not null;
insert into houses( address,count_rooms,count_floors,price )
values ('st.Mark, h.23', 6, 1, 400000),
       ('st.Twin, h.12', 9, 2, 700000),
       ('st.Roulin, h.11', 3, 1, 30000),
       ('st.Twin, h.8', 15, 3, 900000),
       ('st.Twin, h.122', 10, 2, 800000);

create table apartament (
                            id serial primary key,
                            address varchar(150),
                            count_rooms int,
                            num_room int,
                            num_floor int,
                            company varchar (100) not null
);
insert into apartament(address,count_rooms,num_room, num_floor, company)
values ('st.Mars, h.22', 2 , 14 , 4 , 'Lalely'),
       ('st.Allin, h.223', 2 , 43 , 12 , 'Almore'),
       ('st.Mars, h.341', 3 , 19 , 8 , 'Lily'),
       ('st.Markin, h.169', 1 , 10 , 3 , 'Pasha');

create table street (
                        id serial primary key,
                        name_st varchar (100) not null,
                        population int,
                        city_id int references cities (id),
                        country_id int references  countries (id)
)
    insert into street (name_st , population,city_id, country_id )
values ('Mars', 20000, 1, 1),
('Allin', 50000, 2, 2),
('Markin', 20000, 4, 4),
('MA', 6000, 3, 3);


create table universities(
                             id serial primary key,
                             name_uni varchar (100) not null,
                             locartion_id int references cities (id),
                             ranking varchar not null
);
insert into universities (name_uni,locartion_id ,ranking )
values ('AIU', 1, 'Times 143'),
       ('ITU', 2, 'Times 149'),
       ('AIM', 3, 'Times 140'),
       ('ANNU', 4, 'Times 148');


create table magazin(
                        id serial primary key,
                        name_magazin varchar (100) not null,
                        since date,
                        editor varchar (100) not null
);
alter table magazin add column journalist varchar (100) not null ;
insert into magazin (name_magazin,since, editor, journalist  )
values ('Super', '2000-2-23', 'Damira Esenalieva', 'Altyn Alkyshev'),
       ('Eldik', '2009-5-24', 'Sezim Sagynova', 'Alina Sapieva'),
       ('Erkin', '2001-9-23', 'Ainaz Alieva', 'Altyn Alkyshev'),
       ('Ulut', '1998-8-12', 'Samar Karimov', 'Ali Samirov');



create table mg_employee(
                            id serial primary key,
                            name_empl varchar (100) not null,
                            status varchar (100) not null,
                            magazin_id int references magazin (id)
);

insert into mg_employee(name_empl, status, magazin_id)
values ('Alina', 'editor', 1),
       ('Damira', 'editor', 3),
       ('Sezim', 'journalist', 2),
       ('Samat', 'journalist', 4);