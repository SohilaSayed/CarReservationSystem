CREATE sequence E_ID_seq start with 1 increment BY 1 maxvalue 300;
CREATE sequence M_ID_seq start with 1 increment BY 1 maxvalue 300;
drop sequence m_id_seq;
drop sequence E_ID_seq;
CREATE OR REPLACE
  FUNCTION E_ID_get_seq;
    RETURN NUMBER
  IS
  BEGIN
    RETURN E_ID_seq.nextval;
  END E_ID_get_seq;
CREATE OR REPLACE
FUNCTION M_ID_get_seq;
  RETURN NUMBER
IS
BEGIN
  RETURN M_ID_seq.nextval;
END M_ID_get_seq;
CREATE TABLE CAR_AGENCY
  (
    quantity_of_stock NUMBER(3),
    location          VARCHAR2(30) PRIMARY KEY
  );
CREATE TABLE EMPLOYEE
  (
    E_ID        NUMBER(6),
    E_salary    NUMBER(6),
    E_name      VARCHAR2(15),
    E_job_title VARCHAR2(50),
    location    VARCHAR2(30),
    hour        NUMBER(3),
    CONSTRAINT e_id_pk PRIMARY KEY (E_ID),
    CONSTRAINT location_fk FOREIGN KEY (location) REFERENCES CAR_AGENCY (location)
  );
CREATE TABLE customer
  (
    SSN         NUMBER(8),
    C_name      VARCHAR2(15),
    C_job_title VARCHAR2(50),
    C_salary    NUMBER(6),
    address     VARCHAR2(30),
    CONSTRAINT ssn_pk PRIMARY KEY (SSN)
  );
CREATE TABLE CUS_NUM
  (
    phone_number VARCHAR2(11) NOT NULL,
    CSSN         NUMBER(8)REFERENCES customer (SSN),
    PRIMARY KEY (phone_number,CSSN)
  );
CREATE TABLE CAR
  (
    CAR_ID        NUMBER(6),
    model         VARCHAR2(20),
    YEAR          NUMBER(4),
    speed         VARCHAR2(9),
    license       VARCHAR2(7),
    qualification VARCHAR2(50),
    date_of_purchase DATE,
    CSSN         NUMBER(8)NOT NULL,
    E_ID         NUMBER(6),
    status       VARCHAR2(4),
    issue        VARCHAR2(30),
    car_warranty VARCHAR2(20),
    CONSTRAINT car_id_pk PRIMARY KEY (CAR_ID),
    CONSTRAINT cssn_fk FOREIGN KEY (CSSN) REFERENCES customer (SSN),
    CONSTRAINT e_id_fk FOREIGN KEY (E_ID) REFERENCES EMPLOYEE (E_ID)
  );
CREATE TABLE CAR_COL
  (
    color  VARCHAR(7),
    CAR_ID NUMBER(6)REFERENCES CAR (CAR_ID),
    PRIMARY KEY (color,CAR_ID)
  );

CREATE TABLE CAR_MECHANIC
  (
    M_ID     NUMBER(6),
    M_name   NUMBER(20),
    M_salary NUMBER(6),
    CONSTRAINT m_id_pk PRIMARY KEY (M_ID)
  );
  
alter table car_mechanic
modify m_name varchar2(20);
CREATE TABLE REPAIR
  (
    M_ID   NUMBER(6) REFERENCES CAR_MECHANIC (M_ID),
    CAR_ID NUMBER(6)REFERENCES CAR (CAR_ID),
    PRIMARY KEY(M_ID,CAR_ID)
  );
  
insert all
into CAR_AGENCY (quantity_of_stock,location) values (20,'ALexandria')
into CAR_AGENCY (quantity_of_stock,location) values (50,'Cairo')
into CAR_AGENCY (quantity_of_stock,location) values (74,'Asyut')
into CAR_AGENCY (quantity_of_stock,location) values (32,'Luxor')
into CAR_AGENCY (quantity_of_stock,location) values (21,'Ismailia')
select * from dual;

