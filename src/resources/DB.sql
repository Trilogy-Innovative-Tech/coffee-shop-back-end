CREATE TABLE customer(
    id VARCHAR(20) PRIMARY KEY,
    name VARCHAR(200) NOT NULL ,
    email VARCHAR(200) NOT NULL ,
    address VARCHAR(500) NOT NULL ,
    phone VARCHAR(20) NOT NULL ,
    password VARCHAR(200) NOT NULL,
    is_active BOOLEAN
);