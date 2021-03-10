--Employee number, last name, first name, sex, and salary.
SELECT i.emp_no, i.last_name, i.first_name, i.sex, f.salary
FROM employees i
JOIN salaries f
ON (i.emp_no = f.emp_no)

---List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date 
FROM employees
WHERE EXTRACT (YEAR FROM hire_date) = '1986';

--List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT departments.dept_no AS "Department Number",
departments.dept_name AS "Department Name",
dept_manager.emp_no AS "Manager Empl Number",
employees.last_name As "Last Name",
employees.first_name As "Firsr Name"
FROM dept_manager
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no;

---List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT employees.emp_no AS "Manager Emp Number",
employees.first_name AS "First Name",
employees.last_name AS "Last Name", 
departments.dept_name AS "Department Name"
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
SELECT emp_no AS employee_nu,first_name,last_name
FROM employees
WHERE (first_name = 'Hercules' 
	   AND last_name LIKE 'B%')

--List all employees in the Sales department, including their employee number, last name, first name, and department name
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. 
SELECT employees.emp_no, 
employees.last_name, 
employees.first_name, 
departments.dept_name
FROM employees
INNER JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
INNER JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name As "Last Name", COUNT(last_name) As "Number of Last Names"
FROM employees
GROUP BY last_name ORDER BY last_name DESC;