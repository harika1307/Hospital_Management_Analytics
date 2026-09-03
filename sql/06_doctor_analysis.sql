USE hospital_analytics;

-- Q1 Which doctors handle most patients
SELECT 
doc.doct_Id,
CONCAT(doc.FName,' ',doc.LName) AS doctor_Name,
COUNT(distinct a.patient_Id) AS tot_patients
FROM appointment AS a
JOIN doctor AS doc
ON doc.doct_Id=a.doct_Id
GROUP BY doc.doct_Id
ORDER BY tot_patients DESC;

-- Q2 Which dept have highest doctor workload
SELECT 
d.dept_Name,
SUM(doctor_workloads.total_appointments) AS tot_workload
FROM department AS d
JOIN (
SELECT  
doc.doct_Id AS doctor_id,
doc.dept_Id AS dep_id,
COUNT(DISTINCT a.appoIntment_Id) AS total_appointments
FROM appointment AS a
JOIN doctor AS doc
ON a.doct_Id=doc.doct_Id
GROUP BY doc.doct_Id,doc.dept_Id
) AS  doctor_workloads
ON doctor_workloads.dep_id=d.dept_Id 
GROUP BY d.dept_Id,d.dept_Name
ORDER BY tot_workload desc;

-- Q3 Top 10 doctors by appointments
SELECT
doc.doct_Id,
CONCAT(doc.FName,' ',doc.LName) AS doctor_Name,
COUNT(a.appoIntment_Id) AS appointment_count
FROM doctor AS doc
JOIN appointment AS a
ON a.doct_Id=doc.doct_Id
group by doc.doct_Id
ORDER BY appointment_count DESC
LIMIT 10;
