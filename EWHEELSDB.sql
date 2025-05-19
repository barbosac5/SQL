use ewheels;
SET FOREIGN_KEY_CHECKS = 0;

-- Creating CUSTOMER table
CREATE TABLE CUSTOMER (
    CUSTOMER_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_FNAME VARCHAR(50) NOT NULL,
    CUSTOMER_LNAME VARCHAR(50) NOT NULL,
    PHONE_NUMBER VARCHAR(15) UNIQUE NOT NULL,
    PAYMENT_METHOD ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer') NOT NULL,
    ZIP_CODE VARCHAR(10) NOT NULL,
    INDEX (CUSTOMER_FNAME),
    INDEX (CUSTOMER_LNAME),
    INDEX (PHONE_NUMBER),
    INDEX (PAYMENT_METHOD),
    INDEX (ZIP_CODE)
);

-- Creating ACCOUNT table
CREATE TABLE ACCOUNT (
    ACCOUNT_ID INT AUTO_INCREMENT PRIMARY KEY,
    CUSTOMER_ID INT NOT NULL,
    CUSTOMER_FNAME VARCHAR(50) NOT NULL,
    CUSTOMER_LNAME VARCHAR(50) NOT NULL,
    PAYMENT_METHOD ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer') NOT NULL,
    EMAIL VARCHAR(100) UNIQUE NOT NULL,
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID) ON DELETE CASCADE,
    INDEX (CUSTOMER_FNAME),
    INDEX (CUSTOMER_LNAME),
    INDEX (PAYMENT_METHOD),
    INDEX (EMAIL)
);

-- Populating CUSTOMER and ACCOUNT tables with 20 sample entries
INSERT INTO CUSTOMER (CUSTOMER_FNAME, CUSTOMER_LNAME, PHONE_NUMBER, PAYMENT_METHOD, ZIP_CODE) VALUES
('John', 'Doe', '123-456-7890', 'Credit Card', '10001'),
('Jane', 'Smith', '234-567-8901', 'Debit Card', '10002'),
('Alice', 'Johnson', '345-678-9012', 'PayPal', '10003'),
('Bob', 'Brown', '456-789-0123', 'Bank Transfer', '10004'),
('Charlie', 'Davis', '567-890-1234', 'Credit Card', '10005'),
('Emily', 'White', '678-901-2345', 'Debit Card', '10006'),
('Frank', 'Miller', '789-012-3456', 'PayPal', '10007'),
('Grace', 'Wilson', '890-123-4567', 'Bank Transfer', '10008'),
('Henry', 'Moore', '901-234-5678', 'Credit Card', '10009'),
('Ivy', 'Taylor', '012-345-6789', 'Debit Card', '10010'),
('Jack', 'Anderson', '111-222-3333', 'PayPal', '10011'),
('Kate', 'Thomas', '222-333-4444', 'Bank Transfer', '10012'),
('Leo', 'Harris', '333-444-5555', 'Credit Card', '10013'),
('Mia', 'Clark', '444-555-6666', 'Debit Card', '10014'),
('Nathan', 'Lewis', '555-666-7777', 'PayPal', '10015'),
('Olivia', 'Walker', '666-777-8888', 'Bank Transfer', '10016'),
('Peter', 'Hall', '777-888-9999', 'Credit Card', '10017'),
('Quinn', 'Allen', '888-999-0000', 'Debit Card', '10018'),
('Ryan', 'Young', '999-000-1111', 'PayPal', '10019'),
('Sophia', 'King', '000-111-2222', 'Bank Transfer', '10020');

-- Populating ACCOUNT table corresponding to CUSTOMER
INSERT INTO ACCOUNT (CUSTOMER_ID, CUSTOMER_FNAME, CUSTOMER_LNAME, PAYMENT_METHOD, EMAIL) 
SELECT CUSTOMER_ID, CUSTOMER_FNAME, CUSTOMER_LNAME, PAYMENT_METHOD, 
       CONCAT(LOWER(CUSTOMER_FNAME), '.', LOWER(CUSTOMER_LNAME), '@gmail.com') 
FROM CUSTOMER;


-- Create BRAND Table
CREATE TABLE BRAND (
    BRAND_ID INT PRIMARY KEY,
    BRAND_TYPE VARCHAR(20),
    BRAND_NAME VARCHAR(20)
);


CREATE TABLE MAKE (
MAKE_ID INT PRIMARY KEY,
MAKE_NAME VARCHAR(15),
MAKE_YEAR YEAR,
BRAND_ID INT,
FOREIGN KEY (BRAND_ID) REFERENCES BRAND(BRAND_ID)
);

