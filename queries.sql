SELECT * from patients;
SELECT * FROM departments;
SELECT * FROM doctors;
SELECT * FROM doctor_slots;
SELECT * FROM appointments;
INSERT INTO departments(name) VALUES('Phisiotherapy');

-- 2
INSERT INTO patients(patient_no,full_name,dob,phone,address,emergency_phone) VALUES
('PAT-222','Nushrat Jahan', '2001-04-18',01785694,'raj', 01111);

-- 3
SELECT patient_no, full_name, dob, phone FROM patients WHERE full_name like('nus%');

-- 5
SELECT id AS Doctor_id, name AS Doctor_name, fee as Fee FROM doctors WHERE fee<=1000 ORDER BY fee ASC, name ASC;

-- 6
SET @slot_start = TIMESTAMP(
UTC_DATE() + INTERVAL 1 DAY,
'16:00:00'
);
INSERT INTO doctor_slots(doctor_id,starts_at,ends_at) VALUES
(
    26,
    @slot_start,
    DATE_ADD(@slot_start, INTERVAL 30 MINUTE)
);

INSERT INTO doctor_slots (doctor_id, starts_at, ends_at)
VALUES (
    1,
    @slot_start,
    DATE_ADD(@slot_start, INTERVAL 30 MINUTE)
);
-- 7
-- 7
SET @slot_id = (
    SELECT id
    FROM doctor_slots
    WHERE doctor_id = 26
      AND starts_at = @slot_start
);

INSERT INTO appointments (slot_id, patient_id, status)
VALUES (@slot_id, 3, 'booked');

SET @appointment_id = LAST_INSERT_ID();

-- 8
UPDATE appointments
SET status = 'cancelled'
WHERE id = @appointment_id
  AND status = 'booked';

SELECT id, slot_id, patient_id, status
FROM appointments
WHERE id = @appointment_id;


--

USE hospital_db2;


-- 09. প্রতিটি username-এর সঙ্গে তার নির্ধারিত role দেখাও।
SELECT u.username, r.code AS role_name
FROM users AS u
JOIN roles AS r ON r.id = u.role_id
ORDER BY u.username;


-- 10. সক্রিয় ডাক্তারদের নাম, বিভাগ ও consultation fee দেখাও।
SELECT d.name AS doctor_name,
       dep.name AS department,
       d.fee AS consultation_fee
FROM doctors AS d
JOIN departments AS dep ON dep.id = d.department_id
WHERE d.is_active = TRUE
ORDER BY dep.name, d.name;


-- 11. সব appointment-এর ID, রোগীর নাম, ডাক্তারের নাম,
--     slot-এর শুরুর সময় ও status দেখাও।
SELECT a.id AS appointment_id,
       p.full_name AS patient_name,
       d.name AS doctor_name,
       s.starts_at AS slot_start_utc,
       a.status
FROM appointments AS a
JOIN patients AS p ON p.id = a.patient_id
JOIN doctor_slots AS s ON s.id = a.slot_id
JOIN doctors AS d ON d.id = s.doctor_id
ORDER BY s.starts_at, a.id;


-- 12. Doctor ID 1-এর ভবিষ্যতের খোলা ও খালি slot-এর
--     ID, শুরুর সময় ও শেষের সময় দেখাও।
SELECT s.id AS slot_id,
       s.starts_at AS slot_start_utc,
       s.ends_at AS slot_end_utc
FROM doctor_slots AS s
LEFT JOIN appointments AS a ON a.active_slot_id = s.id
WHERE s.doctor_id = 1
  AND s.is_open = TRUE
  AND s.starts_at > UTC_TIMESTAMP()
  AND a.id IS NULL
ORDER BY s.starts_at, s.id;


-- 13. প্রত্যেক ডাক্তারের booked appointment গুনে দেখাও।
--     কোনো booked appointment না থাকলে 0 দেখাও।
SELECT d.id AS doctor_id,
       d.name AS doctor_name,
       COUNT(a.id) AS total_booked
FROM doctors AS d
LEFT JOIN doctor_slots AS s ON s.doctor_id = d.id
LEFT JOIN appointments AS a
    ON a.slot_id = s.id AND a.status = 'booked'
GROUP BY d.id, d.name
ORDER BY total_booked DESC, d.name, d.id;


-- 14. কমপক্ষে দুটি booked appointment আছে এমন ডাক্তারদের
--     নাম ও booking সংখ্যা দেখাও।
SELECT d.name AS doctor_name,
       COUNT(a.id) AS total_booked
FROM doctors AS d
JOIN doctor_slots AS s ON s.doctor_id = d.id
JOIN appointments AS a ON a.slot_id = s.id
WHERE a.status = 'booked'
GROUP BY d.id, d.name
HAVING COUNT(a.id) >= 2
ORDER BY total_booked DESC, d.name, d.id;


-- 15. কখনো appointment করেননি এমন রোগীদের নম্বর ও নাম দেখাও।
SELECT p.patient_no, p.full_name AS patient_name
FROM patients AS p
WHERE NOT EXISTS (
    SELECT 1
    FROM appointments AS a
    WHERE a.patient_id = p.id
)
ORDER BY p.patient_no;


-- 16. নির্দিষ্ট UTC তারিখের সব appointment-এর
--     ID, status ও slot-এর শুরুর সময় দেখাও।
--     উদাহরণের তারিখের জায়গায় প্রয়োজনীয় UTC তারিখ বসাও।
SET @report_date = CAST('2026-11-11' AS DATE);

SELECT a.id AS appointment_id,
       a.status,
       s.starts_at AS slot_start_utc
FROM appointments AS a
JOIN doctor_slots AS s ON s.id = a.slot_id
WHERE s.starts_at >= @report_date
  AND s.starts_at < @report_date + INTERVAL 1 DAY
ORDER BY s.starts_at, a.id;
--