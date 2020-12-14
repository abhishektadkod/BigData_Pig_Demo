student_details = LOAD '/root/Desktop/BIGDATA/students' USING PigStorage(',')
as (id:int, firstname:chararray, lastname:chararray, age:int, phone:chararray, city:chararray, gpa:int);
student_group_all = Group student_details All;
student_gpa_max = foreach student_group_all  Generate
(student_details.firstname, student_details.gpa), MAX(student_details.gpa);
Dump student_gpa_max;