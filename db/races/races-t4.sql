WITH ClassAvgPositions AS (
    SELECT C.class, AVG(R.position) AS avg_position
    FROM Cars C
    JOIN Results R ON C.name = R.car
    GROUP BY C.class
),
CarAvgPositions AS (
    SELECT C.name, C.class, AVG(R.position) AS avg_position
    FROM Cars C
    JOIN Results R ON C.name = R.car
    GROUP BY C.name, C.class
)
SELECT CAP.name AS car_name, CAP.class AS car_class, CAP.avg_position AS average_position, COUNT(R.race) AS race_count, Cl.country AS car_country
FROM CarAvgPositions CAP
JOIN Results R ON CAP.name = R.car
JOIN Classes Cl ON CAP.class = Cl.class
JOIN ClassAvgPositions CLAP ON CAP.class = CLAP.class
WHERE CAP.avg_position < CLAP.avg_position
GROUP BY CAP.name, CAP.class, Cl.country, CAP.avg_position
ORDER BY CAP.class, CAP.avg_position;