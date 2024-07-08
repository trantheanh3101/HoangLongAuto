use manager;
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
