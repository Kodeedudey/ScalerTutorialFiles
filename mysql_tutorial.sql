/*Create Database */
create database first_demo;

/*Use Database */
use first_demo;

/*Drop Database */
drop database test_2;

/*Create Tables */
CREATE TABLE `offices` (
  `officeCode` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `country` varchar(50) NOT NULL,
  `postalCode` varchar(15) NOT NULL,
  `territory` varchar(10) NOT NULL,
  PRIMARY KEY (`officeCode`)
);

CREATE TABLE `employees` (
  `employeeNumber` int(11) NOT NULL,
  `lastName` varchar(50) NOT NULL,
  `firstName` varchar(50) NOT NULL,
  `extension` varchar(10) NOT NULL,
  `email` varchar(100) NOT NULL,
  `officeCode` varchar(10) NOT NULL,
  `reportsTo` int(11) DEFAULT NULL,
  `jobTitle` varchar(50) NOT NULL,
  PRIMARY KEY (`employeeNumber`),
  CONSTRAINT `employees_ibfk_2` FOREIGN KEY (`officeCode`) REFERENCES `offices` (`officeCode`)
) ;

/*Show Tables */
show tables;

/*Drop Tables */
drop table employees;

/*Truncate Tables */
truncate table offices;




/*Insert Data in `employees` */

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1001,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President');

insert  into `employees`(`employeeNumber`,`lastName`,`firstName`,`extension`,`email`,`officeCode`,`reportsTo`,`jobTitle`) values 
(1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com','1',NULL,'President'),
(1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com','1',1002,'VP Sales'),
(1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com','1',1002,'VP Marketing'),
(1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com','6',1056,'Sales Manager (APAC)'),
(1102,'Bondur','Gerard','x5408','gbondur@classicmodelcars.com','4',1056,'Sale Manager (EMEA)'),
(1143,'Bow','Anthony','x5428','abow@classicmodelcars.com','1',1056,'Sales Manager (NA)'),
(1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com','1',1143,'Sales Rep'),
(1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com','1',1143,'Sales Rep'),
(1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com','2',1143,'Sales Rep'),
(1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com','2',1143,'Sales Rep'),
(1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com','3',1143,'Sales Rep'),
(1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com','3',1143,'Sales Rep'),
(1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com','4',1102,'Sales Rep'),
(1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com','4',1102,'Sales Rep'),
(1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com','4',1102,'Sales Rep'),
(1501,'Bott','Larry','x2311','lbott@classicmodelcars.com','7',1102,'Sales Rep'),
(1504,'Jones','Barry','x102','bjones@classicmodelcars.com','7',1102,'Sales Rep'),
(1611,'Fixter','Andy','x101','afixter@classicmodelcars.com','6',1088,'Sales Rep'),
(1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com','6',1088,'Sales Rep'),
(1619,'King','Tom','x103','tking@classicmodelcars.com','6',1088,'Sales Rep'),
(1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com','5',1056,'Sales Rep'),
(1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com','5',1621,'Sales Rep'),
(1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com','4',1102,'Sales Rep');





/*Insert Data in `offices` */

insert  into `offices`(`officeCode`,`city`,`phone`,`addressLine1`,`addressLine2`,`state`,`country`,`postalCode`,`territory`) values 
('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA'),
('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA'),
('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA'),
('4','Paris','+33 14 723 4404','43 Rue Jouffroy D\'abbans',NULL,NULL,'France','75017','EMEA'),
('5','Tokyo','+81 33 224 5000','4-1 Kioicho',NULL,'Chiyoda-Ku','Japan','102-8578','Japan'),
('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2',NULL,'Australia','NSW 2010','APAC'),
('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7',NULL,'UK','EC2N 1HN','EMEA');

/*Alter Table - Add new column, modify existing column */
alter table offices modify addressLine1 varchar(100);

alter table offices add col1 varchar(50);

show create table offices;

/*Select Command - All column, few columns, column alias, Distinct, Limit*/
select * from offices;

select * from offices limit 3;

select officeCode, city from offices limit 3;

select officeCode, 
       city,
	   postalCode as zipCode
from offices limit 3;

select distinct country as distinct_countries from offices;

/*Select Command with inbuilt functions - count, min, max */
select * from employees;

select count(*) as total_rows,
       min(employeeNumber) as min_emp_num,
       max(employeeNumber) as max_emp_num
from employees;

/*Order By Clause */
select * from employees order by officeCode;

select * from employees order by officeCode desc;

select * from employees order by country, salary desc;

/* Where Clause - AND, OR, Like, IN, IS NULL, IS NOT NULL */
select * from employees where reportsTo=1102;

select * from employees where officeCode='1' and jobTitle='VP Sales';

select * from employees where officeCode='1' or jobTitle='Sales Rep';

select * from employees where jobTitle like 'Sales%';
select * from employees where firstName like '____';

select * from employees where officeCode in ('1','6');

select * from offices;

select * from offices where state is null;

select * from offices where state is not null;

/*Update Command */
set sql_safe_updates = 0;
update employees set jobTitle = 'Sales Representative' where jobTitle = 'Sales Rep';

select * from employees;

/*Delete Command */
delete from employees where officeCode='1';

select * from employees;

select * from employees;

/*Group By */
select officeCode,
       count(*) as employees_in_each_office
from employees
group by officeCode;

select reportsTo,
	   officeCode,
       count(*) as employees_in_each_office
from employees
group by reportsTo,officeCode;

/*Group By with Having */

select officeCode,
       count(*) as employees_in_each_office
from employees
group by officeCode having count(*)>=3;

/* Joins - Inner, Left, Right */

select * from employees;

select * from offices;

select 
emp.*,
ofc.*
from employees emp
inner join offices ofc on emp.officeCode=ofc.officeCode;

select 
emp.*,
ofc.*
from employees emp
right join offices ofc on emp.officeCode=ofc.officeCode;