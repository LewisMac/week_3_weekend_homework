DROP TABLE tickets;
DROP TABLE customers;
DROP TABLE films;

CREATE TABLE films(
  id SERIAL8 primary key,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE customers(
  id SERIAL8 primary key, 
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE tickets(
  id SERIAL8 primary key,
  customer_id INT4 references customers(id) ON DELETE CASCADE,
  film_id INT4 references films(id) ON DELETE CASCADE
);
