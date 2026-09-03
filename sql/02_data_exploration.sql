USE hospital_analytics;

SELECT 'patients' AS table_name, COUNT(*) AS row_count FROM patients
UNION ALL
SELECT 'appointment', COUNT(*) FROM appointment
UNION ALL
SELECT 'bed', COUNT(*) FROM bed
UNION ALL
SELECT 'bedrecords', COUNT(*) FROM bedrecords
UNION ALL
SELECT 'department', COUNT(*) FROM department
UNION ALL
SELECT 'doctor', COUNT(*) FROM doctor
UNION ALL
SELECT 'helpers', COUNT(*) FROM helpers
UNION ALL
SELECT 'medicalrecord', COUNT(*) FROM medicalrecord
UNION ALL
SELECT 'nurse', COUNT(*) FROM nurse
UNION ALL
SELECT 'room', COUNT(*) FROM room
UNION ALL
SELECT 'roomrecords', COUNT(*) FROM roomrecords
UNION ALL
SELECT 'staffshift', COUNT(*) FROM staffshift
UNION ALL
SELECT 'surgeryrecord', COUNT(*) FROM surgeryrecord
UNION ALL
SELECT 'ward', COUNT(*) FROM ward;

SHOW TABLES;
-- Patients table analysis

-- Patients count
SELECT 
COUNT(*) FROM patients;

-- gender distribution
SELECT 
COUNT(*) FROM patients
GROUP BY Gender;

describe room; 
DESCRIBE nurse;

DESCRIBE helpers;

DESCRIBE staffshift;

DESCRIBE surgeryrecord;

SHOW CREATE TABLE appointment;
