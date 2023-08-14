--PL/SQL variable declaration and print value

--taken values from table to variables

set serveroutput on
declare 
account customer.acc_no%type;
name customer.user_name%type;
balance customer.user_balance%type;
begin
select acc_no, user_name, user_balance into account, name, balance from customer where card_id=111122;
dbms_output.put_line('Account: '|| account || ' Name: '|| name || ' Balance: '|| balance);
end;
/

--Insert and set default value

--insert value in table

delete from customer where card_id = 111122;
set serveroutput on
declare 
account customer.acc_no%type:=121212;
name customer.user_name%type:='rahim';
balance customer.user_balance%type:=10000;
card_id customer.card_id%type:=111122;
card_pin customer.card_pin%type:=12345;
begin
insert into customer values(account, name, balance, card_id, card_pin);
end;
/

--Row type

--taken values from table and stored using rowtype 

set serveroutput on
declare 
customer_row customer%rowtype;
begin
select acc_no, user_name, user_balance into customer_row.acc_no, customer_row.user_name, customer_row.user_balance from customer where card_id=111122;
dbms_output.put_line('Account: '|| customer_row.acc_no || ' Name: '|| customer_row.user_name || ' Balance: '|| customer_row.user_balance);
end;
/

--cursor and row count

--using cursor and finding the total number of rows

set serveroutput on
declare 
cursor c is select * from customer;
row customer%rowtype;
begin
open c;
fetch c into row.acc_no, row.user_name, row.user_balance, row.card_id, row.card_pin;
while c%found loop
dbms_output.put_line('Account: '||row.acc_no|| ' Name: '||row.user_name || ' Balance: ' ||row.user_balance);
dbms_output.put_line('Row count: '|| c%rowcount);
fetch c into row.acc_no, row.user_name, row.user_balance, row.card_id, row.card_pin;
end loop;
close c;
end;
/

--FOR LOOP/WHILE LOOP/ARRAY with extend() function

--finding the area of the atm machines using loops and array wth extend function

set serveroutput on
declare 
  counter number;
  area atm_machine.machine_area%type;
  TYPE areaARRAY IS VARRAY(10) OF atm_machine.machine_area%type; 
  A_NAME areaARRAY:=areaARRAY();
begin
  counter:=1;
  for x in 1..10  
  loop
    select machine_area into area from atm_machine where machine_id=x;
    A_NAME.EXTEND();
    A_NAME(counter):=area;
    counter:=counter+1;
  end loop;
  counter:=1;
  WHILE counter<=A_NAME.COUNT 
    LOOP 
    DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
    counter:=counter+1;
  END LOOP;
end;
/

--ARRAY without extend() function

--same thing without the extend function

set serverout on
DECLARE 
   counter NUMBER := 1;
   area atm_machine.machine_area%type;
   TYPE areaARRAY IS VARRAY(10) OF atm_machine.machine_area%type; 
   A_NAME areaARRAY:=areaARRAY('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j'); 
   -- VARRAY with a fixed size of 10 elements and initialized with dummy names
BEGIN
   counter := 1;
   FOR x IN 1..10  
   LOOP
      select machine_area into area from atm_machine where machine_id=x;
      A_NAME(counter) := area;
      counter := counter + 1;
   END LOOP;
   counter := 1;
   WHILE counter <= A_NAME.COUNT 
   LOOP 
      DBMS_OUTPUT.PUT_LINE(A_NAME(counter)); 
      counter := counter + 1;
   END LOOP;
END;
/

--IF /ELSEIF /ELSE

--finding the number of machines in each area

set serveroutput on
DECLARE 
   f number := 0;
   n number := 0;
   d number := 0;
   b number := 0;
   area atm_machine.machine_area%type;
BEGIN
   FOR x IN 1..10  
   LOOP
      select machine_area into area from atm_machine where machine_id=x;
      if area='FULBARI' 
        then
        f := f + 1;
      elsif area='daulatpur'  
        then
        d := d + 1;
      elsif area = 'boyra' then
        b := b + 1;
      elsif area = 'new_market' then
        n := n + 1;
        end if;
   END LOOP;
   DBMS_OUTPUT.PUT_LINE('In fulbari there are ' || f|| ' machines'); 
   DBMS_OUTPUT.PUT_LINE('In daulatpur there are ' || d|| ' machines'); 
   DBMS_OUTPUT.PUT_LINE('In boyra there are ' || b|| ' machines'); 
   DBMS_OUTPUT.PUT_LINE('In new_market there are ' || n|| ' machines'); 
   END;
/

--procedure

--finding the users and their balance which is greater than input_balance(only in parameter is used)

CREATE OR REPLACE PROCEDURE bal_greater(
  input_balance IN NUMBER
)
as
cursor c is select * from customer;
row customer%rowtype;
begin
open c;
fetch c into row.acc_no, row.user_name, row.user_balance, row.card_id, row.card_pin;
while c%found loop
if row.user_balance > input_balance then
dbms_output.put_line('Name: ' || row.user_name || ' Balance: ' || row.user_balance);
fetch c into row.acc_no, row.user_name, row.user_balance, row.card_id, row.card_pin;
else
fetch c into row.acc_no, row.user_name, row.user_balance, row.card_id, row.card_pin;
end if;
end loop;
close c;
end;
/

set serveroutput on
declare 
input_balance customer.user_balance%type:=50000;
begin
bal_greater(input_balance);
end;
/  

--finding the user name and balance with the max balance(using out parameter only)

CREATE OR REPLACE PROCEDURE bal_max(
  output_balance out customer.user_balance%type,
  output_name out customer.user_name%type
)
as
begin
select max(user_balance) into output_balance from customer;
select user_name into output_name from customer where user_balance = output_balance;
dbms_output.put_line('Name: ' || output_name || ' Balance: ' || output_balance);
end;
/ 


set serveroutput on
declare 
output_balance customer.user_balance%type;
output_name customer.user_name%type;
begin
bal_max(output_balance, output_name);
end;
/

--function

--finding the number of users with higher balance than certain amount (in out parameter is used)

set serveroutput on
create or replace function bal_higher(var1 in out number) return number AS
begin
  select count(*) into var1 from customer where customer.user_balance > var1; 
   return var1;
end;
/

set serveroutput on
declare 
var1 number:= 50000;
begin
dbms_output.put_line('The number of user who has higher balance than the input balance is '||bal_higher(var1));
end;
/


--creating trigger to update the card_id in the customer and transac table after updating it in the atm_card table

create trigger try
after update on atm_card
referencing old as o new as n
for each row
begin
update customer set card_id = :n.card_id where card_id = :o.card_id;
update transac set card_id = :n.card_id where card_id = :o.card_id;
end;
/

update atm_card set card_id = 1 where card_id = 111122;
select * from atm_card;
select * from transac;
select * from customer;




















