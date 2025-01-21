-- Создаем базу данных, если она не существует
CREATE DATABASE IF NOT EXISTS airline_db;
USE airline_db;

CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS user_roles (
    user_id BIGINT NOT NULL,
    role_id BIGINT NOT NULL,
    PRIMARY KEY (user_id, role_id),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS airports (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    code VARCHAR(10) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS flights (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    flight_number VARCHAR(20) UNIQUE NOT NULL,
    departure_airport_id BIGINT NOT NULL,
    arrival_airport_id BIGINT NOT NULL,
    departure_time DATETIME NOT NULL,
    arrival_time DATETIME NOT NULL,
    available_seats INT NOT NULL CHECK (available_seats >= 0),
    status ENUM('SCHEDULED', 'DEPARTED', 'CANCELLED') DEFAULT 'SCHEDULED',
    FOREIGN KEY (departure_airport_id) REFERENCES airports(id) ON DELETE CASCADE,
    FOREIGN KEY (arrival_airport_id) REFERENCES airports(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS bookings (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT NOT NULL,
    flight_id BIGINT NOT NULL,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    seat_count INT NOT NULL CHECK (seat_count > 0),
    status ENUM('PENDING', 'CONFIRMED', 'CANCELLED') DEFAULT 'PENDING',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE
);
