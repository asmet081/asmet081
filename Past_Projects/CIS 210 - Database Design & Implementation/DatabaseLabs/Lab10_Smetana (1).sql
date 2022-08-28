--Alex Smetana
--Lab10
--12/07/2021

--1) Supplier cities and amount of auto, trucks, TV and airplanes offered in each city?
 SELECT Tb_Supplier.City "Supplier City",
SUM(CASE
WHEN Tb_Product.Name='Auto' THEN Quantity
ELSE 0
  END) "Auto Offered",
 SUM(CASE
WHEN Tb_Product.Name='Truck' THEN Quantity
ELSE 0
  END) "Truck Offered",
SUM(CASE
WHEN Tb_Product.Name='TV' THEN Quantity
ELSE 0
  END) "TV Offered",
SUM(CASE
WHEN Tb_Product.Name='Airplane' THEN Quantity
ELSE 0
  END) "Airplane Offer"
FROM Tb_Supplier,Tb_Transactions,Tb_Product
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID
       AND Tb_Transactions.Prod_ID= Tb_Product.Prod_ID
GROUP BY Tb_Supplier.City 

--2) For each product list the total quantities purchased in the of the following cities: Wausau, Chicago, Madison, New York?
SELECT Tb_Product.Name,
SUM(CASE
WHEN Tb_Consumer.City='Wausau' THEN Quantity
ELSE 0
  END) "Wausau",
SUM(CASE
WHEN Tb_Consumer.City='Chicago' THEN Quantity
ELSE 0
  END) "Chicago",
SUM(CASE
WHEN Tb_Consumer.City='Madison' THEN Quantity
ELSE 0
  END) "Madison",
SUM(CASE
WHEN Tb_Consumer.City='New York' THEN Quantity
ELSE 0
  END) "New York"
FROM Tb_Product, Tb_Transactions, Tb_Consumer
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
GROUP BY Tb_Product.Name

--3) Supplier-consumer pairs having at least one transaction and values for oil, orange, and TV traded between the two?
SELECT Tb_Supplier.Name, Tb_Consumer.Name,
SUM(CASE
WHEN Tb_Product.Name = 'Orange' AND Tb_Transactions.Prod_ID >= 1 THEN Price*Quantity
ELSE 0
  END) "Orange Total",
SUM(CASE
WHEN Tb_Product.Name = 'Oil' AND Tb_Transactions.Prod_ID >= 1 THEN Price*Quantity
ELSE 0
 END) "Oil Total",
SUM(CASE
WHEN Tb_Product.Name = 'TV' AND Tb_Transactions.Prod_ID >= 1 THEN Price*Quantity
ELSE 0
  END) "TV Total"
FROM Tb_Supplier, Tb_Consumer, Tb_Transactions, Tb_Product
WHERE Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
AND Tb_Transactions.Prod_ID = Tb_Product.Prod_ID
GROUP BY Tb_Supplier.Name, Tb_Consumer.Name

--4) Suppliers located in Wausau or Chicago or having less then 3 offers or not having offers for trucks?
SELECT DISTINCT Tb_Supplier.Name, Tb_Supplier.City, SUM(Tb_Offers.Prod_ID), Tb_Product.Name,
(CASE
WHEN Tb_Supplier.City = 'Wausau' Or Tb_Supplier.City = 'Chicago' THEN 'YES'
WHEN SUM(Tb_Offers.Prod_ID) < 3 THEN 'YES'
WHEN Tb_Product.Name != 'TRUCK' THEN 'YES'
ELSE 'NO'
END) "Yes OR NO"
FROM Tb_Supplier, Tb_Product, Tb_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND Tb_Offers.Prod_ID = Tb_Product.Prod_ID
GROUP BY Tb_Supplier.Name, Tb_Supplier.City, Tb_Offers.Prod_ID, Tb_Product.Name

--5) For  each  product  list  quantity  sold  by  suppliers  in  Madison  to  consumers  in Chicago  versus  quantity  sold  by  suppliers  in  Chicago  to  consumers  in  Madison (result columns will be: product name, quantity Madison_Chicago, quantity Chicago_Madison)?
--6) Reduce by 5% the price of all offers for airplanes.
	UPDATE Tb_Offers
	SET Price=0.95*Price
		WHERE Prod_ID IN (SELECT Prod_ID
			FROM Tb_Product
			WHERE Name='Airplane')
--7) Increase by 15% the price of all offers made by suppliers located in Chicago.
	UPDATE Tb_Offers
	SET Price=1.15*Price
	WHERE Prod_ID IN (SELECT Prod_ID
			FROM Tb_Product) 
			AND Supp_ID IN(SELECT Supp_ID
			FROM Tb_Supplier
			WHERE Tb_Supplier.City = 'Chicago')

--8) Increase  by  10%  the  price  of  all  offers  for  products  offered  by  less  than  3 suppliers.
	UPDATE Tb_Offers
	SET Price=1.10*Price
	WHERE Supp_ID IN (SELECT Supp_ID
			FROM Tb_Supplier
			WHERE Tb_Supplier.Supp_ID < 3)

--9) Modify requests prices as follows: increase by 9% the request prices for computers in cities where there is only one computer supplier, increase by 4.5% requests  prices  for  TV  and  auto  and  reduce  by  7.5%  request  prices  for  oil  if request is made by consumer in Chicago.
UPDATE Tb_Requests SET Price=
CASE
WHEN Prod_ID IN (SELECT Prod_ID FROM Tb_Product 
WHERE Name='Computer') THEN 1.09

WHEN Prod_ID IN (SELECT Prod_ID FROM Tb_Product
WHERE Name IN ('TV', 'Auto') ) THEN 1.045

WHEN Prod_ID IN (SELECT Prod_ID FROM Tb_Product
WHERE Name='Oil') AND 
            Con_ID IN (SELECT Con_ID FROM Tb_Consumer
WHERE City='Chicago') THEN 0.925
ELSE 1
END*Price


--10) Increase  by  40%  the offer price  of  all products  for which  demand  is  higher than the offer (the quantity requested is higher than the quantity offered).
	UPDATE Tb_Offers
	SET Price=1.40*Price
	WHERE Supp_ID IN (SELECT Supp_ID
			FROM Tb_Offers, Tb_Requests
			WHERE Tb_Requests.Prod_ID > Tb_Offers.Quantity)