-- 날짜 시간 함수
-- 현재 날짜 출력
SELECT SYSDATE FROM dual;

-- 현재 날짜 형식 변환
-- TO_CHAR(날짜, 형식 포맷)
SELECT TO_CHAR(SYSDATE, 'yyyy') 년도,
       TO_CHAR(SYSDATE, 'mm') 월,
       TO_CHAR(SYSDATE, 'dd') 일,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD') 날짜
FROM dual;

-- 현재 날짜와 시간
SELECT SYSTIMESTAMP FROM dual;
-- 시간 형식 변환
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') 시간,
       TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD HH:MI:SS') 날짜와시간
FROM DUAL;