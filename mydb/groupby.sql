-- department 테이블 생성
CREATE TABLE department(
    deptno      VARCHAR(4) PRIMARY KEY,
    deptname    VARCHAR2(20) NOT NULL,
    office      VARCHAR2(20)
);

INSERT INTO department VALUES ('1000', '인사팀', '서울');
INSERT INTO department VALUES ('1001', '전산팀', '인천');
INSERT INTO department VALUES ('1002', '전산팀', '수원');
INSERT INTO department(deptno, deptname) VALUES ('1003', '영업팀');

COMMIT;

-- employee 테이블 생성
CREATE TABLE employee(
    empno    NUMBER(3) PRIMARY KEY,
    empname  VARCHAR2(20) NOT NULL,
    sal      NUMBER(10),
    createdate DATE DEFAULT SYSDATE,
    deptno   VARCHAR2(4),
    FOREIGN KEY(deptno) REFERENCES department(deptno)    -- 외래키
);

INSERT INTO employee VALUES (100, '이강', 2500000, SYSDATE, '1000');
INSERT INTO employee VALUES (101, '김산', 2000000, SYSDATE, '1001');
INSERT INTO employee VALUES (102, '박달', 1500000, SYSDATE, '1002');
INSERT INTO employee VALUES (103, '강태양', 3500000, SYSDATE, '1000');
INSERT INTO employee VALUES (104, '최우주', 5000000, SYSDATE, '1001');
INSERT INTO employee VALUES (105, '우영우', 4000000, SYSDATE, '1002');

COMMIT;

SELECT * FROM employee;
SELECT * FROM department;

-- '1002'번 부서이름을 '총무팀'으로 변경하기
UPDATE department SET deptname = '총무팀'
WHERE deptno = '1002';

-- '강태양'의 급여를 3000000원으로 변경하기
UPDATE employee SET sal = 3000000
WHERE empname = '강태양';


-- 부서별 급여 총액을 구하시오
SELECT deptno, SUM(sal) 급여총액 
FROM employee 
GROUP BY deptno;

-- 부서이름과 부서별 급여 총액을 출력하시오
-- employee, department 테이블 사용 (동등 조인)
SELECT a.deptno,
       a.deptname,
       sum(b.sal)
FROM department a, employee b
WHERE a.deptno = b.deptno
GROUP BY a.deptno, a.deptname;

-- ROLLUP(칼럼1, 칼럼2) : GROUP BY절에서 모든 소계, 총계를 입체적으로 만듬
SELECT a.deptno,
       a.deptname,
       sum(b.sal)
FROM department a, employee b
WHERE a.deptno = b.deptno
GROUP BY CUBE(a.deptno, a.deptname)
ORDER BY a.deptno;


-- CUBE(칼럼1, 칼럼2) : GROUP BY절에서 모든 소계, 총계를 입체적으로 만듬
SELECT a.deptno,
       sum(b.sal)
FROM department a, employee b
WHERE a.deptno = b.deptno
GROUP BY CUBE(a.deptno, a.deptname)
ORDER BY a.deptno;



-- SUM(칼럼명), OVER(ORDER BY 칼럼명) - 누적합계
-- 칼럼명 영어 소문자로 표기할 때 쌍따옴표로 묶어준다
SELECT empno,
       empname,
       sal,
       SUM(sal) OVER(ORDER BY empno) "sal_sum",
       RANK() OVER(ORDER BY sal DESC) 급여_RANK
FROM employee;

-- 순위 RANK() OVER(ORDER BY 칼럼명) 함수
SELECT empno,
       empname,
       sal,
       RANK() OVER(ORDER BY sal DESC) 급여_RANK,
       DENSE_RANK() OVER(ORDER BY sal DESC) 급여_DENSE_RANK
FROM employee;

