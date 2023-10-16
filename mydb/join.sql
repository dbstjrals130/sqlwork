-- ���� : �� ���̺��� �����Ͽ� ����ϴ� ���
-- ��������(equl join) : ���� ������ ��Ȯ�� ��ġ�ϴ� ��쿡 ��� ���
-- �ܺ����� : ���� ������ ��Ȯ�� ��ġ���� �ʾƵ� ��� ����� ���

SELECT * FROM book;
SELECT * FROM customer;
SELECT * FROM orders;

-- ��(customer)�� ���� �ֹ�(order)�� ���� �����͸� ��� �˻��Ͻÿ�
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid;
--GROUP BY cus.custid, cus.name
-- HAVING cus.name = '�迬��'
--ORDER BY cus.name;


-- �ֹ����� ���� �����͵� ��� �˻�
-- ������ ��ġ���� ���� ���̺� +�� �־���
SELECT cus.name, ord.saleprice
FROM customer cus, orders ord
WHERE cus.custid = ord.custid(+)
ORDER BY cus.name;

-- ���� �̸�, �ֹ��� ���� �̸�, �ֹ���, �ֹ��ݾ�
SELECT cus.name, bk.bookname, ord.orderdate, ord.saleprice
FROM customer cus, book bk, orders ord
WHERE cus.custid = ord.custid   -- �⺻Ű = �ܷ�Ű
   AND bk.bookid = ord.bookid;
   
-- ǥ�� ����(ANSI SQL)
-- ���� ����(INNER JOIN)
-- ��(customer)�� ���� �ֹ�(order)�� ���� ������ �� ���� �̸���
-- ���� �ֹ��� ������ �ǸŰ����� �˻��Ͻÿ�.
SELECT cus.name, ord.saleprice
FROM customer cus INNER JOIN orders ord
   ON cus.custid = ord.custid
ORDER BY cus.name;

-- �ܺ� ����(OUTER JOIN)
-- JOIN ���ǿ� �����ϴ� �����Ͱ� �ƴϾ ����ϴ� ���
-- ��(customer)�� ���� �ֹ�(order)�� ���� ������ �� 
-- �ֹ����� ���� �����͸� �����Ͽ� ���� �̸��� ���� �ֹ��� 
-- ������ �ǸŰ����� �˻��Ͻÿ�.

SELECT cus.name, ord.saleprice
FROM customer cus LEFT OUTER JOIN orders ord
    ON cus.custid = ord.custid
ORDER BY cus.name;

