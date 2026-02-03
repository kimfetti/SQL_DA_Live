-- Drop database if it exists (so the script is re-runnable)
DROP DATABASE IF EXISTS learning_platform;
CREATE DATABASE learning_platform;
USE learning_platform;

-- USERS

-- Drop table if it exists (safe if script re-run)
DROP TABLE IF EXISTS users;

-- Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    email VARCHAR(255),
    created_at VARCHAR(50),
    country VARCHAR(50),
    marketing_source VARCHAR(50)
);

-- Insert sample users
INSERT INTO users (user_id, email, created_at, country, marketing_source) VALUES
(1,  'Kim@example.com',          '2023-11-05',  'United States',   NULL),
(2,  ' alex@~Example.com ',       '2023-11-18',  'US',              'google'),
(3,  'MARIA@test.com',           '2024-01-09',  ' united states ', 'LinkedIn'),
(4,  'sam~sam@test.com',         '2024-01-22',  'Canada',          'linkedin'),
(5,  'jordan@test.com',          '2024-03-01',  NULL,              'Google'),
(6,  'lee@test.com',             '2024-03-18',  'USA',             'instagram'),
(7,  'pat@test.com ',            '2024-03-29',  'United States',   NULL),
(8,  'chris@test.com',           '2024-06-03',  'Canada ',         'Google'),
(9,  'taylor@test.com',          '2024-06-19',  'US',              'google'),
(10, 'jamie@test.com',           '2024-09-07',  'United Kingdom',  'LinkedIn'),
(11, 'morgan@test.com',          '2025-01-15',  'UK',              'linkedin'),
(12, 'riley@test.com',           '2025-01-28',  'United States',   'Instagram'),
(13, 'casey@test.com',           '2025-03-21',  NULL,              'Google'),
(14, 'devon@test.com',           '2025-03-29',  'USA ',            'google'),
(15, 'quinn~patrick@Test.com',   '2025-06-17',  'Canada',          'LinkedIn');


-- SUBSCRIPTIONS

-- Drop table if exists (safe if script re-run)
DROP TABLE IF EXISTS subscriptions;

-- Create subscriptions table
CREATE TABLE subscriptions (
    subscription_id INT PRIMARY KEY,
    user_id INT,
    plan_name VARCHAR(50),
    start_date DATE,   
    end_date DATE,    
    price VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

INSERT INTO subscriptions (subscription_id, user_id, plan_name, start_date, end_date, price) VALUES
(1, 1, 'Basic',      '2023-11-06', '2024-05-05', '9.99'),
(2, 2, 'Premium',    '2023-11-20', '2024-05-31', '19.99'),
(3, 2, 'Pro',        '2024-06-01', NULL,         '29.99'),
(4, 3, 'Trial',      '2024-01-10', '2024-01-31', '0.00'),
(5, 3, 'Pro',        '2024-02-01', NULL,         '29.99'),
(6, 4, 'Basic',      '2024-02-10', '2024-08-15', '9.99'),
(7, 5, 'Trial',      '2024-03-05', '2024-03-31', '0.00'),
(8, 5, 'Basic',      '2024-04-01', NULL,         '9.99'),
(9, 6, 'Premium',    '2024-03-20', NULL,         '19.99'),
(10, 7, 'Basic',     '2024-04-05', NULL,         '9.99'),
(11, 8, 'Premium',   '2024-06-05', NULL,         '19.99'),
(12, 9, 'Pro',       '2024-06-20', '2025-02-28', '29.99'),
(13, 9, 'Basic',     '2025-03-01', NULL,         '9.99'),
(14, 10, 'Pro',      '2024-09-10', NULL,         '29.99'),
(15, 11, 'Trial',    '2025-01-20', '2025-02-15', '0.00'),
(16, 12, 'Basic',    '2025-02-10', NULL,         '9.99'),
(17, 13, 'Premium',  '2025-03-25', NULL,         '19.99'),
(18, 14, 'Pro',      '2025-04-05', '2025-06-30', '29.99'),
(19, 14, 'Basic',    '2025-07-01', NULL,         '9.99'),
(20, 15, 'Basic',    '2025-06-20', NULL,         '9.99');


-- COURSES

DROP TABLE IF EXISTS courses;

CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    category VARCHAR(50),
    difficulty_level VARCHAR(20)
);

