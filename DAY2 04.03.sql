CREATE TABLE emp(
	EMPNO		number(4)NOT NULL, 	 -- 사원번호
	ENAME		varchar2(2),		 -- 사원이름
	JOB			varchar2(9),		 -- 업무
	MGR			NUMBER(4),           -- 사수번호
   	HIREDATE 	DATE,           	 -- 입사일
    SAL 		NUMBER(7,2),         -- 월급
    COMM 		NUMBER(7,2),         -- 커미션
    DEPTNO 		NUMBER(2)         	 -- 부서번호
);

SELECT * FROM emp;		-- 조회

INSERT INTO emp VALUES (7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980', 'dd-mm-yyyy')
						, 800, NULL, 20);	-- 사원이름의 용량이 적어서 오류(아래에서 용량 수정)

ALTER TABLE emp MODIFY ENAME varchar2(10);	-- 수정

INSERT INTO emp VALUES (7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-02-1981', 'dd-mm-yyyy'), 1600, 300, 30);	-- 추가
INSERT INTO emp VALUES (7521, 'WARD', 'SALESMAN', 7902, to_date('22-02-1981', 'dd-mm-yyyy'), 1250, 500, 30);
INSERT INTO emp VALUES (7566, 'JONES', 'MANAGER', 7839, to_date('2-04-1981', 'dd-mm-yyyy'), 2975, NULL, 20);
INSERT INTO emp VALUES (7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981', 'dd-mm-yyyy'), 1250, 1400,30);
INSERT INTO emp VALUES (7698, 'BLAKE', 'MANAGER', 7839, to_date('1-5-1981', 'dd-mm-yyyy'), 2850, NULL,30);
INSERT INTO emp VALUES (7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981', 'dd-mm-yyyy'), 2450, NULL, 10);
INSERT INTO emp VALUES (7788, 'SCOTT', 'ANALYST', 7566, to_date('13-07-1987', 'dd-mm-yyyy'), 3000, NULL, 20);
INSERT INTO emp VALUES (7839, 'KING', 'PRESIDENT', NULL, to_date('17-11-1981', 'dd-mm-yyyy'), 5000, NULL, 10);
INSERT INTO emp VALUES (7844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981', 'dd-mm-yyyy'), 1500, 0, 30);
INSERT INTO emp VALUES (7876, 'ADAMS', 'CLERK', 7788, to_date('13-07-1987', 'dd-mm-yyyy'), 1100, NULL,20);
INSERT INTO emp VALUES (7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981', 'dd-mm-yyyy'), 950, NULL,30);
INSERT INTO emp VALUES (7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981', 'dd-mm-yyyy'), 3000, NULL, 20);
INSERT INTO emp VALUES (7934, 'MILLER', 'CLERK', 7782, to_date ('23-01-1982', 'dd-mm-yyyy'), 1300, NULL, 10);

COMMIT;

SELECT * FROM emp;

CREATE TABLE dept (
	deptno	number(2),		-- 부서번호
	dname	varchar2(4),	-- 부서명
	loc		varchar2(13)	-- 지역
);

SELECT * FROM dept;

INSERT INTO dept VALUES (10, 'ACCOUNTING', 'NEW YORK');

ALTER TABLE dept MODIFY dname varchar2(15);

INSERT INTO dept VALUES (20, 'RESEARCH', 'DALLAS');
INSERT INTO dept VALUES (30, 'SALES', 'CHICAGO');
INSERT INTO dept VALUES (40, 'OPERATIONS', 'BOSTON');

CREATE TABLE BONUS (
	dname	varchar2(10),
	job		varchar2(9),
	sal		NUMBER,
	comm	NUMBER
);

CREATE TABLE salgrade (			-- 급여정보
	grade	NUMBER,
	losal	NUMBER,
	hisal	NUMBER
);

INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);

COMMIT;

SELECT * FROM SALGRADE;
