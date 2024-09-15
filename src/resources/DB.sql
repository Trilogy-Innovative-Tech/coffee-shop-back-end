CREATE TABLE customer
(
    id        VARCHAR(20) PRIMARY KEY,
    name      VARCHAR(200) NOT NULL,
    email     VARCHAR(200) NOT NULL,
    address   VARCHAR(500) NOT NULL,
    phone     VARCHAR(20)  NOT NULL,
    password  VARCHAR(200) NOT NULL,
    is_active BOOLEAN
);

CREATE TABLE item_category
(
    category_id VARCHAR(20) PRIMARY KEY,
    description VARCHAR(100) NOT NULL,
    is_active   BOOLEAN
);

CREATE TABLE item_sub_category
(
    sub_category_id VARCHAR(20) PRIMARY KEY,
    category_id     VARCHAR(20)  NOT NULL,
    description     VARCHAR(100) NOT NULL,
    is_active       BOOLEAN,
    CONSTRAINT fk_cat FOREIGN KEY (category_id) REFERENCES item_category (category_id)
);

