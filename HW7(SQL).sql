#1. Найдите количество сотрудников мужского пола (M) и женского пола (F) и выведите записи в порядке убывания по количеству сотрудников.
select gender, count(*) as count from employees group by gender order by count desc;

#2. Найдите среднюю зарплату в разрезе должностей сотрудников (title), округлите эти средние зарплаты до 2 знаков после запятой и выведите записи в порядке убывания.
select a.title, round(avg(b.salary), 2) as avg_salary from titles a join salaries b on a.emp_no = b.emp_no group by a.title order by avg_salary desc;

#3. Найдите всех сотрудников, которые работали как минимум в 2 департаментах. Вывести их имя, фамилию и количество департаментов, в которых они работали. Показать записи в порядке возрастания.
select a.first_name, a.last_name, count(distinct b.dept_no) as num_departments from employees a join dept_emp b on a.emp_no = b.emp_no group by a.first_name, a.last_name having num_departments >= 2 order by num_departments;

#4. Вывести имя, фамилию и зарплату самого высокооплачиваемого сотрудника.
select a.first_name, a.last_name, b.salary from employees a join salaries b on a.emp_no = b.emp_no order by b.salary desc limit 1;

#5. Вывести месяцы (от 1 до 12), и количество нанятых сотрудников в эти месяцы.
select extract(month from hire_date) as hire_month , count(*) as num_employees from employees group by hire_month order by hire_month;

#6. Создайте VIEW на базе 1-го запроса.
create view num_gender as
select gender, count(*) as count from employees group by gender order by count desc;

select * from num_gender;


