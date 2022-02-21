create Database if not exists `dbms-assignment4`;
use `dbms-assignment4`;

create table if not exists `passenger`(
`passenger_name` varchar(50),
`category` varchar(50),
`gender` varchar(50),
`boarding_city` varchar(50),
`destination_city` varchar(50),
`distance` int,
`bus_type` varchar(50)
);
create table if not exists `price`(
`bus_type` varchar(50),
`distance` int,
`price` int
);

INSERT INTO `passenger` VALUES("Sejal","AC","F","Bengaluru","Chennai",350,"Sleeper");
INSERT INTO `passenger` VALUES("Anmol","Non-AC","M","Mumbai","Hyderabad",700,"Sitting");
INSERT INTO `passenger` VALUES("Pallavi","AC","F","Panaji","Bengaluru",600,"Sleeper");
INSERT INTO `passenger` VALUES("Khusboo","AC","F","Chennai","Mumbai",1500,"Sleeper");
INSERT INTO `passenger` VALUES("Udit","Non-AC","M","Trivandrum","panaji",1000,"Sleeper");
INSERT INTO `passenger` VALUES("Ankur","AC","M","Nagpur","Hyderabad",500,"Sitting");
INSERT INTO `passenger` VALUES("Ankur","Non-AC","M","panaji","Mumbai",700,"Sleeper");
INSERT INTO `passenger` VALUES("Manish","Non-AC","M","Hyderabad","Bengaluru",500,"Sitting");
INSERT INTO `passenger` VALUES("Piyush","AC","M","Pune","Nagpur",700,"Sitting");

INSERT INTO `price` VALUES("Sleeper",350,700);
INSERT INTO `price` VALUES("Sleeper",500,1100);
INSERT INTO `price` VALUES("Sleeper",600,1320);
INSERT INTO `price` VALUES("Sleeper",700,1540);
INSERT INTO `price` VALUES("Sleeper",1000,2200);
INSERT INTO `price` VALUES("Sleeper",1200,2640);
INSERT INTO `price` VALUES("Sleeper",1500,2700);
INSERT INTO `price` VALUES("Sitting",500,620);
INSERT INTO `price` VALUES("Sitting",600,744);
INSERT INTO `price` VALUES("Sitting",700,868);
INSERT INTO `price` VALUES("Sitting",1000,1240);
INSERT INTO `price` VALUES("Sitting",1200,1488);
INSERT INTO `price` VALUES("Sitting",1500,1860);

-- 3)	How many females and how many male passengers travelled for a minimum distance of 600 KM s?
select count(passenger.gender) as count from passenger where `passenger`.distance>=600 group by passenger.gender;

-- 4)	Find the minimum ticket price for Sleeper Bus.
select min(price.price) from price where price.bus_type="Sleeper";

-- 5)	Select passenger names whose names start with character 'S'
select passenger.passenger_name from passenger where passenger.passenger_name like 'S%';

-- 6)	Calculate price charged for each passenger displaying Passenger name, Boarding City,Destination City, Bus_Type, Price in the output
select category.* from `order` inner join product_details on `order`.prod_id=product_details.prod_id inner join 
product on product.pro_id=product_details.pro_id inner join category on category.cat_id = product.cat_id having min(`order`.ord_amount);

-- 7)	What are the passenger name/s and his/her ticket price who travelled in the Sitting bus for a distance of 1000 KM s
select product.pro_id,product.pro_name from `order` inner join product_details on product_details.prod_id=`order`.prod_id
 inner join product on product.pro_id=product_details.pro_id where `order`.ord_date>"2021-10-05";

-- 8)	What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?
select customer.cus_name, customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

-- 9)	List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
select distinct passenger.distance from passenger order by distance DESC;

-- 10)	Display the passenger name and percentage of distance travelled by that passengerfrom the total distance travelled by all passengers without using user variables

-- 11)	Display the distance, price in three categories in table Price
-- a) Expensive if the cost is more than 1000
-- b) Average Cost if the cost is less than 1000 and greater than 500

