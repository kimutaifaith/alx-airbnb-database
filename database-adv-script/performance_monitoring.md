Initial Observations
Query used sequential scan on large bookings table (~500k rows)

Joins slowed down due to missing indexes on FK columns

🔨 Improvements Made
Added indexes on start_date, user_id, property_id

⚡ Results
Metric	Before	After
Execution Time	~500 ms	~60 ms
Scanned Rows	500,000+	~50,000
Access Type	Seq Scan	Index Scan
