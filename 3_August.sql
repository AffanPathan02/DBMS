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
| YashG              |
| b1                 |
| bakery_products    |
| dominos            |
| house_values       |
| information_schema |
| kalpesh            |
| library            |
| manga              |
| movies             |
| mysql              |
| performance_schema |
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
25 rows in set (0.00 sec)

mysql> use manga;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select * from manga
    -> ;
ERROR 1146 (42S02): Table 'manga.manga' doesn't exist
mysql> show tables;
+-----------------+
| Tables_in_manga |
+-----------------+
| onePiece        |
+-----------------+
1 row in set (0.00 sec)

mysql> create databases courses;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'databases courses' at line 1
mysql> create database courses;
Query OK, 1 row affected (0.03 sec)

mysql> use courses;
Database changed
mysql> CREATE TABLE udemy_course (course_id INT PRIMARY KEY);
Query OK, 0 rows affected (0.04 sec)

mysql> desc udemy_course
    -> ;
+-----------+------+------+-----+---------+-------+
| Field     | Type | Null | Key | Default | Extra |
+-----------+------+------+-----+---------+-------+
| course_id | int  | NO   | PRI | NULL    |       |
+-----------+------+------+-----+---------+-------+
1 row in set (0.00 sec)

mysql> drop table udemy_course;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE udemy_course (course_id INT PRIMARY KEY,course_name VARCHAR(25));
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO udemy_course values (101,'MySQl course');
Query OK, 1 row affected (0.03 sec)

mysql> select * from udemy_course;
+-----------+--------------+
| course_id | course_name  |
+-----------+--------------+
|       101 | MySQl course |
+-----------+--------------+
1 row in set (0.00 sec)

mysql> INSERT INTO udemy_course (course_name) values ('MySQl course');
ERROR 1364 (HY000): Field 'course_id' doesn't have a default value
mysql> drop table udemy_course;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE udemy_course (course_id INT AUTO INCREMENT,course_name VARCHAR(25) UNIQUE);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO INCREMENT,course_name VARCHAR(25) UNIQUE)' at line 1
mysql> CREATE TABLE udemy_course (course_id INT AUTO INCREMENT,course_name VARCHAR(25), UNIQUE(COURSE_NAME));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO INCREMENT,course_name VARCHAR(25), UNIQUE(COURSE_NAME))' at line 1
mysql> CREATE TABLE udemy_course (course_id INT AUTO INCREMENT,course_name VARCHAR(25), UNIQUE(course_name));
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'AUTO INCREMENT,course_name VARCHAR(25), UNIQUE(course_name))' at line 1
mysql> CREATE TABLE udemy_course (course_id INT,course_name VARCHAR(25), UNIQUE(COURSE_NAME));
Query OK, 0 rows affected (0.02 sec)

mysql> desc udemy_course;
+-------------+-------------+------+-----+---------+-------+
| Field       | Type        | Null | Key | Default | Extra |
+-------------+-------------+------+-----+---------+-------+
| course_id   | int         | YES  |     | NULL    |       |
| course_name | varchar(25) | YES  | UNI | NULL    |       |
+-------------+-------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> INSERT INTO udemy_course values (101,'MySQl course');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO udemy_course values (102,'MySQl course');
ERROR 1062 (23000): Duplicate entry 'MySQl course' for key 'udemy_course.course_name'
mysql> alter table udemy_course add course_price int not null;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc udemy_course;
+--------------+-------------+------+-----+---------+-------+
| Field        | Type        | Null | Key | Default | Extra |
+--------------+-------------+------+-----+---------+-------+
| course_id    | int         | YES  |     | NULL    |       |
| course_name  | varchar(25) | YES  | UNI | NULL    |       |
| course_price | int         | NO   |     | NULL    |       |
+--------------+-------------+------+-----+---------+-------+
3 rows in set (0.00 sec)

mysql> INSERT INTO udemy_course values (102,'Python course');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO udemy_course values (102,'Python course',499);
Query OK, 1 row affected (0.03 sec)

mysql> select * from udemy_course;
+-----------+---------------+--------------+
| course_id | course_name   | course_price |
+-----------+---------------+--------------+
|       101 | MySQl course  |            0 |
|       102 | Python course |          499 |
+-----------+---------------+--------------+
2 rows in set (0.01 sec)

mysql> drop table udemy_course;
Query OK, 0 rows affected (0.03 sec)

mysql> CREATE TABLE udemy_course (course_id INT PRIMARY KEY AUTO_INCREMENT, course_name VARCHAR(25),course_price int);
Query OK, 0 rows affected (0.03 sec)

mysql> INSERT INTO udemy_course values (101,'Python course',499);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO udemy_course values ('C++ course',499);
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO udemy_course (course_name,course_price) values ('C++ course',499);
Query OK, 1 row affected (0.02 sec)

mysql> select * from udemy_course;
+-----------+---------------+--------------+
| course_id | course_name   | course_price |
+-----------+---------------+--------------+
|       101 | Python course |          499 |
|       102 | C++ course    |          499 |
+-----------+---------------+--------------+
2 rows in set (0.00 sec)

mysql> 
mysql> alter table udemy_course column course_price DEFAULT 128;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'column course_price DEFAULT 128' at line 1
mysql> DROP table udemy_course;
Query OK, 0 rows affected (0.01 sec)

mysql> CREATE TABLE udemy_course (course_id INT, course_name VARCHAR(25),course_price int DEFAULT 128);
Query OK, 0 rows affected (0.02 sec)

mysql> INSERT INTO udemy_course values (101,'Python course',99);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO udemy_course values (101,'C++ course');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO udemy_course values (102,'C++ course');
ERROR 1136 (21S01): Column count doesn't match value count at row 1
mysql> INSERT INTO udemy_course (course_id,course_name) values (102,'C++ course');
Query OK, 1 row affected (0.00 sec)

mysql> select * from udemy_course;
+-----------+---------------+--------------+
| course_id | course_name   | course_price |
+-----------+---------------+--------------+
|       101 | Python course |           99 |
|       102 | C++ course    |          128 |
+-----------+---------------+--------------+
2 rows in set (0.00 sec)

