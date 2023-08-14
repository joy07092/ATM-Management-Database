--inserting values in tables

INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(111122, 'sonali', date '2022-01-31');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(111123, 'sonali', date '2022-02-26');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(111124, 'sonali', date '2022-03-21');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(211122, 'islami', date '2022-07-30');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(211123, 'islami', date '2022-12-1');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(211124, 'islami', date '2022-11-10');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(311122, 'brac', date '2022-09-26');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(411122, 'pubali', date '2022-01-31');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(411123, 'pubali', date '2022-01-31');
INSERT INTO atm_card(card_id, bank_name, expiry) VALUES(411124, 'pubali', date '2022-01-31');

INSERT INTO atm_machine(machine_id, machine_area) VALUES(1,'FULBARI');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(2,'FULBARI');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(3,'FULBARI');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(4,'daulatpur');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(5,'daulatpur');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(6,'daulatpur');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(7,'boyra');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(8,'boyra');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(9,'boyra');
INSERT INTO atm_machine(machine_id, machine_area) VALUES(10,'new_market');

INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(121212, 'rahim', 10000, 111122, 12345);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(121213, 'karim', 20000, 111123, 12435);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(121214, 'rahim', 30000, 111124, 12354);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(212112, 'hridoy', 50000, 211122, 12045);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(212113, 'bijoy', 60000, 211123, 12015);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(212114, 'antor', 70000, 211124, 12015);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(313113, 'joy', 80000, 311122, 11015);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(414113, 'nihal', 60000, 411122, 19015);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(414114, 'ashfaq', 65000, 411123, 29015);
INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(414115, 'irham', 75000, 411124, 99015);

INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(111122, 1, 500, date '2022-01-31');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(111122, 1, 1000, date '2022-02-1');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(311122, 10, 900, date '2022-03-11');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(411122, 7, 1200, date '2022-04-10');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(411123, 9, 1500, date '2022-09-17');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(411122, 8, 2200, date '2022-04-10');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(211123, 5, 4200, date '2022-01-10');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(211122, 2, 5200, date '2022-12-10');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(111123, 2, 5300, date '2022-11-10');
INSERT INTO transac(card_id, machine_id, transac_amount, transac_date) VALUES(411123, 10, 10000, date '2022-09-7');

--displaying table data using select command

--atm cards info of sonali bank

select * from atm_card where bank_name='sonali';

--updating the data in table

--changing the name of customer with a specified account number

update customer set user_name='XXX' where acc_no = 121212;    

update customer set user_name='rahim' where acc_no = 121212;

--deleting row from table

--deleting customer with a specified account number

delete from customer where acc_no=121212;            

INSERT INTO customer(acc_no, user_name, user_balance, card_id, card_pin) VALUES(121212, 'rahim', 10000, 111122, 12345);

--union

--finding name of the banks that has 's' in the beginning or 'r' in the name

select bank_name from atm_card where bank_name like 's%' union select bank_name from atm_card where bank_name like '%r%'; 

--intersect

--finding name of the banks that has 'i' in the end and 's' in the name

select bank_name from atm_card where bank_name like '%i' intersect select bank_name from atm_card where bank_name like '%s%';    

--except/minus

--finding name of the banks that has 'i' in the end but no 's' in the name

select bank_name from atm_card where bank_name like '%i' minus select bank_name from atm_card where bank_name like '%s%';    

--with clause

--finding info of the customer with the highest balance using with clause

with maximum as (select max(user_balance) as max_balance from customer)

select * from customer,maximum where customer.user_balance=maximum.max_balance;                 

--aggregate function

--total row in table

select count(*) from atm_card;   

--total unique banks in table

select count(distinct bank_name) as banks from atm_card;  

--average value of the total balance

select avg(user_balance) from customer;

--sum of the total balance       

select sum(user_balance) from customer;

--max user balance   

select max(user_balance) from customer; 

--min user balance 

select min(user_balance) from customer;   

--group by and having

--getting the total transac by a customer using group by

select sum(transac_amount) from transac group by card_id;   

--same thing but using having condition   

select sum(transac_amount) from transac group by card_id having sum(transac_amount) >= 2200;     

--nested subquery 

--who took out certain amount of money at certain time and machine

select user_name from customer where card_id=(select card_id from transac where machine_id = 1 and transac_amount = 500 and transac_date = '31-JAN-22');    

--set membership(in, not in)

--finding name of the banks that has 'i' in the end and 's' in the name

select bank_name from atm_card where bank_name like '%i' and bank_name in (select bank_name from atm_card where bank_name like '%s%');             

select distinct(bank_name) from atm_card where bank_name like '%i' and bank_name in (select bank_name from atm_card where bank_name like '%s%');

--finding name of the banks that has 'i' in the end but no 's' in the name

select bank_name from atm_card where bank_name like '%i' and bank_name not in (select bank_name from atm_card where bank_name like '%s%');

select distinct(bank_name) from atm_card where bank_name like '%i' and bank_name not in (select bank_name from atm_card where bank_name like '%s%');   

--(some,all)
  
--finding out customer whose balance is higher than at least one member with at least balance 50000

select user_name from customer where user_balance > some(select user_balance from customer where user_balance >=50000);  

--finding out customer whose balance is higher than all the customer with at least balance 50000

select user_name from customer where user_balance > all(select user_balance from customer where user_balance >=50000);  

--finding out customer whose balance is higher or equal than all the customer with at least balance 50000  

select user_name from customer where user_balance >= all(select user_balance from customer where user_balance >=50000);   

--(exists, not exists)

--finding a bank with the letter 'r' if there is bank with the letter 'b'

select bank_name from atm_card where bank_name like '%r%' and exists (select bank_name from atm_card where bank_name like '%b%');    

--finding a bank with letter 'r' if there is no bank with the letter 'x'    

select bank_name from atm_card where bank_name like '%r%' and not exists (select bank_name from atm_card where bank_name like '%x%');    

--(string operation)
  
--finding info of bank with ending 'i'

select * from atm_card where bank_name like '%i'; 

--finding info of bank with name of length 4    

select * from atm_card where bank_name like '____';    

--join operation

--finding info all the customer of sonali bank using natural join

select * from atm_card natural join customer where bank_name='sonali';   

--finding info all the customer of sonali bank using join

select * from atm_card join customer on atm_card.bank_name = 'sonali' and atm_card.card_id = customer.card_id;   

--finding info of all customer of all banks (all 3 results will be same cause nothing is null)

select bank_name, user_name from atm_card left outer join customer using(card_id);

select bank_name, user_name from atm_card right outer join customer using(card_id);      

select bank_name, user_name from atm_card full outer join customer using(card_id);

--view

--creating a view of all customer of only sonali_bank

create view sonali_bank as select * from atm_card natural join customer where bank_name='sonali';   

select * from sonali_bank;

--creating view from view using specific name

create view  custom as select * from sonali_bank where user_name = 'rahim';    

select * from custom;




