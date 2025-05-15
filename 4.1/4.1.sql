CREATE TABLE student (
    student_id CHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    admission_year INT,
    major_code CHAR(3),
    student_number INT,
    phone VARCHAR(15),
    address VARCHAR(100),
    total_credits FLOAT DEFAULT 0.0,
    gpa FLOAT DEFAULT 0.0,
    enrollment_status BOOLEAN DEFAULT TRUE
);