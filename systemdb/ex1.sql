-- ��Ű�� : system
-- ���̺� ����
CREATE TABLE ex1(
    column1 CHAR(10),      -- �������� ����(10byte)
    column2 VARCHAR2(10)   -- �������� ����(10byte)
);

-- ������ �߰�
INSERT INTO ex1(column1, column2) VALUES('abc', 'abc');
INSERT INTO ex1 VALUES('���', '���');

-- ������ ��ȸ
SELECT column1, LENGTH(column1), column2, LENGTH(column2) FROM ex1;

-- Ʈ�����(������ ����ȭ) : COMMIT, ROLLBACK 
COMMIT;