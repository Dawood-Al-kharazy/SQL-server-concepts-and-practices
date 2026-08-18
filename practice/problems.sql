select * from detailedview
where make like 'mer%' and ModelName like '%class%';

-- problem 1 was about creating a master view,
-- we've did it by 'design query in editor' ...


-- problem 2 solution
select *  from VehicleDetails
where year between 1950 and 2000;


-- problem 3 solution
select count(*) as 'number of vehicals' from VehicleDetails
where year between 1950 and 2000;


-- problem 4 solution

select make,  count(*) as 'number of vehicals'
from DetailedView
where year between 1950 and 2000
group by make
order by 'number of vehicals' desc;

-- another solution
select Makes.make, COUNT(*) as numberOfVehicals
from VehicleDetails inner join Makes on  VehicleDetails.MakeID = Makes.MakeID
where VehicleDetails.Year between 1950 and 2000
group by Make
order by numberOfVehicals desc;


-- problem 5: Get All Makes that have manufactured more than 12000 Vehicles in years 1950 to 2000

select Makes.make, COUNT(*) as numberOfVehicals
from VehicleDetails inner join Makes on  VehicleDetails.MakeID = Makes.MakeID
where VehicleDetails.Year between 1950 and 2000
group by Make
having COUNT(*) > 12000
order by numberOfVehicals desc;

-- another solution
select * from
(
	select Makes.make, COUNT(*) as numberOfVehicals
	from VehicleDetails inner join Makes on  VehicleDetails.MakeID = Makes.MakeID
	where VehicleDetails.Year between 1950 and 2000
	group by Make
	having COUNT(*) > 12000
) R1
where numberOfVehicals > 1200;


-- Problem 6: Get number of vehicles made between 1950 and 2000 per make and add total vehicles column beside
select Makes.make, COUNT(*) as numberOfVehicals, (select count(*) from VehicleDetails) as total
from VehicleDetails inner join Makes on  VehicleDetails.MakeID = Makes.MakeID
where VehicleDetails.Year between 1950 and 2000
group by Make
order by numberOfVehicals desc;
 

-- Problem 7: Get number of vehicles made between 1950 and 2000 per make and add total vehicles column beside it, then calculate it's percentage
select Makes.make,
COUNT(*) as numberOfVehicals,
(select count(*) from VehicleDetails) as total,
(1.0 * count(*) / (select count(*) from VehicleDetails)) as percentage
from VehicleDetails inner join Makes on  VehicleDetails.MakeID = Makes.MakeID
where VehicleDetails.Year between 1950 and 2000
group by Make
order by numberOfVehicals desc;

-- another solution
select *, cast(numberOfVehicals as float) / CAST(total as float) as perc from 
(
	select Makes.make, COUNT(*) as numberOfVehicals, (select count(*) from VehicleDetails) as total
	from VehicleDetails inner join Makes on  VehicleDetails.MakeID = Makes.MakeID
	where VehicleDetails.Year between 1950 and 2000
	group by Make
) R1
order by numberOfVehicals desc;

-- Problem 8: Get Make, FuelTypeName and Number of Vehicles per FuelType per Make

select make, fueltypename, count(*) number from
(
		(select id as id1, Make
		from VehicleDetails inner join Makes on VehicleDetails.MakeID = Makes.MakeID) t1
		inner join
		(select id as id2, FuelTypeName
		from VehicleDetails inner join FuelTypes on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID) t2
		on id1 = id2
)
group by FuelTypeName, make

 -- another solution:
 SELECT 
    m.Make,
    f.FuelTypeName,
    COUNT(*) AS Number
FROM VehicleDetails v
INNER JOIN Makes m 
    ON v.MakeID = m.MakeID
INNER JOIN FuelTypes f 
    ON v.FuelTypeID = f.FuelTypeID
WHERE v.Year BETWEEN 1950 AND 2000
GROUP BY 
    m.Make,
    f.FuelTypeName
ORDER BY
	m.make;


--   PROBLEM 9: GET ALL VEHICLES THAT RUNS WITH GAS
SELECT
	*, 'GAS' as fuel
FROM
	VEHICLEDETAILS
WHERE
	FuelTypeID = (SELECT FUELTYPEID FROM FUELTYPES WHERE FUELTYPENAME = 'GAS')

-- another solution
select
	VehicleDetails.*, FuelTypes.FuelTypeName
from
	VehicleDetails inner join FuelTypes on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
WHERE
	FuelTypes.FuelTypeName = N'GAS';






-- Problem 10: Get all Makes that runs with GAS

