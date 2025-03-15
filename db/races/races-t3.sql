WITH ClassAvgPositions AS (
    SELECT C.class, AVG(R.position) AS avg_position
    FROM Cars C
    JOIN Results R ON C.name = R.car
    GROUP BY C.class
),
MinAvgPosition AS (
    SELECT MIN(avg_position) AS min_avg_position
    FROM ClassAvgPositions
)
SELECT C.name AS car_name, C.class AS car_class, AVG(R.position) AS average_position, COUNT(R.race) AS race_count, Cl.country AS car_country,
       (SELECT COUNT(*) FROM Results R2 JOIN Cars C2 ON R2.car = C2.name WHERE C2.class = C.class) AS total_races
FROM Cars C
JOIN Results R ON C.name = R.car
JOIN Classes Cl ON C.class = Cl.class
JOIN ClassAvgPositions CAP ON C.class = CAP.class
JOIN MinAvgPosition MAP ON CAP.avg_position = MAP.min_avg_position
GROUP BY C.name, C.class, Cl.country
ORDER BY C.class, average_position;