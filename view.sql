create or replace force view vw_employee as
select * from employee
where dateBirth is not null
