🔁 1. INNER JOIN – Get all bookings and the users who made them

SELECT 
  bookings.booking_id,
  bookings.start_date,
  bookings.end_date,
  bookings.total_price,
  users.user_id,
  users.first_name,
  users.last_name,
  users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;

🧩 2. LEFT JOIN – Get all properties and their reviews (including properties without reviews)

SELECT 
    p.property_id,
    p.name AS property_name,
    r.review_id,
    r.rating,
    r.comment,
    r.created_at AS review_date
FROM 
    property p
LEFT JOIN 
    review r ON p.property_id = r.property_id
ORDER BY 
    p.property_id;

🔄 3. FULL OUTER JOIN – Get all users and all bookings (even unmatched ones)

SELECT 
  users.user_id,
  users.first_name,
  users.last_name,
  bookings.booking_id,
  bookings.start_date,
  bookings.total_price
FROM users
LEFT JOIN bookings ON users.user_id = bookings.user_id

UNION

SELECT 
  users.user_id,
  users.first_name,
  users.last_name,
  bookings.booking_id,
  bookings.start_date,
  bookings.total_price
FROM bookings
LEFT JOIN users ON users.user_id = bookings.user_id;