INSERT INTO courses (course_id, course_name, category, difficulty_level) VALUES
(1, 'SQL Basics',           'Data Analysis', 'Beginner'),
(2, 'Intermediate SQL',     'Data Analysis', 'Intermediate'),
(3, 'Python Basics',        'Programming',   'Beginner'),
(4, 'Data Visualization',   'Data Analysis', 'Intermediate'),
(5, 'Machine Learning',     'Data Science',  'Advanced'),
(6, 'R for Data Analysis',  'Programming',   'Intermediate');


-- LESSONS

DROP TABLE IF EXISTS lessons;

CREATE TABLE lessons (
    lesson_id INT PRIMARY KEY,
    course_id INT,
    lesson_name VARCHAR(150),
    lesson_order INT,
    difficulty VARCHAR(20),
    FOREIGN KEY (course_id) REFERENCES courses(course_id)
);

-- SQL Basics (course_id = 1)
INSERT INTO lessons VALUES
    (101, 1, 'What Is a Database', 1, 'Beginner'),
    (102, 1, 'Basic SELECT Statements', 2, 'Beginner'),
    (103, 1, 'Filtering with WHERE', 3, 'Beginner'),
    (104, 1, 'Sorting and Limiting Results', 4, 'Beginner'),
    (105, 1, 'Aggregate Functions', 5, 'Beginner');

-- Intermediate SQL (course_id = 2)
INSERT INTO lessons VALUES
    (201, 2, 'INNER and LEFT JOINs', 1, 'Intermediate'),
    (202, 2, 'One-to-Many Relationships', 2, 'Intermediate'),
    (203, 2, 'Subqueries and Derived Tables', 3, 'Intermediate'),
    (204, 2, 'CTEs and Readability', 4, 'Intermediate'),
    (205, 2, 'Self Joins and Cross Joins', 5, 'Intermediate');

-- Python Basics (course_id = 3)
INSERT INTO lessons VALUES
    (301, 3, 'Python Data Types', 1, 'Beginner'),
    (302, 3, 'Control Flow and Loops', 2, 'Beginner'),
    (303, 3, 'Functions and Modules', 3, 'Beginner'),
    (304, 3, 'File I/O', 4, 'Beginner');

-- Data Visualization (course_id = 4)
INSERT INTO lessons VALUES
    (401, 4, 'Introduction to Visualization', 1, 'Intermediate'),
    (402, 4, 'Charts and Graphs', 2, 'Intermediate'),
    (403, 4, 'Storytelling with Data', 3, 'Intermediate');

-- Machine Learning (course_id = 5)
INSERT INTO lessons VALUES
    (501, 5, 'Supervised Learning', 1, 'Advanced'),
    (502, 5, 'Unsupervised Learning', 2, 'Advanced'),
    (503, 5, 'Feature Engineering', 3, 'Advanced');

-- R for Data Analysis (course_id = 6)
INSERT INTO lessons VALUES
    (601, 6, 'Vectors and Data Frames', 1, 'Intermediate'),
    (602, 6, 'Data Cleaning in R', 2, 'Intermediate'),
    (603, 6, 'Visualization in R', 3, 'Intermediate');


-- LESSON ACTIVITY

DROP TABLE IF EXISTS lesson_activity;

CREATE TABLE lesson_activity (
    activity_id INT PRIMARY KEY,
    user_id INT,
    course_id INT,
    lesson_id INT,
    activity_date DATE,     
    minutes_watched INT      
);

