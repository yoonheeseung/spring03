/* guest78.sql */

create table guest78(
 no int primary key,
 name varchar2(30) not null,
 title varchar2(200) not null,
 pass varchar2(30) not null,
 cont varchar2(4000) not null,
 hit int default 0,
 ref int, 
 step int, 
 level2 int,
 regdate date 
);

create sequence guest78_no_seq
increment by 1 start with 1 nocache;

select * from guest78 order by no desc;

delete guest78;
