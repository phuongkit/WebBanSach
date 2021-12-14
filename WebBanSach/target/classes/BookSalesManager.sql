﻿CREATE DATABASE BookSalesManager 
GO

USE BookSalesManager
GO

CREATE TABLE Customer(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	fullname NVARCHAR(255) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	address NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE Account(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	password VARCHAR(15) NOT NULL,
	customer_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES Customer (id)
)
GO

CREATE TABLE Author(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE BookCategory(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE BookGrenre(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
	bookcategory_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (bookcategory_id) REFERENCES BookGrenre (id)
)
GO

CREATE TABLE Supplier(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
	address NVARCHAR(255) NOT NULL,
	branch_number NVARCHAR(255) NOT NULL DEFAULT N'Chi nhánh 1',
	email VARCHAR(255) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	trust_level NVARCHAR(255) NOT NULL DEFAULT N'Bình thường'
)
GO

CREATE TABLE Book(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
	description NVARCHAR(500) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	purchase_price NUMERIC(19, 0) NOT NULL,
	quantity_available NUMERIC(19, 0) NOT NULL,
	quantity_sold NUMERIC(19, 0) NOT NULL,
	sale_price NUMERIC(19, 0) NOT NULL,
	author_id NUMERIC(19, 0) NOT NULL,
	bookgrenre_id NUMERIC(19, 0) NOT NULL,
	supplier_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (author_id) REFERENCES Author (id),
	FOREIGN KEY (bookgrenre_id) REFERENCES BookGrenre (id),
	FOREIGN KEY (supplier_id) REFERENCES Supplier (id)
)
GO

CREATE TABLE Image(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	book_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (book_id) REFERENCES Book (id)
)
GO

CREATE TABLE Discount(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
	created_at DATETIME NULL DEFAULT GETDATE(),
	expired_at DATETIME NULL DEFAULT DATEADD(MONTH, 1, GETDATE()),
	percent_sale float NOT NULL DEFAULT 10
)
GO

CREATE TABLE book_discounts(
	book_id NUMERIC(19, 0) NOT NULL,
	discount_id NUMERIC(19, 0) NOT NULL,
	PRIMARY KEY (book_id, discount_id),
	FOREIGN KEY (book_id) REFERENCES Book(id),
	FOREIGN KEY (discount_id) REFERENCES Discount(id)
)
GO

CREATE TABLE DeliveryStatus(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE Payment(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE ShippingMethod(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL
)
GO

CREATE TABLE Orders(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	delivery_fullname NVARCHAR(255) NOT NULL,
	delivery_phone VARCHAR(15) NOT NULL,
	delivery_address NVARCHAR(255) NOT NULL,
	customer_id NUMERIC(19, 0) NOT NULL,
	payment_id NUMERIC(19, 0) NOT NULL,
	shippingmethod_id NUMERIC(19, 0) NOT NULL,
	deliverystatus_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (payment_id) REFERENCES Payment (id),
	FOREIGN KEY (shippingmethod_id) REFERENCES ShippingMethod (id),
	FOREIGN KEY (deliverystatus_id) REFERENCES DeliveryStatus (id)
)
GO

CREATE TABLE Cart(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	quantity NUMERIC(19, 0) NOT NULL DEFAULT 1,
	book_id NUMERIC(19, 0) NOT NULL,
	customer_id NUMERIC(19, 0) NOT NULL,
	order_id NUMERIC(19, 0) DEFAULT 0,
	FOREIGN KEY (book_id) REFERENCES Book (id),
	FOREIGN KEY (customer_id) REFERENCES Customer (id),
	FOREIGN KEY (order_id) REFERENCES Orders (id)
)
GO