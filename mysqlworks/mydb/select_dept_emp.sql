
SELECT * FROM department;
SELECT * FROM employee;

-- 삽입 오류 : 부서 테이블에 아이디가 30이 없어서 에러
INSERT INTO employee values (106, '양신입', 25, null, 30);

-- 급여가 400만원 이상이고 부서번호가 20인 사원을 검색하시오
SELECT * FROM employee
WHERE sal >= 4000000 AND deptid = 20;

-- 급여가 많은 순으로 정렬하시오.
SELECT * FROM employee
ORDER BY sal DESC;

-- 급여가 없는 사원을 검색하시오.
SELECT * FROM employee
WHERE sal IS NULL;

-- 사원의 총 인원, 급여 총액과 급여 평균을 구하시오.
SELECT COUNT(*) 사원수,
	   SUM(sal) 급여총액,
       round(avg(sal), 0) 급여평균
FROM employee;

-- 부서별 급여 총액을 구하시오
SELECT deptid, 
	   sum(sal) 급여총액, 
	   round(avg(sal), 0) 급여평균 
FROM employee
GROUP BY deptid;

-- 부서이름을 포함한 사원의 모든 정보를 검색하시오(조인)
-- 동등조인
SELECT a.deptid,
	   a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
FROM department a JOIN employee b
	ON a.deptid = b.deptid;

-- join ~ using
SELECT a.deptid,
	   a.deptname,
       b.empid,
       b.empname,
       b.age,
       b.sal
FROM department a JOIN employee b
	USING (deptid);

-- 부서별, 부서이름별 급여 소계, 총계
SELECT a.deptid,
	   a.deptname,
       sum(b.sal) 급여총액,
       round(avg(b.sal), -2) 급여평균
FROM department a JOIN employee b
  ON a.deptid = b.deptid
GROUP BY deptid, deptname with rollup;

-- 최고 급여와 최저 급여를 받는 사원을 검색하시오
SELECT * FROM employee
WHERE sal = (SELECT max(sal) from employee)
   OR sal = (SELECT min(sal) from employee);
   
-- '백두산' 사원의 급여를 430만원으로 수정하세요.
UPDATE employee SET sal = 4300000
WHERE empid = 102;	-- 기본키로만 변경이 가능함

-- 사원의 급여 순위를 구하시오.
SELECT empname,
	   sal,
       rank() over(order by sal desc) 급여순위1,
	   dense_rank() over(order by sal desc) 급여순위2
FROM employee;