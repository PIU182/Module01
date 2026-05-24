CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    job VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id)  REFERENCES Departments(department_id)
);

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

CREATE TABLE EmployeeProjects (
    emp_id INT,
    project_id INT,
    FOREIGN KEY  (emp_id) REFERENCES Employees(emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects(project_id),
    PRIMARY KEY (emp_id, project_id)
);