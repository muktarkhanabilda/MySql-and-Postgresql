#1. Вывести всю информацию из таблицы employees
select * from employees;

#2. Вывести всех мужчин из таблицы employees
select concat(first_name, ' ' , last_name) as full_name_all_man, gender from employees where gender = 'M';
select * from employees where gender = 'M';

#3. Вывести всех сотрудников по имени Elvis
select * from employees where first_name = 'Elvis';

#4. Вывести уникальные/различные названия должностей (поищите в базе данных, посмотрите в какой таблице хранится эта информация)
select distinct title from titles;

#5. Вывести всех сотрудников, кто был трудоустроен в 2000 году (подсказка: столбец hire_date)
select * from employees where hire_date like '%2000%';

#6. Вывести всех сотрудников, кому больше 60 лет на данный момент (т.е. используем Curdate)
select * from employees where curdate() - hire_date < 60;

#7. Вывести количество строк в таблице salaries
select count(*) from salaries;

#8. Вывести количество строк в таблице salaries, где зарплата > 100.000$
select count(salary) from salaries where salary > 100000;