insert all 
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,3400,'Ahmed Ali','Sales',(select location from car_agency where quantity_of_stock=20),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5000,'Asmaa Medhat','IT',(select location from car_agency where quantity_of_stock=20),7)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,3400,'Shehab Hamdy','Sales',(select location from car_agency where quantity_of_stock=50),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,2900,'Sameh Mohammed','Officeservice',(select location from car_agency where quantity_of_stock=50),9)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,2900,'Salma Yehia','Officeservice',(select location from car_agency where quantity_of_stock=20),9)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5200,'Kareem Ahmed','IT',(select location from car_agency where quantity_of_stock=50),7)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,4500,'Haidy Farouk','Marketing',(select location from car_agency where quantity_of_stock=21),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5600,'Osama Hani','Manager',(select location from car_agency where quantity_of_stock=32),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,4500,'Samy Ashraf','Marketing',(select location from car_agency where quantity_of_stock=20),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5600,'Peter Naroz','Manager',(select location from car_agency where quantity_of_stock=50),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5200,'Shaimaa Adel','IT',(select location from car_agency where quantity_of_stock=74),7)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,3400,'Omar Shereif','Sales',(select location from car_agency where quantity_of_stock=32),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,2900,'Mona Shafeek','Officeservice',(select location from car_agency where quantity_of_stock=74),9)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,4500,'Carol Faid','Marketing',(select location from car_agency where quantity_of_stock=50),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5600,'Hady Mousaad','Manager',(select location from car_agency where quantity_of_stock=20),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,4500,'Yassser Aymen','Marketing',(select location from car_agency where quantity_of_stock=74),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5600,'Kariman Shenoda','Manager',(select location from car_agency where quantity_of_stock=74),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,3400,'Yousra Akram','Sales',(select location from car_agency where quantity_of_stock=74),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,2900,'Howida Mahmmoud','Officeservice',(select location from car_agency where quantity_of_stock=32),9)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,4500,'Ali Dagher','Marketing',(select location from car_agency where quantity_of_stock=32),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5200,'Mina Galal','IT',(select location from car_agency where quantity_of_stock=32),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,3400,'Malak Gamal','Sales',(select location from car_agency where quantity_of_stock=21),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,2900,'Bassem Ashour','Officeservice',(select location from car_agency where quantity_of_stock=21),9)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,5600,'Yasmen Wassef','Manager',(select location from car_agency where quantity_of_stock=21),8)
into EMPLOYEE (e_id, e_salary, e_name, e_job_title, location, hour) values (e_id_get_seq,4500,'Kamal Ismail','IT',(select location from car_agency where quantity_of_stock=21),7)
select * from dual;


insert all 
into customer (ssn,c_name,c_job_title,c_salary,address) values (444535,'Adam Khaled','Doctor',5000,'Maadi,Cairo')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444389,'Dareen Ragy','Accountant',3400,'Abu Qir,ALexandria')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444862,'Tala Samier','Lawer',5200,'Bayadeyah,Luxor')
into customer (ssn,c_name,c_job_title,c_salary,address) values (443754,'Shady Waleed','Programmer',3900,'Manfalut,Asyut')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444870,'Marwan Hassan','Secertary',2900,'El-Kasasin,Ismailia')
into customer (ssn,c_name,c_job_title,c_salary,address) values (445867,'Assem Ayub','Doctor',4500,'Shubra,Cairo')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444875,'Tasneem Ather','Journalist',3400,'Fayed,Ismailia')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444249,'Gamila Rezq','Lawer',4200,'Armant,Luxor')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444991,'Shahinda Bahaa','Engineer',5000,'Al Wardiyan,ALexandria')
into customer (ssn,c_name,c_job_title,c_salary,address) values (444143,'Fadi Fouaad','Fireman',4700,'Bawit,Asyut')
select *from dual;

