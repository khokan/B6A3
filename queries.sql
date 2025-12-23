
---

## ✅ queries.sql (All Queries with Solutions)

```sql
-- =====================================================
-- Vehicle Rental System - Required SQL Queries
-- Database: PostgreSQL
-- Tables: users, vehicles, bookings
-- =====================================================

-- -------------------------
-- Query 1: JOIN
-- Retrieve booking information along with:
--   - Customer name
--   - Vehicle name
-- -------------------------
SELECT
  b.booking_id,
  u.name AS customer_name,
  v.name AS vehicle_name,
  b.start_date,
  b.end_date,
  b.status,
  b.total_cost
FROM bookings b
INNER JOIN users u
  ON u.user_id = b.user_id
INNER JOIN vehicles v
  ON v.vehicle_id = b.vehicle_id
ORDER BY b.end_date DESC;


-- -------------------------
-- Query 2: EXISTS
-- Find all vehicles that have never been booked
-- -------------------------
SELECT
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
FROM vehicles v
WHERE NOT EXISTS (
  SELECT 1
  FROM bookings b
  WHERE b.vehicle_id = v.vehicle_id
)
ORDER BY v.vehicle_id;

-- -------------------------
-- Query 3: WHERE
-- Retrieve all available vehicles of a specific type (e.g. cars)
-- -------------------------
SELECT
  v.vehicle_id,
  v.name,
  v.type,
  v.model,
  v.registration_number,
  v.rental_price,
  v.status
FROM vehicles v
WHERE v.status = 'available'
  AND v.type = 'car'
ORDER BY v.rental_price ASC, v.vehicle_id;


-- -------------------------
-- Query 4: GROUP BY and HAVING
-- Find total number of bookings for each vehicle
-- Show only vehicles with more than 2 bookings
-- -------------------------
SELECT
  v.vehicle_id,
  v.name AS vehicle_name,
  COUNT(b.booking_id) AS total_bookings
FROM vehicles v
INNER JOIN bookings b
  ON b.vehicle_id = v.vehicle_id
GROUP BY v.vehicle_id, v.name
HAVING COUNT(b.booking_id) > 2
ORDER BY total_bookings DESC, v.vehicle_id;
