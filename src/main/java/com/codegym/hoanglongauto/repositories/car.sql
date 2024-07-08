use manager;

drop table car;

create table car
(
    id               int auto_increment
        primary key,
    make             varchar(50)  not null,
    model            varchar(50)  not null,
    year             int          not null,
    price            float(10, 2) not null,
    color            varchar(30)  null,
    engine_type      varchar(50)  null,
    horsepower       int          null,
    torque           int          null,
    seating_capacity int          null,
    description      text         null,
    img              varchar(255) not null,
    quantity         int          not null,
    used_car         bit          null
);

INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (1, 'Toyota', 'Vios', 2020, 24500, 'Blue', 'V6', 301, 267, 5, 'Comfortable midsize sedan', '2023-Toyota-Vios.jpg', 10, false);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (2, 'BMW', 'X3', 2019, 22000, 'Red', 'I4', 158, 138, 5, 'Reliable compact car', 'BMW-x3.jpg', 15, true);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (3, 'Ford', 'Ranger', 2021, 55000, 'Black', 'V8', 450, 410, 4, 'Iconic American sports car', 'Ford_Ranger.jpg', 5, false);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (4, 'Ford', 'Territory', 2020, 24000, 'White', 'I4', 160, 184, 5, 'Midsize sedan with good fuel economy', 'Ford_Territory.jpg', 8, true);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (5, 'Honda', 'Wr-V', 2022, 60000, 'Silver', 'V6', 335, 330, 7, 'Luxury SUV with advanced features', 'Honda-Wr-V.jpg', 7, false);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (6, 'Honda', 'Civic', 2021, 42000, 'Gray', 'I4', 201, 236, 5, 'Compact luxury sedan', 'Honda_civic_2022.jpg', 6, false);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (7, 'Honda', 'BRV', 2022, 55000, 'Black', 'I4', 255, 273, 5, 'Luxury midsize sedan', 'HondaBRV2023.jpg', 4, false);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (8, 'Nissan', 'Terra', 2021, 49999.99, 'White', 'Electric', 283, 307, 5, 'Electric car with advanced technology', 'Nissan-Terra-2023.jpg', 12, true);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (9, 'Ford', 'Everest', 2020, 31000, 'Blue', 'I4', 185, 178, 7, 'Comfortable and spacious SUV', 'EverestPlatinum.jpg', 9, false);
INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES (10, 'Kia', 'Carnival', 2022, 19000, 'Green', 'I4', 147, 132, 5, 'Compact and stylish crossover', 'Kia-Carnival-2022.jpg', 11, true);

INSERT INTO manager.car (id, make, model, year, price, color, engine_type, horsepower, torque, seating_capacity, description, img, quantity, used_car) VALUES
(11, 'Hyundai', 'Tucson', 2023, 28500, 'Red', 'I4', 187, 178, 5, 'Modern and versatile SUV', 'hyundai-tucson.jpg', 7, false),
(12, 'Mazda', 'CX-5', 2021, 26000, 'Gray', 'I4', 187, 186, 5, 'Stylish and fun-to-drive SUV', 'mazda-cx5.jpg', 9, true),
(13, 'Mercedes-Benz', 'C-Class', 2022, 45000, 'Black', 'I4', 255, 273, 5, 'Luxury compact sedan', 'mercedes-c-class.jpg', 5, false),
(14, 'Mitsubishi', 'Xpander', 2020, 21000, 'Silver', 'I4', 105, 141, 7, 'Practical and affordable MPV', 'mitsubishi-xpander.jpg', 12, true),
(15, 'Subaru', 'Forester', 2021, 32000, 'Blue', 'I4', 182, 176, 5, 'Rugged and reliable SUV', 'subaru-forester.jpg', 8, false),
(16, 'Toyota', 'Fortuner', 2022, 48000, 'White', 'I4', 150, 400, 7, 'Robust and capable SUV', 'toyota-fortuner.jpg', 6, false),
(17, 'Volkswagen', 'Tiguan', 2020, 29000, 'Green', 'I4', 184, 221, 5, 'Well-rounded compact SUV', 'volkswagen-tiguan.jpg', 10, true),
(18, 'Volvo', 'XC60', 2023, 56000, 'Black', 'I4', 250, 258, 5, 'Luxury SUV with a focus on safety', 'volvo-xc60.jpg', 4, false),
(19, 'Chevrolet', 'Trailblazer', 2021, 25000, 'Red', 'I4', 155, 174, 5, 'Stylish and affordable SUV', 'chevrolet-trailblazer.jpg', 7, true),
(20, 'Jeep', 'Wrangler', 2022, 52000, 'Green', 'V6', 285, 260, 5, 'Iconic off-road SUV', 'jeep-wrangler.jpg', 6, false),
(21, 'Land Rover', 'Defender', 2023, 75000, 'Gray', 'I6', 395, 406, 7, 'Legendary off-roader with modern luxury', 'land-rover-defender.jpg', 3, false),
(22, 'Lexus', 'RX 350', 2022, 46000, 'Blue', 'I4', 295, 268, 5, 'Refined and luxurious SUV', 'lexus-rx-350.jpg', 5, false),
(23, 'MINI', 'Cooper', 2021, 28000, 'Yellow', 'I3', 134, 162, 4, 'Iconic and fun-to-drive small car', 'mini-cooper.jpg', 8, true),
(24, 'Porsche', 'Macan', 2023, 65000, 'White', 'V6', 375, 383, 5, 'Performance-oriented luxury SUV', 'porsche-macan.jpg', 2, false),
(25, 'Tesla', 'Model Y', 2022, 62000, 'Red', 'Electric', 456, 497, 5, 'High-performance electric SUV', 'tesla-model-y.jpg', 4, false);

SHOW CREATE TABLE `oder`;

ALTER TABLE `oder` DROP FOREIGN KEY `oder_ibfk_1`;

ALTER TABLE `oder` ADD CONSTRAINT `oder_ibfk_1` FOREIGN KEY (`car_id`) REFERENCES `car` (`id`);



