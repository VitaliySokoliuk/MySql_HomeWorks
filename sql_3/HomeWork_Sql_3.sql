use Library;

drop table if exists book3;
create table book3(
	id int auto_increment not null primary key,
	title varchar(120) not null,
    description text,
    release_date date not null default '2018-01-01',
    category varchar(30) not null,
    isbn bigint not null unique,
    count_pages smallint unsigned not null,
    price decimal(8,2) not null,
    count_of_books smallint not null,
    f_name varchar(45) not null,
    s_name varchar(45) not null,
    email varchar(50) not null unique,
    age tinyint not null,
    date_of_birth date not null,
    reward varchar(120) default NULL
);


INSERT INTO `book3` (`title`, `description`, `release_date`, `category`, `isbn`, `count_pages`, `price`, `count_of_books`, `f_name`, `s_name`, `email`, `age`, `date_of_birth`, `reward`) 
VALUES ('aut','Et soluta quisquam.','1973-04-22','quis','11010539219714','676','50.21','66','Waylon','Wiza','rosario.bartell@example.net','53','2014-02-03','dolor'),
('itaque','Voluptatem neque.','1996-08-09','qui','14040573453530','773','1212.97','32','Penelope','Tromp','nbraun@example.org','35','2001-01-06','tenetur'),
('et','Odit maiores.','2000-07-20','sit','15724668330512','55','1445.40','26','Kaden','Rolfson','edna59@example.com','23','1973-11-06','ex'),
('omnis','Autem magnam.','1989-12-05','nobis','16340188905596','293','1175.61','6','Derick','Klocko','tiara98@example.com','94','2016-12-25','dolorum'),
('est','Repudiandae sunt.','1988-04-07','veniam','24337484510615','244','119.84','57','Lela','Champlin','ekuvalis@example.com','35','2017-10-24','adipisci'),
('aperiam','Dicta sint qui.','2004-05-25','alias','25787611049599','746','522.84','53','Marlon','Wyman','delta20@example.com','110','1992-09-30','sunt'),
('ullam','Quos sunt.','2011-04-16','eos','31413408839143','494','538.50','47','Maud','Abshire','gusikowski.jules@example.com','31','2013-04-13','dolorum'),
('optio','Enim et eligendi.','2006-05-15','animi','43294140221551','365','1039.31','88','Arjun','Ruecker','clement.grady@example.org','41','2017-11-26','eligendi'),
('magnam','Mollitia et.','1994-05-11','soluta','45392035869881','850','712.46','91','Margarette','Zboncak','gkilback@example.com','98','2008-07-14','dolores'),
('nemo','Dolores corporis.','1986-08-08','accusantium','54842086117714','746','245.00','11','Verona','O\'Hara','keebler.mireya@example.com','81','1996-09-28','facilis'),
('debitis','Illo quo et.','2017-04-29','amet','55478583243675','174','1402.11','67','Lola','Kuvalis','eryn46@example.org','28','1970-11-13','nulla'),
('exercitationem','Facere et deleniti.','1999-10-14','illo','55684683388099','749','245.04','41','Sarah','Kautzer','eleonore.collier@example.org','58','1999-01-16','tempore'),
('ex','Dolorem sint est.','1998-01-08','delectus','57784963562153','727','1236.34','92','Ari','Murphy','hermiston.anderson@example.net','52','2017-08-23','recusandae'),
('voluptas','Quasi corrupti aut.','1991-03-18','suscipit','58570602154359','648','955.29','86','Annamarie','Luettgen','jbrown@example.org','116','1972-08-02','ea'),
('repellendus','Eos quia ut.','2000-02-25','facilis','63131426256150','716','1477.51','98','Stanley','Rolfson','fbernier@example.com','39','1980-09-20','sint'),
('pariatur','Maiores voluptatem quae.','2012-08-03','sit','67790672508999','462','1112.00','3','Destini','Terry','caterina89@example.com','52','1974-08-19','ut'),
('doloribus','Natus maxime et.','1980-02-29','sed','70539102624170','895','1033.00','73','Lorenz','Corwin','beier.mathilde@example.org','39','1996-03-26','dicta'),
('sed','Illum beatae.','1982-07-31','enim','72921085362322','689','1144.34','4','Giovanna','Keebler','lenore04@example.com','112','1994-11-08','veniam'),
('aut','Quia explicabo est.','2016-08-08','quisquam','75037817996926','468','222.17','8','Tommie','Ortiz','edwina08@example.com','33','1974-07-04','deserunt'),
('et','Qui iste repudiandae.','1999-01-22','quas','77364451591856','324','1308.00','75','Simeon','Hayes','xgerlach@example.com','93','2018-09-11','quia'),
('aut','Nesciunt ut non.','1979-04-30','assumenda','79429380293004','263','1177.76','91','Theodora','Lindgren','connelly.dakota@example.com','20','1975-03-22','ab'),
('saepe','Quibusdam laboriosam possimus.','1998-10-13','quod','87564333151094','695','377.80','80','Audie','Mertz','citlalli.jacobs@example.com','110','2012-05-27','minima'),
('quibusdam','Consectetur nostrum et.','1971-05-24','corporis','90837096488103','226','721.21','18','Autumn','Moen','marilie97@example.com','116','1987-02-21','ut'),
('nemo','Non nesciunt.','2017-10-30','fugit','96684111561626','995','665.34','72','Giovanna','Lehner','brown38@example.org','58','1987-11-05','cumque'),
('placeat','Vero eveniet.','1986-01-05','consequuntur','97858234937302','685','960.80','57','Adela','Purdy','mlangosh@example.org','21','1978-07-25','exercitationem'); 

# витягнути всі книжки
select * from book3;

# обновити прізвище автора в 2х книжках
update book3 set s_name = "Default" where id in (1,5);

# підрахувати кількість книжок, в яких автори мають нагороди
select count(*) from book3 where reward != 'NULL';

# вивести інформацію про книжку з найменшою кількістю сторінок
select * from book3 where count_pages = ( select min(count_pages) from book3 );

# вивести максимальну кількість сторінок
select max(count_pages) from book3;

# вивести середню ціну між всіма книжками
select avg(count_pages) from book3;

# порахувати суму книжок за категорією
select category, count(category) as 'сума за категорією' from book3 group by category;

# вивести мінімальну ціну книжки
select min(price) as 'min price' from book3;

# вивести інформацію про книжку з найменшою ціною
select * from book3 where price = ( select min(price) from book3 );

# вивести книжки, де ціна матиме 4 знаки після коми, відсортовано за назвою книги
select id, title, description, release_date, category, count_pages, count_of_books, round(price, 4) as 'price' from book3 order by title;

# вивести книжки за limit (5, 5), (10, 6) та відсортувати за датою публікації.
select * from book3 order by release_date limit 5, 5;
select * from book3 order by release_date limit 10, 6;

# написати 3 запити, використавши різні види пошуку за співпадіннями(like)
select * from book3 where title like 'e%';
select * from book3 where category like '_ui%';
select * from book3 where release_date like '%-05-%';

# вивести книжки де ціна на проміжку: 1. 50-120, 2. не включаючи проміжок 200-600.
select * from book3 where price between 50 and 120;
select * from book3 where price not between 200 and 600 order by price;

# 3 запити на видалення книжки(за id, name, isbn)
set sql_safe_updates = 0;
delete from book3 where id = 25; 
delete from book3 where price > 1400; 
delete from book3 where title = 'nemo';
set sql_safe_updates = 1;






