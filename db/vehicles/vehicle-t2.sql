SELECT V.maker, V.model, C.horsepower, C.engine_capacity, 'Car' AS vehicle_type
FROM Vehicle V
JOIN Car C ON V.model = C.model
WHERE C.horsepower > 150
  AND C.engine_capacity < 3
  AND C.price < 35000

UNION ALL

SELECT V.maker, V.model, M.horsepower, M.engine_capacity, 'Motorcycle' AS vehicle_type
FROM Vehicle V
JOIN Motorcycle M ON V.model = M.model
WHERE M.horsepower > 150
  AND M.engine_capacity < 1.5
  AND M.price < 20000

UNION ALL

SELECT V.maker, V.model, NULL AS horsepower, NULL AS engine_capacity, 'Bicycle' AS vehicle_type
FROM Vehicle V
JOIN Bicycle B ON V.model = B.model
WHERE B.gear_count > 18
  AND B.price < 4000

ORDER BY horsepower DESC NULLS LAST;