CREATE TABLE car (
id INTEGER PRIMARY KEY,
make VARCHAR(30),
model VARCHAR(30),
year INTEGER,
color VARCHAR(30),
vin TEXT,
customer_id INTEGER,
salesperson_id INTEGER,
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (salesperson_id) REFERENCES salesperson(id)
);

CREATE TABLE salesperson (
id INTEGER PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
phone_number TEXT,
email VARCHAR
);

CREATE TABLE customer (
id INTEGER PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
phone_number TEXT,
email VARCHAR(50),
street TEXT,
city TEXT,
state VARCHAR(15),
zip_code INTEGER
);

CREATE TABLE invoice (
id INTEGER PRIMARY KEY,
created_at DATE,
location VARCHAR(50),
total_amount DECIMAL,
customer_id INTEGER,
salesperson_id INTEGER,
car_id INTEGER,
FOREIGN KEY (customer_id) REFERENCES customer(id),
FOREIGN KEY (salesperson_id) REFERENCES salesperson(id),
FOREIGN KEY (car_id) REFERENCES car(id)
);

CREATE TABLE service_history (
id INTEGER PRIMARY KEY,
car_id INTEGER,
service_ticket_id INTEGER,
description VARCHAR(350),
date DATE,
FOREIGN KEY (car_id) REFERENCES car(id),
FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(id)
);

CREATE TABLE service_ticket (
id INTEGER PRIMARY KEY,
customer_id INTEGER,
car_id INTEGER,
created_at DATE,
service_details VARCHAR(350),
FOREIGN KEY (car_id) REFERENCES car(id),
FOREIGN KEY (customer_id) REFERENCES customer(id)
);

CREATE TABLE mechanic (
id INTEGER PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
phone_number TEXT,
email VARCHAR(50)
);

CREATE TABLE service_mechanic (
id INTEGER PRIMARY KEY,
service_ticket_id INTEGER,
mechanic_id INTEGER,
FOREIGN KEY (service_ticket_id) REFERENCES service_ticket(id),
FOREIGN KEY (mechanic_id) REFERENCES mechanic(id)
);