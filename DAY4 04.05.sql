-- NULL처리 내장함수
SELECT * FROM EMP;
SELECT COMM*1.1 FROM EMP;
SELECT NVL(COMM, 0) FROM EMP;				-- NVL(해당열, 대체값)
SELECT NVL(COMM, 0)*1.2 FROM EMP;
SELECT NVL2(COMM, COMM*1.1, 0) FROM EMP;	-- NVL2(해당열, 정상값(NULL이 아닌 값), NULL이면 대체값)

-- DECODE 함수: 조건에 따라 값을 선택
SELECT EMPNO, ENAME, JOB, SAL,
DECODE (JOB,								-- 해당열
	'MANAGER', SAL*1.1,						-- 'MANAGER'가 적용되는 값
	'SALESMAN', SAL*1.05,					-- 'SALESMAN'이 적용되는 값
	'ALALYST', SAL,							
	SAL*1.03) AS UPSAL						-- 그 외 나머지
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL,
CASE JOB
	WHEN 'MANAGER' THEN SAL*1.1
	WHEN 'SALESMAN' THEN SAL*1.5
	WHEN 'ALALYST' THEN SAL
	ELSE SAL*1.03
END AS UPSAL								-- CASE문이 끝나면 END로 마침.
FROM EMP;


-- 행 개수 제한
SELECT *
FROM EMP
WHERE ROWNUM BETWEEN 1 AND 5;


-- 다중함수(집계함수): SUM, MIN, MAX, COUNT, AVG
SELECT * FROM EMP;
SELECT COUNT(ENAME) FROM EMP;						-- 사원 수 확인
SELECT COUNT(COMM) FROM EMP;						-- NULL 값은 제외하고 카운팅

-- 부서번호가 30인 사원 수
SELECT COUNT(DEPTNO)
FROM EMP
WHERE DEPTNO = 30;

SELECT SUM(COMM) FROM EMP;
SELECT SUM(SAL) FROM EMP;
SELECT SUM(DISTINCT SAL),						-- 중복 제거
		SUM(ALL SAL),							-- 중복 포함 전체
		SUM(SAL)								-- 전체
FROM EMP;

SELECT COUNT(SAL),
		COUNT(ALL SAL),
		COUNT(DISTINCT SAL)
FROM EMP;

SELECT MAX(SAL), MIN(SAL)
FROM EMP 
WHERE DEPTNO = 10;				-- 10번 부서의 월급 최소, 최대값

-- 20번 부서에서 신입과 최고참의 입사일 조회
SELECT * FROM EMP;
SELECT MAX(HIREDATE) AS "최고참", MIN(HIREDATE) "신입"
FROM EMP
WHERE DEPTNO = 20;

-- 30번 부서의 월급 평균 조회
SELECT AVG(SAL) "30번 부서 월급 평균"
FROM EMP
WHERE DEPTNO = 30;

-- GROUP BY
-- 10, 20, 30번 부서의 월급 평균 조회
SELECT AVG(SAL), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;
-- GROUP BY를 통한 출력
SELECT AVG(SAL), DEPTNO					-- ENAME, EMPNO 등은 그룹을 못 지음(중복이 거의 없기 때문)
FROM EMP 
GROUP BY DEPTNO 
ORDER BY DEPTNO;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB; 

/* 함수 코딩순서
 * SELECT *
 * FROM 컬럼 이름
 * WHERE
 * GROUP BY
 * ORDER BY */

/* 함수 실행순서
 * FROM
 * WHERE
 * GROUP BY
 * SELECT
 * ORDER BY */

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
--WHERE AVG(SAL) >= 2000					-- WHERE절에서는 집계함수를 사용할 수 없음(실행순서에 맞지 않는 식)
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;
-- HAVING으로 수정
SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000						-- WHERE 대신 HAVING을 사용(SELECT를 조회하고 조건문 접속하기 때문)
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP
WHERE SAL <= 3000							-- 집계함수가 아닌 단독 컬럼은 가능
GROUP BY DEPTNO, JOB
HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

/* 오라클 JOIN
 * INNER JOIN: 매칭이 안되면 버림
 * OUTTER JOIN(LEFT/RIGHT/FULL OUTER) */
SELECT * FROM DEPT;
SELECT * FROM EMP;
-- FROM절에서 테이블로 조인
SELECT * 
FROM EMP, DEPT;					-- JOIN(부서번호의 테이블이 따로 구분되어 있음)
-- WHERE절에서 열 이름을 비교하는 조건식
SELECT * FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO	-- JOIN(같은 부서끼리 매칭)
ORDER BY EMP.DEPTNO;

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY DEPT.DEPTNO, EMP.DEPTNO;		-- 등가조인

