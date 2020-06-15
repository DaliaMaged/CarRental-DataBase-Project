create database carrental1DB; 
use carrental1;
create table client_tb1(
id int ,
firstname varchar(50),
lastname varchar(50),
pass_word varchar(50),
location varchar (50),
primary key(id)
);
create table car_tb2(
id int,
client_id int,
model varchar(50),
color varchar(50),
rentalprice int,
highspeed int ,
primary key(id)
);
create table period_tb3(
id int ,
car_id int,
client_id int,
startdate date, #9999-12-31
enddate date, 
primary key(id)
);
INSERT INTO client_tb1 VALUES ( 1, "moahmed","ali","hamo123","roshdy");
INSERT INTO client_tb1 VALUES ( 2, "ahmed","mohsen","hamada88","sedigaber");
INSERT INTO client_tb1 VALUES ( 3, "safaa","khaked","safyy9","wengt");
INSERT INTO client_tb1 VALUES ( 4, "ali","alii","lol449","smuha");
INSERT INTO client_tb1 VALUES ( 5, "magdy","alaa","megoo23","campshezar");
INSERT INTO client_tb1 VALUES ( 6, "moahmed","gad","gego99","sporting");
INSERT INTO client_tb1 VALUES ( 7, "hager","saad","gogo77","bukla");
INSERT INTO car_tb2 VALUES ( 1, 5,"bmw","black","2000","180");
INSERT INTO car_tb2 VALUES ( 2, 7,"bmw","pink","3000","160");
INSERT INTO car_tb2 VALUES ( 3, 3,"chevorlet","white","1000","120");
INSERT INTO car_tb2 VALUES ( 4, 5,"marceds","black","2500","160");
INSERT INTO car_tb2 VALUES ( 5, 1,"minicooper","black","5000","200");
INSERT INTO car_tb2 VALUES ( 6, 6,"hundai","red","3500","180");
INSERT INTO car_tb2 VALUES ( 7, 2,"kia","gold","4000","140");
INSERT INTO car_tb2 VALUES ( 8, 7,"tyota","white","1000","180");
INSERT INTO period_tb3 VALUES (1,1, 5,'2020-01-1','2020-01-5');
INSERT INTO period_tb3 VALUES (2,2,7,'2020-01-3','2020-01-9');
INSERT INTO period_tb3 VALUES (3,3, 3,'2020-01-1','2020-01-5');
INSERT INTO period_tb3 VALUES (4,4,5,'2020-01-19','2020-01-25');
INSERT INTO period_tb3 VALUES (5,5,1,'2020-01-12','2020-01-15');
INSERT INTO period_tb3 VALUES (6,6,6,'2020-01-2','2020-01-5');
INSERT INTO period_tb3 VALUES (7,7, 2,'2020-01-20','2020-01-25');
INSERT INTO period_tb3 VALUES (8,8, 7,'2020-01-11','2020-01-15');
#1-how to get the first name from client table
SELECT fristname  
FROM client_tb1;
#2-how to get all data from a table
SELECT * FROM client_tb1 ;
#3-how to get two columns from a table 
SELECT model, rentalprice FROM car_tb2;
#4-how to get a column from its id
SELECT highspeed
FROM car_tb2
WHERE id=5;
#5-Using AND gate
SELECT model, rentalprice, highspeed
FROM car_tb2
WHERE rentalprice=3000 AND model="bmw" AND highspeed=160 ;
#6-Using OR gate
SELECT model, rentalprice,color
FROM car_tb2
WHERE rentalprice=3500 OR model="bmw" OR color="black";
#7-Using NOT gate
SELECT model, highspeed
FROM car_tb2
WHERE NOT color="black";
#8-how to get the cars which is between 3000 and 6000 rental prices
SELECT  model
FROM car_tb2
WHERE rentalprice BETWEEN 3000 AND 6000;
#9-how to get the cars which isn't between 3000 and 6000 rental prices
 SELECT  model,color
FROM car_tb2
WHERE rentalprice NOT BETWEEN 3000 AND 6000;
#10-how to oreder the cars that its color is black ordered by its name
SELECT model 
FROM car_tb2  
WHERE color = "black"  
ORDER BY model;
#11- how to get name like "isntance name"
SELECT fristname  
FROM client_tb1 
WHERE location LIKE 'smuha';
#12-how to get a name that the location of this doen't like the conditions   
SELECT fristname  
FROM client_tb1 
WHERE location NOT LIKE 'smuha';
#13 how to show some data from it another data
SELECT *  
FROM client_tb1  
WHERE fristname IN ('ahmed', 'safaa', 'magdy');  
#14 how to show data except another data
SELECT *  
FROM client_tb1  
WHERE fristname NOT IN ('ahmed', 'safaa', 'magdy'); 
#15 how to show the only diffrenet values
SELECT DISTINCT model, color
FROM car_tb2;
#16 how to show the top of a table in certain condition
SELECT model
FROM car_tb2
WHERE rentalprice<=3000;
#17-how to return the first value of the selected column
SELECT firstname  
FROM car_tb2  
LIMIT 1; 
#18-how to return two first values of the selected column
SELECT firstname  
FROM car_tb2  
LIMIT 2;
#19-how to add new column to the table
ALTER TABLE client_tb1 
ADD phonenumber int;
#20- how to convert datatype of certain expression
SELECT CONVERT('2020-01-5', DATETIME);
#21-how to delete a column from a table
ALTER TABLE client_tb1  
DROP COLUMN phonenumber;

#MIN
SELECT MIN(rentalprice)
FROM car_tb2;
#MAX
SELECT MAX(rentalprice)
FROM car_tb2;
#MIN
SELECT MIN(startdate)
FROM period_tb3;
#COUNT
SELECT COUNT(rentalprice)
FROM car_tb2;
#AVG
SELECT AVG(rentalprice)
FROM car_tb2;
#SUM
SELECT SUM(rentalprice)
FROM car_tb2;
#GROUP BY
SELECT COUNT(id), location
FROM client_tb1
GROUP BY location;
#JOINS
#INNER JOIN
SELECT model
FROM car_tb2
INNER JOIN period_tb3
ON car_tb2.model = period_tb3.startdate;
#LEFT
SELECT model
FROM car_tb2
LEFT JOIN period_tb3
ON car_tb2.model = period_tb3.startdate;
#RIGHT
SELECT startdate
FROM car_tb2
RIGHT JOIN period_tb3
ON car_tb2.model = period_tb3.startdate;
#CROSS JOIN 
SELECT *  
FROM period_tb3
CROSS JOIN car_tb2 ;
#UPDATE
UPDATE car_tb2
SET color="blue"
WHERE id=5;
UPDATE car_tb2
SET highspeed="200"
WHERE id=7;
UPDATE client_tb1
SET pass_word="loloo99"
WHERE id=5;
UPDATE client_tb1
SET lastname="keko"
WHERE id=2;
UPDATE car_tb2
SET rentalprice="4505"
WHERE id=5;
#DELETE
DELETE FROM client_tb1  
WHERE  
(id=7);
DELETE FROM car_tb2   
WHERE  
(id=8); 
DELETE FROM period_tb3   
WHERE  
(id=8); 
DELETE FROM car_tb2   
WHERE  
(id=7); 
DELETE FROM period_tb3
WHERE  
(id=7); 