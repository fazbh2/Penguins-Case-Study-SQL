#1 How many total penguins are present in the dataset?
SELECT count(species) FROM case_3_penguin.penguins;
#2 How many penguins belong to each species?
SELECT species, count(species) FROM case_3_penguin.penguins
Group By Species;
#3 How many penguins are found on each island?
SELECT island, count(island) FROM case_3_penguin.penguins
Group By island;
#4 List all penguins whose body mass is greater than 5000 grams.
SELECT *
FROM case_3_penguin.penguins
WHERE body_mass_g > 5000;
#5 Find all Gentoo penguins that are female.
SELECT *
FROM case_3_penguin.penguins
WHERE sex = 'female'
  AND species = 'gentoo';
#6 What is the average bill length for each species?
SELECT 
    species,
    ROUND(AVG(bill_length_mm),1) AS avg_bill_length
FROM case_3_penguin.penguins
GROUP BY species;
#7 What is the average body mass for each island?
SELECT 
    island,
    ROUND(AVG(body_mass_g), 1) AS avg_body_mass
FROM case_3_penguin.penguins
GROUP BY island;
#8 What is the maximum flipper length across all penguins?
SELECT 
    MAX(flipper_length_mm ) AS max_flipper_length
FROM case_3_penguin.penguins
WHERE flipper_length_mm NOT IN ('NA', 'N/A', '');

#9 For each species, calculate the minimum and maximum bill depth.
SELECT
    species,
    ROUND(MIN(bill_depth_mm), 1) AS min_bill_depth,
    ROUND(MAX(bill_depth_mm), 1) AS max_bill_depth
FROM case_3_penguin.penguins
WHERE bill_depth_mm NOT IN ('NA', 'N/A', '')
GROUP BY species;
#10 Count how many penguins have missing values in the sex column.
SELECT 
    COUNT(sex) AS missing_sex_count
FROM case_3_penguin.penguins
WHERE sex IN ('NA', 'N/A', '');
#or
SELECT 
    COUNT(*) AS missing_sex_count
FROM case_3_penguin.penguins
WHERE sex IN ('NA', 'N/A', '');
#11 Count how many complete records exist (no NULL values in numeric fields).
SELECT 
    COUNT(*) AS complete_records
FROM case_3_penguin.penguins
WHERE bill_length_mm NOT IN ('NA', 'N/A', '')
  AND bill_depth_mm NOT IN ('NA', 'N/A', '')
  AND flipper_length_mm NOT IN ('NA', 'N/A', '')
  AND body_mass_g NOT IN ('NA', 'N/A', '');
#12 What is the average bill_length_mm / bill_depth_mm ratio for each species?
SELECT
    species,
    ROUND(AVG(bill_length_mm / bill_depth_mm),1) AS avg_bill_ratio
FROM case_3_penguin.penguins
GROUP BY species;
#13 Show the top 5 heaviest penguins along with species.
SELECT
    ROUND(body_mass_g, 1) AS Heaviest_5
FROM case_3_penguin.penguins
WHERE body_mass_g NOT IN ('NA', 'N/A', '')
ORDER BY body_mass_g DESC
LIMIT 5;
#14 For Adelie penguins, find the average flipper length on each island.
SELECT
     species,
	 ROUND(AVG(flipper_length_mm),1) AS AVG_flipper_length
FROM case_3_penguin.penguins
WHERE species = 'Adelie';

#15 Among penguins with bill_depth_mm > 18, find the average body mass per species.
SELECT
    species,
    ROUND(AVG(body_mass_g), 1) AS avg_body_mass
FROM case_3_penguin.penguins
WHERE bill_depth_mm > 18
  AND bill_depth_mm NOT IN ('NA', 'N/A', '')
  AND body_mass_g NOT IN ('NA', 'N/A', '')
GROUP BY species;
#16  List all penguins ordered by flipper length in descending order.
SELECT *
FROM case_3_penguin.penguins
WHERE flipper_length_mm NOT IN ('NA', 'N/A', '')
  AND flipper_length_mm IS NOT NULL
ORDER BY flipper_length_mm DESC;
#17  Which island has the highest average body mass?
SELECT
    island,
    ROUND(AVG(body_mass_g), 1) AS avg_body_mass
FROM case_3_penguin.penguins
WHERE body_mass_g NOT IN ('NA', 'N/A', '')
  AND body_mass_g IS NOT NULL
GROUP BY island
ORDER BY avg_body_mass DESC
LIMIT 1;
#18 Find the species with the highest average flipper length.
SELECT
    species,
    ROUND(AVG(flipper_length_mm), 1) AS avg_flipper_length
FROM case_3_penguin.penguins
WHERE flipper_length_mm NOT IN ('NA', 'N/A', '')
  AND flipper_length_mm IS NOT NULL
GROUP BY species
ORDER BY avg_flipper_length DESC
LIMIT 1;
#19 Calculate the average body mass for male vs female penguins for each species.
SELECT
    species,
    sex,
    ROUND(AVG(body_mass_g), 1) AS avg_body_mass
FROM case_3_penguin.penguins
WHERE body_mass_g NOT IN ('NA', 'N/A', '')
  AND sex NOT IN ('NA', 'N/A', '')
GROUP BY species, sex
ORDER BY species, sex;
#20 20. Compute bill_length_mm / flipper_length_mm ratio for each penguin and list the top 10
#highest ratios.
SELECT
    *,
    (bill_length_mm / flipper_length_mm) AS ratio
FROM case_3_penguin.penguins
WHERE bill_length_mm NOT IN ('NA', 'N/A', '')
  AND flipper_length_mm NOT IN ('NA', 'N/A', '')
ORDER BY ratio DESC
LIMIT 10;





