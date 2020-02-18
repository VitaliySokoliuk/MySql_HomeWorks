use Library;

drop table if exists book2;
create table book2(
	title varchar(120) not null,
    description text,
    release_date date not null default '2018-01-01',
    category varchar(30) not null,
    isbn bigint not null unique,
    count_pages smallint unsigned not null,
    f_name varchar(45) not null,
    s_name varchar(45) not null,
    email varchar(50) not null unique,
    age tinyint not null,
    date_of_birth date not null,
    reward varchar(120) default NULL
);
select * from book2;
insert into book2(title, description, release_date, category, isbn, count_pages, f_name, s_name, email, age, date_of_birth, reward)
values ('title1', 'description1', '2019-12-30', 'category1', 2345789734566, 55, 'f_name1', 's_name1', 'email1@email', 20, '2000-01-16', 'reward1'),
	('title2', 'description2', '2020-10-20', 'category2', 1234567890123, 24, 'f_name2', 's_name2', 'email2@email', 46, '2000-03-06', 'reward2'),
	('title3', 'description3', '2019-09-14', 'category3', 9987654321123, 76, 'f_name3', 's_name3', 'email3@email', 23, '2002-02-06', 'reward3'),
	('title4', 'description4', '2020-11-08', 'category4', 1234567908567, 22, 'f_name4', 's_name4', 'email4@email', 45, '2005-03-06', 'reward4'),
	('title5', 'description5', '2019-03-29', 'category5', 4567643745666, 95, 'f_name5', 's_name5', 'email5@email', 76, '2011-10-06', 'reward5'),
	('title6', 'description6', '2020-07-12', 'category6', 3356573388838, 85, 'f_name6', 's_name6', 'email6@email', 33, '1994-06-06', 'reward6'),
	('title7', 'description7', '2020-01-07', 'category7', 2356467678654, 93, 'f_name7', 's_name7', 'email7@email', 28, '2001-09-06', 'reward7'),
    ('title11', 'description11', '2019-02-28', 'category5', 1132563474767, 525, 'f_name11', 's_name11', 'email11@email', 33, '1983-05-10', 'reward11'),
	('title12', 'description12', '2020-12-24', 'category2', 5467583677561, 224, 'f_name12', 's_name12', 'email12@email', 46, '1985-03-09', 'reward12');

insert into book2(title, description, category, isbn, count_pages, f_name, s_name, email, age, date_of_birth)
values ('title8', 'description8', 'category8', 3256123498376, 46, 'f_name8', 's_name8', 'email8@email', 54, '1986-01-28'),
	('title9', 'description9', 'category9', 7476412345876, 78, 'f_name9', 's_name9', 'email9@email', 27, '2002-07-01'),
	('title10', 'description10', 'category10', 2345356345667, 67, 'f_name10', 's_name10', 'email10@email', 19, '2006-10-21');

#витягнути всі книги
select * from book2;

#витягнути всі книги де кількість сторінок більше 50
select * from book2 where count_pages > 50;

#витягнути книги, де автори старше 30 років
select * from book2 where age > 30;

#витягнути книги, в яких автори не мають нагород
select * from book2 where reward is NULL;

#витягнути книгу по email автора
select * from book2 where email = 'email1@email';

#витягнути книгу по isbn
select * from book2 where isbn = 1234567890123;

#витягнути всіх вниги які належать до певної категорії
select * from book2 where category = 'category5';

#витягнути книги в яких кількість сторінок більше 200 та вік автора більше 25
select * from book2 where count_pages > 200 AND age > 25;

#витягнути книги, в яких категорія "комедія" або "драма"(назви категорії можете змінити)
select * from book2 where category = 'category5' OR category = 'category2';

#витягнути книги та посортувати за назвою
select * from book2 order by title;

#витягнути книги та посортувати за email автора
select * from book2 order by email;

#витягнути книги та посортувати за кількістю сторінок(проти алфавіту)
select * from book2 order by count_pages desc;

#витягнути унікальні значення категорій
select distinct category from book2;

#витягнути унікальні імена авторів
select distinct f_name from book2;

#витягнути книги які було написано після '2019-01-01'
select * from book2 where release_date > '2019-01-01' order by release_date;

#витягнути книги які було написано до '2010-01-01'
select * from book2 where release_date < '2019-01-01' order by release_date;

