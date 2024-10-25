SELECT * FROM crop.prod;
alter table prod
add column (start_date date, end_date date);
-- adding two empty date columns

UPDATE prod
SET start_date = STR_TO_DATE(CONCAT(SUBSTRING_INDEX(year_range, '-', 1), '-01-01'), '%Y-%m-%d'),
    end_date = STR_TO_DATE(CONCAT(SUBSTRING_INDEX(year_range, '-', 1), '-12-31'), '%Y-%m-%d');
-- Splitting the column year_range into two separate date columns for precision in calculation


select distinct season
from prod;
select distinct crop
from prod;
-- to check the distinct seasons and crops


alter table prod
rename column Production to production;
alter table prod
rename column Year_Range to year_range;
alter table prod
rename column Crop to crop;
-- changing the fonts to small letters for standardisation.


select sum(production)
from prod where start_date='2020-01-01';
-- production value for the year 2013


delete from prod
where crop = 'Jute ##'; 
delete from prod
where crop = 'Mesta ##';
delete from prod 
where crop = 'Total Pulses';
delete from prod
where crop = 'Cereals';
delete from prod 
where crop = 'Total Food Grains';
delete from prod
where crop = 'Total Oil Seeds';
-- deleting records for crops having the above names for deduplication


UPDATE prod
SET production = production * 180 * 0.001
WHERE crop = 'Jute & Mesta ##';
UPDATE prod
SET production = production * 170 *0.001
WHERE crop = 'Cotton#';
-- converting lakh bales to tonnes for cotton, jute and mesta 

UPDATE prod
SET production = ROUND(production, 2);
-- round the values in production column to 2 decimal places 


update prod
set crop = 'Jute and Mesta'
where crop = 'Jute & Mesta ##';
-- changed the names with hash in it for text clarity


Select crop, season, year_range, production, start_date, end_date
from prod
where crop in ('Sugarcane','Cotton');
--table showing for only sugarcane and cotton 


select sum(production) as com_prod
from prod where crop in ('Sugarcane','Cotton', 'Jute & Mesta');
-- gives the total production of commercial crops


select sum(production) as total
from prod;
-- gives the total production 


select sum(production) as cotton
from prod where crop = 'Cotton' and start_date ='2013-01-01';
-- gives the total production of cotton in the year 2013


SELECT crop, start_date, sum(production) as production
FROM prod
GROUP BY crop, start_date
HAVING SUM(CASE WHEN season = 'rabi' THEN 1 ELSE 0 END) > 0
AND SUM(CASE WHEN season = 'kharif' THEN 1 ELSE 0 END) = 0
AND SUM(CASE WHEN season = 'summer' THEN 1 ELSE 0 END) = 0;
-- finding the crops that grow only in a particular season and not the other(Season dependent crop)
