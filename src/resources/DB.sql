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
    description VARCHAR(300) NOT NULL,
    is_active   BOOLEAN
);

CREATE TABLE item_sub_category
(
    sub_category_id VARCHAR(20) PRIMARY KEY,
    category_id     VARCHAR(20)  NOT NULL,
    description     VARCHAR(300) NOT NULL,
    is_active       BOOLEAN,
    CONSTRAINT fk_cat FOREIGN KEY (category_id) REFERENCES item_category (category_id)
);

CREATE TABLE portion_size
(
    portion_id  VARCHAR(20) PRIMARY KEY,
    description VARCHAR(300) NOT NULL,
    is_active   BOOLEAN
);

CREATE TABLE supplier
(
    id        VARCHAR(20) PRIMARY KEY,
    name      VARCHAR(200) NOT NULL,
    phone     VARCHAR(20)  NOT NULL,
    address   VARCHAR(500) NOT NULL,
    is_active BOOLEAN
);

CREATE TABLE employee
(
    id        VARCHAR(20) PRIMARY KEY,
    name      VARCHAR(200) NOT NULL,
    phone     VARCHAR(20)  NOT NULL,
    address   VARCHAR(500) NOT NULL,
    job_title VARCHAR(100) NOT NULL,
    is_active BOOLEAN
);

CREATE TABLE "user"
(
    username    VARCHAR(100) PRIMARY KEY,
    employee_id VARCHAR(20)  NOT NULL,
    email       VARCHAR(100) NOT NULL,
    password    VARCHAR(200) NOT NULL,
    is_active   BOOLEAN,
    CONSTRAINT fk_emp FOREIGN KEY (employee_id) REFERENCES employee (id)
);

CREATE TABLE customer_order
(
    id          VARCHAR(20) PRIMARY KEY,
    customer_id VARCHAR(20) REFERENCES customer (id),
    employee_id VARCHAR(20) REFERENCES employee (id),
    date        DATE          NOT NULL,
    discount    DECIMAL(5, 2) NOT NULL,
    is_active   BOOLEAN
);

CREATE TABLE customer_payment
(
    id        VARCHAR(20) PRIMARY KEY,
    order_id  VARCHAR(20) REFERENCES customer_order (id),
    amount    DECIMAL(9, 2) NOT NULL,
    date      DATE          NOT NULL,
    is_active BOOLEAN
);

CREATE TABLE section
(
    id        VARCHAR(20) PRIMARY KEY,
    name      VARCHAR(100) NOT NULL,
    is_active BOOLEAN
);

CREATE TABLE kot
(
    id          VARCHAR(20) PRIMARY KEY,
    order_id    VARCHAR(20) REFERENCES customer_order (id),
    description VARCHAR(500) NOT NULL,
    section_id  VARCHAR(20) REFERENCES section (id),
    is_active   BOOLEAN
);

CREATE TABLE offer
(
    id          VARCHAR(20) PRIMARY KEY,
    description VARCHAR(200) NOT NULL,
    discount    DECIMAL(9, 2),
    is_active   BOOLEAN
);
