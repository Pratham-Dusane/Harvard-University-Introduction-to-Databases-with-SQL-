-- Table to store district and state information
CREATE TABLE "districts" (
    "Dist_Code" INTEGER PRIMARY KEY,
    "State_Code" INTEGER,
    "State_Name" TEXT NOT NULL,
    "Dist_Name" TEXT NOT NULL
);

-- Table to store crop data by year and district
CREATE TABLE "crop_data" (
    "Dist_Code" INTEGER,
    "Year" INTEGER,
    "Rice_Area" NUMERIC,
    "Rice_Production" NUMERIC,
    "Rice_Yield" NUMERIC,
    "Wheat_Area" NUMERIC,
    "Wheat_Production" NUMERIC,
    "Wheat_Yield" NUMERIC,
    PRIMARY KEY ("Dist_Code", "Year"),
    FOREIGN KEY ("Dist_Code") REFERENCES "districts"("Dist_Code")
);

-- View for Average Rice Yield by District
CREATE VIEW "Average_Rice_Yield_By_District" AS
SELECT
    "Dist_Code",
    AVG("Rice_Yield") AS "Average_Rice_Yield"
FROM
    "crop_data"
GROUP BY
    "Dist_Code";

-- View for Total Wheat Production by Year
CREATE VIEW "Total_Wheat_Production_By_Year" AS
SELECT
    "Year",
    SUM("Wheat_Production") AS "Total_Wheat_Production"
FROM
    "crop_data"
GROUP BY
    "Year";

-- View for Detailed Crop Data by State
CREATE VIEW "Detailed_Crop_Data_By_State" AS
SELECT
    d."State_Name",
    cd."Dist_Code",
    cd."Year",
    cd."Rice_Area",
    cd."Rice_Production",
    cd."Rice_Yield",
    cd."Wheat_Area",
    cd."Wheat_Production",
    cd."Wheat_Yield"
FROM
    "crop_data" cd
JOIN
    "districts" d ON cd."Dist_Code" = d."Dist_Code";

-- Index on Dist_Code in crop_data
CREATE INDEX idx_crop_data_dist_code
ON "crop_data" ("Dist_Code");

-- Index on Year in crop_data
CREATE INDEX idx_crop_data_year
ON "crop_data" ("Year");

-- Composite Index on Dist_Code and Year in crop_data
CREATE INDEX idx_crop_data_dist_code_year
ON "crop_data" ("Dist_Code", "Year");

-- Index on State_Code in districts
CREATE INDEX idx_districts_state_code
ON "districts" ("State_Code");
