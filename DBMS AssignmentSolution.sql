create database TravelOnTheGo;  
use TravelOnTheGo;

/* 
	1.You are required to create two tables PASSENGER and PRICE with the following
attributes and properties 
*/

CREATE TABLE IF NOT EXISTS PASSENGER (
	Passenger_name  VARCHAR(50),
    Category VARCHAR(50),
    Gender VARCHAR(50),
    Boarding_City VARCHAR(50),
    Destination_City VARCHAR(50),
    Distance INT,
    Bus_Type VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS PRICE (
	Bus_Type  VARCHAR(50),
    Distance INT,
    Price INT
);

/* 
	2.Insert the following data in the tables
*/

INSERT INTO PASSENGER values("Sejal", "AC" , "F" ,"Bengaluru","Chennai",350,"Sleeper");
INSERT INTO PASSENGER values("Anmol", "Non-AC" , "M" ,"Mumbai","Hyderabad",700,"Sitting");
INSERT INTO PASSENGER values("Pallavi", "AC" , "F" ,"Panaji","Bengaluru",600,"Sleeper");
INSERT INTO PASSENGER values("Khusboo", "AC" , "F" ,"Chennai","Mumbai",1500,"Sleeper");
INSERT INTO PASSENGER values("Udit", "Non-AC " , "M" ,"Trivandrum","panaji",1000,"Sleeper");
INSERT INTO PASSENGER values("Ankur", "AC" , "M" ,"Nagpur","Hyderabad",500,"Sitting");
INSERT INTO PASSENGER values("Hemant", "Non-AC" , "M" ,"panaji","Mumbai",700,"Sleeper");
INSERT INTO PASSENGER values("Manish", "Non-AC" , "M" ,"Hyderabad","Bengaluru",500,"Sitting");
INSERT INTO PASSENGER values("Piyush", "AC" , "M" ,"Pune","Nagpur",700,"Sitting");

INSERT INTO PRICE values("Sleeper", 350, 770);
INSERT INTO PRICE values("Sleeper", 500, 1100);
INSERT INTO PRICE values("Sleeper", 600, 1320);
INSERT INTO PRICE values("Sleeper", 700, 1540);
INSERT INTO PRICE values("Sleeper", 1000, 2200);
INSERT INTO PRICE values("Sleeper", 1200, 2640);
INSERT INTO PRICE values("Sleeper", 350, 434);
INSERT INTO PRICE values("Sitting", 500, 620);
INSERT INTO PRICE values("Sitting", 500, 620);
INSERT INTO PRICE values("Sitting", 600, 744);
INSERT INTO PRICE values("Sitting", 700, 868);
INSERT INTO PRICE values("Sitting", 1000, 1240);
INSERT INTO PRICE values("Sitting", 1200, 1488);
INSERT INTO PRICE values("Sitting", 1500, 1860);

/* 
	3.How many females and how many male passengers travelled for a minimum distance of
600 KM s?
*/

SELECT 
    SUM(CASE
        WHEN Gender = 'M' THEN 1
        ELSE 0
    END) AS Male_count,
    SUM(CASE
        WHEN Gender = 'F' THEN 1
        ELSE 0
    END) AS Female_count
FROM
    PASSENGER
WHERE
    Distance >= 600;

/* 
	4.Find the minimum ticket price for Sleeper Bus.
*/

SELECT 
    MIN(PRICE) AS MININMUM_PRICE
FROM
    PRICE
WHERE
    BUS_TYPE = 'Sleeper';

/* 
	5. Select passenger names whose names start with character 'S'
*/

SELECT 
    PASSENGER_NAME
FROM
    PASSENGER
WHERE
    PASSENGER_NAME LIKE 'S%';
    
/* 
	6. Calculate price charged for each passenger displaying Passenger name, Boarding City,
Destination City, Bus_Type, Price in the output
*/

SELECT 
    P.PASSENGER_NAME,
    P.BOARDING_CITY,
    P.DESTINATION_CITY,
    P.BUS_TYPE,
    PR.PRICE
FROM
    PASSENGER P
        JOIN
    PRICE PR
WHERE
    P.DISTANCE = PR.DISTANCE
        AND P.BUS_TYPE = PR.BUS_TYPE;


/* 
	7. What is the passenger name and his/her ticket price who travelled in Sitting bus for a
distance of 1000 KM s 
*/

SELECT 
    P.PASSENGER_NAME, P.DISTANCE, PR.BUS_TYPE, PR.PRICE
FROM
    PASSENGER P
    JOIN 
    PRICE PR
WHERE
    P.DISTANCE = 1000 AND P.BUS_TYPE = "Sitting";


/* 
	8. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to
Panaji?
*/
SELECT 
    P.PASSENGER_NAME, P.DISTANCE, PR.BUS_TYPE, PR.PRICE
FROM
    PASSENGER P
    JOIN 
    PRICE PR
WHERE
    P.PASSENGER_NAME = "Pallavi" AND P.DISTANCE = PR.DISTANCE;


/* 
	9. List the distances from the "Passenger" table which are unique (non-repeated
distances) in descending order.
*/

SELECT 
    DISTANCE
FROM
    PASSENGER
GROUP BY distance
HAVING COUNT(DISTANCE) = 1
ORDER BY DISTANCE DESC;

/* 
	10. Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables.
*/

SELECT 
    PASSENGER_NAME,
    DISTANCE,
    (DISTANCE * 100) / (SELECT 
            SUM(DISTANCE)
        FROM
            PASSENGER) AS PERCENTAGE
FROM
    PASSENGER
GROUP BY PASSENGER_NAME,DISTANCE;

/* 
	11. Display the passenger name and percentage of distance travelled by that passenger
from the total distance travelled by all passengers without using user variables.
*/

call TravelOnTheGo.PRICE_CATEGORY();

