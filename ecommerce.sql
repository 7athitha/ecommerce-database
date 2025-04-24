CREATE DATABASE ecommerce;
USE ecommerce;

-- BRAND
CREATE TABLE brand (
    brand_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    logo_url TEXT
);

-- PRODUCT CATEGORY
CREATE TABLE product_category (
    category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    parent_category_id INT DEFAULT NULL,
    name VARCHAR(255) NOT NULL,
    FOREIGN KEY (parent_category_id) REFERENCES product_category(category_id)
);

-- PRODUCT
CREATE TABLE product (
    product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    brand_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    base_price DECIMAL(10,2) NOT NULL,
    description TEXT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

-- PRODUCT IMAGE
CREATE TABLE product_image (
    image_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    image_url TEXT NOT NULL,
    alt_text VARCHAR(255),
    is_primary BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- COLOR
CREATE TABLE color (
    color_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7)
);

-- SIZE CATEGORY
CREATE TABLE size_category (
    size_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- SIZE OPTION
CREATE TABLE size_option (
    size_option_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    size_category_id INT NOT NULL,
    label VARCHAR(50),
    size VARCHAR(50),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- PRODUCT ITEM
CREATE TABLE product_item (
    item_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    sku VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL,
    stock INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- PRODUCT VARIATION
CREATE TABLE product_variation (
    variation_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    color_id INT,
    size_option_id INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- ATTRIBUTE TYPE
CREATE TABLE attribute_type (
    attribute_type_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(100) NOT NULL,
    description TEXT
);

-- ATTRIBUTE CATEGORY
CREATE TABLE attribute_category (
    attribute_category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- PRODUCT ATTRIBUTE
CREATE TABLE product_attribute (
    product_attribute_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT NOT NULL,
    attribute_category_id INT NOT NULL,
    attribute_type_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);