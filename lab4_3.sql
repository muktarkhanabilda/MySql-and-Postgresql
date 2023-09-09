
--  a) Find all students who have taken Comp. Sci. course and got an excellent
-- grade (i.e., A, or A-) and sort them alphabetically;
select *
from student
where id in (select distinct id
             from takes
             where grade in ('A', 'A-'))
order by name;



--  b) Find all advisors of students who got grades lower than B on any class;

select * from student where ID in(
    select s_id
    from advisor
        where s_id in (select distinct id
               from takes
               where grade not in ('B+','A', 'A-'))
    );

select *
from advisor
where s_id in (select distinct id
               from takes
               where grade not in ('B+','A', 'A-'));



--  c) Find all departments whose students have never gotten an F or C grade;
select *
from department
where dept_name not in
      (select dept_name from course where course_id in (select course_id from takes where grade in ('F', 'C')));



--  d) Find all instructors who have never given an A grade in any of the courses they taught;
select *
from instructor
where id not in (select distinct id
                 from takes
                 where grade in ('A', 'A-'));



--  e) Find all courses offered in the morning hours (i.e., courses ending before 13:00);
select *
from course
where course_id in (select distinct course_id
                    from section
                    where time_slot_id in (select time_slot_id from time_slot where end_hr < 13));