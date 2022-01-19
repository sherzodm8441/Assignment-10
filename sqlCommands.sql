create table car_brands(
    brand_name varchar(30),
    brand_id int not null,
    country varchar(30),
    primary key(brand_id)
);

create table employees(
    employee_name varchar(50),
    employee_id int not null,
    gender varchar(10),
    dealership_id int
);

alter table employees add primary key(employee_id);


create table car_dealership(
    dealership_name varchar(50),
    dealership_id int not null, 
    city varchar(30),
    brand_id int,
    primary key(dealership_id),
    foreign key(brand_id) references car_brands(brand_id)
);

alter table employees add foreign key(manager_id) references employees(employee_id);

create table car_models(
    model_name varchar(30),
    model_id int not null,
    model_year int,
    brand_id int,
    primary key(model_id),
    foreign key(brand_id) references car_brands(brand_id)
);

