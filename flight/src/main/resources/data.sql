INSERT INTO roles (name) VALUES ('ROLE_USER');
INSERT INTO roles (name) VALUES ('ROLE_ADMIN');

INSERT INTO users (username, password) VALUES 
('admin', '$2a$10$D9qO4G8F9N87qZqgE8cZ6uO9hJh3CgUZ5WuzZ2RVjoVVFmLOZGgOu'), 
('user1', '$2a$10$a.B5QJoY6uLsIo3XehJv1O.QY/l4kGj90YxRUXIoYEdRWBlcNUXQq');

INSERT INTO user_roles (user_id, role_id) VALUES 
(1, 2),
(2, 1);

INSERT INTO airports (code, name, location) VALUES
('JFK', 'John F. Kennedy International Airport', 'New York, USA'),
('LHR', 'Heathrow Airport', 'London, UK'),
('CDG', 'Charles de Gaulle Airport', 'Paris, France');

INSERT INTO flights (flight_number, departure_airport_id, arrival_airport_id, departure_time, arrival_time, available_seats)
VALUES 
('AA101', 1, 2, '2025-02-01 08:00:00', '2025-02-01 12:00:00', 100),
('BA202', 2, 3, '2025-02-02 09:00:00', '2025-02-02 13:30:00', 150);

INSERT INTO bookings (user_id, flight_id, seat_count, status) VALUES 
(2, 1, 1, 'CONFIRMED');
