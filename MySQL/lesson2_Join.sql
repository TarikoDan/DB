SET SQL_MODE = '';


CREATE SCHEMA IF NOT EXISTS `bank` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `bank` ;

CREATE TABLE IF NOT EXISTS `bank`.`department` (
  `idDepartment` INT NOT NULL,
  `DepartmentCity` VARCHAR(45) NULL,
  `CountOfWorkers` INT NULL,
  PRIMARY KEY (`idDepartment`));

CREATE TABLE IF NOT EXISTS `bank`.`client` (
  `idClient` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Education` VARCHAR(45) NULL,
  `Passport` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `Age` VARCHAR(45) NULL,
  `Department_idDepartment` INT NOT NULL,
  PRIMARY KEY (`idClient`),
  INDEX `fk_Client_Department_idx` (`Department_idDepartment` ASC),
  CONSTRAINT `fk_Client_Department`
    FOREIGN KEY (`Department_idDepartment`)
    REFERENCES `bank`.`department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `bank`.`application` (
  `idApplication` INT NOT NULL,
  `Sum` INT NULL,
  `CreditState` VARCHAR(45) NULL,
  `Currency` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`idApplication`),
  INDEX `fk_Application_Client1_idx` (`Client_idClient` ASC),
  CONSTRAINT `fk_Application_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `bank`.`client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO `bank`.`department` (`idDepartment`, `DepartmentCity`, `CountOfWorkers`) VALUES ('1', 'Kyiv', '12');
INSERT INTO `bank`.`department` (`idDepartment`, `DepartmentCity`, `CountOfWorkers`) VALUES ('2', 'Lviv', '15');
INSERT INTO `bank`.`department` (`idDepartment`, `DepartmentCity`, `CountOfWorkers`) VALUES ('3', 'Rivne', '8');
INSERT INTO `bank`.`department` (`idDepartment`, `DepartmentCity`, `CountOfWorkers`) VALUES ('4', 'Kyiv', '16');
INSERT INTO `bank`.`department` (`idDepartment`, `DepartmentCity`, `CountOfWorkers`) VALUES ('5', 'Lviv', '10');
#
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('1', 'Roman', 'Beregulak', 'high', 'KC249584', 'Lviv', '25', '2');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('2', 'Mariya', 'Pehnyk', 'high', 'KC350156', 'Stryi', '29', '2');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('3', 'Olena', 'Fedychkanych', 'middle', 'KC850145', 'Krasne', '19', '1');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('4', 'Igor', 'Petriv', 'technic', 'KC853952', 'Kyiv', '21', '4');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('5', 'Volodymyr', 'Gryniv', 'high', 'KC849153', 'Skvyra', '35', '4');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('6', 'Oleg', 'Fedyshyn', 'high', 'KC012412', 'Lviv', '42', '5');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('7', 'Taras', 'Sobko', 'middle', 'KC249504', 'Rivne', '20', '3');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('8', 'Viktor', 'Spas', 'technic', 'KC823412', 'Kyiv', '22', '2');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('9', 'Julia', 'Mokina', 'technic', 'KC908295', 'Kyiv', '21', '1');
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('10', 'Oksana', 'Indusiva', 'high', 'KC723532', 'Sambir', '32', '1');
#
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('1', '4000', 'Returned', 'Dollar', '1');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('2', '5000', 'Not returned', 'Dollar', '4');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('3', '7500', 'Returned', 'Euro', '6');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('4', '3200', 'Not returned', 'Gryvnia', '2');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('5', '3700', 'Returned', 'Gryvnia', '3');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('6', '4100', 'Returned', 'Dollar', '1');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('7', '15100', 'Not returned', 'Gryvnia', '9');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('8', '25600', 'Not returned', 'Dollar', '10');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('9', '12300', 'Not returned', 'Gryvnia', '8');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('10', '9700', 'Returned', 'Dollar', '5');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('11', '9000', 'Not returned', 'Gryvnia', '7');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('12', '8100', 'Not returned', 'Dollar', '3');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('13', '4400', 'Not returned', 'Euro', '8');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('14', '2700', 'Returned', 'Dollar', '10');
INSERT INTO `bank`.`application` (`idApplication`, `Sum`, `CreditState`, `Currency`, `Client_idClient`) VALUES ('15', '6600', 'Not returned', 'Euro', '3');
#
# **************************************************************************************************
# 1. +Вибрати усіх клієнтів, чиє ім'я має менше ніж 6 символів.
select * from bank.client where LENGTH(FirstName) < 6;

# 2. +Вибрати львівські відділення банку.+
select * from bank.department where DepartmentCity like 'lviv';

# 3. +Вибрати клієнтів з вищою освітою та посортувати по прізвищу.
select * from bank.client where Education = 'high' order by LastName;

# 4. +Виконати сортування у зворотньому порядку над таблицею Заявка і вивести 5 останніх елементів.
select * from bank.application order by idApplication desc limit 5 OFFSET 10;

# 5. +Вивести усіх клієнтів, чиє прізвище закінчується на OV чи OVA.
select * from client where LastName like '%iv' or LastName like'%iva';

# 6. +Вивести клієнтів банку, які обслуговуються київськими відділеннями.
select * from bank.client where City = 'Kyiv';

# 7. +Вивести імена клієнтів та їхні номера телефону, погрупувавши їх за іменами.
select FirstName,Passport from bank.client group by FirstName;

# 8. +Вивести дані про клієнтів, які мають кредит більше ніж на 5000 тисяч гривень.
select
client.FirstName,
client.LastName,
application.Sum,
application.Currency
from bank.client
join bank.application on client.idClient = application.Client_idClient
where Sum > 5000 and Currency = 'Gryvnia';

# 9. +Порахувати кількість клієнтів усіх відділень та лише львівських відділень.
select count(idClient)
from client
where City = 'Lviv';

# 10. Знайти кредити, які мають найбільшу суму для кожного клієнта окремо.
select concat(FirstName, ' ', LastName) client, MAX(application.Sum) Sum, Currency, Client_idClient
from application
join client c on application.Client_idClient = c.idClient
group by Client_idClient;

# 11. Визначити кількість заявок на крдеит для кожного клієнта.
select
COUNT(a.idApplication) as count_Operations,
       c.FirstName,
       c.LastName
from client c,
     application a
where c.idClient = a.Client_idClient
group by c.FirstName, c.LastName;

# 12. Визначити найбільший та найменший кредити.
update bank.application
set Sum = 2500
where Sum = 3700 and Currency = 'Gryvnia';

select *
    from (
         select a.Sum,
                c.FirstName,
                c.LastName
         from application a,
              client c
         where c.idClient = a.Client_idClient
         group by a.Sum
         order by a.Sum
         limit 1) min
union all
select *
    from (
         select a.Sum,
                c.FirstName,
                c.LastName
         from application a,
              client c
         where c.idClient = a.Client_idClient
         group by a.Sum
         order by a.Sum desc
         limit 1) max;


# 13. Порахувати кількість кредитів для клієнтів,які мають вищу освіту.
select count(a.idApplication),
       c.FirstName,
       c.LastName,
       c.Education
from client c
         join application a on c.idClient = a.Client_idClient
where Education = 'high'
group by c.FirstName, c.LastName, c.Education;

# 14. Вивести дані про клієнта, в якого середня сума кредитів найвища.
select avg(a.Sum) maxAVG,
       c.FirstName,
       c.LastName
from application a
         join client c on a.Client_idClient = c.idClient
group by c.FirstName, c.LastName
order by maxAVG desc
limit 1;

# 15. Вивести відділення, яке видало в кредити найбільше грошей
select SUM(a.Sum),
       concat(d.DepartmentCity,d.idDepartment)
from department d,
     client c,
     application a
where c.idClient = a.Client_idClient and c.Department_idDepartment = d.idDepartment
group by d.DepartmentCity
order by SUM(a.Sum) desc
limit 1;

# 16. Вивести відділення, яке видало найбільший кредит.
select MAX(a.Sum),
       concat(d.DepartmentCity,d.idDepartment)
from department d,
     client c,
     application a
where c.idClient = a.Client_idClient and c.Department_idDepartment = d.idDepartment
group by d.idDepartment
order by MAX(a.Sum) desc
limit 1;


# /*Знайти львівські відділення, які видали кредитів на загальну суму більше ніж 8000
select SUM(a.Sum),
       concat(d.DepartmentCity,d.idDepartment)
from application a,
     client c,
     department d
where c.idClient = a.Client_idClient and c.Department_idDepartment = d.idDepartment
and d.DepartmentCity = 'Lviv'
group by d.idDepartment
having SUM(a.Sum > 8000)
order by SUM(a.Sum);

# /*Знайти клієнтів, які повністю погасили кредити на суму більше ніж 5000
select a.Sum,
       a.CreditState,
       concat(c.FirstName,' ', c.LastName)
from application a,
     client c
where c.idClient = a.Client_idClient
and a.CreditState = 'Returned'
and a.Sum > 5000
group by a.Sum
order by a.Sum;


# /*Знайти максимальний неповернений кредит.*/
select a.Sum,
       a.CreditState,
       concat(c.FirstName,' ', c.LastName) Client,
       concat(d.DepartmentCity,d.idDepartment) Dep
from application a,
     client c,
     department d
where c.idClient = a.Client_idClient and c.Department_idDepartment = d.idDepartment
  and a.CreditState = 'Not returned'
group by a.Sum
order by a.Sum desc
limit 1;


# /*Знайти клієнта, сума кредиту якого найменша*/
select a.Sum,
       concat(c.FirstName,' ', c.LastName) Client,
       concat(d.DepartmentCity,d.idDepartment) Dep
from application a,
     client c,
     department d
where c.idClient = a.Client_idClient and c.Department_idDepartment = d.idDepartment
group by a.Sum
order by a.Sum
limit 1;


# /*Знайти кредити, сума яких більша за середнє значення усіх кредитів*/
select a.idApplication id, a.Sum
from application a
where Sum > (select avg(a.Sum) from application a)
order by Sum;

# /*Знайти клієнтів, які є з того самого міста, що і клієнт, який взяв найбільшу кількість кредитів
INSERT INTO `bank`.`client` (`idClient`, `FirstName`, `LastName`, `Education`, `Passport`, `City`, `Age`, `Department_idDepartment`) VALUES ('11', 'Taras', 'Vred', 'high', 'KA7233333', 'Sambir', '42', '5');

select c.idClient id ,c.FirstName Name, c.LastName, c.City, sum(a.Sum) Summ
from application a right join client c on a.Client_idClient = c.idClient
where c.City = (select c2.City from client c2
                join application a2 on c2.idClient = a2.Client_idClient
                order by a2.Sum desc
                limit 1)
group by id;


# /*Знайти місто чувака який набрав найбільше кредитів
select c.City , COUNT(a.Sum) Count
from client c
join application a on c.idClient = a.Client_idClient
group by c.idClient
order by Count desc
limit 1;


# 17. Усім клієнтам, які мають вищу освіту, встановити усі їхні кредити у розмірі 6000 грн.
update application a join client c on a.Client_idClient = c.idClient
set Sum = 6000
    where c.Education = 'high';

# 18. Усіх клієнтів київських відділень переселити до Києва.
update client c join department d on c.Department_idDepartment = d.idDepartment
set c.City = 'Kyiv'
where d.DepartmentCity = 'Kyiv';

select concat(c.FirstName, ' ',c.LastName) Name,
       c.City,
       concat(d.DepartmentCity, ' ', d.idDepartment) Department
from client c join department d on c.Department_idDepartment = d.idDepartment;

# 19. Видалити усі кредити, які є повернені.
delete
from application
where CreditState = 'Returned';

# 20. Видалити кредити клієнтів, в яких друга літера прізвища є голосною.
select a.Sum,
       concat(c.FirstName, ' ',c.LastName) Name
from application a join client c on a.Client_idClient = c.idClient
# where substring(c.LastName,2,1) in ('a','e','i','o','u','y');
where c.LastName rlike '^.[aeiouy]';

delete a
FROM application a
         JOIN client c ON a.Client_idClient = c.idClient
WHERE c.LastName RLIKE '^.[aeiouy]';

select a.Sum,
       concat(c.FirstName, ' ',c.LastName) Name
from application a join client c on a.Client_idClient = c.idClient;
