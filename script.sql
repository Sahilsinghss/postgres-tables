-- Creating the employees table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(20),
    hire_date DATE,
    department_id INT
);

-- Inserting 20 records into the employees table
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, department_id) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-0100', '2023-01-10', 1),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-0110', '2023-02-15', 2),
(3, 'Robert', 'Johnson', 'robert.johnson@example.com', '555-0120', '2023-03-20', 3),
(4, 'Emily', 'Davis', 'emily.davis@example.com', '555-0130', '2023-04-25', 4),
(5, 'Michael', 'Brown', 'michael.brown@example.com', '555-0140', '2023-05-30', 5),
(6, 'Linda', 'Wilson', 'linda.wilson@example.com', '555-0150', '2023-06-10', 1),
(7, 'William', 'Moore', 'william.moore@example.com', '555-0160', '2023-07-15', 2),
(8, 'Patricia', 'Taylor', 'patricia.taylor@example.com', '555-0170', '2023-08-20', 3),
(9, 'Charles', 'Anderson', 'charles.anderson@example.com', '555-0180', '2023-09-25', 4),
(10, 'Jennifer', 'Thomas', 'jennifer.thomas@example.com', '555-0190', '2023-10-30', 5),
(11, 'James', 'Jackson', 'james.jackson@example.com', '555-0200', '2023-11-10', 1),
(12, 'Mary', 'White', 'mary.white@example.com', '555-0210', '2023-12-15', 2),
(13, 'Richard', 'Harris', 'richard.harris@example.com', '555-0220', '2024-01-20', 3),
(14, 'Elizabeth', 'Martin', 'elizabeth.martin@example.com', '555-0230', '2024-02-25', 4),
(15, 'Joseph', 'Thompson', 'joseph.thompson@example.com', '555-0240', '2024-03-30', 5),
(16, 'Barbara', 'Garcia', 'barbara.garcia@example.com', '555-0250', '2024-04-10', 1),
(17, 'Thomas', 'Martinez', 'thomas.martinez@example.com', '555-0260', '2024-05-15', 2),
(18, 'Susan', 'Robinson', 'susan.robinson@example.com', '555-0270', '2024-06-20', 3),
(19, 'Christopher', 'Clark', 'christopher.clark@example.com', '555-0280', '2024-07-25', 4),
(20, 'Jessica', 'Rodriguez', 'jessica.rodriguez@example.com', '555-0290', '2024-08-30', 5);

-- Creating the departments table
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    manager_id INT,
    location VARCHAR(100),
    phone_number VARCHAR(20),
    budget DECIMAL(10, 2)
);

-- Inserting 20 records into the departments table
INSERT INTO departments (department_id, department_name, manager_id, location, phone_number, budget) VALUES
(1, 'HR', 1, 'New York', '555-1000', 50000.00),
(2, 'Finance', 2, 'Chicago', '555-1010', 75000.00),
(3, 'Engineering', 3, 'San Francisco', '555-1020', 150000.00),
(4, 'Marketing', 4, 'Los Angeles', '555-1030', 60000.00),
(5, 'Sales', 5, 'Seattle', '555-1040', 80000.00),
(6, 'IT', 6, 'Austin', '555-1050', 120000.00),
(7, 'Legal', 7, 'Boston', '555-1060', 55000.00),
(8, 'R&D', 8, 'Denver', '555-1070', 90000.00),
(9, 'Customer Service', 9, 'Miami', '555-1080', 45000.00),
(10, 'Logistics', 10, 'Dallas', '555-1090', 70000.00),
(11, 'Procurement', 11, 'San Diego', '555-1100', 65000.00),
(12, 'Admin', 12, 'Atlanta', '555-1110', 40000.00),
(13, 'Support', 13, 'Portland', '555-1120', 48000.00),
(14, 'Operations', 14, 'Phoenix', '555-1130', 85000.00),
(15, 'Training', 15, 'Philadelphia', '555-1140', 50000.00),
(16, 'Quality Assurance', 16, 'Detroit', '555-1150', 55000.00),
(17, 'Compliance', 17, 'San Antonio', '555-1160', 60000.00),
(18, 'Design', 18, 'Minneapolis', '555-1170', 75000.00),
(19, 'Business Development', 19, 'Houston', '555-1180', 95000.00),
(20, 'Product Management', 20, 'Las Vegas', '555-1190', 100000.00);
