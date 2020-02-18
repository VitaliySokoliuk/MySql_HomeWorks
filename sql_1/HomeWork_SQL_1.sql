create database Library;
use Library;

create table Book(
	title varchar(120) not null, 
    description varchar(100) default 'Опис відсутній',
    release_date date not null default "2018-01-00",
    author varchar(60) not null, 
    category varchar(30) not null
);

insert into Book (title, description, release_date, author, category)
values ("title1", "description1", "2020-02-10", "author1", "category1"),
	("title2", "description2", "2020-02-11", "author2", "category2"),
	("title3", "description3", "2020-02-12", "author3", "category3"),
	("title4", "description4", "2020-02-13", "author4", "category4"),
	("title5", "description5", "2020-02-14", "author5", "category5");

insert into Book (title, author, category)
values ("title6","author6", "category6"),
	("title7","author7", "category7"),
	("title8","author8", "category8"),
	("title9","author9", "category9"),
	("title10","author10", "category10");
    
select * from Book
