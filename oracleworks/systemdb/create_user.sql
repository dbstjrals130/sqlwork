-- ���ο� �����(user) ����
CREATE USER C##mydb IDENTIFIED BY pwmydb;
-- ����(������ ����) ������ ���� �ο�
GRANT CREATE SESSION TO C##mydb;
-- ���̺� �ڿ�(resource) ������ ���� �ο�
GRANT CREATE TABLE, RESOURCE TO C##mydb;
-- DBA�� ����(����)�� ���� �ο�
GRANT CONNECT, DBA TO C##mydb;