insert all
into cus_num (phone_number,cssn) values ('01148737',(select ssn from customer where customer.c_name='Adam Khaled'))
into cus_num (phone_number,cssn) values ('01117397',(select ssn from customer where customer.c_name='Dareen Ragy'))
into cus_num (phone_number,cssn) values ('01089053',(select ssn from customer where customer.c_name='Tala Samier'))
into cus_num (phone_number,cssn) values ('01217287',(select ssn from customer where customer.c_name='Shady Waleed'))
into cus_num (phone_number,cssn) values ('01010293',(select ssn from customer where customer.c_name='Marwan Hassan'))
into cus_num (phone_number,cssn) values ('01195031',(select ssn from customer where customer.c_name='Assem Ayub'))
into cus_num (phone_number,cssn) values ('01102846',(select ssn from customer where customer.c_name='Tasneem Ather'))
into cus_num (phone_number,cssn) values ('01212049',(select ssn from customer where customer.c_name='Gamila Rezq'))
into cus_num (phone_number,cssn) values ('01274937',(select ssn from customer where customer.c_name='Shahinda Bahaa'))
into cus_num (phone_number,cssn) values ('01220538',(select ssn from customer where customer.c_name='Fadi Fouaad'))
into cus_num (phone_number,cssn) values ('01101763',(select ssn from customer where customer.c_name='Marwan Hassan'))
into cus_num (phone_number,cssn) values ('01009168',(select ssn from customer where customer.c_name='Gamila Rezq'))
into cus_num (phone_number,cssn) values ('01109126',(select ssn from customer where customer.c_name='Fadi Fouaad'))
into cus_num (phone_number,cssn) values ('01292604',(select ssn from customer where customer.c_name='Adam Khaled'))
into cus_num (phone_number,cssn) values ('01293721',(select ssn from customer where customer.c_name='Tasneem Ather'))
select * from dual;


insert all 
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2265,'Nissan',2019,'120 KM/Hr','abc954','AMG 4 Cylinder 2 Liter 375 hp','24-may-2020',(select ssn from customer where customer.c_name='Dareen Ragy'),(select e_id from employee where employee.e_name='Ahmed Ali'),'new','no problem','up to 3 years')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2283,'Toyota',2020,'190 KM/Hr','abc826','Drive-E 4 Cylinder 2 Liter 316 hp','08-feb-2021',(select ssn from customer where customer.c_name='Adam Khaled'),(select e_id from employee where employee.e_name='Shehab Hamdy'),'new','no problem','up to 5 years')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2299,'Hyundai',2018,'170 KM/Hr','abc406','PY-VPS 4 Cylinder 2.5 Liter 184 hp','01-aug-2019',(select ssn from customer where customer.c_name='Tala Samier'),(select e_id from employee where employee.e_name='Omar Shereif'),'new','no problem','up to 2 years')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2225,'Volkswagen',2014,'190 KM/Hr','abc184',' Sonata PHEV 4 Cylinder 2 Liter 154 hp','29-jun-2018',(select ssn from customer where customer.c_name='Shady Waleed'),(select e_id from employee where employee.e_name='Yousra Akram'),'used','overheating','up to 12 months')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2227,'KIA',2017,'160 KM/Hr','abc058','K24W 4 Cylinder 2.4 Liter 200 hp','14-jan-2020',(select ssn from customer where customer.c_name='Tasneem Ather'),(select e_id from employee where employee.e_name='Malak Gamal'),'used','sputtering engine','up to 18 months')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2288,'Honda',2010,'150 KM/Hr','abc390','HR15DE 4 Cylinde 1.5 Liter 100 hp','11-oct-2017',(select ssn from customer where customer.c_name='Assem Ayub'),(select e_id from employee where employee.e_name='Shehab Hamdy'),'used','dead battery','up to 12 months')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2269,'Jaguar',2018,'120 KM/Hr','abc296','Subaru 4 Cylinder 2 Liter 268 hp','20-nov-2019',(select ssn from customer where customer.c_name='Fadi Fouaad'),(select e_id from employee where employee.e_name='Yousra Akram'),'new','no problem','up to 2 years')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2273,'Fiat',2019,'170 KM/Hr','abc916','1GR-FE 4 Cylinder 4 Liter 286 hp','25-jul-2021',(select ssn from customer where customer.c_name='Shahinda Bahaa'),(select e_id from employee where employee.e_name='Ahmed Ali'),'used','no problem','up to 2 years')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2231,'Hyundai',2021,'200 KM/Hr','abc038','AUDI 5 Cylinder 2.5 Liter 400 hp','18-dec-2021',(select ssn from customer where customer.c_name='Marwan Hassan'),(select e_id from employee where employee.e_name='Malak Gamal'),'new','no problem','up to 5 years')
into car (car_id,model,year,speed,license,qualification,date_of_purchase,CSSN,E_ID,status,issue,car_warranty) values(2210,'Toyota',2012,'160 KM/Hr','abc174','2NZ-FE 4 Cylinder 1.2 Liter 109 hp','05-mar-2015',(select ssn from customer where customer.c_name='Gamila Rezq'),(select e_id from employee where employee.e_name='Omar Shereif'),'used','brakes grinding','up to 12 months')
select * from dual;


