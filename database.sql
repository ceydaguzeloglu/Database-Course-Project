-- ceyda
-- step 1: create our database if it doesn't exist yet
CREATE DATABASE IF NOT EXISTS CinemaTicketSystem;

-- step 2: select the database to use
USE CinemaTicketSystem;

-- step 3: create the Customer table
CREATE TABLE IF NOT EXISTS Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    registration_date DATE DEFAULT (CURRENT_DATE)
);

-- step 4: create the Ticket table
CREATE TABLE IF NOT EXISTS Ticket (
    ticket_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    showtime_id INT NOT NULL,
    seat_number VARCHAR(10) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    sale_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

-- defne
-- Category table
CREATE TABLE IF NOT EXISTS Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Movie table
CREATE TABLE IF NOT EXISTS Movie (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    duration_minutes INT NOT NULL,
    release_year YEAR,
    CONSTRAINT chk_movie_duration CHECK (duration_minutes > 0),
    CONSTRAINT fk_movie_category FOREIGN KEY (category_id)
        REFERENCES Category(category_id)
);