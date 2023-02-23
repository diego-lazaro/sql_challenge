--List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT * FROM employees;
SELECT employees.emp_no, employees.last_name,
		employees.first_name, employees.sex,
		salaries.salary
FROM employees
LEFT JOIN salaries
ON employees.emp_no = salaries.emp_no
ORDER BY emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.

SELECT * FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31' 
ORDER BY hire_date ASC;

--List the manager of each department with the following information: department number, department name, 
--the manager's employee number, last name, first name.

SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no,
		employees.last_name, employees.first_name
FROM dept_manager
LEFT JOIN departments
ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees 
ON dept_manager.emp_no = employees.emp_no
ORDER BY emp_no;

--List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name,
		dept_emp.dept_no,
		departments.dept_name
FROM employees 
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
order by emp_no;

--List first name, last name, and sex for employees whose first name is 
--"Hercules" and last names begin with "B."

SELECT * FROM employees
WHERE first_name = 'Hercules' AND last_name like 'B%';

--List all employees in the Sales department, including their employee number, 
--last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name,
		dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_no ='d007';

--List all employees in the Sales and Development departments, including their employee number, 
--last name, first name, and department name.

SELECT employees.emp_no, employees.last_name, employees.first_name,
		dept_emp.dept_no
FROM employees 
LEFT JOIN dept_emp 
ON employees.emp_no=dept_emp.emp_no
INNER JOIN departments 
ON departments.dept_no=dept_emp.dept_no
WHERE departments.dept_no in ('d007', 'd005');

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name.

SELECT last_name, COUNT(*) AS freq_count
FROM employees
GROUP BY last_name
ORDER BY freq_count DESC;