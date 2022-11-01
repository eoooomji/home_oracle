SELECT 3 + 1
FROM dual;

SELECT sysdate
FROM dual;

SELECT initcap('korea hello')
FROM dual;

SELECT upper('korea hello')
FROM dual;

SELECT first_name, upper(first_name), last_name, upper(last_name)
FROM employees;

SELECT lower('KOREA')
FROM dual;

SELECT first_name, lower(first_name), last_name, lower(last_name)
FROM employees;

-- employees테이블 first_name에서 대소문자 구분없이 'Ja'가 포함이 된 first_name, salary를 출력
SELECT first_name, salary
FROM employees
WHERE upper(first_name) LIKE upper('%ja%');

SELECT length('korea')
FROM dual;

SELECT length('한글')
FROM dual;

CREATE TABLE user1(data VARCHAR2(5));
DESC user1;
SELECT *
FROM user1;

INSERT INTO user1(data)
VALUES('korea');
SELECT *
FROM user1;
-- ORA-12899: value too large for column "HR"."USER1"."DATA" (actual: 11, maximum: 5)
INSERT INTO user1(data)
VALUES('south korea');
-- ORA-12899: value too large for column "HR"."USER1"."DATA" (actual: 6, maximum: 5)
-- 한글은 오라클에서 저장할 때 한 글자당 1byte를 할당받는다.
INSERT INTO user1(data)
VALUES('한글');

SELECT substr('oracle test', 1, 4)
FROM dual;

SELECT substr('oracle test', -3, 4)
FROM dual;

SELECT substr('오라클 테스트', 3, 4)
FROM dual;

SELECT substr('오라클 테스트', -3, 4)
FROM dual;

SELECT instr('korea', 'or')
FROM dual;

SELECT instr('한국자바', '자바')
FROM dual;

SELECT lpad('korea', 8, '*')
FROM dual;

SELECT rpad('korea', 8, '*')
FROM dual;

SELECT ltrim('***korea', '*')
FROM dual;

SELECT rtrim('korea***', '*')
FROM dual;

SELECT trim('*' from '***korea***')
FROM dual;

SELECT '   korea', length('   korea'), ltrim('   korea'), length(ltrim('   korea'))
FROM dual;

SELECT 'korea   ', length('korea   '), rtrim('korea   '), length(rtrim('korea   '))
FROM dual;

SELECT trim(' ' from '   korea   '), length(trim(' ' from '   korea   '))
FROM dual;

SELECT ascii('A')
FROM dual;

SELECT chr(65)
FROM dual;

SELECT concat('java', 'jsp')
FROM dual;

/* 숫자함수 */
-- 3.55를 소수점 1의 자리까지 출력(반올림)
SELECT round(3.55, 1)
FROM dual;

-- 42523.55를 십의 자리까지 구하기(반올림)
SELECT round(42523.55, -1)
FROM dual;

-- 42523.55의 1의 자리까지 구하기
SELECT round(42523.55, 0)
FROM dual;

-- 256.78 무조건 올림하기
SELECT ceil(256.78)
FROM dual;

-- 289.78에서 소수이하 무조건 버리기
SELECT floor(289.78)
FROM dual;

-- 2의 3승(거듭제곱)
SELECT power(2, 3)
FROM dual;

-- 25의 제곱근
SELECT sqrt(25)
FROM dual;

-- 나머지
SELECT mod(10, 3)
FROM dual;

/* 날짜 함수 */
-- 현재 시스템에서 제공해주는 오늘의 날짜 함수
SELECT sysdate
FROM dual;

SELECT sysdate + 1
FROM dual;

SELECT sysdate - 1
FROM dual;

-- 오늘을 기준으로 10개월 후의 날짜
SELECT add_months(sysdate, 10)
FROM dual;

/* 변환형 함수 */
-- 숫자 -> 문자
SELECT to_char(2532, '9,999.99')
FROM dual;

SELECT to_char(2532, '999,999.99')
FROM dual;

SELECT to_char(2532, '000,000.00')
FROM dual;

-- 각 나라의 통화를 표현 시 L기호 사용
SELECT to_char(2532, 'L999,999.99')
FROM dual;

-- 날짜 -> 문자
SELECT to_char(sysdate, 'yyyy-mm-dd hh:mi:ss day'),/* day:월요일 */
       to_char(sysdate, 'yyyy-mm-dd hh:mi:ss dy'), /* dy:월 */
       to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss day') /* hh24:24시간 */
FROM dual;

-- 문자 -> 숫자
SELECT '253' || '12'
FROM dual; -- 25312

SELECT concat('253', '12')
FROM dual; -- 25312

SELECT '253' + '12'
FROM dual; -- 265

SELECT to_number('253') + to_number('12')
FROM dual; -- 265

-- 문자 -> 날짜
SELECT to_date('2022-10-14')
FROM dual; -- 22/10/14

SELECT first_name || '님은 ' || to_char(hire_date, 'yyyy') || '년 ' || ltrim(to_char(hire_date, 'mm'), '0') || '월 ' || ltrim(to_char(hire_date, 'dd'), '0') || '일에 입사했습니다.'
FROM employees;

/* 일반 함수 */
-- nvl
SELECT commission_pct, nvl(commission_pct, 0)
FROM employees;

SELECT first_name, manager_id, nvl(to_char(manager_id), 'CEO')
FROM employees;

-- nvl2
SELECT commission_pct, nvl2(commission_pct, 1, 0)
FROM employees;

