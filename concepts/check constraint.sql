create table t1(
ID int not null,
name varchar(100) not null,
age int check (age > 18)
);

insert into t1
values (2, 'dawood', 12)

create table t2(
ID int not null,
name varchar(100) not null,
age int,
constraint ch_age check (age > 20)
);

insert into t2
values (1, 'dawood', 1)

select * from t2;

alter table t2
drop constraint ch_age;