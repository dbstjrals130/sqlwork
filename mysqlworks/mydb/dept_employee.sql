-- 부서, 사원 테이블 생성
CREATE table department(
	deptid		int primary key,
    deptname	varchar(30) not null,
    location	varchar(20) not null
);

INSERT INTO department VALUES (10, '개발팀', '서울');
INSERT INTO department VALUES (20, '디자인팀', '부천');

CREATE table employee(
	empid		int primary key,
    empname		varchar(30) not null,
    age			int not null,
    sal			int,
    deptid		int not null,
    FOREIGN KEY(deptid) references department(deptid)
);

INSERT INTO employee values (101, '한강', 27, 2100000, 10);
INSERT INTO employee values (102, '백두산', 32, 3200000, 20);
INSERT INTO employee values (103, '오과장', 45, 5500000, 10);
INSERT INTO employee values (104, '김대리', 38, 4300000, 10);
INSERT INTO employee values (105, '양신입', 25, null, 10);

SELECT * FROM department;
SELECT * FROM employee;
COMMIT;