INSERT INTO MAKE (MAKE_ID, MAKE_NAME, MAKE_YEAR, BRAND_ID) VALUES
(1, 'Zoomster', 2022, 1),
(2, 'EcoRider', 2021, 2),
(3, 'VoltRun', 2023, 3),
(4, 'Roadie', 2020, 1),
(5, 'SwiftWheel', 2021, 4),
(6, 'GlideX', 2022, 2),
(7, 'TurboScoot', 2023, 5),
(8, 'CruzePro', 2020, 3),
(9, 'SpeedMax', 2022, 1),
(10, 'UrbanBolt', 2021, 4),
(11, 'QuickLine', 2023, 5),
(12, 'SkyScoot', 2021, 2),
(13, 'EagleZoom', 2022, 3),
(14, 'SwiftFlyer', 2020, 4),
(15, 'BoltLite', 2023, 1),
(16, 'TrailRider', 2021, 5),
(17, 'ScootNova', 2022, 2),
(18, 'RoverRush', 2023, 4),
(19, 'NeonWheel', 2020, 3),
(20, 'EdgeScoot', 2021, 1),
(21, 'FlashRider', 2022, 2),
(22, 'MotionMax', 2023, 5),
(23, 'ZoomPro', 2021, 3),
(24, 'FlyteX', 2020, 4),
(25, 'DriftEdge', 2023, 1),
(26, 'VoltNova', 2022, 2),
(27, 'HyperScoot', 2021, 5),
(28, 'MegaRider', 2023, 3),
(29, 'PulseDrive', 2020, 4),
(30, 'XpressGo', 2021, 1);


CREATE TABLE MODEL (
MODEL_ID INT PRIMARY KEY,
MODEL_NAME VARCHAR(20),
IN_STOCK BOOLEAN,
REPAIR_HISTORY BOOLEAN,
CUSTOMER_ID INT,
MAKE_ID INT,
FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
FOREIGN KEY (MAKE_ID) REFERENCES MAKE(MAKE_ID)
);


INSERT INTO MODEL (MODEL_ID, MODEL_NAME, IN_STOCK, REPAIR_HISTORY, CUSTOMER_ID, MAKE_ID) VALUES
(1, 'Z1', TRUE, FALSE, 1, 1),
(2, 'EcoX', TRUE, TRUE, 2, 2),
(3, 'VR3', FALSE, TRUE, 3, 3),
(4, 'R1', TRUE, FALSE, 4, 4),
(5, 'SW2', FALSE, FALSE, 5, 5),
(6, 'GX5', TRUE, TRUE, 6, 6),
(7, 'TS7', FALSE, TRUE, 7, 7),
(8, 'CP9', TRUE, FALSE, 8, 8),
(9, 'SM3', TRUE, TRUE, 9, 9),
(10, 'UB1', TRUE, FALSE, 10, 10),
(11, 'QL4', FALSE, FALSE, 11, 11),
(12, 'SS2', TRUE, TRUE, 12, 12),
(13, 'EZ1', TRUE, FALSE, 13, 13),
(14, 'SF5', TRUE, TRUE, 14, 14),
(15, 'BL9', FALSE, FALSE, 15, 15),
(16, 'TR1', TRUE, FALSE, 16, 16),
(17, 'SN6', TRUE, TRUE, 17, 17),
(18, 'RR2', FALSE, TRUE, 18, 18),
(19, 'NW7', TRUE, FALSE, 19, 19),
(20, 'ES3', FALSE, TRUE, 20, 20),
(21, 'FR8', TRUE, FALSE, 21, 21),
(22, 'MM4', TRUE, TRUE, 22, 22),
(23, 'ZP2', FALSE, FALSE, 23, 23),
(24, 'FX9', TRUE, TRUE, 24, 24),
(25, 'DE1', TRUE, FALSE, 25, 25),
(26, 'VN3', FALSE, TRUE, 26, 26),
(27, 'HS5', TRUE, FALSE, 27, 27),
(28, 'MR4', TRUE, TRUE, 28, 28),
(29, 'PD2', FALSE, FALSE, 29, 29),
(30, 'XG6', TRUE, TRUE, 30, 30);

