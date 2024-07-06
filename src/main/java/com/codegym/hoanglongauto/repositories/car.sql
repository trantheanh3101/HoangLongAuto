create database manager;
drop database manager;
use manager;

CREATE TABLE Car (
                     id INT AUTO_INCREMENT PRIMARY KEY,
                     make VARCHAR(50) NOT NULL,
                     model VARCHAR(50) NOT NULL,
                     year INT NOT NULL,
                     price FLOAT(10, 2) NOT NULL,
                     color VARCHAR(30),
                     engine_type VARCHAR(50),
                     horsepower INT,
                     torque INT,
                     seating_capacity INT,
                     description TEXT,
                     img varchar(255) not null ,
                     quantity int not null,
                     used_car bit
);

CREATE TABLE Customer (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(50) NOT NULL,
                          address VARCHAR(255),
                          phone VARCHAR(15),
                          email VARCHAR(100)
);

CREATE TABLE Employee (
                          id INT AUTO_INCREMENT PRIMARY KEY,
                          name VARCHAR(50) NOT NULL,
                          address varchar(100),
                          position VARCHAR(50),
                          salary DECIMAL(10, 2)
);

CREATE TABLE oder (
                       id INT AUTO_INCREMENT PRIMARY KEY,
                       car_id INT,
                       customer_id INT,
                       employee_id INT,
                       sale_date DATE NOT NULL,
                       FOREIGN KEY (car_id) REFERENCES Car(id),
                       FOREIGN KEY (customer_id) REFERENCES Customer(id),
                       FOREIGN KEY (employee_id) REFERENCES Employee(id)
);

