# Vehicle Rental System (PostgreSQL) – ERD & SQL Queries

## Project Overview
This project implements a simple **Vehicle Rental System** database and a set of SQL queries to demonstrate essential relational database concepts using PostgreSQL.

The system supports real-world rental scenarios:
- Users can register with roles (Customer/Admin).
- Vehicles are stored with type, model, unique registration number, rental price, and availability status.
- Bookings connect users to vehicles for a rental period with booking status and total cost.

---

## ERD Diagram

The Entity Relationship Diagram (ERD) visually represents the database structure, including tables, primary keys, foreign keys, and relationships between entities.

🔗 **ERD Diagram Link:**  
[View ERD Diagram](https://drawsql.app/teams/kk-168/diagrams/vehiclerentalsystem)

### ERD Highlights
- Three main entities: **users**, **vehicles**, and **bookings**
- Clearly defined **Primary Keys (PK)** and **Foreign Keys (FK)** and and **unique Keys**
- One-to-Many relationships:
  - users → bookings
  - vehicles → bookings

---

## Database Schema (Logical Design)

### Tables
**users**
- Stores user information: name, email, phone, role
- Ensures unique email for each user

**vehicles**
- Stores vehicle information: name, type, model, registration number, rental price, status
- Ensures unique registration number for each vehicle

**bookings**
- Stores booking details: user, vehicle, rental dates, booking status, total cost
- Linked to users and vehicles using foreign keys

---

## Relationships
- **One-to-Many:** users → bookings  
- **One-to-Many:** vehicles → bookings  
- Each booking references **exactly one user** and **exactly one vehicle**

---

## SQL Queries (queries.sql)

### Query 1: INNER JOIN
**Requirement:** Retrieve booking information along with customer name and vehicle name.

**Concepts Used:** `INNER JOIN`

#### Sample Output
| booking_id | customer_name | vehicle_name     | start_date | end_date   | status     |
|-----------:|---------------|------------------|------------|------------|------------|
| 1 | Alice   | Honda Civic     | 2023-10-01 | 2023-10-05 | completed  |
| 2 | Alice   | Honda Civic     | 2023-11-01 | 2023-11-03 | completed  |
| 3 | Charlie | Honda Civic     | 2023-12-01 | 2023-12-02 | confirmed  |
| 4 | Alice   | Toyota Corolla  | 2023-12-10 | 2023-12-12 | pending    |

---

### Query 2: NOT EXISTS
**Requirement:** Find all vehicles that have never been booked.

**Concepts Used:** `NOT EXISTS`

#### Sample Output
| vehicle_id | name         | type  | model | registration_number | rental_price | status       |
|-----------:|--------------|-------|-------|---------------------|--------------|--------------|
| 3 | Yamaha R15   | bike  | 2023  | GHI-789 | 30 | available   |
| 4 | Ford F-150   | truck| 2020  | JKL-012 | 100| maintenance |

---

### Query 3: WHERE
**Requirement:** Retrieve all available vehicles of a specific type (e.g. cars).

**Concepts Used:** `SELECT`, `WHERE`

#### Sample Output
| vehicle_id | name            | type | model | registration_number | rental_price | status     |
|-----------:|-----------------|------|-------|---------------------|--------------|------------|
| 1 | Toyota Corolla | car  | 2022  | ABC-123 | 50 | available |

---

### Query 4: GROUP BY and HAVING
**Requirement:** Find the total number of bookings for each vehicle and display only those vehicles that have more than 2 bookings.

**Concepts Used:** `GROUP BY`, `HAVING`, `COUNT`

#### Sample Output
| vehicle_name | total_bookings |
|--------------|----------------|
| Honda Civic  | 3              |

---

## How to Run
1. Create the database and load the schema and sample data.
2. Execute the queries:
   ```bash
   psql -d your_database_name -f queries.sql

