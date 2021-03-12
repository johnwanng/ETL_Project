-- Top 5 most accidents Car make
select v.make,count(0) num_of_accidents from accident a inner join
vehicles v on (a."Accident_Index" = v."Accident_Index")
group by v.make order by 2 desc limit(5); 

--"HONDA"	1701
--"MERCEDES"	1191
--"VOLKSWAGEN"	968
--"FORD"	923
--"VAUXHALL"	822

-- Top 5 least accidents Car make
select v.make,count(0) num_of_accidents from accident a inner join
vehicles v on (a."Accident_Index" = v."Accident_Index")
group by v.make order by 2 limit(5); 

--"BRANSON"	1
--"CAGIVA"	1
--"BENELLI"	1
--"BOVA"	1
--"CATERHAM"	1

-- All accident tally with weather info from 2005 Jan to 2017 Dec
select a."Year", a."month", count(0) num_of_accidents, w.tmax, w.tmin,w.rain from accident a 
inner join weather w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain order by 1,2;


-- All accident tally with weather info group by year from 2005 to 2017
select a."Year", count(0) num_of_accidents, avg(w.tmax) ave_max_temp, avg(w.tmin) avg_min_tmp,
sum(w.rain) total_rain from accident a 
inner join weather w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year" order by 1;


-- All accident tally with weather info group by month from 2005 to 2017
select a."month", count(0) num_of_accidents, avg(w.tmax) ave_max_temp, avg(w.tmin) avg_min_tmp,
avg(w.rain) avg_rain_fall, sum(w.rain) total_rain from accident a 
inner join weather w on (a."Year" = w."Year" and a."month" = w."month")
group by a."month" order by 1;


-- Top 5 most accidents year month
select a."Year", a."month", count(0), w.tmax, w.tmin,w.rain from accident a 
inner join weather w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain order by 3 desc limit(5);

--2005	11	190	10.7	3.5	29.2
--2014	10	186	17.6	11	76
--2006	11	184	12.7	5.4	98
--2005	10	184	17.8	11.3	73.4
--2005	6	181	22.8	12.9	32.6


-- Top 5 least accidents year month
select a."Year", a."month", count(0), w.tmax, w.tmin,w.rain from accident a 
inner join weather w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain order by 3 limit(5);

--2013	2	85	6.7	1.2	32.8
--2014	2	98	10.6	4.4	89.8
--2013	1	101	6.5	2	50.1
--2009	2	102	7.8	2.1	69.6
--2010	12	102	3.9	-1.5	21.4

-- Month and Year with the greatest rainfall
with greatest_rainfall_month_year as	  
 (select w.* from weather w where rain in
  (select max(w.rain) 
		from weather w inner join accident a
			on (a."Year" = w."Year" and a."month" = w."month")))
select a."Year", a."month", count(0), w.tmax, w.tmin,w.rain from accident a 
inner join greatest_rainfall_month_year w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain;

--2014	1	131	10	3.8	162.4

-- Month and Year with the minimum temperature
with minimum_temp_month_year as	  
 (select w.* from weather w where w.tmin in 
  (select min(w.tmin) 
		from weather w inner join accident a
			on (a."Year" = w."Year" and a."month" = w."month")))
select a."Year", a."month", count(0), w.tmax, w.tmin,w.rain from accident a 
inner join minimum_temp_month_year w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain;

--2010	12	102	3.9	-1.5	21.4

-- Month and Year with the least rainfall
with least_rainfall_month_year as	  
 (select w.* from weather w where rain in
  (select min(w.rain) 
		from weather w inner join accident a
			on (a."Year" = w."Year" and a."month" = w."month")))
select a."Year", a."month", count(0), w.tmax, w.tmin,w.rain from accident a 
inner join least_rainfall_month_year w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain;

-- 2011	4	123	19.7	8.6	2.4

-- Month and Year with the maximum temperature
with maximum_temp_month_year as	  
 (select w.* from weather w where w.tmax in 
  (select max(w.tmax) 
		from weather w inner join accident a
			on (a."Year" = w."Year" and a."month" = w."month")))
select a."Year", a."month", count(0), w.tmax, w.tmin,w.rain from accident a 
inner join maximum_temp_month_year w on (a."Year" = w."Year" and a."month" = w."month")
group by a."Year", a."month", w.tmax, w.tmin,w.rain;
			
-- 2006	7	177	28.2	16.7	23.6

