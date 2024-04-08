CREATE TABLE DEPT_tmp AS SELECT * FROM DEPT d ;
SELECT * FROM DEPT_TMP;

-- UPDATE _ SET
UPDATE DEPT_TMP SET LOC = 'SEOUL';			-- 해당열 전체 수정
UPDATE DEPT_TMP SET DNAME = 'DATABASE', LOC = 'PUSAN'
WHERE DEPTNO = 40;

-- 서브쿼리를 사용한 데이터 수정
UPDATE DEPT_TMP SET (DNAME, LOC) = (SELECT DNAME, LOC FROM DEPT WHERE DEPTNO = 40)
WHERE DEPTNO = 40;

-- DELETE
CREATE TABLE EMP_TMP AS SELECT * FROM EMP;
SELECT * FROM EMP_TMP;
DELETE FROM EMP_TMP WHERE JOB = 'SALESMAN';

-- 서브쿼리 삭제
DELETE FROM EMP_TMP;			--DATA를 삭제
SELECT * FROM EMP_TMP;
DROP TABLE EMP_TMP;				-- 테이블 삭제(DROP TABLE [테이블 이름])