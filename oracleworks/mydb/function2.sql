-- ��¥ �ð� �Լ�
-- ���� ��¥ ���
SELECT SYSDATE FROM dual;

-- ���� ��¥ ���� ��ȯ
-- TO_CHAR(��¥, ���� ����)
SELECT TO_CHAR(SYSDATE, 'yyyy') �⵵,
       TO_CHAR(SYSDATE, 'mm') ��,
       TO_CHAR(SYSDATE, 'dd') ��,
       TO_CHAR(SYSDATE, 'YYYY-MM-DD') ��¥
FROM dual;

-- ���� ��¥�� �ð�
SELECT SYSTIMESTAMP FROM dual;
-- �ð� ���� ��ȯ
SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') �ð�,
       TO_CHAR(SYSTIMESTAMP, 'YYYY/MM/DD HH:MI:SS') ��¥�ͽð�
FROM DUAL;