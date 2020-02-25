drop database if exists myLibrary;
create database myLibrary char set utf8;
use myLibrary;

create table Books(
	id_book int not null primary key auto_increment,
	title varchar(30) not null,
	description varchar(60),
	price decimal(7,2),
	isbn bigint
);

create table Genres(
	id_book int not null primary key,
	book_genre varchar(30) not null unique,
    constraint BOOK_GENRE_FK foreign key (id_book) references Books(id_book)
);

create table Authors(
	id_author int not null primary key auto_increment,
    f_name varchar(45) not null,
    s_name varchar(45) not null,
    email varchar(50) not null unique,
    address varchar(50),
    date_of_birth date
);

create table Authors_of_books(
	id_book int not null,
	id_author int not null,
    primary key(id_book, id_author),
    constraint A_OF_B_BOOKS_FK foreign key (id_book) references Books(id_book),
    constraint A_OF_B_AUTHOR_FK foreign key (id_author) references Authors(id_author)
);

