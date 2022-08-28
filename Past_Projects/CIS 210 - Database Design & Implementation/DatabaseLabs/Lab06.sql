--Lab06
--Alex Smetana
--CIS220
--10/11
--.25 Extra Credit

--1) Name of consumers having requests for all products?
--1/1 Same as person in class
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE NOT EXISTS (SELECT *
	FROM Tb_Product
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Requests
		WHERE Con_ID = Tb_Consumer.Con_ID
		AND Prod_ID = Tb_Product.Prod_ID))

--2) Name of products requested by all consumers?
--1/1 Same as the person in class. No output.
SELECT Tb_Product.Name
FROM Tb_Product
WHERE NOT EXISTS (SELECT *
	FROM Tb_Consumer
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Requests
		WHERE Prod_ID = Tb_Product.Prod_ID
		AND Con_ID = Tb_COnsumer.Con_ID))

--3) Name of consumers having transactions with all suppliers from Stevens Point?
--1/1 Same as the person in class. No output.
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE NOT EXISTS (SELECT *
			FROM Tb_Supplier
			WHERE Tb_Supplier.City = 'Stevens Point' 
				AND NOT EXISTS (SELECT *
				FROM Tb_Transactions
				WHERE Con_ID = Tb_Consumer.Con_ID
				AND Supp_ID = Tb_Supplier.Supp_ID))

--4) Name of consumers having transactions with all suppliers except maybe those from Stevens Point?
--1/1 Same as person in class. No output.
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE NOT EXISTS (SELECT *
		FROM Tb_Supplier
		WHERE Tb_Supplier.City != 'Stevens Point'
		AND NOT EXISTS (SELECT *
			FROM Tb_Transactions
			WHERE Supp_ID = Tb_Supplier.Supp_ID
			AND Con_ID = Tb_Consumer.Con_ID))

--5) Name of products offered by all suppliers?
--1/1 Same as person in class. No output.
SELECT Tb_Product.Name
FROM Tb_Product
WHERE NOT EXISTS (SELECT *
		FROM Tb_Supplier
		WHERE NOT EXISTS (SELECT *
				FROM Tb_Offers
				WHERE Prod_ID = Tb_Product.Prod_ID
				AND Supp_ID = Tb_Supplier.Supp_ID))

--6) Name of products sold in all cities except Stevens Point?
--.5/1 Same as person in class. Only one instance of consumer.
SELECT Tb_Product.Name
FROM Tb_Product
WHERE NOT EXISTS (SELECT *
		FROM Tb_Consumer
		WHERE Tb_Consumer.City != 'Stevens Point'
		AND NOT EXISTS (SELECT *
			FROM Tb_Transactions
			WHERE Prod_ID = Tb_Product.Prod_ID
			AND Con_ID = Tb_Consumer.Con_ID))

--7) Cities where all products but airplane are requested?
--1/1 Same as Freds in class
SELECT Tb_Consumer.City
FROM Tb_Consumer
	WHERE NOT EXISTS (SELECT *
			FROM Tb_Product
			WHERE Tb_Product.Name != 'Airplane'
			AND NOT EXISTS (SELECT *
				FROM Tb_Requests
				WHERE Con_ID = Tb_Consumer.Con_ID
				AND Prod_ID = Tb_Product.Prod_ID))

--8) Name of consumers having at least one supplier in each supplier city?
--1/1 Same as person in class.
SELECT Name
FROM Tb_Consumer C
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Supplier S
		WHERE NOT EXISTS (SELECT * 
			FROM Tb_Transactions T, Tb_Supplier
			WHERE T.Supp_ID = Tb_Supplier.Supp_ID
			AND T.Con_ID = C.Con_ID
			AND City = S.City))

--9) Name of consumers having at least one supplier in each supplier city except Wausau?
--1/1 Similar to person in class. No output.
SELECT Name
FROM Tb_Consumer C
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Supplier S
		WHERE NOT EXISTS (SELECT * 
			FROM Tb_Transactions T, Tb_Supplier
			WHERE T.Supp_ID = Tb_Supplier.Supp_ID
			AND T.Con_ID = C.Con_ID
			AND City = S.City
			AND S.City <> 'Wausau'))

--10) Name of consumers having purchased all types of products from each and every supplier except for auto and computer from suppliers in Wausau?
--.5/1 Nothing like the person in class. No idea what to give myself
SELECT Tb_Consumer.Name
FROM Tb_Consumer
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Product
			WHERE NOT EXISTS (SELECT *
				FROM Tb_Supplier
					WHERE Tb_Supplier.Name != 'Auto'
					AND Tb_Supplier.Name != 'Computer'
					AND Tb_Supplier.City = 'Wausau'
					AND NOT EXISTS (SELECT *
						FROM Tb_Transactions
						WHERE Prod_ID = Tb_Product.Prod_ID
						AND Supp_ID = Tb_Supplier.Supp_ID
						)))

--11) Product names such that product has been purchased in every city where there was a request for it?
--.5/1 Doesnt even run. Not sure the direction I was headed.
SELECT Tb_Product.Name
FROM Tb_Product
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Requests, Tb_Transactions
			WHERE NOT EXISTS (SELECT *
				FROM Tb_Consumer
				WHERE Prod_ID = Tb_Product.Prod_ID))

--(Extra Credit 1%)  Cities where every consumer has purchased every product?
--.25/1 I attempted it. Very wrong.
SELECT Tb_Consumer.City
FROm Tb_Consumer
	WHERE NOT EXISTS (SELECT *
		FROM Tb_Product
		WHERE Con_ID = Tb_Consumer.Con_ID
		AND Prod_ID = Tb_Product.Prod_ID)
