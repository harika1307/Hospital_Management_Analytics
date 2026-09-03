USE hospital_analytics;

-- Q1 How many appointments are there?
SELECT COUNT(*) AS total_appointments
FROM appointment;

-- Q2 Appointment completion rate
SELECT
COUNT(CASE WHEN appointment_status='Completed' THEN 1 END) AS completed_appointments,
COUNT(*) AS total_appointments,
ROUND(100*COUNT(CASE WHEN appointment_status='Completed' THEN 1 END)/(COUNT(*)),2) AS completion_rate
FROM appointment;

-- Q3 Appointment cancellation rate
SELECT
COUNT(CASE WHEN appointment_status='Cancelled' THEN 1 END) AS cancelled_appointments,
COUNT(*) AS total_appointments,
ROUND(100*COUNT(CASE WHEN appointment_status='Cancelled' THEN 1 END)/(COUNT(*)),2) AS cancellation_rate
FROM appointment;

-- Q4 Which calender month has highest number of appointments
SELECT
    MONTHNAME(appointment_Date) AS month,
    COUNT(*) AS total_appointments_per_month
FROM appointment
WHERE appointment_Date IS NOT NULL
GROUP BY MONTH(appointment_Date),MONTHNAME(appointment_Date)
ORDER BY total_appointments_per_month DESC
LIMIT 1;

-- Q5 Which dept recevies most appointments
SELECT 
d.dept_Name as department_name,
COUNT(*) AS tot_appointments
FROM appointment AS a
JOIN Doctor as r
ON a.doct_Id=r.doct_Id
JOIN Department AS d
ON r.dept_Id=d.dept_Id
GROUP BY d.dept_Name
ORDER BY tot_appointments DESC;
