drop database if exists Bakery;
create database Bakery char set utf8;
use Bakery;

CREATE TABLE Suppliers(
        id_supplier int not null primary key auto_increment,
        company_name varchar(30) not null,
        telephone integer not null,
        site varchar(30),
        mail varchar(30)
);
CREATE TABLE Employees(
        id_employee int not null primary key auto_increment,
        firt_name varchar(15) not null,
        second_name varchar(15) not null,
        telephone bigint not null,
        mail varchar(30),
        salary decimal(8,2) not null,
        birth_date date
);
CREATE TABLE Bakehouse(
        id_bakehouse int not null primary key auto_increment,
        bakehouse_name varchar(15) not null,
        description text,
        mail varchar(30) not null,
        telephone int not null, 
        site varchar(30)
);
CREATE TABLE Location(
        id_bakehouse int not null,
        sity varchar(30) not null,
        district varchar(30) not null,
        street varchar(30) not null,
        description text,
        PRIMARY KEY (id_bakehouse),
        CONSTRAINT Location_Bakehouse_FK FOREIGN KEY (id_bakehouse) REFERENCES Bakehouse(id_bakehouse)
);
CREATE TABLE Orders(
        id_orders int not null primary key auto_increment,
        id_bakehouse int not null,
        id_supplier int not null,
        product_name varchar(30) not null,
        count int not null,
        price decimal(8,2) not null,
        sum decimal(8,2) not null,
        date_of_create date not null,
        CONSTRAINT Orders_Bakehouse_FK FOREIGN KEY (id_bakehouse) REFERENCES Bakehouse(id_bakehouse), 
        CONSTRAINT Orders_Suppliers_FK FOREIGN KEY (id_supplier) REFERENCES Suppliers(id_supplier)
);
CREATE TABLE Sales_registers(
        id_sale int not null auto_increment,
        id_bakehouse int not null,
        id_employee int not null,
        date_sale date not null,
        PRIMARY KEY (id_sale),
        CONSTRAINT Sale_Bakehouse_FK FOREIGN KEY (id_bakehouse) REFERENCES Bakehouse(id_bakehouse), 
        CONSTRAINT Sale_Employees_FK FOREIGN KEY (id_employee) REFERENCES Employees(id_employee)
);
CREATE TABLE Goods_in_sales(
        id_sale int not null,
        product_name varchar(30) not null,
        count int not null,
        price decimal(8,2) not null,
        PRIMARY KEY (id_sale, product_name),
        CONSTRAINT Goods_in_sales_Sales_registers_FK FOREIGN KEY (id_sale) REFERENCES Sales_registers(id_sale) 
);

insert into Suppliers (company_name, telephone, site, mail) values
	('super company', 682350914, 'qwerty.com', 'email@mail.com'),
	('mega company', 987552901, 'site.com', 'em@gmail.com'),
	('company HTC', 918375420, 'company.com', 'post@ukr.net');
    
insert into Employees (firt_name, second_name, telephone, mail, salary, birth_date) values
	('Vasyl', 'Sokol', 987448111, null, 12000, '2000-10-16'),
	('Ivan', 'Yasnuy', 9876521224, 'emzzz@gmail.com', 10000, '1995-12-15'),
	('Petro', 'Alexandor', 945732190, 'emailler@ukr.net', 10000, null),
	('Nastya', 'Marinech', 683754343, null, 14000, '2001-01-16'),
	('Ira', 'Myk', 958301001, 'newpost@gmail.com', 12500, '2003-03-01');
    
insert into Bakehouse (bakehouse_name, description, mail, telephone, site) values
	('top bakery', 'additional description', 'bakery@gmail.com', 983001098, 'sitezzz.com'),
	('mini bakery', null, 'mini@gmail.com', 982368498, 'minibakery.com');

insert into Location (id_bakehouse, sity, district, street, description) values
	(1, 'Lviv', 'Galutskyu', 'nova', null),
	(2, 'Lviv', 'frankivskuy', 'shevchenka', 'near McDonalds');

insert into Orders (id_bakehouse, id_supplier, product_name, count, price, sum, date_of_create) values
	(1, 1, 'bride', 5, 10, 50, '2019-05-20'),
	(1, 1, 'loaf', 3, 15, 45, '2019-06-18'),
	(1, 2, 'bride', 10, 10, 100, '2019-09-01'),
	(1, 2, 'bread', 6, 20, 120, '2020-01-23'),
	(2, 2, 'loaf', 2, 15, 30, '2020-04-07'),
	(2, 3, 'bride', 1, 10, 10, '2020-05-13'),
	(2, 3, 'bread', 15, 20, 300, '2020-08-20');

insert into Sales_registers (id_bakehouse, id_employee, date_sale) values
	(1, 1, '2019-01-23'),
	(1, 2, '2019-06-12'),
	(1, 3, '2020-01-09'),
	(2, 4, '2020-03-03'),
	(2, 5, '2020-03-30'),
	(2, 4, '2020-05-15'),
	(1, 2, '2020-06-27');
 
insert into Goods_in_sales (id_sale, product_name, count, price) values
	(1, 'bread', 2, 25),
	(1, 'loaf', 1, 20),
	(2, 'bread', 3, 25),
	(3, 'loaf', 2, 20),
	(3, 'bride', 5, 15),
	(4, 'loaf', 1, 20),
	(4, 'bride', 6, 15),
	(4, 'bread', 2, 25),
	(5, 'bread', 1, 25),
	(6, 'bride', 2, 15),
	(7, 'loaf', 1, 20),
	(7, 'bread', 2, 25),
	(7, 'bride', 3, 15);

select * from employees e
join sales_registers sr
on e.id_employee = sr.id_employee
where e.id_employee < 4
order by e.id_employee desc;

select s.company_name, o.product_name, b.bakehouse_name, l.sity, l.district, l.street 
from suppliers s
join orders o
on s.id_supplier = o.id_supplier
join bakehouse b
on o.id_bakehouse = b.id_bakehouse
join location l 
on b.id_bakehouse = l.id_bakehouse;





