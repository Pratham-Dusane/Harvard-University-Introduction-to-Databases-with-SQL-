-- Sample queries for the database

-- Find all rice production records for a specific district
SELECT * FROM "crop_data"
WHERE "Dist_Code" = 1 AND "Year" >= 2000;

-- Insert new crop data for a district
INSERT INTO "crop_data" ("Dist_Code", "Year", "Rice_Area", "Rice_Production", "Rice_Yield", "Wheat_Area", "Wheat_Production", "Wheat_Yield")
VALUES (1, 2021, 600.0, 500.0, 833.33, 55.0, 30.0, 545.45);

-- Update the rice yield for a specific district and year
UPDATE "crop_data"
SET "Rice_Yield" = 850.0
WHERE "Dist_Code" = 1 AND "Year" = 2021;

-- Delete all crop data for a specific district and year
DELETE FROM "crop_data"
WHERE "Dist_Code" = 1 AND "Year" = 2021;

-- Find the average rice yield for a specific district across all years
SELECT AVG("Rice_Yield") as "Average_Rice_Yield"
FROM "crop_data"
WHERE "Dist_Code" = 1;

-- Find the total wheat production for all districts in a specific year
SELECT SUM("Wheat_Production") as "Total_Wheat_Production"
FROM "crop_data"
WHERE "Year" = 2021;

-- Find all districts with rice yield greater than a specific value in a given year
SELECT "Dist_Code", "Year", "Rice_Yield"
FROM "crop_data"
WHERE "Rice_Yield" > 800 AND "Year" = 2021;

-- List all years with data available for a specific district
SELECT DISTINCT "Year"
FROM "crop_data"
WHERE "Dist_Code" = 1;

-- Find the district with the highest rice production in a specific year
SELECT "Dist_Code", "Rice_Production"
FROM "crop_data"
WHERE "Year" = 2021
ORDER BY "Rice_Production" DESC
LIMIT 1;

-- Count the number of districts that reported data in a specific year
SELECT COUNT(DISTINCT "Dist_Code") as "District_Count"
FROM "crop_data"
WHERE "Year" = 2021;

-- Retrieve all data for a specific state using the state code
SELECT * FROM "crop_data" AS cd
JOIN "districts" AS d ON cd."Dist_Code" = d."Dist_Code"
WHERE d."State_Code" = 14;

-- Find the yearly rice production trend for a specific district
SELECT "Year", "Rice_Production"
FROM "crop_data"
WHERE "Dist_Code" = 1
ORDER BY "Year";
