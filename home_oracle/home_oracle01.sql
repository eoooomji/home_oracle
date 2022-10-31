SELECT first_name
FROM employees;

SELECT *
FROM employees;

SELECT *
FROM tab;

SELECT salary, salary * 10 AS bonus
FROM employees;

SELECT salary, salary * 10 AS "B O N U S"
FROM employees;

SELECT last_name || '님의 급여는 ' || salary || '입니다.' AS name
FROM employees;

SELECT DISTINCT first_name
FROM employees;

SELECT DISTINCT first_name, last_name
FROM employees;

-- employees테이블에서 salary가 3000미만 일때의 first_name, salary를 출력
SELECT first_name, salary
FROM employees
WHERE salary < 3000;

-- employees테이블에서 frist_name컬럼의 값이 'David'일때의 first_name, salary를 출력
SELECT first_name, salary
FROM employees
WHERE first_name = 'David';

-- employees테이블에서 first_name컬럼의 값이 'David'가 아닐때의 first_name, salary를 출력
SELECT first_name, salary
FROM employees
--WHERE first_name != 'David';
--WHERE first_name <> 'David';
WHERE first_name ^= 'David';

-- employees테이블에서 salary가 3000, 9000, 17000 일 때 first_name, hire_date, salary를 출력
SELECT first_name, hire_date, salary
FROM employees
--WHERE salary = 3000 OR salary = 9000 OR salary = 17000;
WHERE salary IN (3000, 9000, 17000);

-- employees테이블에서 salary가 3000부터 5000까지일 때 first_name, hire_date, salary를 출력
SELECT first_name, hire_date, salary
FROM employees
--WHERE salary >= 3000 AND salary <= 5000;
WHERE salary BETWEEN 3000 AND 5000;

-- employees테이블에서 job_id가 'IT_PROG'가 아닐때 first_name, email, job_id를 출력
SELECT first_name, email, job_id
FROM employees
--WHERE job_id != 'IT_PROG';
--WHERE job_id <> 'IT_PROG';
--WHERE job_id ^= 'IT_PROG';
WHERE NOT(job_id = 'IT_PROG');

-- employees테이블에서 salary가 3000, 9000, 17000이 아닐때의 first_name, hire_date, salary를 출력
SELECT first_name, hire_date, salary
FROM employees
--WHERE NOT(salary  = 3000 OR salary = 9000 OR salary = 17000)
WHERE salary NOT IN(3000, 9000, 17000);

-- employees테이블에서 salary가 3000부터 5000까지가 아닐때의 first_name, hire_date, salary를 출력
SELECT first_name, hire_date, salary
FROM employees
--WHERE NOT (salary >= 3000 AND salary <= 5000);
WHERE salary NOT BETWEEN 3000 AND 5000;

-- employees테이블에서 commission_pct가 null이 아닐 때 first_name, salary, commission_pct를 출력
SELECT first_name, salary, commission_pct
FROM employees
WHERE commission_pct IS NOT NULL;

-- employees테이블에서 first_name에 'der'이 포함이 된다면 first_name, salary, email을 출력
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE '%der%';

-- employees테이블에서 first_name값 중 'A'로 시작하고 두번째 문자는 임의 문자이면서 'exander'로 끝나는
-- first_name, salary, email을 출력
SELECT first_name, salary, email
FROM employees
WHERE first_name LIKE 'A_exander';

-- employees테이블에서 job_id를 오름차순으로 first_name, email, job_id를 출력
SELECT first_name, email, job_id
FROM employees
--ORDER BY job_id ASC;
ORDER BY job_id;

-- employees테이블에서 department_id를 오름차순하고 first_name을 내림차 순으로
-- department_id, first_name, salary를 출력
SELECT department_id, first_name, salary
FROM employees
ORDER BY department_id ASC, first_name DESC;

-- employees테이블에서 가장 최근 입사 순으로 사원의 first_name, salary, hire_date를 출력
SELECT first_name, salary, hire_date
FROM employees
ORDER BY hire_date DESC;

-- employees테이블에서 업무(job_id)가 'FI_ACCOUNT'인 사원들의 급여(salary)가 높은순으로
-- first_name, job_id, salary를 출력
SELECT first_name, job_id, salary
FROM employees
WHERE job_id = 'FI_ACCOUNT'
ORDER BY salary DESC;

-- UNION
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
UNION
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- UNION ALL
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
UNION ALL
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- INTERSECT
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
INTERSECT
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;

-- MINUS
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 40
MINUS
SELECT department_id, first_name, last_name
FROM employees
WHERE department_id = 20 OR department_id = 60;
















