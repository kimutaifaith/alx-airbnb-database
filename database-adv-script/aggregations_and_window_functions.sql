 1. Find the total number of bookings made by each user

SELECT 
  u.user_id,
  u.first_name,
  u.last_name,
  COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.first_name, u.last_name
ORDER BY total_bookings DESC;


🏅 2. Rank properties based on the total number of bookings using a window function

-- Rank properties by total number of bookings using ROW_NUMBER()
SELECT 
    property_id,
    total_bookings,
    ROW_NUMBER() OVER (ORDER BY total_bookings DESC) AS booking_rank
FROM (
    SELECT 
        b.property_id,
        COUNT(*) AS total_bookings
    FROM 
        booking b
    GROUP BY 
        b.property_id
) AS bookings_summary;


