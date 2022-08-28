--ALEX SMETANA
--LAB_01
--CIS210
--09/28/2021

--6.9/10

--+1
--1 Name of consumers having at least one request.
SELECT DISTINCT Tb_Consumer.Name
FROM Tb_Consumer, Tb_Requests
WHERE Tb_Consumer.Con_ID = Tb_Requests.Con_ID

--+1
--2 Name of products offered in Wausau.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
  AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
  AND Tb_Supplier.City = 'Wausau'

--+1
--3 Name of products requested in Wausau, New York, London or Chicago.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Requests, Tb_Consumer
WHERE Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID
AND City = 'Wausau' or City =  'New York' or City = 'London' or City = 'Chicago'

--+(.5)
--4 Name of cities where at least one product is offered.
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = TB_Offers.Supp_ID

--+(.5)
--5 Names of products requested by at least one consumer.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Requests, Tb_Consumer
WHERE Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID

--+(.5)
--6 Supplier names and consumer names such that they have at least one transaction.
SELECT DISTINCT Tb_Supplier.Name, Tb_Consumer.Name
FROM Tb_Supplier, Tb_Consumer, Tb_Transactions
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Consumer.Con_ID

--+(.5)
--7 Supplier city and consumer city such that there is at least one transaction between a supplier and a consumer from the two cities.
SELECT DISTINCT Tb_Supplier.City, Tb_Consumer.City
FROM Tb_Supplier, Tb_Consumer, Tb_Transactions
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Consumer.City = Tb_Supplier.City

--+(.3)
--8 Name of products offered by at least two suppliers.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier S1, Tb_Supplier S2
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND Tb_Offers.Supp_ID = S1.Supp_ID
AND S1.Supp_ID < S2.Supp_ID

SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers O1, TB_Offers O2
WHERE Tb_Product.Prod_ID = O1.Prod_ID
AND Tb_Product.Prod_ID = O2.Prod_ID
AND O1.Supp_ID < O2.Supp_ID

--+1
--9 Name of suppliers from Wausau that have sold computers in Chicago.
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Transactions, Tb_Consumer
WHERE Tb_Supplier.City = 'Wausau'
AND Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Consumer.City = 'Chicago'

--+(.3)
--10 Cities where at least one product is offered and requested.
SELECT DISTINCT Tb_Consumer.City
FROM TB_Offers, Tb_Requests, Tb_Product, Tb_Consumer
WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Prod_ID = Tb_Consumer.Con_ID

--+(.3)
--11 Cities where product auto is both offered and requested.
SELECT DISTINCT Tb_Consumer.City
FROM TB_Offers, Tb_Requests, Tb_Product, Tb_Consumer
WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Prod_ID = Tb_Consumer.Con_ID
AND Tb_Product.Name = 'Auto'