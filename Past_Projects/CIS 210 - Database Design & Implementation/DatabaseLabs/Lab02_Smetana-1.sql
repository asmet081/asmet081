--Lab02
--Alex Smetana
--10/03/2021

--9.5/10 Was very confused on a few problems whether they were correct or not. Please go back and check my querys.
--This is probably within 3 points of error.





--1)   List of transactions for computers with suppliers in Madison and consumer Fisher from Wausau (supplier name, transaction price, quantity and value)
--(.7) Missing value and computer
--Misunderstood the value name. Class discussion. Same points as the person in class.
SELECT Tb_Supplier.Name, Tb_Transactions.Price, Tb_Transactions.Quantity
FROM Tb_Transactions, Tb_Supplier, Tb_Consumer
WHERE Tb_Transactions.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Transactions.Con_ID = Tb_Consumer.Con_ID
AND Tb_Supplier.City = 'Madison'
AND Tb_Consumer.City = 'Wausau'
AND Tb_Consumer.Name = 'Fisher'


--Add bot of these
--FROM Tb_Product
--And Tb_Product.Name = 'computer'


--2)   Name of suppliers offering milk, auto, truck or orange?
--(1)
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Product, TB_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Name IN ('milk', 'orange' , 'auto', 'truck')

--3)   Name of suppliers from Wausau or offering computers or offering oranges?
--(1)? It was confusing in class but I believe I did it correctly. I dont know if have a () change it differently? The examples online used them so i don't understand.
--I need help for this one. The wording was very confusing.

SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Product, TB_Offers
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND (Tb_Product.Name IN ('computer' , 'orange')
OR Tb_Supplier.City = 'Wausau')


--4)   List of product names offered by Herman or Wolf?
--(1)
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Supplier.Name IN ('Wolf', 'Herman')


--5)   Cities where both computers and TVs are requested?
--(1) Also not positive went very quick in class. Possible points off.
SELECT DISTINCT Tb_Consumer.City
FROM Tb_Product P1, Tb_Product P2, Tb_Requests R1, Tb_Requests R2, Tb_Consumer
WHERE Tb_Consumer.Con_ID = R1.Con_ID
AND Tb_Consumer.Con_ID = R1.Con_ID
AND R1.Prod_ID = P1.Prod_ID
AND R2.Prod_ID = P2.Prod_ID
AND P1.Name = 'Computer' 
AND P2.Name = 'TV'

--6)   List of consumers that could buy auto in their own city?
--(1) Done as the same as person in class.
SELECT DISTINCT Tb_Consumer.Name
FROM Tb_Consumer, Tb_Requests, Tb_Product, TB_Offers, Tb_Supplier
WHERE Tb_Consumer.Con_ID = Tb_Requests.Con_ID
AND Tb_Requests.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID
AND Tb_Product.Name = 'auto'
AND Tb_Consumer.City = Tb_Supplier.City


--7)   Name of suppliers offering computer, auto and orange?
--(1) Same as person in class.
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, Tb_Product P1, Tb_Product P2, Tb_Product P3, TB_Offers O1, TB_Offers O2, TB_Offers O3
WHERE Tb_Supplier.Supp_ID = O1.Supp_ID
AND Tb_Supplier.Supp_ID = O2.Supp_ID
AND Tb_Supplier.Supp_ID = O3.Supp_ID
AND O1.Prod_ID = P1.Prod_ID
AND O2.Prod_ID = P2.Prod_ID
AND O3.Prod_ID = P3.Prod_ID
AND P1.Name = 'computer'
AND P2.Name = 'orange' 
And P3.Name = 'auto'

--8)   Name of suppliers selling computers in at least two consumer cities?
--(.5)? I have no idea where to start correcting this. Wrong answer. Missing some code i think.
SELECT DISTINCT Tb_Supplier.Name
FROM Tb_Supplier, TB_Offers, Tb_Product, Tb_Requests, Tb_Consumer C1, Tb_Consumer C2
WHERE Tb_Supplier.Supp_ID = TB_Offers.Supp_ID
AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Prod_ID = Tb_Requests.Prod_ID
ANd Tb_Requests.Con_ID = C1.Con_ID
AND C1.City < C2.City
AND Tb_Product.Name = 'computer'


--9)   Name of products that are both requested and offered?
--(.8) Have a extra line.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, Tb_Requests, TB_Offers
WHERE TB_Offers.Prod_ID = Tb_Product.Prod_ID
AND Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Prod_ID = Tb_Requests.Prod_ID

--10) List of products offered in Chicago or requested in Madison?
--(1) Same answer but different than the person in class. Not sure about the ()'s but is right
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier, Tb_Requests, Tb_Consumer
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID

AND Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID

AND (Tb_Consumer.City = 'Madison' OR Tb_Supplier.City = 'Chicago')

--11) Name of products that are both requested and offered in Madison?
--(.5) Not sure how much to receive.
SELECT DISTINCT Tb_Product.Name
FROM Tb_Product, TB_Offers, Tb_Supplier, Tb_Requests, Tb_Consumer
WHERE Tb_Product.Prod_ID = TB_Offers.Prod_ID
AND TB_Offers.Supp_ID = Tb_Supplier.Supp_ID

AND Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Requests.Con_ID = Tb_Consumer.Con_ID

AND Tb_Supplier.City  IN ('Madison')
AND Tb_Consumer.City  IN ('Madison') 

