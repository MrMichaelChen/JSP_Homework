create database student
go
use student
create table userinfo /* ѧ���� */
(Userid char(20) primary key,
Username char(20) unique,
Userpasswd char(20),
Userrole char(20),
);

create table classes /* ����༶��Ϣ�� */
(Usernumber char(20) primary key,
Username char(40) not null, /* �м�������Լ������ Cname����ȡ��ֵ */
Userage smallint,
Usersex char(20),
Foreign key(Usernumber) references userinfo(Userid) /* Cpno ������,�����ձ���Course, ����������Cno */
);

create table course /* �γ̱� */
(Coursenumber char(20) primary key,
Coursename char(40) not null, /* �м�������Լ������ Coursename����ȡ��ֵ */
TeacherID char(20),
Foreign key(TeacherID) references userinfo(Userid) /* Cpno ������,�����ձ���Course, ����������Cno */
);

create table choose_course /* ѡ����Ϣ�� */
(Studentnumber char(20) not null,
choose_courseid char(20) not null, /* �м�������Լ������ Coursename����ȡ��ֵ */
course_grade char(20),
primary key(Studentnumber,choose_courseid),
Foreign key(choose_courseid) references course(Coursenumber), /* Cpno ������,�����ձ���Course, ����������Cno */
Foreign key(Studentnumber) references userinfo(Userid)
);

insert into userinfo values ('2015001', '��ѩ��', '123456', 'teacher');
insert into userinfo values ('2015009', '֣��Ƽ', '123456', 'teacher');
insert into userinfo values ('2015010', '���ѫ', '123456', 'teacher');
insert into userinfo values ('2015011', '�ھ���', '123456', 'teacher');
insert into userinfo values ('2015002', '�µ���', '123456', 'admin');
insert into userinfo values ('2015003', '������', '123456', 'admin');
insert into userinfo values ('2015004', '��', '123456', 'student');
insert into userinfo values ('2015005', '����', '123456', 'student');
insert into userinfo values ('2015006', '�ŷ�', '123456', 'student');
insert into userinfo values ('2015007', '����', '123456', 'student');
insert into userinfo values ('2015008', '����', '123456', 'student');

insert into classes values ('2015001', '��ѩ��', '22', 'man');
insert into classes values ('2015004', '��', '22', 'man');
insert into classes values ('2015005', '����', '22', 'man');
insert into classes values ('2015006', '�ŷ�', '22', 'man');
insert into classes values ('2015007', '����', '22', 'man');
insert into classes values ('2015008', '����', '22', 'man');

insert into course values ('001', 'java', '2015009');
insert into course values ('002', 'os', '2015010');
insert into course values ('003', 'math', '2015011');
insert into course values ('004', 'test', '2015001');

insert into choose_course values ('2015004', '001', '100');
insert into choose_course values ('2015004', '002', '100');
insert into choose_course values ('2015005', '003', '100');
insert into choose_course values ('2015005', '004', '100');