insert all
into car_col (color,car_id) values ('white',(select car_id from car where license='abc406'))
into car_col (color,car_id) values ('yellow',(select car_id from car where license='abc038'))
into car_col (color,car_id) values ('blue',(select car_id from car where license='abc954'))
into car_col (color,car_id) values ('red',(select car_id from car where license='abc826'))
into car_col (color,car_id) values ('black',(select car_id from car where license='abc406'))
into car_col (color,car_id) values ('silver',(select car_id from car where license='abc184'))
into car_col (color,car_id) values ('white',(select car_id from car where license='abc058'))
into car_col (color,car_id) values ('gray',(select car_id from car where license='abc390'))
into car_col (color,car_id) values ('silver',(select car_id from car where license='abc296'))
into car_col (color,car_id) values ('red',(select car_id from car where license='abc916'))
into car_col (color,car_id) values ('black',(select car_id from car where license='abc038'))
into car_col (color,car_id) values ('blue',(select car_id from car where license='abc174'))
select * from dual;

insert all
into car_mechanic (m_id,m_name,m_salary) values (M_ID_get_seq,'Tamer Dawod',4900)
into car_mechanic (m_id,m_name,m_salary) values (M_ID_get_seq,'Ramy Salem',4700)
into car_mechanic (m_id,m_name,m_salary) values (M_ID_get_seq,'Fares Mounir',3900)
into car_mechanic (m_id,m_name,m_salary) values (M_ID_get_seq,'Mohammed Gad',4200)
into car_mechanic (m_id,m_name,m_salary) values (M_ID_get_seq,'Ziad Mahmoud',4700)
into car_mechanic (m_id,m_name,m_salary) values (M_ID_get_seq,'Mai Faouzy',5000)
select * from dual;

insert all
into repair (m_id,car_id) values ((select m_id from car_mechanic where car_mechanic.m_name='Tamer Dawod'),(select car_id from car where license='abc174'))
into repair (m_id,car_id) values ((select m_id from car_mechanic where car_mechanic.m_name='Mai Faouzy'),(select car_id from car where license='abc058'))
into repair (m_id,car_id) values ((select m_id from car_mechanic where car_mechanic.m_name='Ramy Salem'),(select car_id from car where license='abc184'))
into repair (m_id,car_id) values ((select m_id from car_mechanic where car_mechanic.m_name='Ziad Mahmoud'),(select car_id from car where license='abc390'))
into repair (m_id,car_id) values ((select m_id from car_mechanic where car_mechanic.m_name='Mohammed Gad'),(select car_id from car where license='abc916'))
select * from dual;

select * from car_agency;
select * from employee;
select * from customer;
select * from CUS_NUM;
select * from CAR;
select * from CAR_COL;
select * from CAR_MECHANIC;
select * from REPAIR;

commit