INSERT INTO Car (make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car)
VALUES
    ('Toyota', 'Camry', 2020, 24500.00, 'Blue', 'V6', 301, 267, 5, 'Comfortable midsize sedan', 'img/camry.jpg', 10, 0),
    ('Honda', 'Civic', 2019, 22000.00, 'Red', 'I4', 158, 138, 5, 'Solus GT là phiên bản giới hạn chỉ 25 chiếc dành riêng cho đường đua.

Xe đua một chỗ ngồi này sử dụng động cơ V8 tăng áp kép 3,8 hoặc 4,0 lít điển hình của McLaren, lấy sức mạnh từ động cơ V10 5,2 lít hút khí tự nhiên do Judd Power chế tạo.

Động cơ này sản sinh công suất 829 mã lực với mô-men xoắn 479 lb-ft, xe có thể đạt tốc độ 62 dặm/giờ (100 km/h) trong 2,5 giây.', '<img src="/img/xe1.png">', 15, 1),
    ('Ford', 'Mustang', 2021, 55000.00, 'Black', 'V8', 450, 410, 4, 'Iconic American sports car', 'img/mustang.jpg', 5, 0),
    ('Chevrolet', 'Malibu', 2020, 24000.00, 'White', 'I4', 160, 184, 5, 'Midsize sedan with good fuel economy', 'img/malibu.jpg', 8, 1),
    ('BMW', 'X5', 2022, 60000.00, 'Silver', 'V6', 335, 330, 7, 'Luxury SUV with advanced features', 'img/x5.jpg', 7, 0),
    ('Audi', 'A4', 2021, 42000.00, 'Gray', 'I4', 201, 236, 5, 'Compact luxury sedan', 'img/a4.jpg', 6, 0),
    ('Mercedes-Benz', 'E-Class', 2022, 55000.00, 'Black', 'I4', 255, 273, 5, 'Luxury midsize sedan', 'img/e-class.jpg', 4, 0),
    ('Tesla', 'Model 3', 2021, 49999.99, 'White', 'Electric', 283, 307, 5, 'Electric car with advanced technology', 'img/model3.jpg', 12, 1),
    ('Hyundai', 'Santa Fe', 2020, 31000.00, 'Blue', 'I4', 185, 178, 7, 'Comfortable and spacious SUV', 'img/santafe.jpg', 9, 0),
    ('Kia', 'Soul', 2019, 19000.00, 'Green', 'I4', 147, 132, 5, 'Compact and stylish crossover', 'img/soul.jpg', 11, 1);

-- Thêm 10 khách hàng người Việt Nam vào bảng Customer
INSERT INTO Customer (name, address, phone, email)
VALUES
    ('Nguyễn Văn A', '123 Đường Nguyễn Trãi, Quận 1, TP. Hồ Chí Minh', '090-123-4567', 'nguyenvana@example.com'),
    ('Trần Thị B', '456 Đường Lý Thường Kiệt, Quận 3, TP. Hồ Chí Minh', '091-234-5678', 'tranthib@example.com'),
    ('Lê Văn C', '789 Đường Phan Đình Phùng, Quận Phú Nhuận, TP. Hồ Chí Minh', '092-345-6789', 'levanc@example.com'),
    ('Phạm Thị D', '101 Đường Võ Thị Sáu, Quận 10, TP. Hồ Chí Minh', '093-456-7890', 'phamthid@example.com'),
    ('Vũ Văn E', '202 Đường Điện Biên Phủ, Quận Bình Thạnh, TP. Hồ Chí Minh', '094-567-8901', 'vuvane@example.com'),
    ('Đặng Thị F', '303 Đường Cách Mạng Tháng Tám, Quận 1, TP. Hồ Chí Minh', '095-678-9012', 'dangthif@example.com'),
    ('Hoàng Văn G', '404 Đường Nguyễn Đình Chiểu, Quận 3, TP. Hồ Chí Minh', '096-789-0123', 'hoangvang@example.com'),
    ('Ngô Thị H', '505 Đường Lê Quang Định, Quận Gò Vấp, TP. Hồ Chí Minh', '097-890-1234', 'ngothih@example.com'),
    ('Bùi Văn I', '606 Đường Hoàng Văn Thụ, Quận Tân Bình, TP. Hồ Chí Minh', '098-901-2345', 'buivani@example.com'),
    ('Đỗ Thị K', '707 Đường Trần Hưng Đạo, Quận 5, TP. Hồ Chí Minh', '099-012-3456', 'dothik@example.com');

INSERT INTO Employee (name, address, position, salary)
VALUES
    ('Nguyễn Văn A', '123 Đường Nguyễn Trãi, Quận 1, TP. Hồ Chí Minh', 'Manager', 1500.00),
    ('Trần Thị B', '456 Đường Lý Thường Kiệt, Quận 3, TP. Hồ Chí Minh', 'Sales Executive', 1200.00),
    ('Lê Văn C', '789 Đường Phan Đình Phùng, Quận Phú Nhuận, TP. Hồ Chí Minh', 'Accountant', 1000.00),
    ('Phạm Thị D', '101 Đường Võ Thị Sáu, Quận 10, TP. Hồ Chí Minh', 'HR Specialist', 1100.00),
    ('Vũ Văn E', '202 Đường Điện Biên Phủ, Quận Bình Thạnh, TP. Hồ Chí Minh', 'IT Support', 1300.00),
    ('Đặng Thị F', '303 Đường Cách Mạng Tháng Tám, Quận 1, TP. Hồ Chí Minh', 'Marketing Specialist', 1250.00),
    ('Hoàng Văn G', '404 Đường Nguyễn Đình Chiểu, Quận 3, TP. Hồ Chí Minh', 'Project Manager', 1600.00),
    ('Ngô Thị H', '505 Đường Lê Quang Định, Quận Gò Vấp, TP. Hồ Chí Minh', 'Sales Manager', 1450.00),
    ('Bùi Văn I', '606 Đường Hoàng Văn Thụ, Quận Tân Bình, TP. Hồ Chí Minh', 'Customer Service', 1050.00),
    ('Đỗ Thị K', '707 Đường Trần Hưng Đạo, Quận 5, TP. Hồ Chí Minh', 'Business Analyst', 1350.00);

INSERT INTO oder (car_id, customer_id, employee_id, sale_date)
VALUES
    (3, 5, 2, '2023-02-15'),
    (1, 3, 7, '2023-03-18'),
    (7, 8, 5, '2023-04-22'),
    (5, 2, 4, '2023-05-11'),
    (2, 6, 1, '2023-06-07'),
    (4, 7, 3, '2023-07-14'),
    (9, 1, 9, '2023-08-20'),
    (8, 9, 6, '2023-09-27'),
    (6, 4, 10, '2023-10-05'),
    (10, 10, 8, '2023-11-12');

