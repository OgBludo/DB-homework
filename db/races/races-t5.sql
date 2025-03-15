WITH LowPositionCars AS (
    SELECT C.name, C.class, AVG(R.position) AS avg_position
    FROM Cars C
    JOIN Results R ON C.name = R.car
    GROUP BY C.name, C.class
    HAVING AVG(R.position) > 3.0
),
ClassLowPositionCounts AS (
    SELECT class, COUNT(*) AS low_position_count
    FROM LowPositionCars
    GROUP BY class
)
SELECT LPC.name AS car_name, LPC.class AS car_class, LPC.avg_position AS average_position, COUNT(R.race) AS race_count, Cl.country AS car_country,
       (SELECT COUNT(*) FROM Results R2 JOIN Cars C2 ON R2.car = C2.name WHERE C2.class = LPC.class) AS total_races,
       CLPC.low_position_count
FROM LowPositionCars LPC
JOIN Results R ON LPC.name = R.car
JOIN Classes Cl ON LPC.class = Cl.class
JOIN ClassLowPositionCounts CLPC ON LPC.class = CLPC.class
GROUP BY LPC.name, LPC.class, Cl.country, LPC.avg_position, CLPC.low_position_count
ORDER BY CLPC.low_position_count DESC, LPC.class, LPC.avg_position;
