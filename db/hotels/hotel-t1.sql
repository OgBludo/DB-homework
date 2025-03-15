SELECT
    C.name,
    C.email,
    C.phone,
    COUNT(B.ID_booking) AS total_bookings,
    STRING_AGG(H.name, ', ' ORDER BY H.name) AS hotels,
    AVG(B.check_out_date - B.check_in_date) AS average_stay_duration
FROM
    Customer C
JOIN
    Booking B ON C.ID_customer = B.ID_customer
JOIN
    Room R ON B.ID_room = R.ID_room
JOIN
    Hotel H ON R.ID_hotel = H.ID_hotel
GROUP BY
    C.ID_customer
HAVING
    COUNT(DISTINCT H.ID_hotel) > 1 AND COUNT(B.ID_booking) > 2
ORDER BY
    total_bookings DESC;
