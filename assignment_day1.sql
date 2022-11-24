use day1;
select * from worker;
select * from bonus;
select * from title;

select first_name as worker_name from worker; #1
select upper(first_name) from worker; #2
select distinct department from worker; #3
select substring(first_name, 1, 3) from worker; #4
select position("a" in first_name) from worker where first_name='amitabh'; #5
select rtrim(first_name) from worker; #6
select ltrim(department) from worker; #7
select distinct department, length(department) from worker; #8
select replace(first_name, 'a', 'A') from worker; #9 
select concat(first_name, ' ', last_name) as complete_name from worker; #10
select * from worker order by first_name; #11
select * from worker order by first_name, department desc; #12
select * from worker where first_name in('satish', 'vipul'); #13
select * from worker where first_name not in('satish', 'vipul'); #14
select * from worker where department='admin'; #15
select * from worker where first_name like '%a%'; #16
select * from worker where first_name like '%a'; #17
select * from worker where first_name like '-----h'; #18
select * from worker where salary between 100000 and 500000; #19
select * from worker where year(joining_date)=2014 and month(joining_date)=2; #20
select count(*) from worker where department='admin'; #21
select concat(first_name, ' ', last_name) as worker_name, salary from worker where worker_id in 
	(select worker_id from worker where salary between 50000 and 100000); #22
select count(worker_id), department from worker group by department order by worker_id desc; #23
select distinct w.first_name, t.worker_title from worker w 
	inner join title t on w.worker_id=t.worker_ref_id and t.worker_title in('manager'); #24
select worker_title, affected_from, count(*) from title
	group by worker_title, affected_from having count(*) > 1; #25
select * from worker where mod(worker_id, 2)<>0; #26
select * from worker where mod(worker_id, 2)=0; #27
create table worker_clone like worker; #28
select * from worker_clone;
select * from worker join bonus on worker.worker_id=bonus.worker_ref_id; #29
select * from worker where worker_id not in (select worker_ref_id from bonus); #30