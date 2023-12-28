create database springdb;

use springdb;

create table users(
	id bigint primary key auto_increment,
    userid varchar(20) unique,
    userpasswd varchar(20) not null,
    username varchar(30) not null,
    userage int
);

drop table if exists users;