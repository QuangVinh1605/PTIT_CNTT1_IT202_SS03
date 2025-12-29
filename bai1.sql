-- create database csdl03;
use csdl03;
SET FOREIGN_KEY_CHECKS = 0;
drop table if exists student;
create table student(
student_id int primary key not null,
full_name varchar(50) not null ,
date_of_birth date,
email varchar(50) unique
);

insert into student (student_id,full_name,date_of_birth,email)
values (1,'nguyen quang vinh','2006/05/16','vinh187987987@gmail.com'),
       (2,'hoang van luong','2006/06/01','luong2@gmail.com'),
       (3,'hoang cuong cat','2006/06/01','catngu@gmail.com'),
       (4,'pham viet quan','2005/06/12','quanhoho@gmail.com'),
       (5,'nguyen son minh','2005/06/12','minhhoho@gmail.com')
       ;
       SET SQL_SAFE_UPDATES = 0;
select* from student;
select student_id,full_name from student;
update student set email= 'luong123456789@gmail.com' where student_id=2;
update student set date_of_birth='2006/05/03' where student_id=3;
delete from student where student_id=5;

drop table if exists subject;
create table subject(
subject_id int primary key,
subject_name varchar(50),
credit int check(credit>0) 
);
insert into subject(subject_id,subject_name,credit) 
values(1,'co so du lieu',3),
(2,'cau truc du lieu va giai thuat',2),
(3,'lap trinh python',4),
(4,'lap trinh java',3),
(5,'lap trinh js',3);

update subject set credit=10 where subject_id=4;
update subject set subject_name='lap trinh co ban c' where subject_id=4;
select* from subject;

drop table if exists enrollment;
create table enrollment(
student_id int,
subject_id int,
enroll_date date,
primary key(student_id,subject_id),
foreign key(student_id) references student(student_id),
foreign key(subject_id) references subject(subject_id)
);
insert into enrollment (student_id,subject_id,enroll_date)
values(1,1,'2025/02/02'),
(2,3,'2025/01/03'),
(1,4,'2025/02/02');

select *from enrollment;
select *from enrollment where student_id=3;
drop table if exists score;
create table score(
student_id int,
subject_id int,
mid_score decimal(4,2) check (mid_score<=10 and mid_score>=0),
final_score decimal(4,2) check (final_score<=10 and final_score>=0),
primary key (student_id,subject_id),
foreign key (student_id) references student(student_id),
foreign key(subject_id)references subject(subject_id)
);

insert into score (student_id,subject_id,mid_score,final_score)
values(1,3,10,7),
(2,4,9,8.5),
(3,4,4.5,8.5);

update score set final_score=4.5 where student_id=2;
select*from score;
select*from score where final_score>=8;


/* bai tap tong hop */
insert into student(student_id,full_name,date_of_birth,email)values(6,'pham tuan binh','2000/05/19','thaybinh@gmail.com');
insert into enrollment(student_id,subject_id,enroll_date)values(6,3,'2025/05/23'),(6,4,'2025/09/24');
insert into score(student_id,subject_id,final_score)values(6,3,1.78);
update score set final_score=10 where student_id=6;
delete from enrollment where student_id=2;


