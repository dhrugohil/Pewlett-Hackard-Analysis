-- SELECT emp_no, first_name, last_name
-- FROM employees

-- SELECT title, from_date, to_date
-- FROM titles

-- -- Joining employees and titles tables
-- SELECT emp_no.employees,
--     first_name.employees,
-- last_name.employees
-- FROM employees
-- LEFT JOIN dept_emp
-- ON retirement_info.emp_no = dept_emp.emp_no;

-- -- Joining employees and titles tables
-- SELECT employees.emp_no, 
-- employees.first_name,
-- employees.last_name,
-- titles.title,
-- titles.from_date,
-- titles.to_date
-- INTO emp_titles
-- FROM employees
-- LEFT JOIN titles
-- ON employees.emp_no = titles.emp_no;



-- -- Joining employees and titles tables
-- SELECT employees.emp_no, 
-- employees.first_name,
-- employees.last_name,
-- titles.title,
-- titles.from_date,
-- titles.to_date
-- INTO retirement_titles
-- FROM employees
-- LEFT JOIN titles
-- ON employees.emp_no = titles.emp_no
-- WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
-- ORDER BY employees.emp_no;

-- SELECT *
-- FROM retirement_titles

-- -- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (retirement_titles.emp_no) retirement_titles.emp_no,
-- retirement_titles.first_name,
-- retirement_titles.last_name,
-- retirement_titles.title
-- INTO unique_titles
-- FROM retirement_titles
-- WHERE (to_date = '9999-01-01')
-- ORDER BY retirement_titles.emp_no ASC, retirement_titles.to_date DESC;

-- SELECT *
-- FROM unique_titles

-- -- Creating a retiring_titles table for count
-- SELECT title, COUNT(emp_no) AS count 
-- INTO retiring_titles
-- FROM unique_titles 
-- GROUP BY title 
-- ORDER BY count DESC


-- -- Creating the mentorship eligibility table
-- SELECT DISTINCT ON (emp.emp_no) emp.emp_no, emp.first_name, emp.last_name, emp.birth_date,
-- dep.from_date, dep.to_date,
-- tit.title
-- INTO mentorship_eligibilty
-- FROM employees AS emp
-- INNER JOIN dept_emp AS dep
-- ON emp.emp_no = dep.emp_no
-- INNER JOIN titles AS tit
-- ON emp.emp_no = tit.emp_no
-- WHERE (dep.to_date = '9999-01-01') AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
-- ORDER BY emp.emp_no

-- SELECT *
-- FROM mentorship_eligibilty