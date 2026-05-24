CREATE DATABASE UniversityDB;
CREATE SCHEMA university;

CREATE TABLE university.students (
    student_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL ,
    birth_date DATE ,
    email TEXT NOT NULL UNIQUE
);

CREATE TABLE university.courses (
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL ,
    credits INT
);

CREATE TABLE university.enrollments (
    enrollment_id SERIAL PRIMARY KEY ,
    enroll_date DATE,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES university.students(student_id),
    FOREIGN KEY (course_id) REFERENCES university.courses(course_id)
);

ALTER TABLE university.students ADD CHECK ( EXTRACT(YEAR FROM AGE(students.birth_date)) >= 18);

DROP TABLE university.enrollments;
DROP TABLE university.courses;
DROP TABLE university.students;