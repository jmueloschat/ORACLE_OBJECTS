create table employee
(id number(10) not null,
 name varchar2(50),
 lastName varchar2(50),
 dateBirth Date,
 salary number(17,2)
);

create table employee2
(id number(10) not null,
 name varchar2(50),
 lastName varchar2(50),
 dateBirth Date,
 salary number(17,2)
);

create unique index ind_employee_id on employee (id);
alter table employee add constraint pk_employee_id primary key (id) using index ind_employee_id;
create sequence employee_id;

insert into employee(id,name,lastName,Datebirth,salary) values (employee_id.nextval, 'Max','Smith',to_date('01/01/1980','dd/mm/rrrr'), 3500);
commit;
insert into employee(id,name,lastName,Datebirth,salary) values (employee_id.nextval, 'Ayrton','Senna',to_date('03/10/1962','dd/mm/rrrr'), 700);
commit;
insert into employee(id,name,lastName,Datebirth,salary) values (employee_id.nextval, 'Steve','Goodman',to_date('20/02/1957','dd/mm/rrrr'), 1500);
commit;

create table employee3 as select * from employee;

select * from employee;
select * from employee where id =2;
update employee set salary = salary *1.02 where id = 3;
delete from employee where id =20;
delete from employee where Datebirth between to_date('03/10/1980','dd/mm/rrrr') and to_date('03/10/1922','dd/mm/rrrr');
select PKGEMP001.FNC_CALC_TAXSAL(2)from dual;

merge into employee2 nn using (select * from employee x where x.salary > 3000) oo on (nn.id = oo.id)
  when matched then 
    update set nn.salary = salary
  when not matched then
    insert (id,name,lastName,dateBirth, salary) values(oo.id,oo.name,oo.lastName,oo.dateBirth, oo.salary);
     
select * from employee2;     
