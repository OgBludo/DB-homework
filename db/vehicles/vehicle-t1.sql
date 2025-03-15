SELECT Vehicle.maker, Motorcycle.model
FROM Motorcycle
JOIN Vehicle ON Motorcycle.model = Vehicle.model
WHERE Motorcycle.horsepower > 150
  AND Motorcycle.price < 20000
  AND Motorcycle.type = 'Sport'
ORDER BY Motorcycle.horsepower DESC;