INSERT INTO lesson_activity (activity_id, user_id, course_id, lesson_id, activity_date, minutes_watched) VALUES
(1, 1, 1, 101, '2023-11-06', 30),
(2, 1, 1, 102, '2023-12-05', 25),
(3, 1, 1, 103, '2024-01-10', 20),
(4, 2, 2, 201, '2023-11-20', 40),
(5, 2, 2, 202, '2023-12-15', 45),
(6, 3, 3, 301, '2024-01-10', NULL),
(7, 3, 3, 302, '2024-01-15', 50),
(8, 4, 1, 101, '2024-02-10', 20),
(9, 4, 1, 102, '2024-03-05', 25),
(10, 5, 4, 401, '2024-03-05', 35),
(11, 5, 6, 601, '2024-04-05', 50),
(12, 5, 4, 402, '2024-06-01', 40),
(13, 6, 2, 202, '2024-03-20', 45),
(14, 6, 2, 203, '2024-04-22', 50),
(15, 7, 1, 101, '2024-04-05', NULL),
(16, 8, 2, 203, '2024-06-05', 30),
(17, 9, 5, 501, '2024-06-20', 60),
(18, 9, 5, 502, '2024-07-15', 55),
(19, 10, 5, 502, '2024-09-10', 55),
(20, 11, 6, 601, '2025-01-20', 35),
(21, 12, 3, 301, '2025-02-10', 25),
(22, 13, 4, 401, '2025-03-25', 45),
(23, 14, 5, 502, '2025-04-05', 50),
(24, 14, 6, 603, '2025-05-05', 30),
(25, 15, 3, 301, '2025-06-20', 40);


-- PAYMENTS

DROP TABLE IF EXISTS payments;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    payment_date DATE NOT NULL,
    amount DECIMAL(6,2) NOT NULL,
    payment_method VARCHAR(20) NOT NULL
);

