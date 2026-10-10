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

-- Activity log table (for dashboard)
CREATE TABLE activity_log (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    event_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    activity VARCHAR(100) NOT NULL,
    details VARCHAR(255) NOT NULL
);

-- Sample accounts (2 admins, 4 employees)
INSERT INTO users (employee_code, username, password, full_name, role, created_at) VALUES
('ADM-0001', 'mfelas',   'admin123',   'Mark Irvin Felas',     'Admin',    '2026-10-03 08:24:15'),
('ADM-0002', 'jreyes',   'admin123',   'Jerome Reyes',         'Admin',    '2026-10-03 15:47:02'),
('EMP-0001', 'mobanil',  'emp123',     'Mark Justine Obanil',  'Employee', '2026-10-03 11:02:38'),
('EMP-0002', 'vsasing',  'emp123',     'Vince Adrian Sasing',  'Employee', '2026-10-03 19:31:50'),
('EMP-0003', 'dramos',   'emp123',     'Dean Daryl Ramos',     'Employee', '2026-10-03 02:14:07'),
('EMP-0004', 'holaes',   'emp123',     'Hans Norman Olaes',    'Employee', '2026-10-03 22:58:41');

-- Sample activity logs (for dashboard demo)
INSERT INTO activity_log (activity, details) VALUES
('Login', 'Mark Irvin Felas logged in'),
('Login', 'Jerome Reyes logged in'),
('Login', 'Mark Justine Obanil logged in'),
('Applied', 'Jerome Reyes applied for leave');
