create table board(
num int not null auto_increment,
id varchar(10) not null,
name varchar(10) not null,
subject varchar(100) not null,
content text not null,
regist_day varchar(30),
hit int not null default 0,
ip varchar(20),
primary key(num)

)default charset=utf8;

select * from board;

desc board;

insert into board(id,name,subject,content,regist_day,ip)
values('hong','홍길동','테스트1','테스트1내용','2019004041645','192.168.10.47');


update board set subject=concat(num,subject) ;

 
select *
 from 
(select * 
from board order by num desc) b
where b.num > 10 and b.num<= (10+10);


select * 
from board 
where num > 30 and num<= (30+10)
order by num desc  
;


 select * 
   from board 
where subject  like '%테스트%'
   and num> 0 and num<=(0+10)
 order by num desc 
;

SELECT ROW_NUMBER() OVER(ORDER BY SCORE DESC) 
    AS RANK, NAME, SCORE 
FROM SCORETABLE WHERE STAGE = 1

select b.n, b.*
  from 
(select row_number() over (order by num desc)
as n,num,  subject, name
 from board) b
where n between 11 and 20
 ;


select * 
  from board 
where subject  like '%테스트%' 
    and num > 20 
 order by num desc 
     limit 10;
     
 select * from board;    
 
 update board set subject = concat(name,subject);
 
 update board set subject = concat(subject,'점프')
 where num between 15 and 33
 ;
 
 select * from board order by num desc limit 20,10;
 select * from board order by num desc limit 10 offset 0;
 
sql="select * from board order by num desc limit "+start+" , "+limit;
   
sql="select *  from board where "
    +items+" like '%" + text+ "%' order by num desc limit "
    +start+" , "+limit;

    
 select * from member;   
 
 select name from member where id='hong';