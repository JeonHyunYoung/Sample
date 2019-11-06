create sequence seq_user;
create sequence seq_notice;

select * from tbl_notice;

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


select * from tbl_qna;
select * from TBL_CLASS;

insert into tbl_class values(100, '자바 마스터');
insert into tbl_class values(200, 'JSP 마스터');
insert into tbl_class values(300, '스프링 웹 프로젝트');

create sequence seq_qna;
create sequence seq_class start with 300 increment by 100;  

create table tbl_class(
  cnum number not null,
  ctitle VARCHAR2(100)
);

alter table tbl_class add constraint pk_class primary key(cnum);

create table tbl_qna
(
num number not null,
title varchar2(100) not null,
content varchar2(1000) not null,
writer varchar2(100) not null,
cnum number not null,
regdate date default sysdate,
viewcnt number default 0,
depth number default 0,
pos number,
replycnt number default 0

);

alter table tbl_qna add constraint pk_qna primary key(num);
alter table tbl_qna add constraint fk_qna foreign key(cnum) references tbl_class(cnum) on delete cascade;

insert into tbl_qna(num, title, content, writer, cnum, pos) values(seq_qna.nextVal, '자바 마스터 강의 질문합니다', 'test', 'jeon', 100, seq_qna.nextVal);
insert into tbl_qna(num, title, content, writer, cnum, pos) values(seq_qna.nextVal, 'JSP 질문이요', 'test', 'young', 200, seq_qna.nextVal);
insert into tbl_qna(num, title, content, writer, cnum, pos) values(seq_qna.nextVal, '스프링 어렵네요. 질문합니다.', 'test', 'hyun', 300, seq_qna.nextVal);
select * from tbl_qna;
commit;
select * from tbl_qna order by pos desc;

create sequence seq_reply;

drop table tbl_reply;

create table tbl_reply
(
	rno number not null,
	num number not null,
	replytext varchar2(1000) not null,
	replyer varchar2(100) not null,
  updatedate date default sysdate
);

alter table tbl_reply add constraint pk_rno primary key(rno);
alter table tbl_reply add constraint fk_reply foreign key(num) references tbl_qna(num) on delete cascade;


