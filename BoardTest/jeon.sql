drop table tbl_user;
drop table tbl_notice;

create sequence seq_user;
create sequence seq_notice;

create table tbl_user
(
  num number not null,
  id varchar2(30) not null,
  pw varchar2(30) not null,
  auth number(1) not null
);
alter table tbl_user add CONSTRAINT pk_user primary key(num);

create table tbl_notice
(
  num number not null,
  title varchar2(50) not null,
  content varchar2(1000) not null,
  writer varchar2(30) not null,
  filename varchar2(300),
  regdate date DEFAULT sysdate,
  viewcnt number default 0
);

alter table tbl_notice add CONSTRAINT pk_notice primary key(num);

insert into TBL_USER(num, id, pw, auth) values(seq_user.nextVal, 'jeon', '1111', '1');

select * from tbl_user;
select * from tbl_notice;

commit;