-- ROLLUP(), CUBE(), GROUPING SETS()
CREATE TABLE tbl_dept(
    dept_no     varchar2(3),
    job_nm      varchar2(30),
    salary      number
);

INSERT INTO tbl_dept VALUES('100', '증권사', 3300000);
INSERT INTO tbl_dept VALUES('100', '관리자', 4300000);
INSERT INTO tbl_dept VALUES('100', '관리자', 2500000);
INSERT INTO tbl_dept VALUES('200', '증권사', 5000000);
INSERT INTO tbl_dept VALUES('200', '데이터분석가', 4000000);
INSERT INTO tbl_dept VALUES('200', '관리자', 6000000);

SELECT * FROM tbl_dept;

-- 부서 전체의 인원수와 급여 합계
SELECT COUNT(*) 인원수,
       SUM(salary) 급여합계
FROM tbl_dept;

-- 부서별 직업이름별 인원수 및 급여 합계(소계, 총계가 나오지 않음)
SELECT dept_no,
       job_nm,
       COUNT(*) 인원수,
       SUM(salary) 급여합계
FROM tbl_dept
GROUP BY GROUPING SETS(dept_no, job_nm)
ORDER BY dept_no;

DROP TABLE tbl_dept;


COMMIT;