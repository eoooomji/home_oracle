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


























