-- ===================================================
-- Trips per Taxi Company 
-- Date Range: Nov 15–16, 2017
-- Objective: Identify leading taxi companies by trip volume
-- ===================================================

SELECT 
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM 
    trips t
INNER JOIN 
    cabs c ON c.cab_id = t.cab_id
WHERE
    t.start_ts >= '2017-11-15'
    AND t.start_ts < '2017-11-17'
GROUP BY
    c.company_name
ORDER BY 
    trips_amount DESC;

-- ===================================================
-- Trips for Taxi Companies Containing "Yellow" or "Blue"
-- Date Range: Nov 1–7, 2017
-- Objective: Count trips for companies with specific keywords in their name
-- ===================================================

SELECT 
    c.company_name,
    COUNT(t.trip_id) AS trips_amount
FROM 
    cabs c
INNER JOIN 
    trips t ON t.cab_id = c.cab_id
WHERE
    (c.company_name LIKE '%Yellow%' 
     OR c.company_name LIKE '%Blue%')
    AND t.start_ts >= '2017-11-01'
    AND t.start_ts < '2017-11-08'
GROUP BY
    c.company_name
ORDER BY
    trips_amount DESC;

-- ===================================================
-- Trips for Flash Cab and Taxi Affiliation Services
-- Date Range: Nov 1–7, 2017
-- Objective: Compare trip volume of top companies vs all others
-- ===================================================

SELECT 
    CASE
        WHEN c.company_name = 'Flash Cab' THEN 'Flash Cab'
        WHEN c.company_name = 'Taxi Affiliation Services' THEN 'Taxi Affiliation Services'
        ELSE 'Other'
    END AS company,
    COUNT(t.trip_id) AS trips_amount
FROM 
    cabs c
INNER JOIN 
    trips t ON t.cab_id = c.cab_id
WHERE
    t.start_ts >= '2017-11-01'
    AND t.start_ts < '2017-11-08'
GROUP BY 
    1
ORDER BY 
    trips_amount DESC;

-- ===================================================
-- Retrieve Neighborhood IDs for O'Hare and Loop
-- Objective: Identify neighborhood identifiers for selected areas
-- ===================================================

SELECT 
    neighborhood_id,
    name
FROM 
    neighborhoods
WHERE
    name IN ('O''Hare', 'Loop');

-- ===================================================
-- Classify Weather Conditions by Hour
-- Objective: Categorize hourly weather records as 'Bad' or 'Good'
-- ===================================================

SELECT 
    ts,
    CASE
        WHEN description ILIKE '%rain%' 
             OR description ILIKE '%storm%' THEN 'Bad'
        ELSE 'Good'
    END AS weather_conditions
FROM 
    weather_records;


-- ===================================================
-- Loop -> O'Hare Trips on Saturday with Weather Conditions
-- Date: Saturdays only
-- Objective: Retrieve trip start time, weather condition, and duration
-- ===================================================

SELECT 
    t.start_ts,
    w.weather_conditions,
    t.duration_seconds
FROM 
    trips t
INNER JOIN (
    SELECT
        ts,
        CASE
            WHEN description ILIKE '%rain%' 
                 OR description ILIKE '%storm%' THEN 'Bad'
            ELSE 'Good'
        END AS weather_conditions
    FROM
        weather_records
) w ON w.ts = t.start_ts
WHERE 
    t.pickup_location_id = 50
    AND t.dropoff_location_id = 63
    AND EXTRACT(DOW FROM t.start_ts) = 6
ORDER BY
    t.trip_id;