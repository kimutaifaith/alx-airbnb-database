Step 1: Analyze Query Performance

EXPLAIN ANALYZE
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  b.status,
  u.user_id,
  u.first_name,
  u.last_name,
  u.email,
  p.property_id,
  p.name AS property_name,
  p.location,
  pay.payment_id,
  pay.amount,
  pay.payment_method,
  pay.payment_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
Look for:

Sequential scan (Seq Scan) → Inefficient

Missing indexes on user_id, property_id, booking_id

Long execution times

🛠️ Step 2: Refactor & Improve Performance
✅ Add Missing Indexes
(If not already done):


CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_payments_booking_id ON payments(booking_id);

✅ Refactored Query (No unnecessary columns, join order optimized)


-- Optimized version of the booking summary query
SELECT 
  b.booking_id,
  b.start_date,
  b.end_date,
  b.total_price,
  u.first_name || ' ' || u.last_name AS full_name,
  p.name AS property_name,
  pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN properties p ON b.property_id = p.property_id
LEFT JOIN payments pay ON b.booking_id = pay.booking_id;
Reduced selected columns

Used concatenation to combine names

Maintains all required functionality with better clarity and potential speed

