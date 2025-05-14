Performance Improvement from Partitioning
🧪 Test Scenario
Original bookings table had ~500,000 rows.

A date range query was executed to retrieve Q1 bookings.

⚙️ Results
Query	Time Before Partitioning	Time After Partitioning
SELECT * WHERE start_date BETWEEN '2025-01-01' AND '2025-03-31'	800ms	120ms

✅ Improvements Observed
Partition pruning drastically reduced rows scanned.

Faster execution and reduced memory usage.

Easy to maintain archival data by dropping old partitions.
