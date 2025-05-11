📘 First Normal Form (1NF)
Rule: Eliminate repeating groups; ensure atomicity of data.

Evaluation:

All tables use atomic fields (e.g., phone_number, email).

No multivalued attributes.

✅ Passed

📗 Second Normal Form (2NF)
Rule: Eliminate partial dependencies; non-key attributes must depend on the entire primary key.

Evaluation:

All tables have single-column primary keys (no composite keys).

All non-key attributes fully depend on the primary key.

✅ Passed

📙 Third Normal Form (3NF)
Rule: Eliminate transitive dependencies; non-key attributes must not depend on other non-key attributes.

Evaluation and Adjustment:

🔍 Booking Table
total_price is calculated from pricepernight * number of nights.

Though stored for performance, it is derivable from other fields.

⚠️ Optional Normalization Adjustment:

Remove total_price and compute dynamically in queries or views.

🔍 Other Tables
No transitive dependencies detected.

All non-key attributes directly depend on the primary key.

✅ Passed (with optional adjustment to Booking)


📌 Recommendation
For strict 3NF compliance, remove derived fields like total_price and calculate them in application logic.

👨‍💻 Conclusion
The schema adheres to the principles of 3NF with minimal room for optimization.
