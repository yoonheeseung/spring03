/* board56.sql */
drop table board56;

create table board56(
no int primary key,
name varchar2(30) not null,
title varchar2(200) not null,
pass varchar2(30) not null,
cont varchar2(4000),
hit int default 0,
regdate date
);

create sequence board56_no_seq
increment by 1 start with 1 nocache;

select * from board56 order by no desc;

int no;
String name;
String title;
String pass;
int hit;
String regdate;