CREATE TABLE admins (
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE hotel_managers (
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE users (
    id INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE services (
    id INTEGER NOT NULL AUTO_INCREMENT,
    servicename VARCHAR(255) NOT NULL,
    description TEXT,
    availability BOOLEAN NOT NULL,
    cost DOUBLE,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE hotels (
    id INTEGER NOT NULL AUTO_INCREMENT,
    hotelname VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    manager_id INTEGER,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (manager_id) REFERENCES hotel_managers(id)
);

CREATE TABLE rooms (
    id INTEGER NOT NULL AUTO_INCREMENT,
    room_number VARCHAR(255) NOT NULL,
    room_type VARCHAR(255) NOT NULL,
    capacity INTEGER NOT NULL,
    price DOUBLE NOT NULL,
    availability BOOLEAN NOT NULL,
    hotel_id INTEGER,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE reviews (
    id INTEGER NOT NULL AUTO_INCREMENT,
    rating INTEGER NOT NULL,
    review_comment TEXT,
    user_id INTEGER,
    hotel_id INTEGER,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE notifications (
    id INTEGER NOT NULL AUTO_INCREMENT,
    message TEXT NOT NULL,
    user_id INTEGER,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE reservations (
    id INTEGER NOT NULL AUTO_INCREMENT,
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    user_id INTEGER,
    hotel_id INTEGER,
    status VARCHAR(255) NOT NULL,
    number_of_people INTEGER NOT NULL,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE reservation_rooms (
    reservation_id INTEGER,
    room_id INTEGER,
    PRIMARY KEY (reservation_id, room_id),
    FOREIGN KEY (reservation_id) REFERENCES reservations(id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE hotel_photos (
    id INTEGER NOT NULL AUTO_INCREMENT,
    photo_url TEXT NOT NULL,
    hotel_id INTEGER,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id)
);

CREATE TABLE room_photos (
    id INTEGER NOT NULL AUTO_INCREMENT,
    photo_url TEXT NOT NULL,
    room_id INTEGER,
    created_at TIMESTAMP NULL DEFAULT NULL,
    updated_at TIMESTAMP NULL DEFAULT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (room_id) REFERENCES rooms(id)
);

CREATE TABLE hotel_services (
    hotel_id INTEGER,
    service_id INTEGER,
    PRIMARY KEY (hotel_id, service_id),
    FOREIGN KEY (hotel_id) REFERENCES hotels(id),
    FOREIGN KEY (service_id) REFERENCES services(id)
);