select
	distinct
	Makes.Make, FuelTypes.FuelTypeName
from
	VehicleDetails inner join FuelTypes on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
	inner join Makes on Makes.MakeID = VehicleDetails.MakeID
WHERE
	FuelTypes.FuelTypeName = N'GAS';


-- Problem 11: Get Total Makes that runs with GAS
select 
	COUNT(*) as numberOfMakes
FROM(
	select
		distinct
		Makes.Make, FuelTypes.FuelTypeName
	from
		VehicleDetails inner join FuelTypes on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
		inner join Makes on Makes.MakeID = VehicleDetails.MakeID
	WHERE
		FuelTypes.FuelTypeName = N'GAS'
	) T1

-- another solution
select
	COUNT(distinct Makes.Make) as numberOfMakes
from
	VehicleDetails inner join FuelTypes on VehicleDetails.FuelTypeID = FuelTypes.FuelTypeID
	inner join Makes on Makes.MakeID = VehicleDetails.MakeID
WHERE
	FuelTypes.FuelTypeName = N'GAS';


--Problem 12: Count Vehicles by make and order them by NumberOfVehicles from high to low.
select
	Makes.Make, COUNT(*) as numberOfVehicals
from
	VehicleDetails inner join Makes on VehicleDetails.MakeID = Makes.MakeID
group by
	Make
order by numberOfVehicals desc


-- Problem 13: Get all Makes/Count Of Vehicles that manufactures more than 20K Vehicles
select
	Makes.Make, COUNT(*) as numberOfVehicals
from
	VehicleDetails inner join Makes on VehicleDetails.MakeID = Makes.MakeID
group by
	Make
having
	COUNT(*) > 20000
order by numberOfVehicals desc


-- Problem 14: Get all Makes with make starts with 'B'
select
	*
from
	Makes
where
	Make like 'B%';

-- Problem 15: Get all Makes with make ends with 'W'

select
	*
from
	Makes
where
	Make like '%W'


-- Problem 16: Get all Makes that manufactures DriveTypeName = FWD
select
	distinct M.Make, DT.DriveTypeName
from
	VehicleDetails V inner join Makes M on V.MakeID = M.MakeID
	inner join DriveTypes DT on V.DriveTypeID = DT.DriveTypeID
where
	DT.DriveTypeName = 'FWD';


-- Problem 17: Get total Makes that Mantufactures DriveTypeName=FWD
select
	count(distinct M.Make) NumberOfManufactures
from
	VehicleDetails V inner join Makes M on V.MakeID = M.MakeID
	inner join DriveTypes DT on V.DriveTypeID = DT.DriveTypeID
where
	DT.DriveTypeName = 'FWD';

-- another solution
select 
	COUNT(*) NumberOfManufactures
from
(
	select
	distinct M.Make, DT.DriveTypeName
from
	VehicleDetails V inner join Makes M on V.MakeID = M.MakeID
	inner join DriveTypes DT on V.DriveTypeID = DT.DriveTypeID
where
	DT.DriveTypeName = 'FWD'
) T1

-- Problem 18: Get total vehicles per DriveTypeName Per Make and order them per make asc then per total Desc
select
	 M.Make, DT.DriveTypeName, COUNT(*) NumberOfVehicals
from
	VehicleDetails V inner join Makes M on V.MakeID = M.MakeID
	inner join DriveTypes DT on V.DriveTypeID = DT.DriveTypeID
group by
	M.Make, DT.DriveTypeName
order by
	Make asc, NumberOfVehicals desc



-- Problem 19: Get total vehicles per DriveTypeName Per Make then filter only results with total > 10,000

select
	 M.Make, DT.DriveTypeName, COUNT(*) NumberOfVehicals
from
	VehicleDetails V inner join Makes M on V.MakeID = M.MakeID
	inner join DriveTypes DT on V.DriveTypeID = DT.DriveTypeID
group by
	M.Make, DT.DriveTypeName
having
	COUNT(*) > 10000
order by
	Make asc, NumberOfVehicals desc


-- Problem 20: Get all Vehicles that number of doors is not specified
select 
	*
from
	VehicleDetails
where
	NumDoors is null


-- Problem 21: Get Total Vehicles that number of doors is not specified
select 
	COUNT(*) Total
from
	VehicleDetails
where
	NumDoors is null

-- Problem 22: Get percentage of vehicles that has no doors specified
select
	(1.0 * (select COUNT(*) from VehicleDetails where NumDoors is null))
	/
	(1.0 * (select COUNT(*) from VehicleDetails)) NoSpecifiedDoorsPercentage

