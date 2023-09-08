#1. Создать процедуру, в которой мы получаем на вход два параметра p_salary, p_dept и на выходе получим:
#- Список сотрудников (emp_no, first_name, gender), у которых средняя зарплата больше p_salary и которые когда-то работали в департаменте p_dept.

select * from dept_emp;

delimiter $$

create procedure GetEmployeesBySalaryandDept(in p_salary decimal(10,2), in p_dept int)
Begin
select a.emp_no, a.first_name, a.gender from employees a join salaries b on a.emp_no = b.emp_no
join dept_emp c on a.emp_no = c.emp_no where c.dept_no = p_dept group by a.emp_no, a.first_name, a.gender having avg(b.salary) > p_salary;
end;

$$
delimiter ;

#2. Создать функцию, которая получает на вход f_name и выдает максимальную зарплату среди сотрудников с именем f_name.

DELIMITER //

CREATE FUNCTION GetMaxSalaryByFirstName(f_name VARCHAR(255)) RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE max_salary DECIMAL(10, 2);
    SELECT MAX(s.salary) INTO max_salary
    FROM employees a
    JOIN salaries b ON a.emp_no = b.emp_no
    WHERE a.first_name = f_name;
    RETURN max_salary;
END;
//

DELIMITER ;

#1. Посчитайте количество городов в каждой стране, где IndepYear = 1991 (Independence Year).
select * from city;
select * from country;
select * from countrylanguage;

select a.name as NameCountry, count(b.CountryCode) as Num_City from country a join city b on b.CountryCode = a.Code where a.IndepYear = 1991 group by NameCountry;

#2. Узнайте, какая численность населения и средняя продолжительность жизни людей в Аргентине (ARG).

select b.code as NameCity, Population , b.LifeExpectancy from country b where b.Code = 'ARG' ;

#3. В какой стране самая высокая продолжительность жизни?

select Name from country order by LifeExpectancy desc limit 1;

#4. Перечислите все языки, на которых говорят в регионе «Southeast Asia».

select a.Language from countrylanguage a join country b on a.CountryCode = b.Code where b.Region = 'Southeast Asia';

#5. Посчитайте сумму SurfaceArea для каждого континента.

select Continent, sum(SurfaceArea) as Sum from country group by Continent;
