select * from vnlman

UPDATE vnlman
SET"SET_Efficiency_%" = REPLACE("SET_Efficiency_%", '-', '0')
WHERE "SET_Efficiency_%" = '-';



-- Tambahkan kolom sementara dengan tipe data float
ALTER TABLE vnlman
ADD COLUMN set_efficiency_float float;

-- Salin nilai dari kolom asli ke kolom sementara, memastikan nilai negatif tetap sama
UPDATE vnlman
SET set_efficiency_float = CAST("SET_Efficiency_%" AS float);

-- Hapus kolom asli
ALTER TABLE vnlman
DROP COLUMN "SET_Efficiency_%";

-- Ganti nama kolom sementara ke nama kolom asli
ALTER TABLE vnlman
RENAME COLUMN set_efficiency_float TO "SET_Efficiency_%";




SELECT 
    "Player_Name",
    "Position",
    "Team",
    "VS_Team",
    "Match",
    "Week",
    "SET_Point",
    "SET_Errors",
    "SET_Attempts",
    "SET_Total",
    "SET_Efficiency_%",
    ROUND(("SET_Efficiency_%" * "SET_Attempts")::numeric, 2) AS "Best_Setter_Performance"
FROM 
    (
        SELECT 
"Player_Name",
    "Position",
    "Team",
    "VS_Team",
    "Match",
    "Week",
    "SET_Point",
    "SET_Errors",
    "SET_Attempts",
    "SET_Total",
    "SET_Efficiency_%",
            ("SET_Efficiency_%" * "SET_Attempts") AS calc_weighted_efficiency
        FROM 
            vnlman
        WHERE 
            "Position" = 'S'
    ) AS subquery
WHERE 
    calc_weighted_efficiency > 0
ORDER BY 
    12 DESC;
    
 
UPDATE "OverAllSetterPerformance"
SET "Week" = '4'
WHERE Trim("Week") = 'Final_Round'


    
    
SELECT*
from "OverAllSetterPerformance"
WHERE Trim("Week") = '4'

SELECT 
Count("Player_Name")
FROM vnlweek1



ALTER TABLE "OverAllSetterPerformance"
ALTER COLUMN "Week" TYPE INTEGER USING "Week"::integer;



SELECT * 
FROM "OverAllSetterPerformance"
WHERE TRIM("Week") NOT IN ('1', '2', '3');
