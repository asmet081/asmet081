--Labo05
--Alex Smetana
--10/28/2021

--11.25/12

--1) Name of consumers that are not from Wausau or Stevens Point?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE Tb_Consumer.City IN (SELECT City
	From Tb_Consumer
	WHERE Tb_Consumer.City NOT IN ('Wausau', 'Stevens Point'))

--2) Name of consumers requesting computers and cars?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE Con_ID IN (
	SELECT Con_ID
	FROM Tb_Requests, Tb_Product
	Where Tb_Product.Prod_ID = Tb_Requests.Prod_ID
	AND Tb_Product.Name = 'Auto')
		AND Con_ID IN (
			SELECT Con_ID
			FROM Tb_Requests, Tb_Product
			Where Tb_Product.Prod_ID = Tb_Requests.Prod_ID
			AND Tb_Product.Name = 'Computer')

--3) Name of consumers not requesting anything?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE Con_ID NOT IN (SELECT DISTINCT Con_ID FROM Tb_Requests)

--4) Name of consumers not requesting computers or cars?
--1/1 I did the demo in class.
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE Con_ID NOT IN (
	SELECT Con_ID
	FROM Tb_Requests, Tb_Product
	Where Tb_Product.Prod_ID = Tb_Requests.Prod_ID
	AND Tb_Product.Name = 'Auto')
		OR Con_ID NOT IN (
			SELECT Con_ID
			FROM Tb_Requests, Tb_Product
			Where Tb_Product.Prod_ID = Tb_Requests.Prod_ID
			AND Tb_Product.Name = 'Computer')

--5) Name of consumers having purchased at least two product types (no aggregate functions!)?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE Con_ID IN (
	SELECT T1.Con_ID
	FROM Tb_Transactions T1, Tb_Transactions T2
	WHERE T2.Con_ID = T1.Con_ID
	AND T1.Prod_ID<>T2.Prod_ID)

--6) Name of consumers requesting only computers?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Consumer.Name
FROM Tb_Consumer
WHERE Con_ID IN (
	SELECT Con_ID
	FROM Tb_Requests, Tb_Product
	Where Tb_Product.Prod_ID = Tb_Requests.Prod_ID
	AND Tb_Product.Name = 'Computer')
		AND Con_ID NOT IN (
			SELECT Con_ID
			FROM Tb_Requests, Tb_Product
			Where Tb_Product.Prod_ID = Tb_Requests.Prod_ID
			AND Tb_Product.Name != 'Computer')

--7) Name of suppliers having at most one consumer (no count)?
--1/1 I think i got it right. Not sure about the output.
SELECT Tb_Supplier.Name
FROM Tb_Supplier
WHERE Supp_ID IN (
	SELECT Supp_ID
	FROM Tb_Transactions, Tb_Consumer
	WHERE Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
	)
		AND Supp_ID NOT IN (
		SELECT Supp_ID
		FROM Tb_Consumer C1, Tb_Consumer C2
		WHERE C1.Con_ID <> C2.Con_ID
		AND C1.Con_ID = C2.Con_ID
		)


--8) Name of products not offered in Chicago?
--1/1 SAME AS PERSON IN CLASS
SELECT Name
FROM Tb_Product
WHERE Prod_ID NOT IN (
	SELECT Prod_ID
	FROM Tb_Offers, Tb_Supplier
	WHERE TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
	AND Tb_Supplier.City = 'Chicago')

--9) Name of products offered in Chicago and sold in Wausau?
--1/1 SAME AS PERSON IN CLASS
SELECT Name
FROM Tb_Product
WHERE Prod_ID IN (
	SELECT Prod_ID
	FROM Tb_Offers, Tb_Supplier
	WHERE TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
	AND Tb_Supplier.City = 'Chicago')
		AND Prod_ID IN (
			SELECT Prod_ID
			FROM Tb_Transactions, Tb_Consumer
			WHERE Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
			AND Tb_Consumer.City = 'Wausau')

--10) Name of suppliers offering both auto and computer, but nothing else?
--1/1 SAME OUTPUT AS PERSON IN CLASS.
SELECT Tb_Supplier.Name
FROM Tb_Supplier
WHERE Supp_ID IN (
	Select Supp_ID
	FROM TB_Offers, Tb_Product
	WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID
	AND Tb_Product.Name = 'Auto')
		AND Supp_ID IN (
		Select Supp_ID
		FROM TB_Offers, Tb_Product
		WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID
		AND Tb_Product.Name = 'Computer')
				AND Supp_ID NOT IN (
				Select Supp_ID
				FROM TB_Offers, Tb_Product
				WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID
				AND Tb_Product.Name != 'Auto'
				AND Tb_Product.Name != 'Computer')


--11) Cities where nothing is offered?
--.75/1 Did it with Supp ID and not city.
SELECT DISTINCT Tb_Supplier.City
FROM Tb_Supplier
WHERE Supp_ID NOT IN (
	SELECT Supp_ID
	FROM TB_Offers, Tb_Product
	WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID)

--12) (Extra Credit – 1%) Products sold in the same cities where auto was sold, but nowhere else?
--.5/1 Doesnt run. I attempted it.
SELECT Tb_Product.Name
FROM Tb_Product
WHERE Prod_ID IN (
	SELECT Prod_ID
	FROM Tb_Product, Tb_Transactions, Tb_Consumer
	WHERE Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
	AND Tb_Product.Name = 'Auto')
		AND Prod_ID NOT IN (
		SELECT Prod_ID
		FROM Tb_Product, Tb_Transactions, Tb_Consumer
		WHERE Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
		AND Tb_Product.Name != 'Auto')