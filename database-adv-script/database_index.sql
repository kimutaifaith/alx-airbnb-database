-- User Table Indexes
CREATE INDEX idx_user_email ON User(email);
CREATE INDEX idx_user_id ON User(id);

-- Booking Table Indexes
CREATE INDEX idx_booking_user_id ON Booking(user_id);
CREATE INDEX idx_booking_property_id ON Booking(property_id);
CREATE INDEX idx_booking_booking_date ON Booking(booking_date);

-- Property Table Indexes
CREATE INDEX idx_property_location ON Property(location);
CREATE INDEX idx_property_id ON Property(id);

-- Use the following commands to measure query performance before adding indexes:

EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'example@example.com';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 1;
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York';

--After Adding Indexes
--Use the following commands to measure query performance after adding indexes:

EXPLAIN ANALYZE SELECT * FROM User WHERE email = 'example@example.com';
EXPLAIN ANALYZE SELECT * FROM Booking WHERE user_id = 1;
EXPLAIN ANALYZE SELECT * FROM Property WHERE location = 'New York';
