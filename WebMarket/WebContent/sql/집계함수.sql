select * from board;

insert into board(id,name,subject,content,regist_day,hit,ip)
values('kim','김길동','테스트2','테스트2내용','20190405',0,'192.168.10.47');

select num,id,name,subject,content,regist_day,hit,ip from board;

select * from board;

insert into board(id,name,subject,content)
values('kang','강길동','테스트2','테스트2내용');

insert into board(id,name,subject)
values('kang','강길동','테스트2');

--집계함수
select * from board;

select count(num) from board;
select count(id) from board;
select count(regist_day) from board;
--행전체 칼럼의 개수
select count(*) from board;
select max(num) from board;
select sum(num) from board;


