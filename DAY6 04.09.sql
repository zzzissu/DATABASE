--1. EMP 테이블에서 입사일 순으로 사원번호, 이름, 급여, 입사일자, 부서번호 조회
SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
ORDER BY HIREDATE;

--2. EMP 테이블에서 부서번호로 정렬한 후 급여가 많은 순으로 사원번호, 성명, 업무, 부서번호, 급여 조회
SELECT EMPNO, ENAME, JOB, DEPTNO, SAL
FROM EMP
ORDER BY DEPTNO, SAL;


--3. EMP 테이블에서 모든 SALESMAN의 급여 평균, 최고액, 최저액, 합계를 조회
SELECT AVG(SAL) AS 평균, MAX(SAL) AS 최고액, MIN(SAL) AS 최저액, SUM(SAL) AS 합계
FROM EMP
WHERE JOB = 'SALESMAN';


--4. EMP 테이블에서 각 부서별로 인원수, 급여의 평균, 최저 급여, 최고 급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력
SELECT D.DNAME AS 부서이름, E.DEPTNO AS 부서번호, 
		COUNT(E.EMPNO) AS 인원수, AVG(E.SAL) AS 평균급여,
		MAX(E.SAL) AS 최고급여, MIN(E.SAL) AS 최소급여, SUM(E.SAL) AS 총급여
FROM EMP E LEFT OUTER JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
GROUP BY E.DEPTNO, D.DNAME
ORDER BY SUM(E.SAL) DESC;

