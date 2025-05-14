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
Before Creating Indexes

EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE user_id = 'abc-123' AND status = 'confirmed';
This will show whether the database uses a sequential scan.

🚀 After Creating Indexes
Re-run the same query:

EXPLAIN ANALYZE
SELECT * 
FROM bookings
WHERE user_id = 'abc-123' AND status = 'confirmed';
✅ Expected Outcome:
Queries with filters on user_id, status, location, or email should run significantly faster.

The query plan should now use index scans instead of sequential scans.
