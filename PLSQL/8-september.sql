/*

create table burrower_table (Roll_no int,Name varchar(50),DateofIssue date,NameofBook varchar(50),status varchar(1));

create table fine_table (Roll_no int, Date date,Amt int);

insert into burrower_table values (1,'Aditya','01-08-2022','toc','i');
insert into burrower_table values (5,'Kalp','07-09-2022','spos','r');
insert into burrower_table values (17,'Affan','09-02-2022','spos','i');
insert into burrower_table values (10,'Sweta','06-09-2022','spos','r');
insert into burrower_table values (16,'Tejas','02-09-2022','spos','r');

insert into burrower_table values (8,'Samruddhi','01-20-2022','spm','i');
insert into burrower_table values (12,'Himanshu','01-21-2022','cns','i');
insert into burrower_table values (53,'Sherya','01-21-2022','dbms','i');
insert into burrower_table values (7,'Viraj','01-01-2022','dbms','i');

select * from burrower_table;

*/

DECLARE
roll_no int;
book_name varchar(50);

doi date;
System_date date;

no_of_days int(20);
BEGIN
roll_no := :roll_no;
book_name := :book_name;
     select Sysdate into System_date from dual;
     select DateofIssue into doi from burrower_table where Roll_no=roll_no and NameofBook=book_name;
     
     
     no_of_days:=System_date-doi;

dbms_output.put_line(no_of_days);

END;
/

