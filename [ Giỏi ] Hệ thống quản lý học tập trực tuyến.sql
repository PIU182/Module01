CREATE SCHEMA elearning;

CREATE TABLE elearning.students (
    student_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE elearning.instructors (
    instructor_id SERIAL PRIMARY KEY ,
    first_name VARCHAR(50) NOT NULL ,
    last_name VARCHAR(50) NOT NULL ,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE elearning.courses (
    course_id SERIAL PRIMARY KEY ,
    course_name VARCHAR(100) NOT NULL ,
    instructor_id INT,
    FOREIGN KEY (instructor_id) REFERENCES elearning.instructors(instructor_id)
);

CREATE TABLE elearning.enrollments (
    enrollment_id SERIAL PRIMARY KEY ,
    enroll_date DATE NOT NULL ,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES elearning.students(student_id),
    FOREIGN KEY (course_id) REFERENCES elearning.courses(course_id)
);

CREATE TABLE elearning.assignments (
    assignment_id SERIAL PRIMARY KEY ,
    title VARCHAR(100) NOT NULL ,
    due_date DATE NOT NULL ,
    course_id INT,
    FOREIGN KEY (course_id) REFERENCES elearning.courses(course_id)
);

CREATE TABLE elearning.submissions (
    submission_id SERIAL PRIMARY KEY ,
    submission_date DATE NOT NULL ,
    grade NUMERIC(10, 2) CHECK ( grade > 0 AND grade < 100 ),
    assignment_id INT,
    student_id INT,
    FOREIGN KEY (assignment_id) REFERENCES elearning.assignments(assignment_id),
    FOREIGN KEY (submission_id) REFERENCES elearning.students(student_id)
);