SELECT EMP.EMPNO, EMP.ENAME, DEPT.DEPTNO, DEPT.DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO AND SAL >= 3000;

SELECT * FROM EMP e , SALGRADE s 
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

-- OUTER JOIN
SELECT E.EMPNO, E.ENAME, E.MGR, 
		E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME 
FROM EMP e , EMP e2
WHERE E.MGR = E2.EMPNO (+)		-- (+) 있는 쪽이 기준(MGR이 NULL값이어도 출력이 됨. NULL값도 확인해야 할때 대부분 사용)
ORDER BY E.EMPNO;

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM,
		DEPTNO, D.DNAME, D.LOC 
FROM EMP e NATURAL JOIN DEPT d ;

-- INNER JOIN
SELECT *
FROM EMP e JOIN DEPT d ON(E.DEPTNO = D.DEPTNO)		-- INNER가 생략되어 있음
WHERE SAL >= 3000;

-- OUTER JOIN
SELECT E.EMPNO, E2.ENAME, E.MGR,
		E2.EMPNO AS MGR_DMPMO, 
		E2.ENAME AS MGR_ENAME
FROM EMP e LEFT OUTER JOIN EMP e2 ON(E.MGR = E2.EMPNO);		-- 왼쪽 외부 조인 MGR

SELECT E.EMPNO, E2.ENAME, E.MGR,
		E2.EMPNO AS MGR_DMPMO, 
		E2.ENAME AS MGR_ENAME
FROM EMP e RIGHT OUTER JOIN EMP e2 ON(E.MGR = E2.EMPNO);

SELECT E.EMPNO, E2.ENAME, E.MGR,
		E2.EMPNO AS MGR_DMPMO, 
		E2.ENAME AS MGR_ENAME
FROM EMP e FULL OUTER JOIN EMP e2 ON(E.MGR = E2.EMPNO);

SELECT * FROM EMP;

-- 서브쿼리
--SELECT BOWNUM, * FROM EMP;			--ROWNUM과 *이 중복으로 인식되기 때문에 조회불가
SELECT ROWNUM, E.* FROM EMP e ;
SELECT * 
FROM(SELECT ROWNUM, E.* FROM EMP e)
WHERE ROWNUM BETWEEN 1 AND 5;

SELECT * 
FROM(SELECT ROWNUM AS RN, E.* FROM EMP e)
WHERE RN BETWEEN 6 AND 10;

SELECT * 
FROM(SELECT ROWNUM AS RN, E.* FROM EMP e)
WHERE RN BETWEEN 11 AND 15;

-- 급여를 내림차순으로 정렬하고 상위 5명 정보를 출력
SELECT *
FROM(SELECT * FROM EMP e ORDER BY SAL DESC)
WHERE ROWNUM BETWEEN 1 AND 5;

-- SCOTT보다 높은 급여를 받는 사원
SELECT * FROM EMP;

SELECT *
FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME='SCOTT');

-- ALLEN의 추가수당보다 높은 추가수당을 받는 사원
SELECT *
FROM EMP
WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME='ALLEN');


/* 문제 풀기*/
SELECT * FROM EMP;

-- 1. EMP 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수, 급여의 합을 출력
SELECT DEPTNO "부서번호", COUNT(EMPNO) "인원 수", SUM(SAL) "총 급여"
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(EMPNO) > 4;


-- 2. EMP 테이블에서 가장 많은 사원이 속해있는 부서번호와 사원수를 출력
SELECT DEPTNO, COUNT(EMPNO)
FROM EMP
GROUP BY DEPTNO
HAVING COUNT(EMPNO) = (SELECT MAX(COUNT(EMPNO)) FROM EMP GROUP BY DEPTNO);


-- 3. EMP 테이블에서 가장 많은 사원을 갖는 MGR의 사원번호를 출력
SELECT MGR
FROM EMP
GROUP BY MGR
HAVING COUNT(MGR) = (SELECT MAX(COUNT(MGR)) FROM EMP GROUP BY MGR);


-- 4. EMP 테이블에서 부서번호가 10인 사원수와 부서번호가 30인 사원수를 각각 출력

SELECT DEPTNO, COUNT(EMPNO)
FROM EMP
GROUP BY DEPTNO
HAVING DEPTNO = 10 OR DEPTNO = 30;







