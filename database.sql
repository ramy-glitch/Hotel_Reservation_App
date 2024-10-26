CREATE TABLE admin (
    adminID INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (adminID),
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE hotelmanager (
    managerID INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (managerID),
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE user (
    userID INTEGER NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (userID),
    CONSTRAINT unique_username UNIQUE (username),
    CONSTRAINT unique_email UNIQUE (email)
);

CREATE TABLE service (
    serviceID INTEGER NOT NULL AUTO_INCREMENT,
    servicename VARCHAR(255) NOT NULL,
    description TEXT,
    availability BOOLEAN NOT NULL,
    cost DOUBLE,
    PRIMARY KEY (serviceID)
);

CREATE TABLE hotel (
    hotelID INTEGER NOT NULL AUTO_INCREMENT,
    hotelname VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    managerID INTEGER,
    PRIMARY KEY (hotelID),
    FOREIGN KEY (managerID) REFERENCES hotelmanager(managerID)
);

CREATE TABLE room (
    roomID INTEGER NOT NULL AUTO_INCREMENT,
    roomNumber VARCHAR(255) NOT NULL,
    roomType VARCHAR(255) NOT NULL,
    capacity INTEGER NOT NULL,
    price DOUBLE NOT NULL,
    availability BOOLEAN NOT NULL,
    hotelID INTEGER,
    PRIMARY KEY (roomID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE review (
    reviewID INTEGER NOT NULL AUTO_INCREMENT,
    rating INTEGER NOT NULL,
    reviewcomment TEXT,
    userID INTEGER,
    hotelID INTEGER,
    PRIMARY KEY (reviewID),
    FOREIGN KEY (userID) REFERENCES user(userID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE notification (
    notificationID INTEGER NOT NULL AUTO_INCREMENT,
    message TEXT NOT NULL,
    notificationdate DATE NOT NULL,
    userID INTEGER,
    PRIMARY KEY (notificationID),
    FOREIGN KEY (userID) REFERENCES user(userID)
);

CREATE TABLE reservation (
    reservationID INTEGER NOT NULL AUTO_INCREMENT,
    reservationDate DATE NOT NULL,
    checkInDate DATE NOT NULL,
    checkOutDate DATE NOT NULL,
    userID INTEGER,
    hotelID INTEGER,
    status VARCHAR(255) NOT NULL,
    numberOfPeople INTEGER NOT NULL,
    PRIMARY KEY (reservationID),
    FOREIGN KEY (userID) REFERENCES user(userID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE reservation_rooms (
    reservationID INTEGER,
    roomID INTEGER,
    PRIMARY KEY (reservationID, roomID),
    FOREIGN KEY (reservationID) REFERENCES reservation(reservationID),
    FOREIGN KEY (roomID) REFERENCES room(roomID)
);

CREATE TABLE hotel_photos (
    photoID INTEGER NOT NULL AUTO_INCREMENT,
    photoURL TEXT NOT NULL,
    hotelID INTEGER,
    PRIMARY KEY (photoID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE room_photos (
    photoID INTEGER NOT NULL AUTO_INCREMENT,
    photoURL TEXT NOT NULL,
    roomID INTEGER,
    PRIMARY KEY (photoID),
    FOREIGN KEY (roomID) REFERENCES room(roomID)
);

CREATE TABLE hotel_services (
    hotelID INTEGER,
    serviceID INTEGER,
    PRIMARY KEY (hotelID, serviceID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID),
    FOREIGN KEY (serviceID) REFERENCES service(serviceID)
);