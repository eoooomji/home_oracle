/* equi join */
-- oracle용
SELECT dept.department_id, emp.first_name, emp.job_id, dept.department_name
FROM employees emp, departments dept
WHERE emp.department_id = dept.department_id;

-- ansi용
SELECT dept.department_id, emp.first_name, emp.job_id, dept.department_name
FROM employees emp inner join departments dept
ON emp.department_id = dept.department_id;

-- employees와 department테이블에서 사원번호(employee_id), 부서번호(department_id), 부서명(department_name)을 검색하시오.
SELECT e.employee_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE d.department_id = e.department_id
ORDER BY e.employee_id;

SELECT e.employee_id, d.department_id, d.department_name
FROM employees e inner join departments d
ON d.department_id = e.department_id
ORDER BY e.employee_id;

-- employees와 jobs테이블에서 사원번호(employee_id), 업무번호(job_id), 업무명(job_title)을 검색하시오.
SELECT e.employee_id, j.job_id, j.job_title
FROM employees e, jobs j
WHERE e.job_id = j.job_id
ORDER BY employee_id;

SELECT e.employee_id, j.job_id, j.job_title
FROM employees e inner join jobs j
ON e.job_id = j.job_id
ORDER BY employee_id;

-- job_id가 'FI_MGR'인 사원이 속한 급여(salary)의 최소값(min_salary), 최대값(max_salary)를 출력하시오.
SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e, jobs j
WHERE e.job_id = j.job_id
AND e.job_id = 'FI_MGR';

SELECT e.first_name, e.job_id, j.min_salary, j.max_salary
FROM employees e inner join jobs j
ON e.job_id = j.job_id
WHERE e.job_id = 'FI_MGR';

-- 부서가 'Seattle'에 있는 부서에서 근무하는 직원들의
-- first_name, hire_date, department_name, city를 출력하는 SELECT를 작성하시오.
SELECT e.first_name, e.hire_date, d.department_name, l.city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND l.city = 'Seattle';

SELECT e.first_name, e.hire_date, d.department_name, l.city
FROM employees e inner join departments d
ON e.department_id = d.department_id inner join locations l
ON d.location_id = l.location_id
WHERE l.city = 'Seattle';

-- 20번 부서의 이름과 그 부서에 근무하는 사원의 이름(first_name)을 출력하시오.
SELECT d.department_id, d.department_name, e.first_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_id = 20;

SELECT d.department_id, d.department_name, e.first_name
FROM employees e inner join departments d
ON e.department_id = d.department_id
WHERE d.department_id = 20;

-- 1400, 1500번 위치의 도시이름과 그 곳에 있는 부서의 이름을 출력하시오.
SELECT l.location_id, l.city, d.department_name
FROM locations l, departments d
WHERE l.location_id = d.location_id
AND l.location_id IN (1400, 1500);

SELECT l.location_id, l.city, d.department_name
FROM locations l inner join departments d
ON l.location_id = d.location_id
WHERE l.location_id IN (1400, 1500);

/* carteian product(카티션 곱) 조인 */
-- oracle용
SELECT e.department_id, e.first_name, e.job_id, j.job_title
FROM employees e, jobs j; -- 2033(107 * 19)

SELECT count(*) FROM employees; -- 107
SELECT count(*) FROM jobs; -- 107

-- ANSI용
SELECT e.department_id, e.first_name, j.job_id, j.job_title
FROM employees e CROSS JOIN jobs j; -- 2033

/* NATURAL JOIN */
SELECT first_name, salary, department_id, department_name
FROM employees NATURAL JOIN departments;

SELECT first_name, salary, d.department_id, d.department_name
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id;

/* OUTER JOIN */
-- oracle용
SELECT e.first_name, e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+); /* LEFT OUTER JOIN */

SELECT e.first_name, e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id; /* RIGHT OUTER JOIN */

-- ansi용
SELECT e.first_name, e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id; /* LEFT OUTER JOIN */

SELECT e.first_name, e.employee_id, e.department_id, d.department_id, d.department_name
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id; /* LEFT OUTER JOIN */

/* SELF JOIN */
-- oracle용
SELECT w.employee_id AS 사원번호, w.first_name AS 사원이름, w.manager_id AS 매니저번호, m.first_name AS 매니저이름
FROM employees w, employees m
WHERE w.manager_id = m.manager_id
ORDER BY w.employee_id;

-- ansi용
SELECT w.employee_id AS 사원번호, w.first_name AS 사원이름, w.manager_id AS 매니저번호, m.first_name AS 매니저이름
FROM employees w JOIN employees m
ON w.manager_id = m.manager_id
ORDER BY w.employee_id;

/* USING */
SELECT department_id, first_name, job_id, department_name
FROM employees INNER JOIN departments USING(department_id)
-- ON e.department_id = d.department_id
WHERE department_id = 30;












