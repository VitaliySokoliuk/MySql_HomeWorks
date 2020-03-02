drop database if exists myLibrary;
create database myLibrary char set utf8;
use myLibrary;

create table Genres(
	id_genre int not null primary key auto_increment,
	book_genre varchar(30) not null unique
);

create table Books(
	id_book int not null primary key auto_increment,
    id_genre int not null,
	title varchar(30) not null,
	description varchar(60),
	price decimal(7,2),
	isbn bigint,
    constraint BOOK_GENRE_FK foreign key (id_genre) references Genres(id_genre)
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

insert into Genres(book_genre)
values ('documentary'),
		('technical');

insert into Books (id_genre, title, description, price, isbn)
values (1, 'Traces on rhe road', 'book about war', 325.50, 4371489675091),
		(2, 'Basic knowledge of Java', 'This book help you in learning Java', 550, 4377681920341),
		(2, 'Diagrams', null, 270, 4371489202894);

insert into Authors(f_name, s_name, email, address, date_of_birth)
values ('Valeriy', 'Ananev', 'email@gmail.com', 'Lviv', '1990-03-23'),
		('Andrii', 'Andrew', 'anotheremail@ukr.net', null, '2000-02-09'),
		('Vasya', 'Vasyliv', 'eachone@ukr.net', null, '2001-12-15'),
		('Yuriy', 'Mander', 'email214365@gmail.com', 'Kyiv', '1999-10-30');

insert into Authors_of_books(id_book, id_author)
values (1, 1),
		(2, 2),
		(2, 3),
		(3, 2),
		(3, 4);

select b.title, g.book_genre, a.f_name, a.s_name
from genres as g join books as b
on g.id_genre = b.id_genre 
join authors_of_books as ab
on b.id_book = ab.id_book 
join authors as a
on ab.id_author = a.id_author
order by a.f_name;



