
--   a) Find all courses worth more than 3 credits;
select * from course where credits>3;



--  b) Find all classrooms situated either in ‘Watson’ or ‘Packard’ buildings;
select * from classroom where building = 'Watson' or building = 'Packard';



--  c) Find all courses offered by the Computer Science department;
select * from course where dept_name = 'Comp. Sci.';



--  d) Find all courses offered during fall;
select s.course_id, title, dept_name, credits
from course join section s
on course.course_id = s.course_id where semester = 'Fall';
select *
from course
where course_id in (select course_id from section where semester = 'Fall');



--  e) Find all students who have more than 45 credits but less than 90;
select * from student where tot_cred>45 and tot_cred<90;
select * from student where  tot_cred between 45 and 90;



--  f) Find all students whose names end with vowels;
select * from student where right(name, 1) in ('a', 'e', 'i', 'o', 'u');



--  g) Find all courses which have course ‘CS-101’ as their prerequisite;
select course.course_id, title, dept_name, p.prereq_id
from course join prereq p
on course.course_id = p.course_id where p.prereq_id = 'CS-101';
select *
from course
where course_id in (select course_id from prereq where prereq_id = 'CS-101');


