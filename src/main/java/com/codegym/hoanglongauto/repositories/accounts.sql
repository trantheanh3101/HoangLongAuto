create table accounts
(
    id       int auto_increment
        primary key,
    account  varchar(50) not null,
    password varchar(50) not null
);

INSERT INTO manager.accounts (id, account, password) VALUES (1, 'admin', 'pass1');
INSERT INTO manager.accounts (id, account, password) VALUES (2, 'admin', 'pass2');
INSERT INTO manager.accounts (id, account, password) VALUES (3, 'admin', 'pass3');
