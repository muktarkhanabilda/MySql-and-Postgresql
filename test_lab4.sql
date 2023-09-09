--1
--a
select *
from course
where credits > 3;

--b
select *
from classroom
where building = 'Watson'
   or building = 'Packard';

--c
select *
from course
where dept_name = 'Comp. Sci.';

--d
select *
from course
where course_id in (select course_id from section where semester = 'Fall');

--e
select *
from student
where tot_cred > 45
  and tot_cred < 90;

--f
select *
from student
where right(name, 1) in ('a', 'e', 'u', 'o', 'i');

--g
select *
from course
where course_id in (select course_id from prereq where prereq_id = 'CS-101');


--2
--a
select dept_name, avg(salary)
from instructor
group by (dept_name)
order by avg(salary) asc;

--b
select building, count(course_id)
from section
group by building
order by count(course_id) desc limit 1;

--c
select dept_name, count(course_id)
from course
group by (dept_name) limit 1;

--d
select id, name
from student where id in(select id
                         from takes
                         where left(course_id, 2)='CS' group by id having count(1)>3);

--e
select *
from instructor
where dept_name='Music' or dept_name = 'Biology' or dept_name = 'Philosophy';

--f
select *
from instructor
where id in(select id
            from teaches
            where id not in(select  id from  teaches t where t.year = 2017)
            and year = 2018);

--3
--a
select *
from student
where id in(select id
            from takes
            where grade in ('A', 'A-'))
and dept_name = 'Comp. Sci.'
order by (name);

--b
select *
from advisor
where s_id in (select  id
               from takes
               where grade not in ('A', 'A-', 'B', 'B+'));

--c
select *
from  department
where dept_name in (select  dept_name
                    from student
                    where id in (select id
                                 from takes
                                 where grade not in ('C', 'F')));

--d
select *
from instructor
where id not in (select id
             from takes
             where grade in ('A'));

select *
from course
where course_id in (select course_id
                    from section
                    where time_slot_id in (select  time_slot_id
                                           from time_slot
                                           where end_hr <13));