-- another solution
select
	(cast ((select COUNT(*) from VehicleDetails where NumDoors is null)as float))
	/
	(cast ((select COUNT(*) from VehicleDetails) AS float)) NoSpecifiedDoorsPercentage



-- Problem 23: Get MakeID , Make, SubModelName for all vehicles that have SubModelName 'Elite'
select
	distinct M.MakeID, M.Make, SM.SubModelName
from
	Makes M inner join VehicleDetails VD on M.MakeID = VD.MakeID inner join
	SubModels SM on VD.ModelID = SM.ModelID
where
	SM.SubModelName = 'Elite';


	select * from VehicleDetails

-- Problem 24: Get all vehicles that have Engines > 3 Liters and have only 2 doors
select
	*
from
	VehicleDetails
where
	Engine_Liter_Display > 3 and NumDoors = 2



-- Problem 25: Get make and vehicles that the engine contains 'OHV' and have Cylinders = 4
select
	VD.*,  M.Make
from
	VehicleDetails VD inner join Makes M on VD.MakeID = M.MakeID
where
	(VD.Engine like '%OHV%') and (VD.Engine_Cylinders = 4);



-- Problem 26: Get all vehicles that their body is 'Sport Utility' and Year > 2020
select
	VD.*
from
	VehicleDetails VD inner join Bodies B on VD.BodyID = B.BodyID
where
	B.BodyName = 'Sport Utility' and VD.Year > 2020



-- Problem 27: Get all vehicles that their Body is 'Coupe' or 'Hatchback' or 'Sedan'
select
	VD.*
from
	VehicleDetails VD inner join Bodies B on VD.BodyID = B.BodyID
where
	B.BodyName in('Coupe', 'Hatchback', 'Sedan');


-- Problem 28: Get all vehicles that their body is 'Coupe' or 'Hatchback' or 'Sedan' and manufactured in year 2008 or 2020 or 2021
select
	VD.*
from
	VehicleDetails VD inner join Bodies B on VD.BodyID = B.BodyID
where
	B.BodyName in('Coupe', 'Hatchback', 'Sedan') and Year in(2008, 2020, 2021);


-- Problem 29: Return found=1 if there is any vehicle made in year 1950
select found = 1
where
exists(
	select top 1 VD.ID from VehicleDetails VD where Year = 1950
	)



-- Problem 30: Get all Vehicle_Display_Name,
--NumDoors and add extra column to describe number of doors by words, and if door is null display 'Not Set'
select distinct NumDoors from VehicleDetails
-----
select
	Vehicle_Display_Name, NumDoors,
	case numdoors
		when 0 then 'Zero'
		when 1 then 'One'
		when 2 then 'Two'
		when 3 then 'Three'
		when 4 then 'Four'
		when 5 then 'Five'
		when 6 then 'Six'
		when 8 then 'Eight'
		--when NumDoors is null then 'Not set'
		else 'Not set'
		--else 'Unknown'
	end  NumberOfDoors
from
	VehicleDetails;



-- Problem 31: Get all Vehicle_Display_Name,
--year and add extra column to calculate the age of the car then sort the results by age desc.

select
	Vehicle_Display_Name, Year, YEAR(getdate()) - year Age
from
	VehicleDetails
order by Age desc


--  Problem 32: Get all Vehicle_Display_Name, year, Age for vehicles that their age between 15 and 25 years old
select
	Vehicle_Display_Name, Year, YEAR(getdate()) - year Age
from
	VehicleDetails
where
	(YEAR(getdate()) - year) between 15 and 25
order by Age desc

-- another solution
select
	*
from
(
	select
		Vehicle_Display_Name, Year, YEAR(getdate()) - year Age
	from
		VehicleDetails
) T1
where
	(YEAR(getdate()) - year) between 15 and 25
order by Age desc




--  Problem 33: Get Minimum Engine CC , Maximum Engine CC , and Average Engine CC of all Vehicles
select
	MIN(Engine_CC) minCC, MAX(Engine_CC) maxCC, AVG(Engine_CC) avgCC
from
	VehicleDetails



--  Problem 34: Get all vehicles that have the minimum Engine_CC
select
	*
from
	VehicleDetails
where Engine_CC = (select MIN(Engine_CC) from VehicleDetails);


--  Problem 35: Get all vehicles that have the Maximum Engine_CC
select
	*
from
	VehicleDetails
where Engine_CC = (select MAX(Engine_CC) from VehicleDetails);


--  Problem 36: Get all vehicles that have Engin_CC below average
select
	*
from
	VehicleDetails
