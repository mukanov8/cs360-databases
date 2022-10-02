-- MySQL Script generated by MySQL Workbench
-- Sat Oct  9 01:36:53 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP TABLE IF EXISTS EMPLOYEE;
DROP TABLE IF EXISTS COMPANY;
DROP TABLE IF EXISTS ACCOUNT;

CREATE TABLE EMPLOYEE(  
    employee_id int NOT NULL primary key,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    salary int comment  "month",
    company int not null REFERENCES COMPANY(company_id) on delete cascade
) ENGINE = InnoDB;

CREATE TABLE COMPANY(  
    company_id int NOT NULL primary key,
    company_name VARCHAR(20),
    annual_sales double comment "billons of US",
    founding_date DATE
) ENGINE = InnoDB;

CREATE TABLE ACCOUNT(  
    account_id int NOT NULL primary key,
    bank_name VARCHAR(20),
    opening_date DATE,
    owner int not null REFERENCES EMPLOYEE(employee_id) on update cascade
) ENGINE = InnoDB;

ALTER TABLE employee
ADD constraint fk_emp_1
Foreign key (company) references company(company_id) on delete cascade on update cascade;

ALTER TABLE account
ADD constraint fk_acc_1
Foreign key (owner) references employee(employee_id) on delete cascade on update cascade;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

Insert into company values(11335, "Apple", 274.5, "1976-04-01"), 
                            (23594, "AMD", 9.76, "1969-05-01");
Insert into employee values(123, "James", "Martin", 7940, 11335),
                            (137, "Jhon", "Robert", 8480, 11335),
                            (196, "Anya", "Markovitz", 7590, 11335),
                            (319, "James", "Kellar", 10130, 23594),
                            (354, "Ella", "Morris", 5910, 23594);
insert into account values(482123841, "Moris", "2017-12-03", 137), (482158458, "Moris", "2013-04-04", 196), 
			(482150295, "Moris", "2012-04-19", 319), (482198493, "Moris", "2016-01-20", 354),
			(1396482312, "Moris", "2015-02-09" ,137), (1391834859, "Moris", "2017-06-12", 319), 
			(1100823917, "Luis", "2018-05-19", 354), (1100549371, "Luis", "2014-11-29", 123), (1100391039, "Luis", "2015-09-28", 354),
			(853919350, "Luis", "2020-03-23", 196), (853019328, "Luis", "2017-09-22", 123), 
			(853595011, "Luis", "2013-05-04", 354), (853069005, "Luis", "2018-09-17", 319);