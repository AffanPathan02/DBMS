ubuntu@ubuntu-OptiPlex-5000:~$ mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.29-0ubuntu0.22.04.2 (Ubuntu)

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
| Mcdonalds          |
| anime              |
| bakery_products    |
| dominos            |
| house_values       |
| information_schema |
| manga              |
| movies             |
| mysql              |
| performance_schema |
| sports             |
| student            |
| student_database   |
| student_info       |
| sys                |
| vrushali           |
| yash               |
+--------------------+
19 rows in set (0.00 sec)

mysql> drop database anime;
Query OK, 0 rows affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| Diksha             |
| Dominos            |
| Mcdonalds          |
| bakery_products    |
| dominos            |
| house_values       |
| information_schema |
| manga              |
| movies             |
| mysql              |
| performance_schema |
| sports             |
| student            |
| student_database   |
| student_info       |
| sys                |
| vrushali           |
| yash               |
+--------------------+
18 rows in set (0.00 sec)

mysql> create database vehicle_record;
Query OK, 1 row affected (0.03 sec)

mysql> use vehicle_record;
Database changed
mysql> create table car_record (car_no varchar(25),car_name varchar(25),km_driven int);
Query OK, 0 rows affected (0.03 sec)

mysql> insert into car_record values ('MH12EU1990','Ford Ecosport',2563);
Query OK, 1 row affected (0.03 sec)

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| MH12EU1990 | Ford Ecosport |      2563 |
+------------+---------------+-----------+
1 row in set (0.00 sec)

mysql> insert into car_record values ('MH14AS0182','Hyundai i20',19204);
Query OK, 1 row affected (0.03 sec)

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
2 rows in set (0.00 sec)

mysql> alter table car_record modify column car_no PRIMARY KEY;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'PRIMARY KEY' at line 1
mysql> alter table car_record modify column car_no PRIMARY KEY(car_no);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'PRIMARY KEY(car_no)' at line 1
mysql> drop table car_record;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from car_record;
ERROR 1146 (42S02): Table 'vehicle_record.car_record' doesn't exist
mysql> create table car_record (car_no varchar(25),car_name varchar(25),km_driven int,primary key(car_no));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into car_record values ('MH12EU1990','Ford Ecosport',2563);
Query OK, 1 row affected (0.00 sec)

mysql> insert into car_record values ('MH14AS0182','Hyundai i20',19204);
Query OK, 1 row affected (0.01 sec)

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
2 rows in set (0.00 sec)

mysql> desc car_record;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| car_no    | varchar(25) | NO   | PRI | NULL    |       |
| car_name  | varchar(25) | YES  |     | NULL    |       |
| km_driven | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> drop car_record;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'car_record' at line 1
mysql> drop table car_record;
Query OK, 0 rows affected (0.04 sec)

mysql> create table car_record (car_no varchar(25) NOT NULL,car_name varchar(25),km_driven int,primary key(car_no));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into car_record values ('MH12EU1990','Ford Ecosport',2563);
Query OK, 1 row affected (0.00 sec)

mysql> insert into car_record values ('MH14AS0182','Hyundai i20',19204);
Query OK, 1 row affected (0.00 sec)

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
2 rows in set (0.00 sec)

mysql> desc car_record;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| car_no    | varchar(25) | NO   | PRI | NULL    |       |
| car_name  | varchar(25) | YES  |     | NULL    |       |
| km_driven | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> desc table car_record;
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------+
| id | select_type | table      | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------+
|  1 | SIMPLE      | car_record | NULL       | ALL  | NULL          | NULL | NULL    | NULL |    2 |   100.00 | NULL  |
+----+-------------+------------+------------+------+---------------+------+---------+------+------+----------+-------+
1 row in set, 1 warning (0.02 sec)

mysql> insert into car_record values ('AP16IO9011','TATA Nexon',878564);
Query OK, 1 row affected (0.02 sec)

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| AP16IO9011 | TATA Nexon    |    878564 |
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
3 rows in set (0.00 sec)

mysql> insert into car_record values ('GJ390605','Maruti Swift',12);
Query OK, 1 row affected (0.03 sec)

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| AP16IO9011 | TATA Nexon    |    878564 |
| GJ390605   | Maruti Swift  |        12 |
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
4 rows in set (0.00 sec)

mysql> update car_record set car_no='GJ39QW0605' WHERE car_no='GJ390605';
Query OK, 1 row affected (0.03 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from car_record;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| AP16IO9011 | TATA Nexon    |    878564 |
| GJ39QW0605 | Maruti Swift  |        12 |
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE car_record ADD owner_name varchar(40);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from car_record;
+------------+---------------+-----------+------------+
| car_no     | car_name      | km_driven | owner_name |
+------------+---------------+-----------+------------+
| AP16IO9011 | TATA Nexon    |    878564 | NULL       |
| GJ39QW0605 | Maruti Swift  |        12 | NULL       |
| MH12EU1990 | Ford Ecosport |      2563 | NULL       |
| MH14AS0182 | Hyundai i20   |     19204 | NULL       |
+------------+---------------+-----------+------------+
4 rows in set (0.00 sec)

mysql> alter table car_record RENAME car_record to car_records;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'to car_records' at line 1
mysql> alter table car_record RENAME to car_record  car_records;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'car_records' at line 1
mysql> alter table car_record RENAME to car_records;
Query OK, 0 rows affected (0.02 sec)

mysql> select * from car_records;
+------------+---------------+-----------+------------+
| car_no     | car_name      | km_driven | owner_name |
+------------+---------------+-----------+------------+
| AP16IO9011 | TATA Nexon    |    878564 | NULL       |
| GJ39QW0605 | Maruti Swift  |        12 | NULL       |
| MH12EU1990 | Ford Ecosport |      2563 | NULL       |
| MH14AS0182 | Hyundai i20   |     19204 | NULL       |
+------------+---------------+-----------+------------+
4 rows in set (0.00 sec)

mysql> alter table car_records add column rating int AFTER km_driven;
Query OK, 0 rows affected (0.00 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from car_records;
+------------+---------------+-----------+--------+------------+
| car_no     | car_name      | km_driven | rating | owner_name |
+------------+---------------+-----------+--------+------------+
| AP16IO9011 | TATA Nexon    |    878564 |   NULL | NULL       |
| GJ39QW0605 | Maruti Swift  |        12 |   NULL | NULL       |
| MH12EU1990 | Ford Ecosport |      2563 |   NULL | NULL       |
| MH14AS0182 | Hyundai i20   |     19204 |   NULL | NULL       |
+------------+---------------+-----------+--------+------------+
4 rows in set (0.00 sec)

mysql> create view car_view as select car_no,car_name,km_driven from car_records where km_driven>2000;
Query OK, 0 rows affected (0.03 sec)

mysql> select * from car_view;
+------------+---------------+-----------+
| car_no     | car_name      | km_driven |
+------------+---------------+-----------+
| AP16IO9011 | TATA Nexon    |    878564 |
| MH12EU1990 | Ford Ecosport |      2563 |
| MH14AS0182 | Hyundai i20   |     19204 |
+------------+---------------+-----------+
3 rows in set (0.00 sec)

mysql> create index car_index on car_records (car_no);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from car_index;
ERROR 1146 (42S02): Table 'vehicle_record.car_index' doesn't exist
mysql> 
