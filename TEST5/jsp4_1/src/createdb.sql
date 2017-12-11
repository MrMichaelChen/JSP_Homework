create database student
go
use student
create table userinfo /* 学生表 */
(Userid char(20) primary key,
Username char(20) unique,
Userpasswd char(20),
Userrole char(20),
);

create table classes /* 软件班级信息表 */
(Usernumber char(20) primary key,
Username char(40) not null, /* 列级完整性约束条件 Cname不能取空值 */
Userage smallint,
Usersex char(20),
Foreign key(Usernumber) references userinfo(Userid) /* Cpno 是外码,被参照表是Course, 被参照列是Cno */
);

create table course /* 课程表 */
(Coursenumber char(20) primary key,
Coursename char(40) not null, /* 列级完整性约束条件 Coursename不能取空值 */
TeacherID char(20),
Foreign key(TeacherID) references userinfo(Userid) /* Cpno 是外码,被参照表是Course, 被参照列是Cno */
);

create table choose_course /* 选课信息表 */
(Studentnumber char(20) not null,
choose_courseid char(20) not null, /* 列级完整性约束条件 Coursename不能取空值 */
course_grade char(20),
primary key(Studentnumber,choose_courseid),
Foreign key(choose_courseid) references course(Coursenumber), /* Cpno 是外码,被参照表是Course, 被参照列是Cno */
Foreign key(Studentnumber) references userinfo(Userid)
);

insert into userinfo values ('2015001', '王雪涛', '123456', 'teacher');
insert into userinfo values ('2015009', '郑丽萍', '123456', 'teacher');
insert into userinfo values ('2015010', '刘於勋', '123456', 'teacher');
insert into userinfo values ('2015011', '于景新', '123456', 'teacher');
insert into userinfo values ('2015002', '陈德玺', '123456', 'admin');
insert into userinfo values ('2015003', '柏灵筠', '123456', 'admin');
insert into userinfo values ('2015004', '马超', '123456', 'student');
insert into userinfo values ('2015005', '黄忠', '123456', 'student');
insert into userinfo values ('2015006', '张飞', '123456', 'student');
insert into userinfo values ('2015007', '赵云', '123456', 'student');
insert into userinfo values ('2015008', '关羽', '123456', 'student');

insert into classes values ('2015001', '王雪涛', '22', 'man');
insert into classes values ('2015004', '马超', '22', 'man');
insert into classes values ('2015005', '黄忠', '22', 'man');
insert into classes values ('2015006', '张飞', '22', 'man');
insert into classes values ('2015007', '赵云', '22', 'man');
insert into classes values ('2015008', '关羽', '22', 'man');

insert into course values ('001', 'java', '2015009');
insert into course values ('002', 'os', '2015010');
insert into course values ('003', 'math', '2015011');
insert into course values ('004', 'test', '2015001');

insert into choose_course values ('2015004', '001', '100');
insert into choose_course values ('2015004', '002', '100');
insert into choose_course values ('2015005', '003', '100');
insert into choose_course values ('2015005', '004', '100');