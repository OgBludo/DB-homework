WITH HotelCategories AS (
    SELECT
        H.ID_hotel,
        CASE
            WHEN AVG(R.price) < 175 THEN 'Дешевый'
            WHEN AVG(R.price) BETWEEN 175 AND 300 THEN 'Средний'
            ELSE 'Дорогой'
        END AS category
    FROM
        Hotel H
    JOIN
        Room R ON H.ID_hotel = R.ID_hotel
    GROUP BY
        H.ID_hotel
),
CustomerPreferences AS (
    SELECT
        C.ID_customer,
        C.name,
        STRING_AGG(DISTINCT H.name, ', ' ORDER BY H.name) AS visited_hotels,
        MAX(HC.category) AS preferred_hotel_type
    FROM
        Customer C
    JOIN
        Booking B ON C.ID_customer = B.ID_customer
    JOIN
        Room R ON B.ID_room = R.ID_room
    JOIN
        Hotel H ON R.ID_hotel = H.ID_hotel
    JOIN
        HotelCategories HC ON H.ID_hotel = HC.ID_hotel
    GROUP BY
        C.ID_customer, C.name
)
SELECT
    ID_customer,
    name,
    preferred_hotel_type,
    visited_hotels
FROM
    CustomerPreferences
ORDER BY
    CASE preferred_hotel_type
        WHEN 'Дешевый' THEN 1
        WHEN 'Средний' THEN 2
        WHEN 'Дорогой' THEN 3
        ELSE 4
    END,
    ID_customer;
