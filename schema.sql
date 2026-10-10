-- Employee Management System Database

DROP DATABASE IF EXISTS employee_management_system;
CREATE DATABASE employee_management_system;
USE employee_management_system;

-- Users table (login accounts)
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_code VARCHAR(20) NOT NULL UNIQUE,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    role VARCHAR(20) NOT NULL DEFAULT 'Employee',
    is_active TINYINT(1) DEFAULT 1,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Employees table (personal + work info)
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_code VARCHAR(20) NOT NULL UNIQUE,
    first_name VARCHAR(50) NOT NULL,
    middle_name VARCHAR(50) NULL,
    last_name VARCHAR(50) NOT NULL,
    birthdate DATE NOT NULL,
    gender VARCHAR(10) NULL,
    email VARCHAR(100) UNIQUE,
    contact_number VARCHAR(20),
    address VARCHAR(255),
    hire_date DATE NOT NULL,
    college VARCHAR(100),
    position VARCHAR(100),
    employment_type VARCHAR(20) DEFAULT 'Full-Time',
    status VARCHAR(20) DEFAULT 'Active',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Activity log table (for dashboard)
CREATE TABLE activity_log (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    event_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    activity VARCHAR(100) NOT NULL,
    details VARCHAR(255) NOT NULL
);

-- Sample users (2 admins, 4 employees)
INSERT INTO users (employee_code, username, password, full_name, role, created_at) VALUES
('ADM-0001', 'mfelas',   'admin123',   'Mark Irvin Felas',     'Admin',    '2026-10-03 08:24:15'),
('ADM-0002', 'jreyes',   'admin123',   'Jerome Reyes',         'Admin',    '2026-10-03 15:47:02'),
('EMP-0001', 'mobanil',  'emp123',     'Mark Justine Obanil',  'Employee', '2026-10-03 11:02:38'),
('EMP-0002', 'vsasing',  'emp123',     'Vince Adrian Sasing',  'Employee', '2026-10-03 19:31:50'),
('EMP-0003', 'dramos',   'emp123',     'Dean Daryl Ramos',     'Employee', '2026-10-03 02:14:07'),
('EMP-0004', 'holaes',   'emp123',     'Hans Norman Olaes',    'Employee', '2026-10-03 22:58:41');

-- Sample employees
INSERT INTO employees (employee_code, first_name, middle_name, last_name, birthdate, gender, email, contact_number, address, hire_date, college, position, employment_type, status) VALUES
('ADM-0001', 'Mark Irvin', 'Dizon', 'Felas', '1990-06-20', 'Male', 'mfelas@university.edu', '09181234567', 'Quezon City', '2021-08-01', 'CICT', 'Instructor I', 'Full-Time', 'Active'),
('ADM-0002', 'Jerome', 'Mendoza', 'Reyes', '1993-02-14', 'Male', 'jreyes@university.edu', '09201234567', 'Makati', '2022-01-10', 'CCJ', 'Assistant Professor', 'Full-Time', 'Active'),
('EMP-0001', 'Mark Justine', 'Bautista', 'Obanil', '1992-11-05', 'Male', 'mobanil@university.edu', '09191234567', 'Pasig', '2021-08-01', 'IT', 'IT Staff', 'Full-Time', 'Active'),
('EMP-0002', 'Vince Adrian', 'Ramos', 'Sasing', '1994-09-30', 'Male', 'vsasing@university.edu', '09211234567', 'Taguig', '2022-06-15', 'CICT', 'Instructor II', 'Full-Time', 'Active'),
('EMP-0003', 'Dean Daryl', 'Santos', 'Ramos', '1995-04-12', 'Male', 'dramos@university.edu', '09251234567', 'Manila', '2023-01-05', 'CICT', 'Instructor I', 'Full-Time', 'Active'),
('EMP-0004', 'Hans Norman', 'Cruz', 'Olaes', '1991-08-18', 'Male', 'holaes@university.edu', '09261234567', 'Quezon City', '2020-03-20', 'CILT', 'Learning Tech Specialist', 'Part-Time', 'Active');

-- Sample activity logs
INSERT INTO activity_log (activity, details) VALUES
('Login', 'Mark Irvin Felas logged in'),
('Login', 'Jerome Reyes logged in'),
('Login', 'Mark Justine Obanil logged in'),
('Applied', 'Jerome Reyes applied for leave');