drop database if exists Bakery;
create database Bakery char set utf8;
use Bakery;

CREATE TABLE Постачальники(
        ІД_постачальника int not null primary key auto_increment,
        Назва_фірми varchar(30) not null,
        Телефон integer not null,
        Місто varchar(15),
        Вулиця varchar(20),
        Сайт varchar(30),
        Пошта varchar(30)
);
CREATE TABLE Працівники(
        ІД_працівника int not null primary key auto_increment,
        Прізвище varchar(15) not null,
        Імя varchar(15) not null,
        По_батькові varchar(15) not null,
        Телефон int not null,
        Посада varchar(30),
        Зарплата_за_місяць decimal(8,2) not null,
        Дата_народження date
);
CREATE TABLE Булочна(
        ІД_булочної int not null primary key auto_increment,
        Назва_булочної varchar(15) not null,
        Опис text,
        Пошта varchar(30) not null,
        Телефон int not null, 
        Сайт varchar(30),
        Графік_роботи varchar(30)
);
CREATE TABLE Розташування(
        ІД_булочної int not null,
        Місто varchar(30) not null,
        Район varchar(30) not null,
        Вулиця varchar(30) not null,
        Опис_місцевості varchar(50),
        PRIMARY KEY (ІД_булочної),
        CONSTRAINT Розташування_Булочна FOREIGN KEY (ІД_булочної) REFERENCES Булочна(ІД_булочної)
);
CREATE TABLE Замовлення(
        ІД_замовлення int not null primary key auto_increment,
        ІД_булочної int not null,
        ІД_постачальника int not null,
        ІД_товару int not null,
        Назва_товару varchar(30) not null,
        Кількість int not null,
        Ціна_товару decimal(8,2) not null,
        Сума decimal(8,2) not null,
        Дата_створення_замовлення date not null,
        CONSTRAINT Замовлення_Булочна FOREIGN KEY (ІД_булочної) REFERENCES Булочна (ІД_булочної), 
        CONSTRAINT Замовлен_Постачальн FOREIGN KEY (ІД_постачальника) REFERENCES Постачальники (ІД_постачальника)
);
CREATE TABLE Реєстр_продажів(
        ІД_продажу int not null,
        ІД_булочної int not null,
        ІД_працівника int not null,
        Дата_продажу date not null,
        PRIMARY KEY (ІД_продажу),
        CONSTRAINT Продаж_Булочна FOREIGN KEY (ІД_Булочної) REFERENCES Булочна (ІД_Булочної), 
        CONSTRAINT Продаж_Працівник FOREIGN KEY (ІД_працівника) REFERENCES Працівники (ІД_працівника)
);
CREATE TABLE Товари_в_продажі(
        ІД_продажу int not null,
        ІД_товару int not null,
        Назва_товару varchar(30) not null,
        Кількість int not null,
        PRIMARY KEY (ІД_продажу, ІД_товару),
        CONSTRAINT Товар_Продаж FOREIGN KEY (ІД_продажу) REFERENCES Реєстр_продажів (ІД_продажу) 
);

