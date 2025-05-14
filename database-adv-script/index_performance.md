1. Identify High-Usage Columns
Based on common WHERE, JOIN, and ORDER BY clauses:

User Table
user_id (used in JOINs)

email (used in logins or lookups)

role (used in filtering by user type)

Booking Table
booking_id (used in JOINs)

user_id (JOIN)

property_id (JOIN)

status, start_date (used in filters or sorting)

Property Table
property_id (JOIN)

location (filtered in search)

pricepernight (used in filters or ordering)

🛠️ 2. CREATE INDEX Commands (Save to database_index.sql)
sql
Copy
Edit
-- database_index.sql

-- User Table
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_role ON users(role);

-- Booking Table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_status ON bookings(status);
CREATE INDEX idx_bookings_start_date ON bookings(start_date);

-- Property Table
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(pricepernight);
⏱️ 3. Measure Query Performance
You can use EXPLAIN or ANALYZE to compare performance before and after indexing. Here's an example:


-- Before indexing
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE user_id = 'some-user-id' AND status = 'confirmed';

-- After indexing
-- Run the same query again and compare the cost and execution time
✅ Expected Outcome:
Queries with filters on user_id, status, location, or email should run significantly faster.

The query plan should now use index scans instead of sequential scans.
