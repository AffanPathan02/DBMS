--CREATE TABLE circle_area (radius number, area number);


declare 
radius_var number;
area_var number;
pi number:= 3.14;
begin
dbms_output.put_line('Area of circle from radius 5 to 9'); 
for radius_var in 5..9 loop
area_var:=pi*radius_var*radius_var;

dbms_output.put_line(area_var);
insert into circle_area values(radius_var,area_var);
end loop;

end;
/
