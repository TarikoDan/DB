#Создать базу данных.
#Создать таблицу Клиент с полями id, name, surname, age, email, phone, sex.
create database if not exists test;
drop database test;
use lessondb;
create table users (
                       id int primary key  auto_increment,
                       name varchar(255) not null ,
                       surname varchar(255),
                       age int,
                       email varchar(255) unique ,
                       phone varchar(255),
                       sex varchar(255) default 'male'
);
insert into users (id,name, surname, age, email, phone)
    value (
           1,'Vova', 'Bilyck', 32, 'v@f.ua', '0955478541'
    );
insert into users (name, surname, age, email, phone, sex)
values
('Vania', 'Suilyck', 15, 'van@f.ua', '0955475551','male'),
(  'Sopnia', 'Mys', 77, 'vsan@f.ua', '0955475551','female'),
('Lilia', 'Tuz', 25, 'van@gmail.ua', '05151','female'),
( 'Nazar', '', 35, 'naz@gmail.ua', '51561941','male'),
('Max', null, 35, 'max@gmail.ua', '51191','male'),
('Taras', 'Pipi', 44, 'tar@f.ua', '365161','male'),
('Sergij', 'Noi', 16, 'ser@f.ua', '54154111','male'),
('Michael', 'Zen', 14, 'mi@f.ua', '51181','male'),
('Vania', 'Choi', 10, 'cho@f.ua', '84118','female');
select * from users where surname is null;
update  users
set surname = 'doe2' where surname = '' ;
select * from users;
select * from users where sex = 'male';
select * from users where age > 18 order by  age desc;
select * from users where age > 18 and age < 60 order by  age desc;
select * from users where sex = 'male' and age between 18 and 60 order by  age desc;
select * from users where sex = 'female' and age <60 order by  age desc;
select * from users where id between 3 and  15 order by  age ;
select * from users where email like '%@gmail.ua';



