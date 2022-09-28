create table o_rollcall(rno number,name varchar(20),status varchar(30));

create table n_rollcall(rno number,name varchar(20),status varchar(30));

insert into o_rollcall values(1,'Riya','Present');
insert into o_rollcall values(2,'Sid','Absent');
insert into o_rollcall values(3,'Neha','Present');
insert into o_rollcall values(4,'Nikhil','Absent');
insert into o_rollcall values(5,'Arya','Present');


select * from o_rollcall;

insert into n_rollcall values(3,'Neha','Present');
insert into n_rollcall values(6,'Om','Absent');
insert into n_rollcall values(7,'Priya','Present');
insert into n_rollcall values(8,'Sneha','Absent');

select * from n_rollcall;

/* implicit cursor*/

begin
update o_rollcall set status='Present' where rno=2;
if sql%found then
dbms_output.put_line('Updated');
end if;
if sql%notfound then
dbms_output.put_line('Not updated- not found');
end if;
if sql%rowcount=0 then
dbms_output.put_line('No row updated');
end if;
end;
/

/*for loop cursor:present student are displayed */

declare
cursor for_cur is select rno,name,status from o_rollcall where status='Present';
tmp for_cur%rowtype;
begin
for tmp in for_cur
loop
dbms_output.put_line('  ROLLNO:   '||tmp.rno||' '||'  Name:  '||tmp.name||' '||'Status: '||tmp.status);
end loop;
end;
/   

/* Parameterized cursor: take input from the user and display*/

declare 
roll number;
cursor param_cur(roll number) is select * from o_rollcall where rno=roll;
tmp param_cur%rowtype;
begin
roll:=&roll;
for tmp in param_cur(roll) loop
dbms_output.put_line('Roll No:   '||tmp.rno);
dbms_output.put_line('Name:   '||tmp.name);
dbms_output.put_line('Status:   '||tmp.status);
end loop;
end;
/

/* merge */

begin
merge into n_rollcall t1 using (select rno,name,status from o_rollcall) t2 on (t1.rno=t2.rno) when not matched then insert 
values(t2.rno,t2.name,t2.status);
if sql%rowcount>0 then
dbms_output.put_line('Merged  '||sql%rowcount||' Row Updated');
else
dbms_output.put_line('no row updated');
end if;
if sql%notfound then
dbms_output.put_line('Not Merged');
end if;
end;
/

select * from n_rollcall;











