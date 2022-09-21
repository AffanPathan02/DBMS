create table student_marks (
    roll_no number(30),
    name varchar2(20),
    total_marks number(30)
);

create table result1 (
    roll number(30),
    name1 varchar2(30),
    Class varchar2(20)
);

insert into student_marks values (17,'Affan',810);
insert into student_marks values (18,'Swapnil',969);
insert into student_marks values (10,'Sweta',975);
insert into student_marks values (16,'Tejas',750);
insert into student_marks values (78,'Ramesh',212);

select * from student_marks;
select * from result;

