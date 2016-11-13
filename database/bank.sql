create table customer_master
(customer_id varchar(250)not null primary key,
name varchar(255)not null ,
username varchar(255) not null,
password varchar(255) not null,
guardian_type varchar(255) default null,
guardian_name varchar(255) default null,
address varchar(255) not null,
citizenship varchar(255) not null,
state varchar(255) not null,
country varchar(255) not null,
email_address varchar(255) not null,
gender char(1) not null,
marital_status varchar(255) default null,
contact_no number(10) not null,
date_of_birth date not null,
branch_name varchar(255) not null,
citizen_status varchar(255) not null,
identification_proof_type varchar(255) not null,
identification_document_number varchar(255) not null,
ref_acc_hol_name varchar(255) not null,
ref_acc_hol_acc_no number(30) not null,
ref_acc_hol_add varchar(255) not null);

create table account_master
(branch_id varchar(250)not null,
customer_id varchar(250)not null,
account_number number(16) not null primary key,
account_type varchar(255) not null,
initial_deposit_amount number(32) not null,
registration_date date not null,
constraint custid foreign key (customer_id) references customer_master(customer_id),
constraint bid foreign key (branch_id) references branch(branch_id)
);

create table transaction
(account_number number(16) not null,
transaction_number VARCHAR(6)not null primary key,
dot DATE,
medium_of_transaction VARCHAR(20),
transaction_type VARCHAR(20),
transaction_amount INT(7),
constraint acnumber foreign key(account_number) references account_master(account_number));

create table branch
(
branch_id varchar(250)not null primary key,
branch_name varchar(250)not null,
branch_city varchar(50) not null
);

create table loan
(loan_id varchar(250)not null primary key,
branch_id varchar(250)not null,
customer_id varchar(250)not null,
loan_Type varchar(250)not null,
loan_Amount number(32) not null,
loan_Apply_Date date not null,
loan_Issue_Date date not null,
rate_Of_interest number(10) not null,
duration_of_the_loan date not null,
constraint custotid foreign key (customer_id) references customer_master(customer_id),
constraint brid foreign key (branch_id) references branch(branch_id));

create table educational_loan
(loan_id varchar(250)not null,
 customer_id varchar(250)not null,
 course_fee number(32) not null,
 course varchar(250)not null,
 father_name varchar(250)not null,
 father_occupation varchar(250)not null, 
 father_total_exp number(32) not null,
 father_exp_current_company number(32) not null,
 ration_card_number varchar(250)not null,
 annual_income number(32) not null,
 primary key(loan_id,customer_id),
 constraint lid foreign key (loan_id) references loan(loan_id),
 constraint customtid foreign key (customer_id) references customer_master(customer_id));

create table personal_housing_loan
(
loan_id varchar(250)not null,
customer_id varchar(250)not null,
annual_income number(32) not null,
company_name varchar(250)not null,
designation varchar(250)not null,
total_exp number(32) not null,
exp_current_company number(32) not null,primary key(loan_id,customer_id),
constraint loid foreign key (loan_id) references loan(loan_id),
 constraint custometid foreign key (customer_id) references customer_master(customer_id));
