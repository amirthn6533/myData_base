drop database if exists library_system;
create database library_system;
use library_system;
create table publishers(
publisher_id int auto_increment primary key,
publisher_name varchar(255) not null,
publisher_address varchar(255) not null
);
create table authors(
author_id int auto_increment primary key,
author_name varchar(255) not null,
author_info text
);

create table genres(
genre_id int auto_increment primary key,
genre_name varchar(255) NOT NULL
);
create table books(
book_id int auto_increment primary key,
book_title varchar(255) not null,
book_description text,
publisher_id int,
genre_id int,
foreign key (publisher_id) references publishers(publisher_id),
foreign key (genre_id) references genres(genre_id)
);
create table books_authors(
book_id int,
author_id int,
primary key (book_id, author_id),
foreign key (book_id) references books(book_id),
foreign key (author_id) references authors(author_id)
);
create table roles(
role_id int auto_increment primary key,
role_name varchar(255) not null
);
create table users(
user_id int auto_increment primary key,
user_name varchar(255) not null, 
user_egn varchar(10) not null, 
user_phone varchar (20),
user_pass varchar(255) not null,
user_email varchar(255) not null,
role_id int,
user_role enum('administrator','librarian','student','teacher') not null
);
create table borrowed_books(
borrow_id int auto_increment primary key, 
user_id int,
book_id int,
borrow_date date,
return_date date,
foreign key(user_id) references users(user_id),
foreign key (book_id) references books(book_id)
);



