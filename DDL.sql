--dropping tables if exist(constraints and cascading action and referential integrity)

drop trigger try;
drop procedure bal_greater;
drop procedure bal_max;
drop function bal_higher;
drop view custom;
drop view sonali_bank;
drop table transac;
drop table customer;
drop table atm_machine;
drop table atm_card;

--creating tables 

create table atm_card(
    card_id number(10) not null check(card_id > 0),
    expiry date not null,
    bank_name varchar(10) not null,
    PRIMARY KEY (card_id)
);

create table atm_machine(
    machine_id number(5) not null check(machine_id > 0),
    machine_area varchar(10) not null,
    PRIMARY KEY(machine_id)
);

create table customer(
    acc_no number(8) not null check(acc_no > 0),
    user_name varchar(25) not null,
    user_balance number(6) not null check(user_balance >= 100),
    card_id number(10),
    card_pin number(8) not null check(card_pin > 0),
    PRIMARY KEY (acc_no),
    FOREIGN KEY (card_id) REFERENCES atm_card on delete cascade
);

create table transac(
    card_id number(10),
    machine_id number(5),
    transac_amount number(6) not null check(transac_amount >= 500),
    transac_date date,
    FOREIGN KEY (card_id) REFERENCES atm_card on delete cascade,
    FOREIGN KEY (machine_id) REFERENCES atm_machine on delete cascade
);

--adding column in table

alter table atm_card add branch char(20);

--modify column definition in table

alter table atm_card modify branch varchar(20);

--rename the column in table

alter table atm_card rename column branch to bank_branch;

--drop the column from table

alter table atm_card drop column bank_branch;
