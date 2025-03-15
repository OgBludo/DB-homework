SELECT C.name AS car_name, C.class AS car_class, AVG(R.position) AS average_position, COUNT(R.race) AS race_count, Cl.country AS car_country
FROM Cars C
JOIN Results R ON C.name = R.car
JOIN Classes Cl ON C.class = Cl.class
GROUP BY C.name, C.class, Cl.country
ORDER BY average_position, C.name
LIMIT 1;