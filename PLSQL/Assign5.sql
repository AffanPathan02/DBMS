--CREATE TABLE stud_marks(name VARCHAR2(25),total_marks NUMBER);
--CREATE TABLE result(roll_number NUMBER , name VARCHAR2(25), class VARCHAR2(30));

-- CREATE TABLE ONLY ONCE


SET SERVEROUT ON

CREATE OR REPLACE PROCEDURE procedure_1 ( roll_no IN NUMBER, name IN VARCHAR2 ,marks IN NUMBER) AS
	BEGIN
		IF (marks<=1500 and marks>=990) THEN
			DBMS_OUTPUT.PUT_LINE ('DISTINCTION');
			INSERT INTO result VALUES (roll_no,name,'DISTINCTION');
		ELSIF (marks<=989 and marks>=900) THEN
			DBMS_OUTPUT.PUT_LINE ('FIRST CLASS');
			INSERT INTO result VALUES (roll_no,name,'FIRST CLASS');
		ELSIF (marks<=899 and marKs>825) THEN
			DBMS_OUTPUT.PUT_LINE('HIGHER SECOND CLASS');
			INSERT INTO result VALUES (roll_no,name,'HIGHER SECOND CLASS');
		ELSE
			DBMS_OUTPUT.PUT_LINE ('FAIL');
			INSERT INTO result VALUES (roll_no,name,'FAIL');

	    END IF;
	    INSERT INTO stud_marks VALUES (name,marks);
    END procedure_1;
/
BEGIN

			procedure_1(17,'Affan',810);
			procedure_1(18,'Swapnil',969);
			procedure_1(10,'Sweta',975);
			procedure_1(16,'Tejas',750);
END;
/
-- insert into student_marks values (17,'Affan',810);
-- insert into student_marks values (18,'Swapnil',969);
-- insert into student_marks values (10,'Sweta',975);
-- insert into student_marks values (16,'Tejas',750);
-- insert into student_marks values (78,'Ramesh',212);

select * from student_marks;
select * from result;