where Engine_CC < (select AVG(Engine_CC) from VehicleDetails);


--  Problem 37: Get total vehicles that have Engin_CC above average
select
	COUNT(*) as AboveAvrage
from
	VehicleDetails
where Engine_CC > (select AVG(Engine_CC) from VehicleDetails);
-- or we can selcet from the select statement



--  Problem 38: Get all unique Engin_CC and sort them Desc
select 
	distinct Engine_CC
from
	VehicleDetails
order by Engine_CC desc



--  Problem 39: Get the maximum 3 Engine CC
select
	distinct top 3 Engine_CC
from
	VehicleDetails
order by Engine_CC desc


--  Problem 40: Get all vehicles that has one of the Max 3 Engine CC
select
	*
from
	VehicleDetails
where 
	Engine_CC in (
		select
			distinct top 3 Engine_CC
		from
			VehicleDetails
		order by Engine_CC desc
	)



--  Problem 41: Get all Makes that manufactures one of the Max 3 Engine CC
select 
	distinct M.Make, VD.Engine_CC
from
	VehicleDetails VD inner join Makes M on VD.MakeID = M.MakeID
where 
	Engine_CC in (
		select
			distinct top 3 Engine_CC
		from
			VehicleDetails
		order by Engine_CC desc
	)
order by make;



--  Problem 42: Get a table of unique Engine_CC and calculate tax per Engine CC
select
	distinct Engine_CC,
	case 
		when Engine_CC between 0 and 1000 then 100
		when Engine_CC <= 2000 then 200
		when Engine_CC <= 4000 then 300
		when Engine_CC <= 6000 then 400
		when Engine_CC <= 8000 then 500
		when Engine_CC > 8000 then 600
		else 0
	end Tax
from
	VehicleDetails

-- the best solution is:
select Engine_CC,
	CASE
		WHEN Engine_CC between 0 and 1000 THEN 100
		 WHEN Engine_CC between 1001 and 2000 THEN 200
		 WHEN Engine_CC between 2001 and 4000 THEN 300
		 WHEN Engine_CC between 4001 and 6000 THEN 400
		 WHEN Engine_CC between 6001 and 8000 THEN 500
		 WHEN Engine_CC > 8000 THEN 600	
		ELSE 0
	END as Tax
from 
(
	select distinct Engine_CC from VehicleDetails
) R1
order by Engine_CC


--  Problem 43: Get Make and Total Number Of Doors Manufactured Per Make
select 
	Makes.Make, sum(NumDoors) totalDoors
from
	VehicleDetails inner join Makes on VehicleDetails.MakeID = Makes.MakeID
group by Make
order by totalDoors desc;



--  Problem 44: Get Total Number Of Doors Manufactured by 'Ford'
select 
	Makes.Make, sum(NumDoors) totalDoors
from
	VehicleDetails inner join Makes on VehicleDetails.MakeID = Makes.MakeID
group by Make
having Makes.Make = 'Ford'



--  Problem 45: Get Number of Models Per Make

SELECT        Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc



--  Problem 46: Get the highest 3 manufacturers that make the highest number of models
select top 3 Make, NumberOfModels
from (
SELECT        Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
)t1
Order By NumberOfModels Desc

-- or
SELECT        top 3 Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc


--  Problem 47: Get the highest number of models manufactured
SELECT        top 1 Makes.Make, COUNT(*) AS NumberOfModels
FROM            Makes INNER JOIN
                         MakeModels ON Makes.MakeID = MakeModels.MakeID
GROUP BY Makes.Make
Order By NumberOfModels Desc


--  Problem 48: Get the highest Manufacturers manufactured the highest number of models
SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make

		having COUNT(*) = (

										select Max(NumberOfModels) as MaxNumberOfModels
										from
										(

												SELECT      MakeID, COUNT(*) AS NumberOfModels
												FROM       
																		 MakeModels
												GROUP BY MakeID
												
										) R1

							)




--  Problem 49: Get the Lowest Manufacturers manufactured the lowest number of models

SELECT        Makes.Make, COUNT(*) AS NumberOfModels
		FROM            Makes INNER JOIN
								 MakeModels ON Makes.MakeID = MakeModels.MakeID
		GROUP BY Makes.Make

		having COUNT(*) = (

										select Min(NumberOfModels) as MaxNumberOfModels
										from
										(

												SELECT      MakeID, COUNT(*) AS NumberOfModels
												FROM       
																		 MakeModels
												GROUP BY MakeID
												
										) R1

							)


--  Problem 50: Get all Fuel Types , each time the result should be showed in random order
select * from FuelTypes
order by NEWID()
