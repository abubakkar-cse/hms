INSERT INTO roles (code) VALUES
('ADMIN'),
('DOCTOR'),
('RECEPTIONIST'),
('NURSE'),
('ACCOUNTANT'),
('PHARMACIST'),
('LAB_TECHNICIAN'),
('PATIENT'),
('MANAGER'),
('SUPPORT');


INSERT INTO users
(role_id, username, password_hash, is_active)
VALUES
(1, 'admin01', '$2y$10$samplehash001', TRUE),
(2, 'doctor01', '$2y$10$samplehash002', TRUE),
(2, 'doctor02', '$2y$10$samplehash003', TRUE),
(2, 'doctor03', '$2y$10$samplehash004', TRUE),
(2, 'doctor04', '$2y$10$samplehash005', TRUE),
(2, 'doctor05', '$2y$10$samplehash006', TRUE),
(2, 'doctor06', '$2y$10$samplehash007', TRUE),
(2, 'doctor07', '$2y$10$samplehash008', TRUE),
(2, 'doctor08', '$2y$10$samplehash009', TRUE),
(3, 'reception01', '$2y$10$samplehash010', TRUE),
(4, 'nurse01', '$2y$10$samplehash011', TRUE),
(5, 'accountant01', '$2y$10$samplehash012', TRUE),
(6, 'pharmacist01', '$2y$10$samplehash013', TRUE),
(7, 'labtech01', '$2y$10$samplehash014', TRUE),
(8, 'patient01', '$2y$10$samplehash015', FALSE);

INSERT INTO departments (name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('Dermatology'),
('Pediatrics'),
('Gynecology'),
('ENT'),
('Ophthalmology'),
('Medicine'),
('Urology'),
('Psychiatry'),
('Dental');

INSERT INTO doctors
(user_id, department_id, name, specialization, fee, is_active)
VALUES
(2, 1, 'Dr. Rahim Ahmed', 'Cardiologist', 1200.00, TRUE),
(3, 2, 'Dr. Karim Hasan', 'Neurologist', 1500.00, TRUE),
(4, 3, 'Dr. Sakib Hossain', 'Orthopedic Surgeon', 1000.00, TRUE),
(5, 4, 'Dr. Nusrat Jahan', 'Dermatologist', 800.00, TRUE),
(6, 5, 'Dr. Farhana Akter', 'Child Specialist', 900.00, TRUE),
(7, 6, 'Dr. Sumaiya Islam', 'Gynecologist', 1200.00, TRUE),
(8, 7, 'Dr. Mahmudul Hasan', 'ENT Specialist', 700.00, TRUE),
(9, 8, 'Dr. Tanvir Ahmed', 'Eye Specialist', 850.00, TRUE);

INSERT INTO patients
(patient_no, full_name, dob, phone, address, emergency_phone)
VALUES
('PAT-001', 'Abdur Rahman', '1995-05-12', '01711111111', 'Rajshahi, Bangladesh', '01811111111'),
('PAT-002', 'Nusrat Jahan', '1998-08-20', '01722222222', 'Dhaka, Bangladesh', '01822222222'),
('PAT-003', 'Mohammad Hasan', '1985-02-15', '01733333333', 'Bogura, Bangladesh', '01833333333'),
('PAT-004', 'Fatema Akter', '2000-11-25', '01744444444', 'Rajshahi, Bangladesh', '01844444444'),
('PAT-005', 'Sabbir Hossain', '1992-03-10', '01755555555', 'Dhaka, Bangladesh', '01855555555'),
('PAT-006', 'Sumaiya Islam', '1996-07-18', '01766666666', 'Khulna, Bangladesh', '01866666666'),
('PAT-007', 'Rakib Ahmed', '1988-09-05', '01777777777', 'Sylhet, Bangladesh', '01877777777'),
('PAT-008', 'Maliha Chowdhury', '2002-01-30', '01788888888', 'Rajshahi, Bangladesh', '01888888888'),
('PAT-009', 'Tanvir Hasan', '1990-06-22', '01799999999', 'Chittagong, Bangladesh', '01899999999'),
('PAT-010', 'Sadia Afrin', '1997-12-14', '01611111111', 'Dhaka, Bangladesh', '01622222222'),
('PAT-011', 'Imran Hossain', '1980-04-08', '01633333333', 'Rajshahi, Bangladesh', '01644444444'),
('PAT-012', 'Jannatul Ferdous', '1999-10-19', '01655555555', 'Rangpur, Bangladesh', '01666666666'),
('PAT-013', 'Mehedi Hasan', '1994-02-28', '01677777777', 'Pabna, Bangladesh', '01688888888'),
('PAT-014', 'Sharmin Akter', '1987-05-16', '01699999999', 'Natore, Bangladesh', '01511111111'),
('PAT-015', 'Arif Hossain', '2001-09-09', '01522222222', 'Rajshahi, Bangladesh', '01533333333');

INSERT INTO doctor_slots
(doctor_id, starts_at, ends_at, is_open)
VALUES
(19, '2026-11-11 09:00:00', '2026-11-11 09:30:00', TRUE),
(19, '2026-11-11 09:30:00', '2026-11-11 10:00:00', TRUE),
(19, '2026-11-11 10:00:00', '2026-11-11 10:30:00', TRUE),

(20, '2026-11-11 09:00:00', '2026-11-11 09:30:00', TRUE),
(20, '2026-11-11 09:30:00', '2026-11-11 10:00:00', TRUE),

(21, '2026-11-11 10:00:00', '2026-11-11 10:30:00', TRUE),
(21, '2026-11-11 10:30:00', '2026-11-11 11:00:00', TRUE),

(24, '2026-11-11 11:00:00', '2026-11-11 11:30:00', TRUE),
(24, '2026-11-11 11:30:00', '2026-11-11 12:00:00', TRUE),

(25, '2026-11-11 12:00:00', '2026-11-11 12:30:00', TRUE),
(25, '2026-11-11 12:30:00', '2026-11-11 13:00:00', TRUE),

(23, '2026-11-11 14:00:00', '2026-11-11 14:30:00', TRUE),
(22, '2026-11-11 14:30:00', '2026-11-11 15:00:00', TRUE),

(26, '2026-11-11 15:00:00', '2026-11-11 15:30:00', TRUE),
(26, '2026-11-11 16:00:00', '2026-11-11 16:30:00', TRUE);

select * from doctors;
select * from doctor_slots;

INSERT INTO appointments
(slot_id, patient_id, status)
VALUES
(46, 1, 'booked'),
(47, 2, 'checked_in'),
(48, 3, 'cancelled'),
(49, 4, 'booked'),
(50, 5, 'no_show'),
(51, 6, 'booked'),
(52, 7, 'checked_in'),
(53, 8, 'booked'),
(54, 9, 'cancelled'),
(54, 10, 'booked'),

(55, 12, 'booked');


