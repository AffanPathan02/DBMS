-- Cursors: (All types: Implicit, Explicit, Cursor FOR Loop, Parameterized Cursor)
-- Write a PL/SQL block of code using parameterized Cursor that will merge the data available in
-- the newly created table N_RollCall with the data available in the table O_RollCall. If the data in
-- the first table already exist in the second table then that data should be skipped

CREATE TABLE O_rollcall (
    roll_no int,
    name1 VARCHAR2(20),
    status VARCHAR2(8)
);

CREATE TABLE N_rollcall (
    roll_no int,
    name1 VARCHAR2(20),
    status VARCHAR2(8)
);

insert into O_rollcall values (17,'Affan','Present');
insert into O_rollcall values (18,'Swapnil','Present');
insert into O_rollcall values (8,'Viraj','Absent');
insert into O_rollcall values (16,'Tejas','Absent');
insert into O_rollcall values (10,'Sweta','Present');

--implicit cursor 

BEGIN
    UPDATE O_ROLLCALL
    SET
        STATUS='Absent'
    WHERE
        ROLL_NO=8;
    IF SQL%FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Updated');
    END IF;
    IF SQL%NOTFOUND THEN
        DBMS_OUTPUT.PUT_LINE('Not updated- not found');
    END IF;
    IF SQL%ROWCOUNT=0 THEN
        DBMS_OUTPUT.PUT_LINE('No row updated');
    END IF;
END;
/


--explicit cursor

DECLARE
CURSOR exp_cursor is select * from O_rollcall WHERE status ='Present';
tmp exp_cursor%rowtype;

BEGIN
OPEN exp_cursor;
LOOP exit when exp_cursor%notfound;
FETCH exp_cursor into tmp;
DBMS_OUTPUT.PUT_LINE('Roll no:'||tmp.roll_no||'  Name:'||tmp.name1||'  Status:'||tmp.status);
END loop;

if exp_cursor%rowcount>0 THEN
DBMS_OUTPUT.PUT_LINE(exp_cursor%rowcount||' Rows Found');
end if;
END;
/

--for CURSOR

declare
cursor for_cur is select roll_no,name,status from O_rollcall where status='Present';
tmp for_cur%rowtype;
begin
for tmp in for_cur
loop
dbms_output.put_line('  ROLLNO:   '||tmp.rno||' '||'  Name:  '||tmp.name||' '||'Status: '||tmp.status);
end loop;
end;
/   
