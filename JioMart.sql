create database JioMart
use JioMart
--create tables
--create UserDetails table
create table UserDetails (
UserDetailsId int identity(1,1),
UserFirstName varchar(20),
UserLastName varchar(20),
UserAddress varchar(100),
UserMobileNo varchar(15),
UserWalletBalance float,
CreatedOn datetime default getdate(),
UpdatedOn datetime default getdate()
)
--drop table UserDetails
--exec sp_rename 'UserDetails.UserMobileno', 'UserMobileNo'
--create Category Table
create table Category(
CategoryId int identity(10001,1),
CategoryName varchar(20),
CreatedOn datetime default getdate(),
UpdatedOn datetime default getdate()
)
--drop table Category
--create Productname Table
create table ProductDetails(
ProductDetailsId int identity(11,1),
ProductName varchar(40),
ProductPrice float,
ProductStockQuantity int,
CategoryId int,
CreatedOn datetime default getdate(),
UpdatedOn datetime default getdate()
)
--Drop table ProducDetails
--alter table ProductName add ProductQuantity int
--exec sp_rename 'Productname.[ProductName.ProductQuantity]','ProductQuantity'
--create table CartDetails
Create table JioMart.CartDetails(
CartDetailsId int identity(101,1),
ProductDetailsId int,
ProductQuantity int,
CartTotalPrice float,
CartOrderStatus varchar(15) default 'Not Complete',
UserDetailsId int,
CreatedOn datetime default getdate(),
UpdatedOn datetime default getdate()
)

--crete OrderDetails Table
create table JioMart.OrderDetails(
OrderDetailsId int identity(1,1),
CartDetailsId int,
OrderPaymentMode varchar(10),
OrderTotalPrice int,
OrderDeliveryStatus varchar(10) default 'InProgress',
OrderDate datetime default getdate(),
Createdon datetime default getdate(),
Updatedon datetime default getdate()
)
--drop table jioMart.Orderdetails
---table created successfully
------------------------------------------------------------------------------
--Now create Store procedure for insert update delete and select 
--insert data into UserDetails Table using store Procedure
exec jIOmART.InsertUserDetails 1,'Rajesh','Patel','Madana(gadh),Palanpur','1234567890',1000,'u'
exec jIOmART.InsertUserDetails 0,'Aman','Gupta','Kalol,Gandhinagar','1237894560',0,'I'
exec jIOmART.InsertUserDetails 0,'Karan','Shah','Income tex,Ahmedabad','8974561230',0,'I'
exec jIOmART.InsertUserDetails 0,'Pankaj','Gawai','Malad,Mumbai','4568795890',0,'I'
exec jIOmART.InsertUserDetails 0,'Pankaj','Gawai','Malad,Mumbai','4568795890',0,'y'
--truncate table UserDetails

--insert data into Category TableFruits & Vegetables,Books,Home Care
exec JioMart.InsertCategory 0,'Groceries','I'
exec JioMart.InsertCategory 0,'Home & Kichen','I'
exec JioMart.InsertCategory 0,'Fashion','I'
exec JioMart.InsertCategory 0,'Electronics','I'
exec JioMart.InsertCategory 0,'Electronics','k'
----------------------------------------------------------------------

