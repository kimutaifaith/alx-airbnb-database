Step 1: Create a Partitioned Table Structure
sql

-- Step 1: Create a new partitioned bookings table
CREATE TABLE bookings_partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

✅ Step 2: Create Monthly or Yearly Partitions
sql

-- Example: Create partitions for Q1 2025
CREATE TABLE bookings_2025_q1 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2025-04-01');

-- Add more partitions as needed
CREATE TABLE bookings_2025_q2 PARTITION OF bookings_partitioned
    FOR VALUES FROM ('2025-04-01') TO ('2025-07-01');

✅ Step 3: Test Query on Partitioned Table
sql

-- Query: Fetch bookings between Feb and March 2025
EXPLAIN ANALYZE
SELECT *
FROM bookings_partitioned
WHERE start_date BETWEEN '2025-02-01' AND '2025-03-31';
