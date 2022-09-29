/*

create table borrower(rollno int,Name varchar(20),doi date,nameOfBook varchar(20),status varchar(5));

create table fines(roll_no int,todaydate date,amnt int);

insert into borrower values(05,'Kalp','08-05-2022','DBMS','i');
insert into borrower values(16,'Tejas','08-15-2022','TOC','i');
insert into borrower values(17,'Affan','08-23-2022','SPOS','i');
insert into borrower values(10,'Sweta','08-29-2022','CNS','i');
insert into borrower values(40,'Sakshi','09-05-2022','DBMS','i');
insert into borrower values(08,'Samruddhi','08-18-2022','TOC','i');
insert into borrower values(12,'Himanshu','08-05-2022','DBMS','i');
insert into borrower values(18,'Swapnil','08-12-2022','DBMS','i');
insert into borrower values(07,'Viraj','08-02-2022','DM','i');


select * from borrower;
select * from fines;

*/

DECLARE 
roll_number number;
name1 varchar(20);
dateofissue date;
System_date date;
noOfDays number(20);
amnt number;
BEGIN
roll_number:=:roll_number;
name1:=:name1;
select Sysdate into System_date from dual;
select doi into dateofissue from borrower where rollno=roll_number and nameOfBook=name1;
dbms_output.put_line(dateofissue);
noOfDays:=System_date - dateofissue;
dbms_output.put_line(noOfDays);
if noOfDays>15 and noOfdays<30 then
amnt:=noOfdays*5;
dbms_output.put_line('Fine: ' ||amnt);
elsif noOfdays>30 then
amnt:=noOfdays*50;
dbms_output.put_line('Fine: ' ||amnt);
else
dbms_output.put_line('No fine');
END IF;
IF noOfDays>15 THEN
INSERT INTO fines values(roll_number,Sysdate,amnt);
UPDATE borrower set status ='r' where rollno=roll_number;
END if;
exception
when no_data_found then
dbms_output.put_line(roll_number||' Not Found');

END;
/
