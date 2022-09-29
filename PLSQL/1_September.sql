DECLARE 
    X NUMBER :=100;
BEGIN
    dbms_output.put_line('x is '||X);
END;
/

      //LOOP PRGRAM//
DECLARE
    a NUMBER := &a;
    b NUMBER := &b;
    c NUMBER;
    d NUMBER;
    i NUMBER;
begin
    c:= a+b;
     FOR i IN 1..10 LOOP 
        d:=a*i;
        dbms_output.put_line(a||' x '||i|| ' = '||d);
    END LOOP;
    dbms_output.put_line('Sum of '||a||' and '||b||' is '||c);
end;
/

CREATE TABLE student_list(
    roll_no INT,
    name VARCHAR(25),
    department VARCHAR(25)
);

INSERT INTO student_list values (1,'Affan','Computer');
INSERT INTO student_list values (2,'Swapnil','Computer');

select * from student_list;



