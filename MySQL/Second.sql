# create database if not exists cars;
use lessondb;
create table cars
(
    id           int not null primary key auto_increment,
    model        varchar(255),
    power        int,
    year         int(4),
    manufacturer varchar(255),
    type         varchar(255),
    volume       int
);
insert into cars (manufacturer, model, power, year, type, volume)
values ('BMW', '530', 250, 2015, 'sedan', 3000),
       ('BMW', 'M320', 250, 2019, 'hatchback', 2000),
       ('BMW', 'X5', 350, 2011, 'SUV', 3500),
       ('Mercedes', 'S500', 350, 2009, 'sedan', 5000),
       ('Mercedes', 'E200', 150, 2016, 'sedan', 1800),
       ('Mercedes', 'GL', 550, 2015, 'SUV', 5500),
       ('Audi', 'A5', 250, 2014, 'universal', 2300),
       ('Audi', 'A1', 80, 2016, 'hatchback', 1100),
       ('Audi', 'Q8', 450, 2019, 'SUV', 4000),
       ('VW', 'B6', 190, 2015, 'universal', 1900),
       ('VW', 'T5', 180, 2016, 'bus', 2500),
       ('VW', 'Tuareg', 280, 2018, 'SUV', 3000);

select *
from cars
where year between 2010 and 2020;

select * from cars
where volume <2000 and power > 100;

select * from cars
where manufacturer = 'BMW' and power > 100 and  volume < 3000;

select count(distinct manufacturer) from cars;

select
     manufacturer
    ,count(manufacturer)
                    from cars
group by manufacturer;

select
    count(id) as count,
    concat(manufacturer,' ', model,' ',volume)
from cars
group by volume
order by volume;


update cars
set type = 'sportcar' where power > 300;

create table if not exists carsManufacturer(
      id int not null primary key auto_increment,
      manufacturer varchar(255)
);

create table if not exists carsModels (
      id           int not null primary key auto_increment,
      model        varchar(255),
      power        int,
      year         int(4),
      type         varchar(255),
      volume       int,
      id_manufacturer int,
      foreign key (id_manufacturer) references carsManufacturer(id)
);

insert into carsManufacturer (manufacturer)
values ('BMW'),
 ('Mercedes'),
 ('Audi'),
 ('Vw');

insert into carsModels(id_manufacturer,model, power, year, type, volume )
values (1,'530', 250, 2015, 'sedan', 3000),
       (1,'M320', 250, 2019, 'hatchback', 2000),
       (1,'X5', 350, 2011, 'SUV', 3500),
       (2,'S500', 350, 2009, 'sedan', 5000),
       (2,'E200', 150, 2016, 'sedan', 1800),
       (2,'GL', 550, 2015, 'SUV', 5500),
       (3,'A5', 250, 2014, 'universal', 2300),
       (3,'A1', 80, 2016, 'hatchback', 1100),
       (3,'Q8', 450, 2019, 'SUV', 4000),
       (4,'B6', 190, 2015, 'universal', 1900),
       (4,'T5', 180, 2016, 'bus', 2500),
       (4,'Tuareg', 280, 2018, 'SUV', 3000);

# create table models_to_Manufacterer (
#     id_model int primary key not null auto_increment
# )
select * from carsManufacturer Manufact
join carsModels cM on Manufact.id = cM.id_manufacturer;

select
manufacturer,
       model,
volume,
       count(cM.id),
       year

from carsManufacturer Manufact
    join carsModels cM on Manufact.id = cM.id_manufacturer
group by manufacturer,volume,year
order by year;