--insert data into pRODUctDetails Table
EXEC JioMart.InsertProductDetails 11,'Surf excel matic liquid',37,100,10001,'U'
EXEC JioMart.INSERTPRODUCTDetails 0,'Arial matic liquid',318,100,10001,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Parachute coconate oil',280,100,10001,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Tata tea premium 1kg',395,100,10001,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'parle-G goldBiscuits',116,100,10001,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Plastic cloth clips 12',124,100,10002,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Plastic mug pack(4)',85,100,10002,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Folding Table',512,100,10002,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Single Mattress',450,100,10002,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Disposable paper cup (12)',156,100,10002,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Backpack with rain cover',336,100,10003,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'UV protected glass',289,100,10003,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'T-shirt for men',199,100,10003,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'finger-ring',89,100,10003,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Spark shoe',599,100,10003,'I'
EXEC JioMart.INSERTPRODUCTDetails 0,'Campus shoe',690,100,10003,'I'
-----------------------------------------------------------------
--insert data into cartdetails
EXEC JioMart.InsertCartDetails 0,11,2,624,1,'I'
EXEC JioMart.InsertCartDetails 0,13,1,280,1,'I'
EXEC JioMart.InsertCartDetails 0,18,1,512,1,'I'
EXEC JioMart.InsertCartDetails 0,17,1,85,2,'I'
EXEC JioMart.InsertCartDetails 0,11,2,624,2,'I'
EXEC JioMart.InsertCartDetails 0,19,2,900,2,'I'
EXEC JioMart.InsertCartDetails 0,24,1,89,2,'I'
EXEC JioMart.InsertCartDetails 0,21,1,336,3,'I'
EXEC JioMart.InsertCartDetails 0,23,2,398,3,'I'
EXEC JioMart.InsertCartDetails 0,25,1,599,3,'I'
EXEC JioMart.InsertCartDetails 0,11,2,624,3,'I'
-----------------------------------------------------------------
--truncate table JioMart.OrderDetails
--insert data into orderdetails table
insert into Jiomart.OrderDetails values(101,'UPI',624,default,getdate(),Getdate(),getdate())
insert into Jiomart.OrderDetails values(102,'UPI',280,default,getdate(),Getdate(),getdate())
insert into Jiomart.OrderDetails values(102,'Wallet',0,default,getdate(),Getdate(),getdate())
/*

insert into Orderdetails values(10,11,'2023-08-12 17:28:28.003','2023-08-10 17:28:28.003','2023-08-10 17:28:28.003')
insert into Orderdetails values(10,16,'2023-08-12 17:28:28.003','2023-08-10 17:28:28.003','2023-08-10 17:28:28.003')
insert into Orderdetails values(10,21,'2023-08-12 17:28:28.003','2023-08-10 17:28:28.003','2023-08-10 17:28:28.003')
insert into Orderdetails values(10,12,'2023-08-12 17:28:28.003','2023-08-10 17:28:28.003','2023-08-10 17:28:28.003')
insert into Orderdetails values(10,19,'2023-08-10 01:28:28.003','2023-08-10 01:28:28.003','2023-08-10 01:28:28.003')
insert into Orderdetails values(10,18,'2023-08-10 01:28:28.003','2023-08-10 01:28:28.003','2023-08-10 01:28:28.003')
insert into Orderdetails values(10,23,'2023-08-10 01:28:28.003','2023-08-10 01:28:28.003','2023-08-10 01:28:28.003')
insert into Orderdetails values(10,22,'2023-08-10 01:28:28.003','2023-08-10 01:28:28.003','2023-08-10 01:28:28.003')
insert into Orderdetails values(10,11,'2023-08-10 01:28:28.003','2023-08-10 01:28:28.003','2023-08-10 01:28:28.003')
insert into Orderdetails values(10,13,getdate(),getdate(),getdate())
insert into Orderdetails values(10,17,getdate(),getdate(),getdate())
insert into Orderdetails values(10,17,getdate(),getdate(),getdate())
insert into Orderdetails values(10,12,getdate(),getdate(),getdate())
insert into Orderdetails values(10,11,getdate(),getdate(),getdate())
insert into Orderdetails values(10,15,getdate(),getdate(),getdate())
insert into Orderdetails values(10,19,getdate(),getdate(),getdate())
insert into Orderdetails values(10,20,getdate(),getdate(),getdate())
insert into Orderdetails values(10,12,getdate(),getdate(),getdate())
insert into Orderdetails values(10,25,getdate(),getdate(),getdate())
insert into Orderdetails values(10,22,getdate(),getdate(),getdate())
insert into Orderdetails values(10,14,getdate(),getdate(),getdate())
--TRUNCATE TABLE ORDERDETAILS
*/
-----------------------------------------------------------------------------
/*
insert into Details(UserDetailsId,ProductNameId)
select UD.UserDetailsId,PN.ProductDetailsId from UserDetails as UD
cross join ProductDetails as PN
*/
--create schema JioMart
select * from JioMart.UserDetails
select * from JioMart.Category
select * from JioMart.ProductDetails
select * from JioMart.CartDetails
select * from JioMart.OrderDetails

-----------------------------==========================
--========================================================
--Quieries using aggregate function
--user total order price
select sum(PN.ProductPrice)as user_total_order_price,UD.UserName
from OrderDetails as OD
inner join UserDetails as UD on OD.UserDetailsId = UD.UserDetailsId
inner join ProductName as PN on OD.ProductNameId = PN.ProductNameId
group by UD.UserName
having UD.UserName = 'Rajesh'

----Avg PRICE VALUE FOR PARTICULAR VALUE
select AVG(PN.ProductPrice) AS AVGPRICE,C.CategoryName 
from ProductName as PN
inner join Category aS C ON C.CategoryId=PN.CategoryId
GROUP BY C.CategoryName

----STDEV of price
select STDEV(DISTINCT ProductPrice) as distinct_value,STDEV(ProductPrice) as all_value
from ProductName as PN
inner join Category as C on C.CategoryId = PN.CategoryId
group by C.CategoryName;


--STDEV of price
select STDEVP(DISTINCT ProductPrice) as distinct_value,STDEVP(ProductPrice) as all_value
from ProductName as PN
inner join Category as C on C.CategoryId = PN.CategoryId
group by C.CategoryName;

--Var in price
select var(DISTINCT ProductPrice) as distinct_value,var(ProductPrice) as all_value
from ProductName as PN
inner join Category as C on C.CategoryId = PN.CategoryId
group by C.CategoryName;



---COUNT_big
/*
COUNT_BIG(*) returns the number of items in a group. This includes NULL values and duplicates.

COUNT_BIG (ALL expression) evaluates expression for each row in a group, and returns the number of nonnull values.

COUNT_BIG (DISTINCT expression) evaluates expression for each row in a group, and returns the number of unique, nonnull values.

COUNT_BIG is a deterministic function when used without the OVER and ORDER BY clauses. 
COUNT_BIG is nondeterministic when used with the OVER and ORDER BY clauses. 
See Deterministic and Nondeterministic Functions for more information.
*/

SELECT COUNT_BIG(*) FROM Category as C
left join ProductName as PN on C.CategoryId = PN.CategoryId


SELECT COUNT_BIG(PN.ProductName) FROM Category as C
left join ProductName as PN on C.CategoryId = PN.CategoryId


--error
SELECT first(ProductDetails.ProductName) from ProducDdetails
group by CategoryId
--ERROR
select RANK(12,1) within group(order by ProductNameId,UserDetailsId) from OrderDetails

select RANK(1000, 500) WITHIN GROUP (ORDER BY salary, bonus) from employees


