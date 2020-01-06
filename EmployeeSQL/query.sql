-- Create Queries for Data Analysis

-- 1. list each employee: employee number, last name, first name, gender, salary
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no

-- 2. list employees hired in 1986
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'; 

-- 3. list manager of each department with department number, department name, manager's employee number, last name, first name, start and end employment dates
SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name, dm.from_date, dm.to_date
FROM dept_manager AS dm
INNER JOIN departments AS d ON (dm.dept_no = d.dept_no)
INNER JOIN employees as e ON (dm.emp_no = e.emp_no);

-- 4. list department of each employee with employee number, last name, first name, department name
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN employees AS e ON (de.emp_no = e.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no);

-- 5. list all employees with first name "Hercules" and last name begins with 'B'
SELECT e.first_name, e.last_name
FROM employees AS e
WHERE first_name = 'Hercules' 
AND last_name LIKE 'B%'; 

-- 6. list all employees in the Sales department, with employee number, last name, first name, department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no) 
WHERE dept_name = 'Sales';

-- 7. list all employees in the Sales and Development departments, with employee number, last name, first name, department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
INNER JOIN dept_emp AS de ON (e.emp_no = de.emp_no)
INNER JOIN departments AS d ON (de.dept_no = d.dept_no) 
WHERE dept_name = 'Sales' 
OR dept_name = 'Development';

-- 8. in descending order, list frequency count of employee last names (how many share each last name) 
SELECT e.last_name,
COUNT (e.emp_no) AS "Last Name Frequency"
FROM employees AS e
GROUP BY e.last_name
ORDER BY COUNT (e.emp_no) DESC;



