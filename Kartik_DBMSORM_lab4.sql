/*creating database*/
Create database lab_4_2105;
use lab_4_2105;

/*creating tables*/
create table supplier(
SUPP_ID INT primary key,
SUPP_NAME varchar(50) NOT NULL,
SUPP_CITY varchar(50) NOT NULL,
SUPP_PHONE varchar(50) NOT NULL
);
select * from supplier;
create table customer(
CUS_ID INT primary key,
CUS_NAME varchar(20) NOT NULL,
CUS_PHONE varchar(10) NOT NULL,
CUS_CITY varchar(30) NOT NULL,
CUS_GENDER char
);

create table category(
CAT_ID INT primary key,
CAT_NAME varchar(20) NOT NULL
);

create table product(
PRO_ID INT primary key,
PRO_NAME VARCHAR(20) NOT NULL DEFAULT "Dummy",
PRO_DESC VARCHAR(60),
CAT_ID INT,
foreign key(CAT_ID) references category(CAT_ID)
);
select * from product;

create table supplier_pricing(
PRICING_ID	INT primary key,
PRO_ID INT,
SUPP_ID INT,
foreign key(PRO_ID) references product(PRO_ID),
foreign key(SUPP_ID) references supplier(SUPP_ID),
SUPP_PRICE	INT DEFAULT 0
);
select * from supplier_pricing;


create table orders(
ORD_ID	INT primary key,
ORD_AMOUNT INT NOT NULL,
ORD_DATE DATE NOT NULL,
CUS_ID	INT,
PRICING_ID	INT,
foreign key(CUS_ID) references customer(CUS_ID),
foreign key(PRICING_ID) references supplier_pricing(PRICING_ID)
);
select * from orders;

create table rating(
RAT_ID	INT primary key,
ORD_ID INT,
foreign key(ORD_ID) references orders(ORD_ID),
RAT_RATSTARS INT NOT NULL
);
select * from rating;


/*Inserting values into tables*/

/*-------Supplier Table---------*/
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (1, 'Rajesh Retails', 'Delhi', '1234567890');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (2, 'Appario Ltd.', 'Mumbai', '2589631470');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (3, 'Knome products', 'Banglore', '9785462315');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (4, 'Bansal Retails', 'Kochi', '8975463285');
insert into supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values (5, 'Mittal Ltd.', 'Lucknow', '7898456532');
select * from supplier

