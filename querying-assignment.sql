# 1. Print out all the student first names and last names. (1pt)
SELECT first_name, last_name FROM student;

# 2. Print out the IDs of all the tenured instructors. (1pt)
SELECT instructor_id FROM instructor WHERE tenured = 1;

# 3. Print out the student first and last names along with their advisor's first and last names. Make sure to alias descriptive column names. 
#Leave out any students without advisors and any advisors without students. (1pt)
SELECT student.first_name std_first_name, 
student.last_name std_last_name, 
instructor.first_name adv_first_name, 
instructor.last_name adv_last_name
FROM student, instructor
WHERE student.advisor_id = instructor.instructor_id;

# 4. Print out the ID, first name, and last name of all instructors who do not have any advisees 
#(HINT: Lookup the different join types in MySQL and use "IS NULL" instead of "= NULL"). (1pt)
SELECT instructor.instructor_id, instructor.first_name, instructor.last_name 
FROM instructor
LEFT JOIN student ON instructor.instructor_id = student.advisor_id
WHERE student.student_id IS NULL;

# 5. Print out the first and last name of all the instructors along with the total number of credit hours they teach. (1pt)
SELECT i.first_name, i.last_name, SUM(c.num_credits) AS num_credits
FROM instructor i, course c
WHERE i.instructor_id = c.instructor_id
GROUP BY i.instructor_id, first_name, last_name;

# 6. Print out the course code and course name of all 3000 level courses (HINT: Lookup the SQL LIKE operator). (1pt)
SELECT course_code, course_name
FROM course
WHERE course_code LIKE '%3___';

# 7. Print out the course schedule of the student with an ID of 1 by printing off the course code, instructor first name, instructor last name, 
# and number of credit hours for each course in which student 1 is enrolled. (3pts)
SELECT course_code, first_name, last_name, SUM(num_credits) AS num_credits
FROM course c, student_schedule s, instructor i
WHERE c.course_id = s.course_id AND c.instructor_id = i.instructor_id AND student_id = 1
GROUP BY course_code, first_name, last_name;

SELECT * FROM instructor;
SELECT * FROM student;
SELECT * FROM course;