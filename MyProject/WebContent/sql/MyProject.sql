create table pjmember (
userid varchar2(50) not null primary key,
passwd varchar(64) not null,
name varchar2(50) not null,
email varchar2(50),
phone varchar2(50)
);

create table pjboard (
num number not null primary key,
writer varchar2(50) not null,
subject varchar2(50) not null,
pawd varchar2(60) not null,
reg_date date default sysdate,
readcount number default 0,
ref number not null,
re_step number not null, 
re_level number not null,
content varchar2(4000) not null,
ip varchar2(30) not null,
filename varchar2(200),
filesize number default 0,
down number default 0
);

create table pjboard_comment (
comment_num number not null primary key, --댓글 일련번호 
board_num number not null references pjboard(num), --Foreign Key 
writer2 varchar2(50) not null,
content2 clob not null, --큰내용을 처리할 수 있게 clob을 써본다.
reg_date2 date default sysdate
);

select * from pjmember;

delete from pjboard_comment;

select *from pjboard;

select *from  pjboard_comment;

COMMIT;