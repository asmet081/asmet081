--Lab03
--Alex Smetana
--10/12/2021

--FINAL GRADE
--10.15/11 = 87%

--1)   Cities and number of car suppliers in each?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Supplier.City, COUNT(Tb_Supplier.Supp_ID)
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Auto'
GROUP BY Tb_Supplier.City

--2)   Product name and quantity offered in each city?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Supplier.City, Tb_Product.Name, SUM(TB_Offers.Quantity)
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
GROUP BY Tb_Supplier.City, Tb_Product.Name

--3)   Supplier name and quantity of TV she sold in each consumer city?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.City, Tb_Supplier.Name, SUM(Tb_Transactions.Quantity)
FROM Tb_Supplier, Tb_Transactions, Tb_Consumer, Tb_Product
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
AND Tb_Transactions.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'TV'
GROUP BY Tb_Consumer.City, Tb_Supplier.Name

--4)   Supplier city and quantity of milk offered vs quantity of milk sold in that city?
--.9/1 misinterpretted question
--Missing: P.prod_Id = O.offers
SELECT Tb_Supplier.City, SUM(TB_Offers.Quantity), SUM(Tb_Transactions.Quantity)
FROM Tb_Supplier, TB_Offers, Tb_Transactions, Tb_Product
WHERE Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Transactions.Supp_ID = TB_Offers.Supp_ID
AND Tb_Transactions.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Milk'
GROUP BY Tb_Supplier.City


--5)   Cities where more than 4 products have been sold?
--1/1 CORRECT ANSWER
--
SELECT Tb_Supplier.City
FROM Tb_Supplier, Tb_Product, Tb_Transactions
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Transactions.Prod_ID = Tb_Product.Prod_ID
GROUP BY Tb_Supplier.City
HAVING Count(Tb_Transactions.Prod_ID) > 4

--6)   Cities where there are at least 3 consumers?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.City
FROM Tb_Consumer
GROUP BY Tb_Consumer.City
HAVING Count(Tb_Consumer.Con_ID) > 3

--7)   Consumer cities where quantity of milk sold is less than the quantity of milk requested? 
--1/1 SAME AS PERSON IN CLASS.
SELECT Tb_Consumer.City
FROM Tb_Consumer, Tb_Requests, Tb_Product, Tb_Transactions
WHERE Tb_Consumer.Con_ID = Tb_Requests.Con_ID
AND Tb_Requests.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Product.Name = 'Milk'
GROUP BY Tb_Consumer.City
HAVING SUM(Tb_Transactions.Quantity) < SUM(Tb_Requests.Quantity)

--8)   Supplier-consumer cities and value of computers sold by suppliers in the first city to consumers in the second city?
--.75/1 HAD AN EXTRA LINE. FIXED.
SELECT Tb_Supplier.City, Tb_Consumer.City, SUM(Tb_Transactions.Quantity * Tb_Transactions.Price)
FROM Tb_Supplier, Tb_Consumer, Tb_Transactions, Tb_Product
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Product.Name = 'Computer'
--AND Tb_Supplier.City = Tb_Consumer.City
GROUP BY Tb_Supplier.City, Tb_Consumer.City

--9)   Supplier-consumer-product names such that supplier is selling product to consumer with total value of transactions between supplier and consumer for given product?
--1/1 SAME AS PERSON IN CLASS.
SELECT Tb_Supplier.Name, Tb_Consumer.Name, Tb_Product.Name, SUM(Tb_Transactions.Quantity * Tb_Transactions.Price)
FROM Tb_Supplier, Tb_Consumer, Tb_Product, Tb_Transactions
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Supplier.Supp_ID = Tb_Consumer.Con_ID
GROUP BY Tb_Supplier.Name, Tb_Consumer.Name, Tb_Product.Name

--10) Supplier-consumer cities and product names such that suppliers in first city are selling product to consumers in second city with total value of transactions between cities for given product?
--.75/1 I HACE AN EXTRA LINE. NOT SURE WHAT TO GRADE.
SELECT Tb_Supplier.City, Tb_Consumer.City, Tb_Product.Name, SUM(Tb_Transactions.Quantity * Tb_Transactions.Price)
FROM Tb_Supplier, Tb_Consumer, Tb_Product, Tb_Transactions
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Consumer.City = Tb_Supplier.City
GROUP BY Tb_Supplier.City, Tb_Consumer.City, Tb_Product.Name

--11) Comparative list of supplier or consumer cities with respective number of suppliers and consumers in each city (columns are City, NumberOfSuppliers, NumberOfConsumers)?(Extra Credit – 1%) For each product
--.75/1 NOT SURE WHER I WENT WRONG. GUESSING ON POINTS OFF.
SELECT Tb_Supplier.City, COUNT(Tb_Supplier.Supp_ID), Tb_Consumer.City, COUNT(Tb_Consumer.Con_ID)
FROM Tb_Consumer, Tb_Supplier, Tb_Transactions
WHERE Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
GROUP BY Tb_Supplier.City, Tb_Consumer.City