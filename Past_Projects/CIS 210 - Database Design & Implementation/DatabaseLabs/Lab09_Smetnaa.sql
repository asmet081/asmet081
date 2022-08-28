--Alex Smetana
--Lab09
--12/05/2021

--10.25/11 This lab was rough. I belive I did most of the lab correct but could use help with the grading

--1) List of all products and number of transactions for each (0 if no transactions)?
--1/1 SAME AS PERSON IN CLASS
SELECT Tb_Product.Name, isnull (count(Tran_ID),0)
FROM Tb_Product Left JOIN Tb_Transactions
ON Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
GROUP BY Tb_Product.Name

---2) List of all requested products and number of transactions for each (0 if no transactions)?
--1/1 SAME RESULT AS PERSON IN CLASS
SELECT Tb_Product.Name, isnull (Count(Tran_ID),0)
FROM Tb_Requests Left Join (Tb_Product Inner Join Tb_Transactions ON Tb_Product.Prod_ID  = Tb_Transactions.Prod_ID) 
ON Tb_Requests.Prod_ID = Tb_Product.Prod_ID
GROUP BY Tb_Product.Name

--3) List of all consumers and total quantity of each product purchased by consumer (0 if none)?
--.75/1 Missed an extra column
SELECT Tb_Consumer.Name, isnull (SUM(Quantity),0)
FROM Tb_Consumer Left Join (Tb_Transactions Inner Join Tb_Product ON Tb_Product.Prod_ID = Tb_Transactions.Prod_ID) 
ON Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
Group By TB_Consumer.Name

--4) List  of  all  suppliers  from  Wausau  and  number  of  consumers  for  each  (0  if  no consumers)?
--1/1 Same as person in class
SELECT Tb_Supplier.Name, isnull (Count(Tb_Consumer.Con_ID),0)
FROM Tb_Supplier Left Join (Tb_Transactions  Inner Join Tb_Consumer ON Tb_Transactions.Con_ID = Tb_Consumer.Con_ID) 
ON Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Supplier.City = 'Wausau'
GROUP BY Tb_Supplier.Name

--5) List  of  all  suppliers  and  number  of  consumers  for  the  suppliers  in  Wausau  (0  if  no consumers or supplier not from Wausau)?
--1/1 SAME AS PERSON IN CLASS 
SELECT Tb_Supplier.Name, isnull (Count(Tb_Consumer.Con_ID),0)
FROM Tb_Supplier Left Join (Tb_Transactions  Inner Join Tb_Consumer ON Tb_Transactions.Con_ID = Tb_Consumer.Con_ID) 
ON Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
WHERE Tb_Consumer.City = 'Wausau'
GROUP BY Tb_Supplier.Name

--6) List of all suppliers and number of consumers each has in Wausau?
--1/1 SAME AS PERSON IN CLASS 
SELECT Tb_Supplier.Name, Count(Tb_Consumer.Con_ID)
FROM Tb_Supplier Left Join (Tb_Transactions  Inner Join Tb_Consumer ON Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
AND Tb_Consumer.City = 'Wausau') 
ON Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
GROUP BY Tb_Supplier.Name

--7) List of all products and number of suppliers offering product and number of consumers requesting product?
--.25/1 Didnt finsih it
SELECT Tb_Product.Name, COUNT(Supp_ID), --COUNT(Tb_Consumer.Con_ID)
FROM Tb_Product Left Join Tb_Offers Left Join Tb_Supplier ON

GROUP BY Tb_Product.Name

--8) Consumer-Product pairs and number of requests of consumer for product (0 if none)?
--1/1 
SELECT Tb_Product.Name, Tb_Consumer.City, COUNT(DISTINCT Tb_Requests.Con_ID) As 'Number of Requests'
FROM Tb_Product Left JOIN (Tb_Requests Inner Join Tb_Consumer ON Tb_Requests.Con_ID = Tb_Consumer.Con_ID ) 
ON Tb_Product.Prod_ID = Tb_Requests.Prod_ID
GROUP BY Tb_Product.Name, Tb_Consumer.City

--9) List of all consumer cities and amount of TV and computer sold in each?
--1/1
SELECT Tb_Consumer.City, isnull(Count(Tb_Product.Prod_ID),0)
FROM Tb_Consumer Left Join (Tb_Transactions Inner Join Tb_Product ON Tb_Transactions.Prod_ID = Tb_Product.Prod_ID)  
ON Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Product.Name = 'TV' OR Tb_Product.Name = 'Computer'
GROUP BY Tb_Consumer.City

--10) List of consumers from Madison and number of computer requests for each (0 if no requests)?
--1/1
SELECT Tb_Consumer.Name, isnull(Count(Tb_Product.Prod_ID),0)
FROM Tb_Consumer Left Join (Tb_Requests Inner Join Tb_Product ON Tb_Requests.Prod_ID = Tb_Product.Prod_ID AND Tb_Product.Name = 'Computer')
ON Tb_Consumer.Con_Id = Tb_Requests.Con_ID
AND Tb_Consumer.City = 'Madison'
GROUP BY Tb_Consumer.Name

--11) List  of  all  products  requested  in  Wausau  with  number  of  requests  and  number  of transactions with consumers in Wausau for each (0 if none)?
--1/1 Didnt understand how to do it. Did it the other way
SELECT Tb_Product.Name, COUNT(DISTINCT Tb_Requests.Con_ID) As 'Products Requested in Wausau', COUNT(DISTINCT Tb_Transactions.Prod_ID) 'Number of Transactions'
FROM Tb_Product, Tb_Requests, Tb_Consumer,Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID
AND Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Consumer.City = 'Wausau'
GROUP BY Tb_Product.Name
