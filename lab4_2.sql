
--  a) For each department, find the average salary of instructors in that
-- department and list them in ascending order. Assume that every
-- department has at least one instructor;
select avg(salary) as avg_sal, dept_name from instructor group by (dept_name) order by avg(salary) ;



--  b) Find the building where the biggest number of courses takes place;
select count(course_id) , building from section group by building order by count(course_id);
select count(course_id) , building from section group by building order by count(course_id) desc limit 1;



--  c) Find the department with the lowest number of courses offered;
select count(course_id), dept_name from course group by dept_name;
select count(course_id), dept_name from course group by dept_name order by count(course_id) asc limit 1;




--  d) Find the ID and name of each student who has taken more than 3 courses  from the Computer Science department;
select id, name, dept_name
from student
where id in (select id
             from takes
             where left(course_id, 2) = 'CS'
             group by (id)
             having count(1) > 3);

select  id
             from takes
             where left(course_id, 2) = 'CS'
             group by (id);


--  e) Find all instructors who work either in Biology, Philosophy, or Music departments;
select *
from instructor
where dept_name in ('Biology', 'Philosophy', 'Music')




--  f) Find all instructors who taught in the 2018 year but not in the 2017 year;
select *
from instructor
where id in (select id
             from teaches t
             where id not in (select id
                              from teaches
                              where year = 2017)
               and t.year = 2018);


select distinct course_id from takes where course_id like 'CS%'