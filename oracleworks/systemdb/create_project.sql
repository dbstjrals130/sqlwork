-- ���ο� �����(user) ����
CREATE USER C##project IDENTIFIED BY pw1234;
-- ����(������ ����) ������ ���� �ο�
GRANT CREATE SESSION TO C##project;
-- ���̺� �ڿ�(resource) ������ ���� �ο�
GRANT CREATE TABLE, RESOURCE TO C##project;
-- DBA�� ����(����)�� ���� �ο�
GRANT CONNECT, DBA TO C##project;