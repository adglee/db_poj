SET FOREIGN_KEY_CHECKS=0;
SET AUTOCOMMIT = 0;

/*Table to store information about cafe customers */
CREATE OR REPLACE TABLE Customers (
    idCustomer INT AUTO_INCREMENT NOT NULL,
    fName varchar(50) NOT NULL,
    lName varchar(50) NOT NULL,
    email varchar (200) NOT NULL,
    custPhone varchar(10) NOT NULL,
    creditCard varchar(15) NOT NULL,
    custAddress varchar(200) NOT NULL,
    custCity varchar(50) NOT NULL,
    custState varchar(2) NOT NULL,
    custZip int NOT NULL,
    PRIMARY KEY (idCustomer)
);

/* Table to store information about the orders customers make */
CREATE OR REPLACE TABLE Orders (
    idOrder int AUTO_INCREMENT NOT NULL,
    customersIdCustomer int NOT NULL,
    locationsIdLocation int NOT NULL,
    date datetime NOT NULL,
    totalSale decimal(19,2) NOT NULL,
    PRIMARY KEY (idORder),
    FOREIGN KEY (customersIdCustomer) REFERENCES Customers(idCustomer),
    FOREIGN KEY (locationsIdLocation) REFERENCES Locations(idLocation)
);

/* Table to store the products available at cafes */
CREATE OR REPLACE TABLE Products (
    idProduct int AUTO_INCREMENT NOT NULL,
    name varchar(50) NOT NULL,
    costPrice decimal(19,2) NOT NULL,
    salesPrice decimal(19,2) NOT NULL,
    kcal int NOT NULL,
    PRIMARY KEY (idProduct)
);

/* Table to store information on all the cafe locations */
CREATE OR REPLACE TABLE Locations (
    idLocation int AUTO_INCREMENT NOT NULL,
    locAddress varchar(50) NOT NULL,
    locCity varchar(50) NOT NULL,
    locState varchar(2) NOT NULL,
    locZip int NOT NULL,
    locPhone varchar(10) NOT NULL,
    PRIMARY KEY(idLocation)
);

/* Intersection table for the M:N relationship between Orders and Products */
CREATE OR REPLACE TABLE OrdersHasProducts (
    idOrdersHasProduct int AUTO_INCREMENT NOT NULL,
    ordersIdOrder int NOT NULL,
    productsIdProduct int NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY(idOrdersHasProduct),
    FOREIGN KEY (ordersIdOrder) references Orders (idOrder),
    FOREIGN KEY (productsIdProduct) references Products (idProduct)
);

/* Intersection table for the M:N relationship between Products and Locations*/
CREATE OR REPLACE TABLE ProductsHasLocations (
    idProductsHasLocation int AUTO_INCREMENT NOT NULL,
    productsIdProduct int NOT NULL,
    locationsIdLocation int NOT NULL,
    quantity int NOT NULL,
    PRIMARY KEY(idProductsHasLocation),
    FOREIGN KEY (locationsIdLocation) references Locations (idLocation),
    FOREIGN KEY (productsIdProduct) references Products (idProduct)
);


/*From here down its all just populating the tables with example data */
INSERT INTO Customers(idCustomer, fName, lName, email, custPhone, creditCard, 
custAddress, custCity, custState, custZip)
VALUES(1, 'Trevor', 'Jensen', 'tjen@gmail.com', '1112223333', '123789000000000', 
'4023 Happy Hollow Road', 'Fayetteville', 'NC', 28301),
(2, 'Brandie', 'Chandler', 'bchandler@yahoo.com', '2223334444', '789456000000000',
'1784 Heliport Loop', 'Seymour', 'IN', 47274),
(3, 'Sofia', 'Hickman', 'shickman@live.com', '3334445555', '456124000000000',
'1221 Fannie Street', 'Houston', 'TX', 77060);

INSERT INTO Orders(idOrder, date, totalSale, customersIdCustomer, locationsIdLocation)
VALUES(1, '2023-10-25', 5, 1, 2),
(2, '2023-10-25', 8, 3, 1),
(3, '2023-10-26', 3.95, 2, 2),
(4, '2023-10-26', 9.25, 1, 3);

INSERT INTO Products(idProduct, name, costPrice, salesPrice, kcal)
VALUES(1, 'espresso', 0.25, 2.75, 10),
(2, 'latte', 0.35, 4.75, 190),
(3, 'iced coffee', 0.2, 3.95, 80),
(4, 'cupcake', 0.5, 3.25, 130),
(5, 'macaron', 0.75, 2.25, 43);

INSERT INTO Locations(idLocation, locAddress, locCity, locState, locZip, locPhone)
VALUES(1, '4005 University Street', 'Burien', 'WA', 98168, '2061234567'),
(2, '878 Elliot Avenue', 'Seattle', 'WA', 98115, '5641234567'),
(3, '2412 Mutton Town Road', 'Seattle', 'WA', 98161, '3601234567');

INSERT INTO OrdersHasProducts(idOrdersHasProduct, ordersIdOrder, productsIdProduct, quantity)
VALUES(1, 1, 1, 1),
(2, 1, 5, 1),
(3, 2, 2, 1),
(4, 2, 4, 1),
(5, 3, 3, 1),
(6, 4, 2, 1),
(7, 4, 5, 2);

INSERT INTO ProductsHasLocations(idProductsHasLocation, productsIdProduct, locationsIdLocation, quantity)
VALUES(1, 1, 1, 100),
(2, 2, 1, 100),
(3, 3, 1, 100),
(4, 4, 1, 50),
(5, 5, 1, 100),
(6, 1, 2, 100),
(7, 2, 2, 100),
(8, 3, 2, 100),
(9, 4, 2, 50),
(10, 5, 2, 100),
(11, 1, 3, 100),
(12, 2, 3, 100),
(13, 3, 3, 100),
(14, 4, 3, 50),
(15, 5, 3, 100);


SET FOREIGN_KEY_CHECKS=1;
COMMIT;