INSERT INTO payments (payment_id, user_id, payment_date, amount, payment_method) VALUES
(1, 1, '2023-11-06', 9.99, 'credit_card'),
(2, 1, '2023-12-06', 9.99, 'credit_card'),
(3, 1, '2024-01-06', 9.99, 'credit_card'),
(4, 1, '2024-02-06', 9.99, 'credit_card'),
(5, 1, '2024-03-06', 9.99, 'credit_card'),
(6, 1, '2024-04-06', 9.99, 'credit_card'),
(7, 1, '2024-05-06', 9.99, 'credit_card'),
(8, 2, '2023-11-20', 19.99, 'credit_card'),
(9, 2, '2023-12-20', 19.99, 'credit_card'),
(10, 2, '2024-01-20', 19.99, 'credit_card'),
(11, 2, '2024-02-20', 19.99, 'credit_card'),
(12, 2, '2024-03-20', 19.99, 'credit_card'),
(13, 2, '2024-04-20', 19.99, 'credit_card'),
(14, 2, '2024-06-01', 29.99, 'credit_card'),
(15, 2, '2024-07-01', 29.99, 'credit_card'),
(16, 3, '2024-01-10', 0.00, 'paypal'),
(17, 3, '2024-02-01', 29.99, 'paypal'),
(18, 3, '2024-03-01', 29.99, 'paypal'),
(19, 3, '2024-04-01', 29.99, 'paypal'),
(20, 4, '2024-02-10', 9.99, 'credit_card'),
(21, 4, '2024-03-10', 9.99, 'credit_card'),
(22, 4, '2024-04-10', 9.99, 'credit_card'),
(23, 4, '2024-05-10', 9.99, 'credit_card'),
(24, 4, '2024-06-10', 9.99, 'credit_card'),
(25, 4, '2024-07-10', 9.99, 'credit_card'),
(26, 4, '2024-08-10', 9.99, 'credit_card'),
(27, 5, '2024-03-05', 0.00, 'paypal'),
(28, 5, '2024-04-01', 9.99, 'paypal'),
(29, 5, '2024-05-01', 9.99, 'paypal'),
(30, 5, '2024-06-01', 9.99, 'paypal'),
(31, 6, '2024-03-20', 19.99, 'credit_card'),
(32, 6, '2024-04-20', 19.99, 'credit_card'),
(33, 6, '2024-05-20', 19.99, 'credit_card'),
(34, 6, '2024-06-20', 19.99, 'credit_card'),
(35, 7, '2024-04-05', 9.99, 'credit_card'),
(36, 7, '2024-05-05', 9.99, 'credit_card'),
(37, 7, '2024-06-05', 9.99, 'credit_card'),
(38, 8, '2024-06-05', 19.99, 'paypal'),
(39, 8, '2024-07-05', 19.99, 'paypal'),
(40, 8, '2024-08-05', 19.99, 'paypal'),
(41, 9, '2024-06-20', 29.99, 'credit_card'),
(42, 9, '2024-07-20', 29.99, 'credit_card'),
(43, 9, '2024-08-20', 29.99, 'credit_card'),
(44, 9, '2024-09-20', 29.99, 'credit_card'),
(45, 9, '2024-10-20', 29.99, 'credit_card'),
(46, 9, '2024-11-20', 29.99, 'credit_card'),
(47, 9, '2025-03-01', 9.99, 'credit_card'),
(48, 9, '2025-04-01', 9.99, 'credit_card'),
(49, 10, '2024-09-10', 29.99, 'credit_card'),
(50, 10, '2024-10-10', 29.99, 'credit_card'),
(51, 10, '2024-11-10', 29.99, 'credit_card'),
(52, 11, '2025-01-20', 0.00, 'credit_card'),
(53, 11, '2025-02-20', 0.00, 'credit_card'),
(54, 12, '2025-02-10', 9.99, 'paypal'),
(55, 12, '2025-03-10', 9.99, 'paypal'),
(56, 12, '2025-04-10', 9.99, 'paypal'),
(57, 13, '2025-03-25', 19.99, 'paypal'),
(58, 13, '2025-04-25', 19.99, 'paypal'),
(59, 13, '2025-05-25', 19.99, 'paypal'),
(60, 14, '2025-04-05', 29.99, 'credit_card'),
(61, 14, '2025-05-05', 29.99, 'credit_card'),
(62, 14, '2025-07-01', 9.99, 'credit_card'),
(63, 14, '2025-08-01', 9.99, 'credit_card'),
(64, 15, '2025-06-20', 9.99, 'paypal'),
(65, 15, '2025-07-20', 9.99, 'paypal');


-- LEADS

DROP TABLE IF EXISTS leads;

CREATE TABLE leads (
    lead_id INT PRIMARY KEY,
    email VARCHAR(255) NOT NULL,
    source VARCHAR(50) NOT NULL,
    created_at DATETIME NOT NULL
);

INSERT INTO leads (lead_id, email, source, created_at) VALUES
(1,  'alex@example.com',           'newsletter_signup',     '2024-02-10 09:15:00'),
(2,  'brianna@example.com',     'cheat_sheet_download',  '2024-03-05 14:42:00'),
(3,  'chris@test.com',          'newsletter_signup',     '2024-04-18 11:30:00'),
(4,  'danielle@example.com',    'webinar_registration',  '2024-05-22 16:05:00'),
(5,  'eric@test.com',           'cheat_sheet_download',  '2024-06-03 10:20:00'),
(6,  'kim@example.com',          'newsletter_signup',    '2024-06-15 08:55:00'),
(7,  'maria@test.com',          'cheat_sheet_download',  '2024-07-01 13:10:00'),
(8,  'jordan@test.com',          'webinar_registration',  '2024-07-18 17:45:00'),
(9,  'taylor@test.com',         'newsletter_signup',     '2024-09-05 09:00:00'),
(10, 'jamie@test.com',          'webinar_signup',        '2025-01-12 12:30:00'),
(11, 'karen@example.com',       'newsletter_signup',     '2025-02-08 08:10:00'),
(12, 'leopold@test.com',            'cheat_sheet_download',  '2025-03-14 15:25:00');