-- Sample Data for BRAND Table
INSERT INTO BRAND (BRAND_ID, BRAND_TYPE, BRAND_NAME)
VALUES
        (1, 'Economy', 'Toyota'),
        (2, 'Economy', 'Ford'),
        (3, 'Economy', 'Honda'),
        (4, 'Economy', 'Chevrolet'),
        (5, 'Luxury', 'Mercedes-Benz'),
        (6, 'Luxury', 'BMW'),
        (7, 'Luxury', 'Audi'),
        (8, 'Economy', 'Nissan'),
        (9, 'Economy', 'Hyundai'),
        (10, 'Economy', 'Volkswagen'),
        (11, 'Off-Road', 'Jeep'),
        (12, 'Off-Road', 'Land Rover'),
        (13, 'Luxury', 'Lexus'),
        (14, 'Muscle', 'Dodge'),
        (15, 'Muscle', 'Chevrolet'),
        (16, 'Sports', 'Porsche'),
        (17, 'Sports', 'Ferrari'),
        (18, 'Sports', 'Lamborghini'),
        (19, 'Electric', 'Tesla'),
        (20, 'Economy', 'Mitsubishi'),
        (21, 'Luxury', 'Jaguar'),
        (22, 'Luxury', 'Cadillac'),
        (23, 'Luxury', 'Chrysler'),
        (24, 'Luxury', 'Buick'),
        (25, 'Luxury', 'Acura'),
        (26, 'Electric', 'Lucid'),
        (27, 'Luxury', 'Genesis'),
        (28, 'Economy', 'Peugeot'),
        (29, 'Economy', 'Renault'),
        (30, 'Economy', 'Fiat');
    
-- Creating ACCESSORIES table
CREATE TABLE ACCESSORIES (
    ACCESSORIES_ID INT PRIMARY KEY,
    ACCESSORY_NAME VARCHAR(100),
    PRICE INT,
    ACCESSORY_DESC VARCHAR(100),
        MODEL_ID INT,
        FOREIGN KEY (MODEL_ID) REFERENCES MODEL(MODEL_ID)
);


INSERT INTO ACCESSORIES (ACCESSORIES_ID, ACCESSORY_NAME, PRICE, ACCESSORY_DESC, MODEL_ID) 
VALUES
        (1, 'All-Weather Floor Mats', 150, 'Protects the car interior from dirt and spills', 5),
        (2, 'Leather Seat Covers', 200, 'Adds comfort and luxury to the car seats', 12),
        (3, 'Rearview Camera', 300, 'Enhances parking safety with a clear rear view', 8),
        (4, 'LED Headlights', 250, 'Improves nighttime visibility with bright LED lights', 15),
        (5, 'Sunshade', 100, 'Shields the interior from harmful UV rays', 22),
        (6, 'Bluetooth Hands-Free Kit', 180, 'Allows seamless phone connectivity while driving', 10),
        (7, 'Premium Sound System', 350, 'Enhances the audio experience with high-quality speakers', 3),
        (8, 'Roof Rack', 400, 'Provides extra storage for long trips', 7),
        (9, 'Car Cover', 220, 'Protects the car from dust and weather elements', 19),
        (10, 'Performance Air Intake', 270, 'Improves engine efficiency and power', 11),
        (11, 'Dashcam', 500, 'Records trips and provides security footage', 4),
        (12, 'Portable Tire Inflator', 130, 'Useful for emergency tire inflation', 9),
        (13, 'Custom Alloy Wheels', 600, 'Enhances the car’s appearance and performance', 13),
        (14, 'Rear Spoiler', 750, 'Improves aerodynamics and adds a sporty look', 18),
        (15, 'Heated Seat Kit', 450, 'Provides warmth and comfort during winter', 2),
        (16, 'Wireless Charging Pad', 320, 'Allows for convenient smartphone charging', 6),
        (17, 'Trunk Organizer', 90, 'Keeps the cargo area neat and organized', 25),
        (18, 'Performance Exhaust System', 650, 'Enhances engine sound and power', 14),
        (19, 'Fog Lights', 275, 'Increases visibility during foggy conditions', 20),
        (20, 'Remote Start System', 500, 'Allows remote engine start for convenience', 1),
        (21, 'Steering Wheel Cover', 200, 'Improves grip and adds style to the wheel', 16),
        (22, 'Side Window Deflectors', 160, 'Reduces wind noise and rain intrusion', 21),
        (23, 'Parking Sensors', 550, 'Helps with parking in tight spaces', 30),
        (24, 'Navigation System', 280, 'Provides GPS navigation with real-time traffic updates', 30),
        (25, 'Heads-Up Display', 330, 'Projects driving information onto the windshield', 17),
        (26, 'Seat Gap Filler', 140, 'Prevents small items from falling between seats', 23),
        (27, 'Emergency Roadside Kit', 210, 'Includes essential tools for roadside emergencies', 27),
        (28, 'USB Fast Charging Ports', 195, 'Provides high-speed charging for devices', 29),
        (29, 'High-Performance Brake Pads', 380, 'Enhances braking efficiency and safety', 26),
        (30, 'Smart Keyless Entry System', 420, 'Enables secure keyless car access', 24);






