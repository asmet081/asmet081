--Alex Smetana
--Lab08
--1) Name of suppliers located in cities having ‘C’ as initial?
		SELECT Name
		FROM Tb_Supplier
		WHERE City LIKE '[C]%'

--2) Name of products with name having ‘A’, ‘C’ or ‘O’ as initial?
		SELECT Name
		FROM Tb_Product
		WHERE Name LIKE '[ACO]%'

--3) Name of products with name ending with ‘e’ or ‘l’?
		SELECT Name
		FROM Tb_Product
		WHERE Name LIKE '%[EL]'

--4) Name  of  consumers  starting  with  ‘W’  and  not  ending  with  ‘a’,  ‘c’,’d’,’e’,’f’,’g’, ‘l’,’m’,’n’ or ‘o’.
		SELECT Name
		FROM Tb_Consumer
		WHERE Name LIKE '[W]%'
		AND Name NOT LIKE '%[acdefglmno]'

--5) Names of suppliers not starting with ‘A’ or ’J’ and having ‘a’ in the third position?
		SELECT Name
		FROM Tb_Supplier
		WHERE Name NOT LIKE '[AJ]%'
		AND Name LIKE '__[a]%'

--6) Name of suppliers located in a city not having ‘C’ as initial and offering products with name having ‘O’ as initial.
		SELECT Tb_Supplier.Name, Tb_Product.Name
		FROM Tb_Supplier, Tb_Product, Tb_Offers
		WHERE Tb_Supplier.Supp_ID = Tb_Offers.Supp_ID
		AND TB_Offers.Prod_ID = Tb_Product.Prod_ID
		AND Tb_Supplier.Name NOT LIKE '[C]%'
		AND Tb_Product.Name LIKE '[O]%'

--7) Find  the  number  of  days  until  the  end  of  the  year  (2  columns:  date  of  final, number of days)?
 SELECT DATEDIFF(day, GETDATE(), '12/30/2021')	

--8) Tell  what  day  of  the  week  will  be  your  50th  birthday  (2  columns:  date  of  birth, day of week for 50th birthday)? 
SELECT DAY('04/17/2021'), DATENAME(dw, '04/17/2052')

--9) Tell the equivalent in days, in hours and in minutes of your age?
 SELECT DATEDIFF(day, '04/17/2001', GETDATE()) as 'Days Old', 
 DATEDIFF(hour, '04/17/2001', GETDATE()) as 'Hours Old', 
 DATEDIFF(MINUTE, '04/17/2001', GETDATE()) as 'Minutes Old'

--10) Return the current date as in this sample: “Monday, November 15, 2021”.
SELECT DATENAME(DW, GETDATE()) as 'Day of Week', 
DATENAME(MM, GETDATE()) as 'Month of Year', 
DATEPART(DD, GETDATE()) 'Day of Month', 
DATENAME(YYYY, GETDATE()) as 'Year'
