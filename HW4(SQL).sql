#1. Найти всех женщин, у которых emp_no заканчивается на 7
select * from employees where emp_no like '%7' and gender = 'F';

#2. Вывести все emp_no сотрудников, кто не работал в департаменте d005 (таблица dept_emp)
 select emp_no from dept_emp where dept_no <> 'd005';

select * from dept_emp;

#3. Вывести все названия департаментов, где есть буквы ‘u’ и ‘o’
select * from departments where dept_name like '%u%o%';
#select * from departments where dept_name like '%u%' or '%o%';

#4. Вывести имена всех сотрудников, где есть либо ‘z’ либо ‘t’
select first_name from employees where first_name like '%z%' or '%t%';

#5. Вывести все фамилии сотрудников, которые были наняты на работу между ‘1993-01-15’ и ‘1993-12-31’
select last_name from employees where hire_date between '1993-01-15' and '1993-12-31';

#6. Получить список со всеми сотрудницами, чье имя Kellie
select concat(first_name, ' ', last_name ) as full_name from employees where first_name = 'Kellie' and gender = 'F';

#7. Получить список со всеми сотрудницами, чье имя Kellie или Aruna
select concat(first_name, ' ', last_name ) as full_name from employees where first_name = 'Kellie' or first_name = 'Aruna' and gender = 'F';

#8. Выбрать всю информацию из таблицы salaries где зарплаты между 66 000 и 70 000 долларов
select * from salaries where salary between 66000 and 70000;