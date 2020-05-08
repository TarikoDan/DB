# create database if not exists cars;
use lessondb;
create table cars(
    id int not null primary key auto_increment,
    model varchar(255),
    power int,
    year int(4),
    manufacturer varchar(255),
    type varchar(255),
    volume int
);
insert into cars (manufacturer, model, power, year,  type, volume)
    values
('BMW','530',250,2015,'sedan',3000),
('BMW','M320',250,2019,'hatchback',2000),
('BMW','X5',350,2011,'SUV',3500),
('Mercedes','S500',350,2009,'sedan',5000),
('Mercedes','E200',150,2016,'sedan',1800),
('Mercedes','GL',550,2015,'SUV',5500),
('Audi','A5',250,2014,'universal',2300),
('Audi','A1',80,2016,'hatchback',1100),
('Audi','Q8',450,2019,'SUV',4000),
('VW','B6',190,2015,'universal',1900),
('VW','T5',180,2016,'bus',2500),
('VW','Tuareg',280,2018,'SUV',3000);

