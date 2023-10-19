-- �����б� ������, ��� ���̺�
SELECT * FROM summer_price;
SELECT * FROM summer_register;

-- �л��� ��� ���������� �˻��Ͻÿ�.
-- JOIN ~ USING(Į����) : ���� Į�� �̸��� ���� ���
                      -- ��Ī�� ����� �� ����
SELECT b.sid,
       subject,
       a.price
FROM summer_price a JOIN summer_register b
  USING (subject);

-- ���� ������ �հ� �� ��ü �Ѱ踦 ���Ͻÿ�
-- ROLLUP(), CUBE()
-- NVL(����, '�Ѱ�') 
-- ������ NULL�� �ƴϸ� ���� ���, NULL�̸� '�Ѱ�' ���
SELECT NVL(b.subject, '�Ѱ�') ��������,
       sum(a.price) �������հ�
FROM summer_price a, summer_register b
WHERE a.subject = b.subject
GROUP BY ROLLUP(b.subject);

-- ���� ������ �հ�
INSERT INTO summer_register
VALUES (301, 'Python');

INSERT INTO summer_price
VALUES ('Python', 40000);

SELECT subject,
       SUM(price)
FROM summer_price
GROUP BY subject;