/*-------Customer Table-------*/
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (1, 'AAKASH', '9999999999', 'DELHI', 'M');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (2, 'AMAN', '9785463215', 'NOIDA', 'M');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (3, 'NEHA', '9999999999', 'MUMBAI', 'F');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (4, 'MEGHA', '9994562399', 'KOLKATA', 'F');
insert into customer (CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values (5, 'PULKIT', '7895999999', 'LUCKNOW', 'M');

/*-------Category Table-------*/
insert into category values(1, 'BOOKS'); 
insert into category values(2, 'GAMES');
insert into category values(3, 'GROCERIES');
insert into category values(4, 'ELECTRONICS');
insert into category values(5, 'CLOTHES');

/*--------Product Table-------*/
insert into product values(1, 'GTA V', 'Windows 7 and above with i5 processor and 8GB RAM', 2);
insert into product values(2, 'TSHIRT', 'SIZE-L with Black, Blue and White variations', 5);
insert into product values(3, 'ROG LAPTOP', 'Windows 10 with 15inch screen, i7 processor, 1TB SSD', 4);
insert into product values(4, 'OATS', 'Highly Nutritious from Nestle', 3);
insert into product values(5, 'HARRY POTTER', 'Best Collection of all time by J.K Rowling', 1);
insert into product values(6, 'MILK', '1L Toned MIlk', 3);
insert into product values(7, 'Boat Earphones', '1.5Meter long Dolby Atmos', 4);
insert into product values(8, 'Jeans', 'Stretchable Denim Jeans with various sizes and color', 5);
insert into product values(9, 'Project IGI', 'compatible with windows 7 and above', 2);
insert into product values(10, 'Hoodie', 'Black GUCCI for 13 yrs and above', 5);
insert into product values(11, 'Rich Dad Poor Dad', 'Written by RObert Kiyosaki', 1);
insert into product values(12, 'Train Your Brain', 'By Shireen Stephen', 1);

/*-----Supplier_pricing Table----*/
insert into supplier_pricing values(1, 1, 2, 1500);
insert into supplier_pricing values(2, 3, 5, 30000);
insert into supplier_pricing values(3, 5, 1, 3000);
insert into supplier_pricing values(4, 2, 3, 2500);
insert into supplier_pricing values(5, 4, 1, 1000);

/*----Order Table-----*/
insert into orders values(101, 1500, '2021-10-06', 2, 1);
insert into orders values(102, 1000, '2021-10-12', 3, 5);
insert into orders values(103, 30000, '2021-09-16', 5, 2);
insert into orders values(104, 1500, '2021-10-05', 1, 1);
insert into orders values(105, 3000, '2021-08-16', 4, 3);
insert into orders values(109, 3000, '2021-00-10', 5, 3);
insert into orders values(110, 2500, '2021-09-10', 2, 4);
insert into orders values(111, 1000, '2021-09-15', 4, 5);
insert into orders values(114, 1000, '2021-09-16', 3, 5);
insert into orders values(115, 3000, '2021-09-16', 5, 3);

/*---Rating table------*/
insert into rating values(1, 101, 4);
insert into rating values(2, 102, 3);
insert into rating values(3, 103, 1);
insert into rating values(4, 104, 2);
insert into rating values(5, 105, 4);
insert into rating values(9, 109, 3);
insert into rating values(10, 110, 5);
insert into rating values(11, 111, 3);
insert into rating values(14, 114, 5);
insert into rating values(15, 115, 3);

select * from rating

/*4.Display the total number of customers based on gender who have placed orders of worth at least Rs.3000.*/
 SELECT CUS_GENDER, COUNT(*) AS total_customers
FROM customer
WHERE CUS_ID IN (
    SELECT CUS_ID
    FROM orders
    WHERE ORD_AMOUNT >= 3000
    GROUP BY CUS_ID
)
GROUP BY CUS_GENDER; 

/*5.Display all the orders along with product name ordered by a customer having Customer_Id=2*/
select product.pro_name, orders.* from orders, supplier_pricing, product where orders.cus_id=2 and
orders.pricing_id=supplier_pricing.pricing_id and supplier_pricing.pro_id=product.pro_id;

/*6.Display the Supplier details who can supply more than one product.*/
select supplier.* from supplier where supplier.supp_id in 
(select supp_id from supplier_pricing group by supp_id having count(supp_id)>1)
group by supplier.supp_id;

/*7. Find the least expensive product from each category and print the table with category id, name, product name and price of the product */
SELECT c.cat_id, c.cat_name, p.pro_name, sp.supp_price
FROM category c
JOIN product p ON c.cat_id = p.cat_id
JOIN supplier_pricing sp ON p.pro_id = sp.pro_id
WHERE (c.cat_id, sp.supp_price) IN (
    SELECT cat_id, MIN(supp_price)
    FROM product
    JOIN supplier_pricing ON product.pro_id = supplier_pricing.pro_id
    GROUP BY cat_id
);

/*8.Display the Id and Name of the Product ordered after “2021-10-05”.*/
select product.pro_id, product.pro_name from orders inner join supplier_pricing on supplier_pricing.pricing_id=orders.pricing_id inner join product on product.pro_id=supplier_pricing.pro_id where orders.ord_date>"2021-10-05";

/*9. Display customer name and gender whose names start or end with character 'A'. */
select customer.cus_name, customer.cus_gender from customer where customer.cus_name like 'A%' or customer.cus_name like '%A';

/*10. Create a stored procedure to display supplier id, name, Rating(Average rating of all the products sold by every customer) and
Type_of_Service. For Type_of_Service, If rating =5, print “Excellent Service”,If rating >4 print “Good Service”, If rating >2 print “Average
Service” else print “Poor Service”. Note that there should be one rating per supplier.*/

DELIMITER //
CREATE PROCEDURE GetSupplierRatings()
BEGIN
    SELECT s.SUPP_ID, s.SUPP_NAME, AVG(r.RAT_RATSTARS) AS Rating,
    CASE
        WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
        WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
        WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
        ELSE 'Poor Service'
    END AS Type_of_Service
    FROM supplier s
    JOIN supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    JOIN orders o ON sp.PRICING_ID = o.PRICING_ID
    JOIN rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY s.SUPP_ID, s.SUPP_NAME;
END //

DELIMITER ;

CALL GetSupplierRatings();

