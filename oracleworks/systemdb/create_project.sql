-- 새로운 사용자(user) 생성
CREATE USER C##project IDENTIFIED BY pw1234;
-- 세션(저장을 유지) 생성할 권한 부여
GRANT CREATE SESSION TO C##project;
-- 테이블 자원(resource) 생성할 권한 부여
GRANT CREATE TABLE, RESOURCE TO C##project;
-- DBA에 접속(연결)할 권한 부여
GRANT CONNECT, DBA TO C##project;