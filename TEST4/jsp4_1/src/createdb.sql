create database student
go
use student
create table userinfo /* ѧ���� */
(Userid char(20) primary key,
Username char(20) unique,
Userpasswd char(20),
Userrole char(20),
);

create table rj1502 /* �γ̱� */
(Usernumber char(20) primary key,
Username char(40) not null, /* �м�������Լ������ Cname����ȡ��ֵ */
Userage smallint,
Usersex char(20),
Foreign key(Usernumber) references userinfo(Userid) /* Cpno ������,�����ձ���Course, ����������Cno */
);

insert into userinfo values ('2015001', '��ѩ��', '123456', 'admin');
insert into userinfo values ('2015002', '�µ���', '123456', 'admin');
insert into userinfo values ('2015003', '������', '123456', 'admin');
insert into userinfo values ('2015004', '��', '123456', 'user');
insert into userinfo values ('2015005', '����', '123456', 'user');
insert into userinfo values ('2015006', '�ŷ�', '123456', 'user');
insert into userinfo values ('2015007', '����', '123456', 'user');
insert into userinfo values ('2015008', '����', '123456', 'user');


insert into rj1502 values ('2015001', '��ѩ��', '22', 'man');
insert into rj1502 values ('2015002', '�µ���', '22', 'man');
insert into rj1502 values ('2015003', '������', '22', 'girl');
insert into rj1502 values ('2015004', '��', '22', 'man');
insert into rj1502 values ('2015005', '����', '22', 'man');
insert into rj1502 values ('2015006', '�ŷ�', '22', 'man');
insert into rj1502 values ('2015007', '����', '22', 'man');
insert into rj1502 values ('2015008', '����', '22', 'man');