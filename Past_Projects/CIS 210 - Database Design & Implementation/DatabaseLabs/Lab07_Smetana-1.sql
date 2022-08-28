--Lab07
--Alex Smetana
--8/10. Need help grading this one because it was a bad lab for me.
--Was genrous on the grading but probably need to deduct a point or two.

--1) Product name and supplier having the largest offer for that product?
--1/1 Same as person in class
SELECT DISTINCT Tb_Product.Name, Tb_Supplier.Name, TB_Offers.Price
FROM Tb_Product, Tb_Supplier, TB_Offers
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND TB_Offers.Price = (SELECT DISTINCT MAX(TB_Offers.Price)
						FROM Tb_Offers
						WHERE Prod_ID = Tb_Product.Prod_ID)

--2) Supplier name and product for which supplier has the largest offer?
--75/1-Used price instead of quantity
SELECT Tb_Supplier.Name, Tb_Product.Name, Tb_Offers.Price
FROM Tb_Supplier, Tb_Product, TB_Offers
WHERE Tb_Product.Prod_ID = Tb_Offers.Prod_ID
AND Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Price = (SELECT Max(TB_Offers.Price)
							FROM TB_Offers
							WHERE Prod_ID = Tb_Product.Prod_ID)


--3) Product name and city where that product sold at the highest price?
--1/1 Same as peson in class.
	SELECT P.Name, City, Price
	FROM Tb_Product P, Tb_Transactions, Tb_Consumer
	WHERE P.Prod_ID=Tb_Transactions.Prod_ID
  	 AND Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
     AND Price = (SELECT Max(Price)
				FROM Tb_Transactions
				WHERE Prod_ID=P.Prod_ID)

--4) Supplier city and product name that sold at the lowest price in that city?
--.75/1 Not sure did someting wrong.
SELECT DISTINCT Tb_Supplier.City, Tb_Product.Name, Price
FROM Tb_Supplier, Tb_Product, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Prod_ID = Tb_Product.Prod_ID
AND Tb_Transactions.Price = (SELECT DISTINCT MIN(Price)	
					FROM Tb_Transactions
					WHERE Prod_ID=Tb_Product.Prod_ID)

--5) Supplier city and name of the supplier with the most consumers?
--.75/1 Wrong not sure what to take off.
	SELECT S.Name, S.City, COUNT(DISTINCT C.Con_ID)
	FROM Tb_Supplier S, Tb_Transactions, Tb_Consumer C
	WHERE S.Supp_ID=Tb_Transactions.Supp_ID
     AND Tb_Transactions.Con_ID= C.Con_ID
	GROUP BY  S.Name, S.Supp_ID, S.City
	HAVING COUNT(DISTINCT C.Con_ID)>=
				ALL (SELECT COUNT(DISTINCT Tb_Consumer.Con_ID)
 				FROM Tb_Consumer, Tb_Transactions
				WHERE Tb_Transactions.Con_ID= Tb_Consumer.Con_ID
				AND S.Supp_ID=Tb_Transactions.Supp_ID
		 		GROUP BY City)


--6) Product name and supplier who offered that product in largest quantity?
--.5/1 Did it wrong. Not sure.
SELECT DISTINCT Tb_Product.Name, Tb_Supplier.Name, SUM(Tb_Offers.Quantity)
FROM Tb_Product, Tb_Supplier, Tb_Offers
WHERE Tb_Product.Prod_ID = Tb_Offers.Prod_ID
AND Tb_Supplier.Supp_ID = Tb_Offers.Supp_ID
GROUP BY Tb_Product.Name, Tb_Supplier.Name
Having SUM(Quantity) >= ALL (SELECT SUM(Quantity)
								FROM Tb_Offers O2
								WHERE Prod_ID = O2.Prod_ID
								GROUP BY O2.Supp_ID)


SELECT DISTINCT Tb_Product.Name, Tb_Supplier.Name, Max(Tb_Offers.Quantity)
FROM Tb_Product, Tb_Supplier, Tb_Offers
WHERE Tb_Product.Prod_ID = Tb_Offers.Prod_ID
AND Tb_Supplier.Supp_ID = Tb_Offers.Supp_ID
AND Max(Tb_Offers.Quantity) = (SELECT Max(Quantity)
								FROM Tb_Offers
								WHERE Prod_ID = Tb_Offers.Prod_ID)

--7) Product name and supplier city where product is offered in largest quantity?
--1/1 Same as person in calss
SELECT Tb_Product.Name, Tb_Supplier.City, Tb_Offers.Quantity
FROM Tb_Product, Tb_Supplier, Tb_Offers
WHERE Tb_Product.Prod_ID = Tb_Offers.Prod_ID
AND Tb_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Offers.Quantity = (SELECT MAX(Tb_Offers.Quantity)
						FROM Tb_Offers
						WHERE Prod_ID = Tb_Product.Prod_ID)

--8) Product name and supplier who sold that product in largest quantity?
--.75/1 Really not sure what I did wrong. I think my code is mostly correct.
SELECT Tb_Product.Name, Tb_Supplier.Name, SUM(Quantity)
FROM Tb_Product, Tb_Supplier, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
GROUP BY Tb_Product.Name, Tb_Supplier.Name, Tb_Product.Prod_ID
HAVING SUM(Quantity) >= ALL (SELECT SUM(Quantity)
							   FROM Tb_Transactions
							   WHERE Prod_ID = Tb_Transactions.Prod_ID
							   GROUP BY Supp_ID)

--9) Supplier city and product name that sold best (as total transactions value) in that city?
--.75/1 Missing the supplier in the subquery
SELECT Tb_Supplier.City, Tb_Product.Name,  SUM(Price*Quantity)
FROM Tb_Supplier, Tb_Product, Tb_Transactions
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Transactions.Prod_ID = Tb_Product.Prod_ID
GROUP BY Tb_Supplier.City, Tb_Product.Name
HAVING SUM(Price*Quantity) >= ALL (SELECT SUM(Price*Quantity)
								FROM Tb_Transactions T2
								WHERE Prod_ID = T2.Prod_ID
								GROUP BY T2.Con_ID)

--10) Product name and consumer city where product had worst sales (as total transactions value)?
--.75/1 missing the ConID in subquery. Its mostly right
SELECT Tb_Product.Name, Tb_Consumer.City, SUM(Price*Quantity)
FROM Tb_Product, Tb_Consumer, Tb_Transactions
WHERE Tb_Product.Prod_Id = Tb_Transactions.Prod_ID
AND Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
GROUP BY Tb_Product.Name, Tb_Consumer.City
HAVING SUM(Price*Quantity) <= ALL (SELECT SUM(Price*Quantity)
								FROM Tb_Transactions T2
								WHERE Prod_ID = T2.Prod_ID
								GROUP BY T2.Con_ID)

--11) Product name and name of supplier that sold the largest quantity of that product?
--1/1 Same as number 8. Free point.
SELECT Tb_Product.Name, Tb_Supplier.Name, SUM(Tb_Transactions.Quantity)
FROM Tb_Product, Tb_Supplier, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
GROUP BY Tb_Product.Name, Tb_Supplier.Name
HAVING SUM(Tb_Transactions.Quantity) >= ALL (SELECT SUM(T2.Quantity)
										 FROM Tb_Transactions T2
										 WHERE Prod_ID = T2.Prod_ID
										 GROUP BY T2.Supp_ID)


--(Extra Credit) Consumer city and name of the most requested product (as number of requests) in that city?