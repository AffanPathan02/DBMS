ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 9
Server version: 8.0.30-0ubuntu0.22.04.1 (Ubuntu)

Copyright (c) 2000, 2022, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Diksha             |
| Dominos            |
| Employees          |
| Mcdonalds          |
| YGTECH             |
| YashG              |
| anime              |
| b1                 |
| bakery_products    |
| courses            |
| dominos            |
| house_values       |
| information_schema |
| kalpesh            |
| library            |
| manga              |
| movies             |
| mysql              |
| performance_schema |
| purnandu           |
| shital             |
| sports             |
| student            |
| student_database   |
| student_info       |
| sys                |
| vehicle_record     |
| vrushali           |
| yash               |
+--------------------+
29 rows in set (0.00 sec)

mysql> create database employee;
Query OK, 1 row affected (0.00 sec)

mysql> use employee;
Database changed
mysql> create table employee_list(emp_id INT,enmp_name VARCHAR(25),dept_name VARCHAR(25),salary INT);
Query OK, 0 rows affected (0.03 sec)

mysql> alter table employee_list rename column enmp_name to emp_name;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> insert into employee_list values (5,'Tejas,'computer',50000),(6,'Sweta','AIDS',90348);
    '> insert into employee_list values (5,'Tejas,'computer',50000),(6,'Sweta','AIDS',90348)^C
mysql> insert into employee_list values (5,'Tejas','computer',50000),(6,'Sweta','AIDS',90348);
Query OK, 2 rows affected (0.03 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> select * from employee_list;
+--------+-----------+-----------+--------+
| emp_id | emp_name  | dept_name | salary |
+--------+-----------+-----------+--------+
|      1 | Affan     | computer  | 200000 |
|      2 | swapnil   | CR        | 100000 |
|      3 | Himanshu  | pharmacy  |  90934 |
|      4 | samruddhi | AIDS      |  75000 |
|      5 | Tejas     | computer  |  50000 |
|      6 | Sweta     | AIDS      |  90348 |
+--------+-----------+-----------+--------+
6 rows in set (0.00 sec)

mysql> select * from employee_list where emp_id in (select emp_id from employee_list where salary>90500);
+--------+----------+-----------+--------+
| emp_id | emp_name | dept_name | salary |
+--------+----------+-----------+--------+
|      1 | Affan    | computer  | 200000 |
|      2 | swapnil  | CR        | 100000 |
|      3 | Himanshu | pharmacy  |  90934 |
+--------+----------+-----------+--------+
3 rows in set (0.00 sec)

mysql> select * from employee_list where salary>90500;
+--------+----------+-----------+--------+
| emp_id | emp_name | dept_name | salary |
+--------+----------+-----------+--------+
|      1 | Affan    | computer  | 200000 |
|      2 | swapnil  | CR        | 100000 |
|      3 | Himanshu | pharmacy  |  90934 |
+--------+----------+-----------+--------+
3 rows in set (0.00 sec)

mysql> select * from employee_list where dept_name = (select dept_name from employee_list where emp_name='Himashu');
Empty set (0.00 sec)

mysql> select * from employee_list where dept_name = (select dept_name from employee_list where emp_name='Himanshu');
+--------+----------+-----------+--------+
| emp_id | emp_name | dept_name | salary |
+--------+----------+-----------+--------+
|      3 | Himanshu | pharmacy  |  90934 |
+--------+----------+-----------+--------+
1 row in set (0.00 sec)

mysql> select * from employee_list where dept_name = (select dept_name from employee_list where emp_name='Tejas');
+--------+----------+-----------+--------+
| emp_id | emp_name | dept_name | salary |
+--------+----------+-----------+--------+
|      1 | Affan    | computer  | 200000 |
|      5 | Tejas    | computer  |  50000 |
+--------+----------+-----------+--------+
2 rows in set (0.00 sec)

mysql> select * from employee_list where dept_name = (select dept_name from employee_list where emp_name='Sweta');
+--------+-----------+-----------+--------+
| emp_id | emp_name  | dept_name | salary |
+--------+-----------+-----------+--------+
|      4 | samruddhi | AIDS      |  75000 |
|      6 | Sweta     | AIDS      |  90348 |
+--------+-----------+-----------+--------+
2 rows in set (0.00 sec)

