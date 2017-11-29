create database student
go
use student
create table userinfo /* 学生表 */
(Userid char(20) primary key,
Username char(20) unique,
Userpasswd char(20),
Userrole char(20),
);

create table rj1502 /* 课程表 */
(Usernumber char(20) primary key,
Username char(40) not null, /* 列级完整性约束条件 Cname不能取空值 */
Userage smallint,
Usersex char(20),
Foreign key(Usernumber) references userinfo(Userid) /* Cpno 是外码,被参照表是Course, 被参照列是Cno */
);

insert into userinfo values ('2015001', '王雪涛', '123456', 'admin');
insert into userinfo values ('2015002', '陈德玺', '123456', 'admin');
insert into userinfo values ('2015003', '柏灵筠', '123456', 'admin');
insert into userinfo values ('2015004', '马超', '123456', 'user');
insert into userinfo values ('2015005', '黄忠', '123456', 'user');
insert into userinfo values ('2015006', '张飞', '123456', 'user');
insert into userinfo values ('2015007', '赵云', '123456', 'user');
insert into userinfo values ('2015008', '关羽', '123456', 'user');


insert into rj1502 values ('2015001', '王雪涛', '22', 'man');
insert into rj1502 values ('2015002', '陈德玺', '22', 'man');
insert into rj1502 values ('2015003', '柏灵筠', '22', 'girl');
insert into rj1502 values ('2015004', '马超', '22', 'man');
insert into rj1502 values ('2015005', '黄忠', '22', 'man');
insert into rj1502 values ('2015006', '张飞', '22', 'man');
insert into rj1502 values ('2015007', '赵云', '22', 'man');
insert into rj1502 values ('2015008', '关羽', '22', 'man');