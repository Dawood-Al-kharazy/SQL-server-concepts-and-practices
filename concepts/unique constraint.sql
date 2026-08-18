---     unique constraint    ---

create table t3(
ID int unique,
Name varchar(100),
Age int);

create table t4(
ID int,
Name varchar(100),
Age int,
constraint Unq_ID unique (ID)
);

insert into t4
values(
4, 'dawood', 12);

alter table t4
add unique (name);

alter table t4
add constraint uni_name unique (name)

---    new example    ---
create table t5(
ID int,
Name varchar(29),
Age int);


alter table t5
add unique (id);

alter table t5
add constraint uni_name unique (name);

alter table t5
drop constraint uni_name;
