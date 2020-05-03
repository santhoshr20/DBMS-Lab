REM Part – II : DML Retrieval operations

REM alter table employees drop primary key cascade;



REM 11. Display firsy name, job id and salary of all the employees.

SELECT first_name,job_id,salary FROM employees;



REM 12. Display the id, name(first & last), salary and annual salary of all the employees. Sort the employees by first name. Label the columns as shown below:(EMPLOYEE_ID, FULL NAME, MONTHLY SAL, ANNUAL SALARY)

SELECT employee_id AS "EMPLOYEE_ID",
	CONCAT(first_name,last_name) AS "FULL NAME",
	salary AS "MONTHLY SALARY",
	salary*12 AS "ANNUAL SALARY"
FROM employees 
ORDER BY first_name;


REM 13. List the different jobs in which the employees are working for.

SELECT DISTINCT job_id FROM employees;



REM 14. Display the id, first name, job id, salary and commission of employees who are earning commissions.

SELECT employee_id,first_name,job_id,salary,commission_pct 
FROM employees
WHERE commission_pct IS NOT NULL;



REM 15. Display the details (id, first name, job id, salary and dept id) of employees who are MANAGERS.

SELECT employee_id,first_name,job_id,salary,department_id
FROM employees
WHERE job_id LIKE '%MAN';



REM 16. Display the details of employees other than sales representatives (id, first name, hire date, job id, salary and dept id) who are hired after ‘01May1999’ or whose salary is at least 10000.

SELECT employee_id,first_name,hire_date,job_id,salary,department_id
FROM employees
WHERE job_id !='SA_REP' AND (hire_date>'01-MAY-1999' OR salary>=10000)
ORDER BY first_name;



REM 17. Display the employee details (first name, salary, hire date and dept id) whose salary falls in the range of 5000 to 15000 and his/her name begins with any of characters (A,J,K,S). Sort the output by first name.

SELECT first_name,salary,hire_date,department_id
FROM employees 
WHERE (salary BETWEEN 5000 AND 15000) AND substr(first_name,0,1) IN('A','J','K','S')
ORDER BY first_name;




REM 18. Display the experience of employees in no. of years and months who were hired after 1998. Label the columns as: (EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, EXPYRS, EXPMONTHS)

SELECT employee_id AS "EMPLOYEE_ID",
	first_name AS "FIRST_NAME",
	hire_date AS "HIRE_DATE",
	2019-EXTRACT(year FROM hire_date) AS "EXP_YRS",
	MOD(ROUND(MONTHS_BETWEEN(TO_DATE('31-DEC-2019'),hire_date)),12) AS "EXP-MONTHS"
FROM employees
WHERE EXTRACT(year FROM hire_date)>1998;




REM 19. Display the total number of departments.

SELECT count(DISTINCT(department_id)) AS "no_of_depts"
FROM employees;




REM 20. Show the number of employees hired by yearwise. Sort the result by year wise.


SELECT EXTRACT(year FROM hire_date) AS "YEAR",
	count(employee_id) AS "No_OF_EMP"
FROM employees
GROUP BY EXTRACT(year FROM hire_date)
ORDER BY EXTRACT(year FROM hire_date);



REM 21. Display the minimum, maximum and average salary, number of employees for each department. Exclude the employee(s) who are not in any department. Include the department(s) with at least 2 employees and the average salary is more than 10000. Sort the result by minimum salary in descending order.

SELECT department_id,
	min(salary) AS "MIN SALARY",
	max(salary) AS "MAX SALARY",
	avg(salary) AS "AVERAGE SALARY",
	count(employee_id) AS "No_OF_EMP"
FROM employees
GROUP BY department_id
HAVING count(employee_id)>=2 AND avg(salary)>10000
ORDER BY min(salary) desc;
