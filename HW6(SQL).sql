#1. Выведите список всех менеджеров, а именно их emp_no, 
#имена/фамилии, номер департамента, который они курируют, и дату найма в компанию. (именно менеджером, то есть подсказка dept_manager)
select * from dept_manager;
SELECT * FROM employees;
select * from titles;

SELECT 
    a.emp_no, a.first_name, a.last_name, b.from_date, b.to_date
FROM
    employees a
        JOIN
    dept_manager b ON a.emp_no = b.emp_no;

#2. Существует ли сотрудник по фамилии Markovitch, который когда-то был менеджером департамента. 
#Может быть таких сотрудников несколько? (именно менеджером, то есть подсказка dept_manager)
SELECT 
    a.emp_no, b.dept_no, a.first_name, a.last_name
FROM
    employees a
        JOIN
    dept_manager b ON a.emp_no = b.emp_no
    where a.last_name like '%Markovitch%';


#3. Вывести список сотрудников, имена/фамилии, дату найма, должность в компании, у которых имя начинается на М, а фамилия заканчивается на H.
SELECT 
    c.emp_no,
    a.first_name,
    a.last_name,
    c.title,
    c.from_date,
    c.to_date
FROM
    employees a
        RIGHT JOIN
    titles c ON a.emp_no = c.emp_no
WHERE
    first_name LIKE 'M%'
        AND last_name LIKE 'H%';

#4. Создайте временную таблицу на основе salaries, где у вас будет emp_no и его/ее максимальная 
#и минимальная зарплата за весь период работы в компании. 
#Далее сделайте JOIN используя эту временную таблицу и таблицу employees чтобы получить список сотрудников, их имена/фамилии, и их мин/макс зарплат.

SELECT 
    *
FROM
    salaries;

create temporary table salaries;
SELECT 
    emp_no, MAX(salary) AS MAX, MIN(salary) AS MIN
FROM
    salaries
GROUP BY emp_no;

SELECT 
    b.first_name, b.last_name, a.MAX, a.MIN
FROM
    salaries a
        JOIN
    employees b ON a.emp_no = b.emp_no;




select * from  salaries join employees on salaries.emp_no = employees.emp_no;

