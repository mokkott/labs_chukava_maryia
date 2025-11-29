drop table if exists order_items;
drop table if exists orders;
drop table if exists menu_items;
drop table if exists menu_categories;
drop table if exists employees;
drop table if exists reservations;
drop table if exists stol;
drop table if exists customers;

create table customers
(
	customer_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	phone varchar(50), -- +
	email varchar(50)
); 


create table stol
(
	table_id int primary key,
	seats int,
	locations varchar(50)
);


create table reservations
(
	reservation_id int primary key,
	customer_id int references customers(customer_id),
	table_id int references stol(table_id),
	reservation_date date,
	reservation_time time,
	status varchar(50)
);


create table employees
(
	employee_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	positions varchar(50),
	phone varchar(50)
);


create table menu_categories
(
	category_id int primary key,
	category_name varchar(50)
);


create table menu_items
(
	item_id int primary key,
	category_id int references menu_categories(category_id),
	full_name varchar(50),
	descriotion text,
	price decimal(10,2)
);


create table orders
(
	order_id int primary key,
	reservation_id int references reservations(reservation_id),
	employee_id int references employees(employee_id),
	order_date date,
	order_time time
);


create table order_items
(
	order_item_id int primary key,
	order_id int references orders(order_id),
	item_id int references menu_items(item_id),
	quantity int
);


drop table if exists payments;
drop table if exists attendance;
drop table if exists member_enrollment;
drop table if exists sessions;
drop table if exists program_schedule;
drop table if exists training_programs;
drop table if exists trainer_qualifications;
drop table if exists trainers;
drop table if exists members;

create table members 
(
	member_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	phone varchar(50),
	email varchar(50),
	membership_type varchar(50)
);

create table trainers 
(
	trainer_id int primary key,
	first_name varchar(50),
	last_name varchar(50),
	phone varchar(50),
	email varchar(50)
);

create table trainer_qualifications
(
	qualification_id int primary key,
	trainer_id int references trainers(trainer_id),
	qualification_name varchar(50),
	descriprion text
);

create table training_programs
(
	program_id int primary key,
	program_name varchar(50),
	program_type varchar(50),
	difficulty_level varchar(50),
	description text
);

create table program_schedule
(
	schedule_id int primary key,
	program_id int references training_programs(program_id),
	day_of_week varchar(50),
	start_time time,
	end_time time
);

create table sessions 
(
	session_id int primary key,
	program_id int references training_programs(program_id),
	trainer_id int references trainers(trainer_id),
	session_date date,
	session_start time,
	session_end time
);

create table member_enrollment
(
	enrollment_id int primary key,
	member_id int references members(member_id),
	program_id int references training_programs(program_id),
	enrollment_date date
);

create table attendance
(
	attendance_id int primary key,
	session_id int references sessions(session_id),
	member_id int references members(member_id),
	status varchar(50)
);

create table payments
(
	payment_id int primary key,
	member_id int references members(member_id),
	payment_date date,
	price decimal,
	payment_type varchar(50)
);



