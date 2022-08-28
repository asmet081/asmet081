--9.7/10
--Alex Smetana

--1) Name of suppliers from Wausau or offering computers or offering oranges?
--.8/1. Misinterpretted question. Needs to be and rather than the or that is included.
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Product, TB_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Supplier.City = 'Wausau'
OR Tb_Product.Name = 'Computer'
UNION
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Product, TB_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Supplier.City = 'Wausau'
OR Tb_Product.Name = 'Oranges'

--2) Name of suppliers who do not have an offer?
--1/1 Same as result person in classroom.
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier
EXCEPT
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Product, TB_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID

--3) Name of suppliers offering cars and computers?
--1/1 Same as person in class
SELECT Tb_Supplier.Name
FROM Tb_Supplier, TB_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Computer'
INTERSECT
SELECT Tb_Supplier.Name
FROM Tb_Supplier, TB_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Auto'

--4) Cities where neither cars nor computers are offered?
--1/1 Same result as person in calss
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Supplier
EXCEPT
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Supplier, TB_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Auto'
EXCEPT
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Supplier, TB_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Computer'

--5) Name of suppliers offering only cars and computers?
--.8/1 missing a final intersection. The rest is correct
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, TB_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Auto'
INTERSECT
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, TB_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Computer'

--6) Name of products not offered in Chicago?
--1/1 Same result as person in class
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product
EXCEPT
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Supplier.City = 'Chicago'

--7) Name of products offered in Chicago, but not requested in Madison?
--1/1 Same result as person in class
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Supplier.City = 'Chicago'
EXCEPT 
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Requests, Tb_Consumer
WHERE Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID
AND Tb_Consumer.City = 'Madison'

--8) Number of products sold both in Chicago and in Madison?
--.8/1 I need input because this question was confusing
--
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Transactions, Tb_Supplier
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Supplier.City =  'Chicago'
INTERSECT
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Transactions, Tb_Supplier
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Supplier.City =  'Madison'

--9) Name of suppliers that sold only cars and computers and only in Madison?
--.8/1 Confusing 
SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Auto'
INTERSECT
SELECT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Offers, Tb_Product
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name = 'Computer'
INTERSECT
SELECT Tb_Supplier.Name
FROM Tb_Supplier
WHERE Tb_Supplier.City = 'Madison'

--10) Name of products sold in Chicago, but not requested in Madison?
--1/1 Same as person in class.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Supplier.City = 'Chicago'
EXCEPT
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Requests, Tb_Consumer
WHERE Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID
AND Tb_Consumer.City = 'Madison'

--11) Name of suppliers that sold at most one product type (no count)?
--.5/1 No clue what to take off.
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Product, Tb_Supplier, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Transactions.Quantity <= 1

--(Extra Credit – 1%) Supplier cities where none of the suppliers has any offer
--1/1 
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Supplier, TB_Offers
EXCEPT
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Supplier, TB_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID