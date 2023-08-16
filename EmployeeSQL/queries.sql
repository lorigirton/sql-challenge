--QUERIES
-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
LEFT JOIN salaries ON (salaries.emp_no = employees.emp_no);

--2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE EXTRACT (YEAR FROM hire_date)= 1986;

--3. List the manager of each department along with their department number, department name, 
	--employee number, last name, and first name.
	--------HOW DO I JOIN 3????
-- SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_no, departments.dept_name, 
-- employees.emp_no, employees.last_name, employees.first_name
-- FROM dept_manager
-- LEFT JOIN departments ON (departments.dept_no = dept_manager.dept_no)
-- LEFT JOIN employees ON (employees.emp_no = departments.emp_no);
-- CREATE TABLE managers (
-- 	dept_no VARCHAR(4) REFERENCES departments(dept_no),
-- 	dept_name VARCHAR(30) REFERENCES departments(dept_name), dept_manager(dept_name),
-- 	emp_no INTEGER REFERENCES dept_manager(emp_no),
-- 	PRIMARY KEY(emp_no),
-- 	FOREIGN KEY(dept_no) REFERENCES departments
-- );
SELECT 	employees.emp_no, 
		employees.last_name, 
		employees.first_name, 
		dept_manager.dept_no,  
		departments.dept_name
FROM  employees
LEFT JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
LEFT JOIN departments ON dept_manager.dept_no = departments.dept_no;

-- CREATE TABLE managers (
-- 	dept_no VARCHAR(4) REFERENCES departments(dept_no),
-- 	dept_name VARCHAR(30) REFERENCES departments(dept_name),
-- 	dept_no VARCHAR(4) REFERENCES dept_manager(dept_no),
-- 	emp_no INTEGER REFERENCES dept_manager(emp_no),
-- 	CONSTRAINT pk_departements PRIMARY KEY(dept_no),
-- 	FOREIGN KEY (dept_no) REFERENCES dept_man(dept_no)
-- );
-- SELECT departments.dept_no, departments.dept_name, dept_manager.dept_no, department_manager.emp_no 
-- FROM dept_manager
-- LEFT JOIN departments ON (departments.dept_no = dept_manager.dept_no);

-- SELECT managers.dept_no, managers.dept_name, managers.emp_no, employees.emp_no, employees.last_name, employees.first_name
-- FROM managers
-- LEFT JOIN employees ON (managers.emp_no = employees.emp_no);
SELECT
	department.dept_no, department.dept_name, dept_manager.dept_no, dept_manager.emp_no, employees.emp_no, employees.last_name, employees.first_name
FROM 
	
--4. List the department number for each employee along with that employee's employee number, 
	--last name, first name, and department name.


--5. List first name, last name, and sex of each employee whose first name is Hercules and 
	--whose last name begins with the letter B.
SELECT employees.first_name, employees.last_name, employees.sex
FROM employees
WHERE first_name LIKE '%Hercules%' AND last_name LIKE 'B%';

--6. List each employee in the Sales department, including their employee number, last name, and first name.
-----FIX????????????????????

SELECT dept_emp.emp_no, dept_emp.dept_no, employees.first_name, employees.last_name, employees.emp_no
FROM dept_emp
WHERE dept_no LIKE '%d007%'
LEFT JOIN employees ON (employees.emp_no= dept_emp.emp_no);

--7. List each employee in the Sales and Development departments, including their employee numer,
	--last name, first name, and department name


--8. List the frequency counts, in descending order, of all the employee last names (that is, 
	--how many employees share each last name).
SELECT COUNT(last_name)
FROM employees
ORDER BY last_name DESC;
