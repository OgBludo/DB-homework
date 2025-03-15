WITH CustomerBookings AS (
    SELECT
        C.ID_customer,
        C.name,
        COUNT(B.ID_booking) AS total_bookings,
        COUNT(DISTINCT H.ID_hotel) AS unique_hotels,
        SUM(R.price * (B.check_out_date - B.check_in_date)) AS total_spent
    FROM
        Customer C
    JOIN
        Booking B ON C.ID_customer = B.ID_customer
    JOIN
        Room R ON B.ID_room = R.ID_room
    JOIN
        Hotel H ON R.ID_hotel = H.ID_hotel
    GROUP BY
        C.ID_customer, C.name
    HAVING
        COUNT(DISTINCT H.ID_hotel) > 1 AND COUNT(B.ID_booking) > 2
)
SELECT
    ID_customer,
    name,
    total_bookings,
    total_spent,
    unique_hotels
FROM
    CustomerBookings
WHERE
    total_spent > 500
ORDER BY
    total_spent;
