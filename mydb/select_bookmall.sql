SELECT * FROM orders;
-- �ֹ� ���̺��� Į��, �ڷ��� ����
DESC orders;

-- ��� �Լ� - ����(COUNT), �հ�(SUM), ���(AVG), �ִ밪(MAX), �ּҰ�(MIN)
-- COUNT(*) : '*' - Į����
-- COUNT(Į����) :
SELECT COUNT(orderid) AS ���ǸŰǼ�
FROM orders;

SELECT SUM(saleprice) AS ���Ǹž�,
       AVG(saleprice) AS �����
FROM orders;

-- ���� �ֹ��� ������ ���Ǹž� ���
SELECT SUM(saleprice) AS ���Ǹž�
FROM orders;

-- ������ �ֹ��� ������ ���Ǿ��� ���
-- �׷����� ������ ��� - GROUP BY Į����
SELECT custid,
       COUNT(*) AS ��������,
       SUM(saleprice) AS ���Ǹž�
FROM orders
GROUP BY custid;


-- ������ �ֹ��� ������ ���Ǹžװ� ���������� ���
-- ���������� 3�� �̻��� �ڷ� �˻�
-- HAVING �� ��� - GROUP BY ������ ������ ���� �� ���
SELECT custid,
       COUNT(*) AS ��������,
       SUM(saleprice) AS ���Ǹž�
FROM orders
GROUP BY custid
HAVING COUNT(*) >=3
   --AND SUM(saleprice) > 35000;


SELECT COUNT(*) AS �Ѱ���, COUNT(phone) AS ��ȭ��ȣ�� 
FROM customer;

-- ���� �߿��� �ִ밡��, �������� �˱�
SELECT MAX(price) �ְ���, MIN(price) ��������
FROM book;

select * from customer;

-- '3�� ��(�Ȼ�)'�� �ֹ��� ������ �� �Ǹž� ���ϱ�
select sum(saleprice) as ���Ǹž�
from orders
where custid = 3;

-- ����(Join)
-- ��������(EQUI JOIN) : equal(=)�� ����ϴ� ����
-- ���̺�A.Į���� = ���̺�B.Į���� (Į�� - �⺻Ű�� �ܷ�Ű)
-- ���� �̸��� ���� �ֹ��� �ֹ������� �˻��Ͻÿ�(customer, orders ����)
SELECT customer.name, orders.saleprice
FROM customer, orders
WHERE customer.custid = orders.custid;

-- 3�� ���� ���̵�� �����̸��� �ֹ� ������ �˻�
select custid, bookname, saleprice
from orders, book
where orders.bookid = book.bookid
    and orders.custid = 3;
    
-- ��Ī ��� ����
-- �� �̸��� ����(��������), �ֹ� ���ݺ� ��������
select cus.name, ord.saleprice
from customer cus, orders ord
where cus.custid = ord.custid
order by cus.name, ord.saleprice desc;


