--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, 
employees.last_name,
employees.first_name,
employees.sex,
salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no

--2. List employees who were hired in 1986.
SELECT * FROM employees
WHERE DATE_PART('year',hire_date) = 1986
ORDER BY emp_no

--3. List the manager of each department with the following information: department number, 
--department name, the manager's employee number, last name, first name.
SELECT department_manager.dept_no, 
departments.dept_name,
department_manager.emp_no,
employees.last_name, 
employees.first_name
FROM department_manager
LEFT JOIN departments
ON department_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON department_manager.emp_no = employees.emp_no
ORDER BY emp_no

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
SELECT employees.emp_no,
employees.last_name,
employees.first_name,
department_employees.dept_no,
departments.dept_name
FROM employees 
INNER JOIN department_employees ON employees.emp_no=department_employees.emp_no
INNER JOIN departments ON departments.dept_no=department_employees.dept_no
order by emp_no

--5. List first name, last name, and sex for employees whose first name is "Hercules" and 
--last names begin with "B."
SELECT first_name, last_name, sex FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%'
--6. List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
department_employees.dept_no AS Department
FROM employees 
LEFT JOIN department_employees 
ON employees.emp_no=department_employees.emp_no
INNER JOIN departments 
ON departments.dept_no=department_employees.dept_no
WHERE departments.dept_name='Sales';

--7. List all employees in the Sales and Development departments, including their 
--employee number, last name, first name, and department name.
SELECT 
employees.emp_no, 
employees.last_name, 
employees.first_name,
department_employees.dept_no AS Department
FROM employees 
LEFT JOIN department_employees 
ON employees.emp_no=department_employees.emp_no
INNER JOIN departments 
ON departments.dept_no=department_employees.dept_no
WHERE departments.dept_name in ('Sales', 'Development')

--8. In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.
SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC

