USE hospital_analytics;

-- Missing patient IDs
SELECT *
FROM patients
WHERE patient_Id=NULL;

-- Duplicate patient IDs
SELECT patient_Id,COUNT(*) AS duplicate_count
FROM patients
GROUP BY patient_Id
HAVING COUNT(*)>1;

-- Missing important appointment IDs
SELECT *
FROM appointment
WHERE appoIntment_Id IS NULL;

-- invalid patient ages
SELECT patient_Id,FName,LName,Date_Of_Birth
FROM patients
WHERE Date_Of_Birth IS NULL
OR Date_Of_Birth>curdate()
OR timestampdiff(YEAR,Date_Of_Birth,CURDATE())>120;

-- patient data quality check
SELECT
    COUNT(*) AS total_patients,
    SUM(FName IS NULL) AS missing_first_name,
    SUM(LName IS NULL) AS missing_last_name,
    SUM(Gender IS NULL) AS missing_gender,
    SUM(Date_Of_Birth IS NULL) AS missing_dob,
    SUM(contact_No IS NULL) AS missing_contact,
    SUM(pt_Address IS NULL) AS missing_address
FROM patients;

SELECT distinct Gender
FROM patients;

SELECT distinct appointment_status
FROM appointment;
-- ===
SELECT DISTINCT mode_of_payment
FROM appointment;
SELECT distinct mode_of_appointment
FROM appointment;
SELECT distinct Gender
FROM doctor;
SELECT distinct Gender
FROM nurse;
SELECT distinct Gender
FROM helpers;

-- appointment to patients
SELECT a.appointment_Id, a.patient_Id
FROM appointment a
LEFT JOIN patients p
    ON a.patient_Id = p.patient_Id
WHERE p.patient_Id IS NULL;

-- appointement to doctors
SELECT a.appointment_Id, a.doct_Id
FROM appointment a
LEFT JOIN doctor d
    ON a.doct_Id = d.doct_Id
WHERE d.doct_Id IS NULL;

-- medical records to patients
SELECT m.record_Id, m.patient_Id
FROM medicalrecord m
LEFT JOIN patients p
    ON m.patient_Id = p.patient_Id
WHERE p.patient_Id IS NULL;

SELECT *
FROM appointment
WHERE payment_amount < 0;

SELECT *
FROM bedrecords
WHERE amount < 0;

SELECT *
FROM roomrecords
WHERE amount < 0;

SELECT *
FROM bedrecords
WHERE discharge_Date < admission_Date;

SELECT *
FROM roomrecords
WHERE discharge_Date < admission_Date;



SELECT *
FROM medicalrecord
WHERE next_Visit < visit_Date;

SELECT
    COUNT(*) AS invalid_next_visit_records
FROM medicalrecord
WHERE next_Visit < visit_Date;

-- percentage of invalid data rows
SELECT
    COUNT(*) AS total_records,
    SUM(next_Visit < visit_Date) AS invalid_records,
    ROUND(
        100 * SUM(next_Visit < visit_Date) / COUNT(*),
        2
    ) AS invalid_percentage
FROM medicalrecord;

SELECT
    appointment_status,
    COUNT(*) AS appointment_count
FROM appointment
WHERE appointment_Date > CURDATE()
GROUP BY appointment_status;