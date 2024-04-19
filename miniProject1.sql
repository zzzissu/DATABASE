
------------------ 테이블 생성

CREATE TABLE cart
(
  cart_no   VARCHAR2(20) NOT NULL unique,
  cart_qty  NUMBER       NOT NULL,
  cart_date DATE         NOT NULL,
  prod_name VARCHAR2(20) NOT NULL,
  cart_price VARCHAR2(20) NOT NULL
);

CREATE TABLE lprod
(
  lprod_code VARCHAR2(20) NOT NULL,
  lprod_name VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_lprod PRIMARY KEY (lprod_code)
);


CREATE TABLE employee_mem
(
  mem_name     VARCHAR2(20) NOT NULL,
  mem_hiredate DATE         NOT NULL,
  mem_position VARCHAR2(20) NOT NULL,
  mem_num     VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_employee_mem PRIMARY KEY (mem_num)
);


CREATE TABLE prod
(
  prod_code  VARCHAR2(20) NOT NULL,
  prod_name  VARCHAR2(20) NOT NULL,
  prod_price NUMBER       NOT NULL,
  prod_qty   NUMBER       NOT NULL,
  lprod_code VARCHAR2(20) NOT NULL,
  CONSTRAINT PK_prod PRIMARY KEY (prod_name)
);

ALTER TABLE cart
  ADD CONSTRAINT FK_prod_TO_cart         -- 제약조건 걸어주기
    FOREIGN KEY (prod_name)
    REFERENCES prod (prod_name);         -- 참조(cart 에 있는 데이터를 참조)

ALTER TABLE prod
  ADD CONSTRAINT FK_lprod_TO_prod
    FOREIGN KEY (lprod_code)
    REFERENCES lprod (lprod_code);
   
CREATE TABLE TOTALSALES
(
  TO_PRICE NUMBER   NULL
);

        

----------------- 상품 데이터 입력
SELECT * FROM prod;

INSERT INTO lprod VALUES ('b01', '빵류');
INSERT INTO lprod VALUES ('c01', '케이크류');
INSERT INTO lprod VALUES ('c02', '쿠키류');

INSERT INTO prod VALUES ('a001', '소세지빵', 2000, 300, 'b01');
INSERT INTO prod VALUES ('a002', '단팥빵', 1000, 300, 'b01');
INSERT INTO prod VALUES ('a003', '크림빵', 1500, 300, 'b01');
INSERT INTO prod VALUES ('a004', '피자빵', 2500, 300, 'b01');
INSERT INTO prod VALUES ('a005', '바게트', 2500, 300, 'b01');
INSERT INTO prod VALUES ('a006', '생크림 케이크', 18000, 300, 'c01');
INSERT INTO prod VALUES ('a007', '초코 케이크', 23000, 300, 'c01');
INSERT INTO prod VALUES ('a008', '과일 케이크', 20000, 300, 'c01');
INSERT INTO prod VALUES ('a009', '초코 쿠키', 3500, 300, 'c02');
INSERT INTO prod VALUES ('a010', '버터 쿠키', 3000, 300, 'c02');

----------------- 직원 데이터 입력

SELECT * FROM EMPLOYEE_MEM;
SELECT * FROM PROD;
SELECT * FROM TOTALSALES;
SELECT * FROM CART;

INSERT INTO employee_mem VALUES ('한지수', to_date('23-02-2020', 'dd-mm-yyyy'), 'Manager', '2002-2301');
INSERT INTO employee_mem VALUES ('이윤지', to_date('30-04-2019', 'dd-mm-yyyy'), 'Manager', '1904-3001');
INSERT INTO employee_mem VALUES ('이은지', to_date('25-03-2020', 'dd-mm-yyyy'), 'Staff', '2003-2501');
INSERT INTO employee_mem VALUES ('강소이', to_date('05-06-2022', 'dd-mm-yyyy'), 'Staff', '2206-0501');
INSERT INTO employee_mem VALUES ('한성지', to_date('01-05-2023', 'dd-mm-yyyy'), 'Intern', '2305-0101');
INSERT INTO employee_mem VALUES ('강정미', to_date('16-10-2021', 'dd-mm-yyyy'), 'Staff', '2110-1601');