SELECT count(*), sum(nvl2(commission_pct, 1, 0)), count(*) - sum(nvl2(commission_pct, 1, 0))
FROM employees;

SELECT count(*) AS 전체사원수, 
       SUM(nvl2(commission_pct, 1, 0)) AS "커미션지급 사원수",
       count(*) - SUM(nvl2(commission_pct, 1, 0)) AS "커미션미지급 사원수"
FROM employees;

-- NULLIF
SELECT commission_pct, NULLIF(commission_pct, 0.4)
FROM employees;

-- coalesce
SELECT first_name, commission_pct, salary, coalesce(commission_pct, salary)
FROM employees;

SELECT first_name, commission_pct, salary, coalesce(commission_pct, commission_pct)
FROM employees;

/* decode */
-- dapartment_id값이 10이면 'ACCOUNTING', 20이면 'RESEARCH',
-- 30이면 'SALES', 40이면 'OPERATIONS', 'OTHERS'
SELECT first_name, department_id,
       decode(department_id, 10, 'ACCOUNTING',
                             20, 'RESEARCH',
                             30, 'SALES',
                             40, 'OPERATIONS', 'OTHERS') AS department_name
FROM employees;

-- 직급이 'PR_REP'인 사원은 5%, 'SA_MAN'인 사원은 10%,
-- 'AC_MGT'인 사원은 15%, 'PU_CLERK'인 사원은 20%를 인상
SELECT job_id, salary, decode(job_id, 'PR_REP', salary * 1.05,
                                      'SA_MAN', salary * 1.1,
                                      'AC_MGT', salary * 1.15,
                                      'PU_CLERK', salary * 1.2, salary) AS newsal
FROM employees;                                    

/* case end */
-- 입사일(hire_date) 1-3이면 '1분기', 4-6이면 '2분기',
--                  7-9이면 '3분기', 10-12이면 '4분기' 로
-- 처리를 하고 사원명(first_name), 입사일(hire_date), 분기로 출력하시오.
SELECT first_name AS "사원명", hire_date AS "입사일",
       case when to_char(hire_date, 'mm') <= 3 then '1분기'
            when to_char(hire_date, 'mm') <= 6 then '2분기'
            when to_char(hire_date, 'mm') <= 9 then '3분기'
            when to_char(hire_date, 'mm') <= 12 then '4분기'
       end AS "분기"
FROM employees;

-- salary의 값이 10000미만이면 '하', 10000이상 20000미만이면 '중', 20000이상이면 '상'
-- 으로 출력하도록 query문을 작성하시오.
SELECT first_name, salary,
       case when salary < 10000 then '하'
            when salary < 20000 then '중'
            when salary >= 20000 then '상'
       end AS "구분"
FROM employees;

/* 집계 함수 */
SELECT max(salary), min(salary), count(salary), sum(salary), avg(salary), stddev(salary), variance(salary)
FROM employees;

SELECT count(commission_pct)
FROM employees;

SELECT count(employee_id)
FROM employees;

SELECT count(*)
FROM employees;

SELECT count(DISTINCT commission_pct)
FROM employees;

SELECT count(ALL commission_pct)
FROM employees;

-- 집계함수와 단순컬럼은 함께 사용할수 없다.
-- 그룹함수와 단순컬럼을 사용하기 위해서는 단순 컬럼을 그룹화 해야 한다.
SELECT first_name, count(*)
FROM employees;

SELECT department_id, count(*)
FROM employees
GROUP BY department_id
ORDER BY department_id;

-- 50이하인 부서번호에 대해서 null이 아닌 부셔별의 직원수를 출력
SELECT department_id, count(*)
FROM employees
WHERE department_id <= 50
AND department_id IS NOT NULL
GROUP BY department_id;

SELECT department_id, count(*)
FROM employees
WHERE department_id IS NOT NULL
GROUP BY department_id
HAVING department_id <= 50;

-- 부서별의 직원수가 5이하인 경우만 출력
SELECT department_id, count(*)
FROM employees
GROUP BY department_id
HAVING count(*) <= 5;

-- 업무별 급여 합계를 출력
SELECT job_id, sum(salary)
FROM employees
GROUP BY job_id;

-- 부서별로 최소급여, 최대급여를 최소값과 최대값이 같지 않은 경우에만 부서별 오름차순으로 출력
SELECT department_id, min(salary), max(salary)
FROM employees
GROUP BY department_id
HAVING min(salary) != max(salary)
ORDER BY department_id;

SELECT department_id
FROM employees
ORDER BY department_id DESC;

-- first_name중 세번째 인덱스에 위치한게 e인것을 리턴
-- instr(데이터, 찾을 문자, 시작위치, 순서)
SELECT first_name
FROM employees
WHERE instr(first_name, 'e', 3, 1) = 3;

-- 2인덱스 부터 2번째의 e값을 찾아서 리턴
SELECT instr('korea', 'e', 2, 2)
FROM dual; -- 0

SELECT instr('koreae', 'e', 2, 2)
FROM dual; -- 6

/* ROWNUM */
SELECT rownum, first_name, salary
FROM employees;

SELECT rownum, first_name, salary
FROM employees
WHERE rownum = 1;

SELECT rownum, first_name, salary
FROM employees
WHERE rownum <= 3;

SELECT rownum, first_name, salary
FROM employees
WHERE rownum = 3;

SELECT rownum, first_name, salary
FROM employees
WHERE rownum >= 3;

/* ROWID */
SELECT rowid, first_name, salary
FROM employees;



















