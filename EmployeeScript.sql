CREATE TABLE IF NOT EXISTS Employees_list (
	employee_id SERIAL PRIMARY KEY,
	employee_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Department (
	department_id SERIAL PRIMARY KEY,
	department_name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Head_of_department (
	hod_id SERIAL PRIMARY KEY,
	department_id INTEGER UNIQUE REFERENCES Department(department_id),
	employee_id INTEGER UNIQUE REFERENCES Employees_list(employee_id)
);

CREATE TABLE IF NOT EXISTS Employee (
	employee_id INTEGER UNIQUE REFERENCES Employees_list(employee_id),
	department_id INTEGER UNIQUE REFERENCES Department(department_id),
	hod_id INTEGER REFERENCES Head_of_department(hod_id),
	CONSTRAINT pk_employee PRIMARY KEY (employee_id, department_id, hod_id)
);