CREATE TABLE RECEIPT (
	RECEIPT_ID INT PRIMARY KEY, 
    PAYMENT_METHOD ENUM('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer') NOT NULL, 
    EMAIL VARCHAR(100) UNIQUE NOT NULL, 
    ACCOUNT_ID INT, 
    CUSTOMER_ID INT, 
    BRAND_NAME VARCHAR(20), 
    MAKE_NAME VARCHAR(15), 
    MODEL_NAME VARCHAR(20), 
    ACCESSORIES_ID INT, 
    MODEL_ID INT,
    FOREIGN KEY (MODEL_ID) REFERENCES MODEL(MODEL_ID),
    FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
	FOREIGN KEY (ACCOUNT_ID) REFERENCES ACCOUNT(ACCOUNT_ID),
	FOREIGN KEY (ACCESSORIES_ID) REFERENCES ACCESSORIES(ACCESSORIES_ID)
    
);
DROP TABLE RECEIPT;
INSERT INTO RECEIPT (RECEIPT_ID, PAYMENT_METHOD, EMAIL, ACCOUNT_ID, CUSTOMER_ID, BRAND_NAME, MAKE_NAME, MODEL_NAME, ACCESSORIES_ID, MODEL_ID) VALUES
(1, 'Credit Card', 'john.doe@example.com', 1, 1, 'Toyota', 'Corolla', 'Sedan', 1, 1),
(2, 'PayPal', 'jane.smith@example.com', 2, 2, 'Honda', 'Civic', 'Hatchback', 2, 2),
(3, 'Debit Card', 'sam.brown@example.com', 3, 3, 'Ford', 'Focus', 'SUV', 3, 3),
(4, 'Credit Card', 'alice.jones@example.com', 4, 4, 'BMW', 'X5', 'Coupe', 4, 4),
(5, 'Bank Transfer', 'michael.green@example.com', 5, 5, 'Audi', 'A4', 'Convertible', 5, 5),
(6, 'Debit Card', 'linda.wilson@example.com', 6, 6, 'Tesla', 'Model 3', 'Sedan', 6, 6),
(7, 'PayPal', 'david.kim@example.com', 7, 7, 'Chevrolet', 'Malibu', 'Coupe', 7, 7),
(8, 'Credit Card', 'emma.brown@example.com', 8, 8, 'Nissan', 'Altima', 'Sedan', 8, 8),
(9, 'PayPal', 'oliver.white@example.com', 9, 9, 'Kia', 'Sportage', 'SUV', 9, 9),
(10, 'PayPal', 'sophia.johnson@example.com', 10, 10, 'Hyundai', 'Elantra', 'Sedan', 10, 10),
(11, 'Credit Card', 'liam.martin@example.com', 11, 11, 'Mazda', 'CX-5', 'SUV', 11, 11),
(12, 'Debit Card', 'charlotte.king@example.com', 12, 12, 'Subaru', 'Outback', 'Hatchback', 12, 12),
(13, 'PayPal', 'james.roberts@example.com', 13, 13, 'Volkswagen', 'Golf', 'Sedan', 13, 13),
(14, 'PayPal', 'mia.taylor@example.com', 14, 14, 'Volvo', 'XC90', 'SUV', 14, 14),
(15, 'Credit Card', 'benjamin.thomas@example.com', 15, 515, 'Jeep', 'Wrangler', 'Convertible', 15, 15),
(16, 'Bank Transfer', 'ella.clark@example.com', 16, 516, 'Porsche', '911', 'Coupe', 16, 16),
(17, 'PayPal', 'lucas.hall@example.com', 17, 17, 'Lexus', 'RX', 'SUV', 17, 17),
(18, 'Credit Card', 'amelia.harris@example.com', 18, 518, 'Acura', 'MDX', 'Hatchback', 18, 18),
(19, 'Credit Card', 'henry.adams@example.com', 19, 19, 'Mercedes', 'C-Class', 'Sedan', 19, 19),
(20, 'PayPal', 'ava.walker@example.com', 20, 20, 'Cadillac', 'Escalade', 'SUV', 20, 20);
