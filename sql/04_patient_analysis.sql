USE hospital_analytics;

-- Q1-how many patients are there?
SELECT COUNT(*) AS total_patients
FROM patients;

-- Q2-gender distribution
SELECT Gender,
COUNT(*) AS patient_count,
ROUND(100*COUNT(*)/(SELECT COUNT(*) FROM patients),2) AS percentage
FROM patients
GROUP BY Gender
ORDER BY patient_count DESC;

-- Q3-Age distribution
SELECT
    patient_Id,
    FName,
    LName,
    Date_Of_Birth,
    TIMESTAMPDIFF(YEAR, Date_Of_Birth, CURDATE()) AS age
FROM patients
ORDER BY age;

SELECT
CASE 
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE())<18 THEN '0-17'
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE()) BETWEEN 18 AND 29 THEN '18-29'
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE()) BETWEEN 30 AND 44 THEN '30-44'
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE()) BETWEEN 45 AND 59 THEN '45-59'
ELSE '60+'
END AS age_group,
COUNT(*) AS patient_count,
ROUND(100*COUNT(*)/(SELECT COUNT(*) FROM patients),2) AS percentage
FROM patients
GROUP BY age_group
ORDER BY patient_count DESC;

-- Q4 Which age group has highest number of patients?
SELECT
CASE 
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE())<18 THEN '0-17'
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE()) BETWEEN 18 AND 29 THEN '18-29'
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE()) BETWEEN 30 AND 44 THEN '30-44'
WHEN TIMESTAMPDIFF(YEAR,Date_Of_Birth,CURDATE()) BETWEEN 45 AND 59 THEN '45-59'
ELSE '60+'
END AS age_group,
COUNT(*) AS patient_count,
ROUND(100*COUNT(*)/(SELECT COUNT(*) FROM patients),2) AS percentage
FROM patients
GROUP BY age_group
ORDER BY patient_count DESC
LIMIT 1;

-- Q5 Patients with multiple medical records
SELECT COUNT(*) AS patients_with_multiple_records
FROM (
	SELECT patient_Id
    FROM medicalrecord
    GROUP BY patient_Id
    HAVING COUNT(*)>1
) AS patient_records;



