SELECT C.name AS car_name, C.class AS car_class, AVG(R.position) AS average_position, COUNT(R.race) AS race_count
FROM Cars C
JOIN Results R ON C.name = R.car
GROUP BY C.name, C.class
HAVING AVG(R.position) = (
    SELECT MIN(avg_pos)
    FROM (
        SELECT AVG(R2.position) AS avg_pos
        FROM Cars C2
        JOIN Results R2 ON C2.name = R2.car
        WHERE C2.class = C.class
        GROUP BY C2.name
    ) AS subquery
)
ORDER BY average_position;