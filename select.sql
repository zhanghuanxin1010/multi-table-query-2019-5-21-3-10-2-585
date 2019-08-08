# 1.查询同时存在1课程和2课程的情况
   select*from  course c inner join student_course s  on c.id=s.courseId where c.id='1'or c.id='2'
# 2.查询同时存在1课程和2课程的情况
  select*from  course c inner join student_course s  on c.id=s.courseId where c.id='1'or c.id='2'
# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
        select s.id,s.name,t.a from student s, (select studentID,avg(score) as a from student_course group by studentID)as t where s.id=t.studentID  and t.a>='60';
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
      select * from (select *from  student st left join student_course s on st.id=s.studentId) as i where score is null
# 5.查询所有有成绩的SQL
   select * from (select *from  student st left join student_course s on st.id=s.studentId) as i where score is  not null
# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
     select *from (select st.id ,st.name,st.age,sc.courseId from student st left join  student_course sc on st.id=sc.studentId left join course co  on sc.courseId=co.id) as a where courseId='1'or courseId='2'
# 7.检索1课程分数小于60，按分数降序排列的学生信息
     select st.*,sc.courseId,sc.score from student st left join  student_course sc on st.id=sc.studentId left join course co  on sc.courseId=co.id where courseId='1' and score<'60' order by score desc
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
       select courseId ,avg(score)as a from student_course  group by (courseId) order by a desc,courseId 
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
     select st.name,sc.score from student st left join  student_course sc on st.id=sc.studentId left join course co  on sc.courseId=co.id where co.name="数学" and score<'60' 
