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

use springdb;

create table boards(
	id bigint primary key auto_increment,
    boardtitle varchar(100) not null,
    boardwriter varchar(20) not null,
    boardcontent text not null,
    hit int default 0,
    createtime datetime default now(),
    updatedtime datetime
);

select * from boards;