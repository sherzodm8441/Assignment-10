
CREATE DATABASE car_dealerships; --creates database

create table car_brands( --creates table
    brand_name varchar(30),
    brand_id int not null,
    country varchar(30),
    primary key(brand_id)
);

create table employees(  --creates table
    employee_name varchar(50),
    employee_id int not null,
    gender varchar(10),
    dealership_id int
);

alter table employees add primary key(employee_id); --adds primary key


create table car_dealership( --creates table
    dealership_name varchar(30),
    dealership_id int not null, 
    city varchar(30),
    brand_id int,
    primary key(dealership_id),
    foreign key(brand_id) references car_brands(brand_id)
);

alter table employees add foreign key(dealership_id) references car_dealership(dealership_id); --adds foreign key

create table car_models( ----creates table
    model_name varchar(20),
    model_id int not null,
    model_year int,
    brand_id int,
    primary key(model_id),
    foreign key(brand_id) references car_brands(brand_id)
);

insert into car_brands values --adds data
('Toyota', 100, 'Japan'),
('BMW', 101, 'Germany'),
('Renault', 102, 'France'),
('Tesla', 103, 'USA');

insert into car_dealership values --adds data
('Toyota Dealership', 200, 'Brooklyn', 100),
('BMW Dealership', 201, 'Manhattan', 101),
('Renault Dealership', 202, 'Paris', 102),
('Tesla Dealership', 203, 'Los Angeles', 100);

insert into car_models values --adds data
('Rav4', 300, 2022, 100),
('X1', 301, 2021, 101),
('Arkana', 302, 2022, 102),
('Model3', 303, 2020, 103);


insert into employees values --adds data
('Bailey Adams', 400, 'm', 200),
('Nadia Nixon', 401, 'f', 201),
('Stewart Quimby', 402, 'm', 202),
('Violet Mason', 403, 'f', 203);


update car_dealership --updates the brand_id of car_dealership because incorrect id was initally entered
set brand_id = 103
where dealership_id = 203;

select * from car_models --joins with 2 tables
inner join car_brands
on car_models.brand_id = car_brands.brand_id;

select * from car_models --joins with 3 tables
inner join car_brands on car_models.brand_id = car_brands.brand_id
inner join car_dealership on car_brands.brand_id = car_dealership.brand_id;

select * from car_models --joins with 4 tables
inner join car_brands on car_models.brand_id = car_brands.brand_id
inner join car_dealership on car_brands.brand_id = car_dealership.brand_id
inner join employees on car_dealership.dealership_id = employees.dealership_id;

