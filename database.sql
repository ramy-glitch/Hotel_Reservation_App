CREATE TABLE admin (
    adminID INTEGER PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE hotelmanager (
    managerID INTEGER PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE user (
    userID INTEGER PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE service (
    serviceID INTEGER PRIMARY KEY,
    servicename VARCHAR(255) NOT NULL,
    description TEXT,
    availability BOOLEAN NOT NULL,
    cost DOUBLE
);

CREATE TABLE hotel (
    hotelID INTEGER PRIMARY KEY,
    hotelname VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    managerID INTEGER,
    FOREIGN KEY (managerID) REFERENCES hotelmanager(managerID)
);

CREATE TABLE room (
    roomID INTEGER PRIMARY KEY,
    roomNumber VARCHAR(255) NOT NULL,
    roomType VARCHAR(255) NOT NULL,
    capacity INTEGER NOT NULL,
    price DOUBLE NOT NULL,
    availability BOOLEAN NOT NULL,
    hotelID INTEGER,
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE review (
    reviewID INTEGER PRIMARY KEY,
    rating INTEGER NOT NULL,
    reviewcomment TEXT,
    userID INTEGER,
    hotelID INTEGER,
    FOREIGN KEY (userID) REFERENCES user(userID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE notification (
    notificationID INTEGER PRIMARY KEY,
    message TEXT NOT NULL,
    notificationdate DATE NOT NULL,
    userID INTEGER,
    FOREIGN KEY (userID) REFERENCES user(userID)
);

CREATE TABLE reservation (
    reservationID INTEGER PRIMARY KEY,
    reservationDate DATE NOT NULL,
    checkInDate DATE NOT NULL,
    checkOutDate DATE NOT NULL,
    userID INTEGER,
    hotelID INTEGER,
    status VARCHAR(255) NOT NULL,
    numberOfPeople INTEGER NOT NULL,
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
    photoID INTEGER PRIMARY KEY,
    photoURL TEXT NOT NULL,
    hotelID INTEGER,
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID)
);

CREATE TABLE room_photos (
    photoID INTEGER PRIMARY KEY,
    photoURL TEXT NOT NULL,
    roomID INTEGER,
    FOREIGN KEY (roomID) REFERENCES room(roomID)
);

CREATE TABLE hotel_services (
    hotelID INTEGER,
    serviceID INTEGER,
    PRIMARY KEY (hotelID, serviceID),
    FOREIGN KEY (hotelID) REFERENCES hotel(hotelID),
    FOREIGN KEY (serviceID) REFERENCES service(serviceID)
);