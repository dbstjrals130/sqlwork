-- ROWNUM(로우번호, 행번호)
-- 행 수를 제한하고 싶을 때 사용, SUDO COLUMNE이라 함
CREATE TABLE ex_score(
    name   VARCHAR2(20),
    score  NUMBER(3)
);

INSERT INTO ex_score VALUES('김하나', 94);
INSERT INTO ex_score VALUES('고하나', 85);
INSERT INTO ex_score VALUES('이하나', 100);
INSERT INTO ex_score VALUES('박하나', 97);
INSERT INTO ex_score VALUES('정하나', 87);
INSERT INTO ex_score VALUES('최하나', 87);
INSERT INTO ex_score VALUES('윤하나', 91);
INSERT INTO ex_score VALUES('임하나', 77);
INSERT INTO ex_score VALUES('장하나', 80);
INSERT INTO ex_score VALUES('함하나', 95);

-- 1부터 5행까지 정보 출력
SELECT ROWNUM, name, score
FROM ex_score
--WHERE ROWNUM >= 1 AND ROWNUM <= 5;
WHERE ROWNUM BETWEEN 1 AND 5;

-- 2부터 6행까지 데이터 검색
-- ROWNUM은 1부터 시작해야 함
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM >= 2 AND ROWNUM <= 6; 

-- 점수가 높은 순으로 검색하시오(내림차순 정렬)
SELECT * FROM ex_score
ORDER BY score DESC;

-- 1부터 5행까지 정보 출력
SELECT ROWNUM, name, score
FROM ex_score
--WHERE ROWNUM >= 1 AND ROWNUM <= 5;
WHERE ROWNUM BETWEEN 1 AND 5;

-- 점수가 높은 순으로 5명을 검색하시오
SELECT ROWNUM, name, score
FROM ex_score
WHERE ROWNUM <=5
ORDER BY score DESC;

-- 성적을 내림차순으로 정렬한 후 5개를 검색
/*
  실행 순서
  1. FROM절 테이블명
  2. WHERE, GROUP BY
  3. SELECT 절
  4. ORDER 절
*/
SELECT ROWNUM, name, score
FROM (SELECT * 
        FROM ex_score 
       ORDER BY score DESC)
WHERE ROWNUM <= 5;

-- 성적의 순위 검색하기
SELECT name,
       score,
       RANK() OVER(ORDER BY score DESC) 순위1,
       DENSE_RANK() OVER(ORDER BY score DESC) 순위2
FROM ex_score;



COMMIT;



