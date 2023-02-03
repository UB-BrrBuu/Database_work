CREATE TABLE employees(

    employee_id serial PRIMARY KEY,
    name text NOT NULL,
    job text NOT NULL,
    salary int NOT NULL
);

INSET INTO employees(name, job, salary)
VALUES('John', 'teller', 25000),
('Jane', 'teller', 26000),
('Johnny', 'teller', 60000),
('Joe', 'teller', 24000),
('Jenny', 'teller', 28000)
;

SELECT name 
FROM employees
ORDER BY name DESC;