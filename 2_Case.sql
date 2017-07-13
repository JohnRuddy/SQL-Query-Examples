select  
Customer,
Country,
freight,
orderdate,
categoryname
,	CASE
		when Country IN('France','Germany','Spain') Then 'Europe'
		when city='Cork' Then 'Corky'
		when freight>200 then 'Wow Expensive'
		when Country IN('UK')  Then 'Britain'
		Else 'Overseas - Not Europe, Cork, <200 and Not Britain'
	END  AS 'Destination'

,	CASE 
		when freight>200 then 'Rediculous'
		when freight between 100 and 200 then 'Dear'
		else 'cheap'
	END  AS 'FreightDesc'
,	CASE freight
		when 257.62 then '25762'
		when 63.79 then 'sixty-ish'
		else 'dunno'
	End AS 'FreightEasy'
, IIF (freight>200, 'Expensive2012', 'Cheap2012') as 'IIF_2012'

from vsales1 v
order by 4, 1