-- ���� ����
-- product, product_review
SELECT * FROM product;
SELECT * FROM product_review;

-- ���䰡 �ִ� ��ǰ�� ������ �˻��Ͻÿ�
-- ���� ���̺� product_name Į���� ���
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a, product_review b
WHERE a.product_code = b.product_code;


-- ���䰡 ���� ��ǰ�� ������ �˻��Ͻÿ�
SELECT a.product_name,
       b.*
FROM product a, product_review b
WHERE a.product_code = b.product_code;

-- ANSI(�̱���ȸ) ���� - STANDARD JOIN(ǥ������)
-- ��������(INNER JOIN - ON)
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a JOIN product_review b
  ON a.product_code = b.product_code;
  
-- �ܺ�����(LEFT, RIGHT ����)
-- ������ ������ ������� ��� ��ǰ�� ������ �˻�
SELECT b.review_no,
       b.product_code,
       a.product_name,
       b.content,
       b.regdate
FROM product a LEFT JOIN product_review b
  ON a.product_code = b.product_code;
  
-- ���䰡 ���� ��ǰ�� ������ �˻��Ͻÿ�
SELECT a.product_name "��ǰ�ıⰡ ���� ��ǰ"
FROM product a LEFT JOIN product_review b
  ON a.product_code = b.product_code
WHERE b.content IS NULL;

-- ��ǰ ���� ���̺� product_name Į�� �߰�
-- ��Į�� �������� : �� Į���� ��ȯ��, SELECT ������ ���
SELECT A.review_no,
       A.product_code,
       (SELECT B.product_name
        FROM product B
        WHERE A.product_code = B.product_code) 
       product_name,
       A.content,
       A.member_id
FROM product_review A;  
