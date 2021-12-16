CREATE DATABASE BookSalesManager 
GO

USE BookSalesManager
GO

CREATE TABLE Account(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	username VARCHAR(255) NOT NULL UNIQUE,
	password VARCHAR(15) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	permission BIT NOT NULL DEFAULT 0 --1:admin 0:customer
)
GO

CREATE TABLE Customer(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	fullname NVARCHAR(255) NOT NULL,
	email VARCHAR(50) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	address NVARCHAR(255) NOT NULL,
	account_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (account_id) REFERENCES Account (id)
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
	FOREIGN KEY (bookcategory_id) REFERENCES BookCategory (id)
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

CREATE TABLE Image(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL UNIQUE,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	book_id NUMERIC(19, 0)
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
	image_id NUMERIC(19, 0) NOT NULL DEFAULT 1, -- image default
	FOREIGN KEY (author_id) REFERENCES Author (id),
	FOREIGN KEY (bookgrenre_id) REFERENCES BookGrenre (id),
	FOREIGN KEY (supplier_id) REFERENCES Supplier (id),
	FOREIGN KEY (image_id) REFERENCES Image (id)
)
GO

ALTER TABLE Image ADD FOREIGN KEY (book_id) REFERENCES Book(id); 

CREATE TABLE Discount(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	name NVARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT GETDATE(),
	expired_at DATETIME NOT NULL DEFAULT DATEADD(MONTH, 1, GETDATE()), -- expire 1 month
	percent_sale float NOT NULL DEFAULT 10
)
GO

CREATE TABLE Book_Discounts(
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
	account_id NUMERIC(19, 0) NOT NULL,
	payment_id NUMERIC(19, 0) NOT NULL,
	shippingmethod_id NUMERIC(19, 0) NOT NULL,
	deliverystatus_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (account_id) REFERENCES Account (id),
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
	account_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (book_id) REFERENCES Book (id),
	FOREIGN KEY (account_id) REFERENCES Account (id)
)
GO

CREATE TABLE Order_Carts(
	id NUMERIC(19, 0) IDENTITY(1,1) PRIMARY KEY,
	quantity NUMERIC(19, 0) NOT NULL DEFAULT 1,
	order_id NUMERIC(19, 0) NOT NULL,
	cart_id NUMERIC(19, 0) NOT NULL,
	FOREIGN KEY (order_id) REFERENCES Orders (id),
	FOREIGN KEY (cart_id) REFERENCES Cart (id)
)
GO

INSERT INTO Account VALUES(N'admin', N'123456', DEFAULT, 1);

INSERT INTO Customer VALUES(N'Minh Phương', N'phuongdorc@gmail.com', N'0395682717', N'Long An', 1);

INSERT INTO BookCategory VALUES(N'Sách Kinh Tế - Kỹ Năng');--1
INSERT INTO BookGrenre VALUES(N'Kinh Tế - Chính Trị',1);
INSERT INTO BookGrenre VALUES(N'Sách Khởi Nghiệp',1);
INSERT INTO BookGrenre VALUES(N'Sách Tài Chính, Kế Toán',1);
INSERT INTO BookGrenre VALUES(N'Sách Quản Trị Nhân Sự',1);
INSERT INTO BookGrenre VALUES(N'Sách Kỹ Năng Làm Việc',1);
INSERT INTO BookGrenre VALUES(N'Nhân Vật - Bài Học Kinh Doanh',1);
INSERT INTO BookGrenre VALUES(N'Sách Quản Trị - Lãnh Đạo',1);
INSERT INTO BookGrenre VALUES(N'Sách Kinh Tế Học',1);
INSERT INTO BookGrenre VALUES(N'Sách Chứng Khoán - Bất Động Sản - Đầu Tư',1);
INSERT INTO BookGrenre VALUES(N'Sách Marketing - Bán Hàng',1);

INSERT INTO BookCategory VALUES(N'Nghệ Thuật Sống - Tâm Lý');--2
INSERT INTO BookGrenre VALUES(N'Sách Nghệ Thuật Sống',2);
INSERT INTO BookGrenre VALUES(N'Sách Tâm Lý',2);
INSERT INTO BookGrenre VALUES(N'Sách Hướng Nghiệp',2);
INSERT INTO BookGrenre VALUES(N'Sách Nghệ Thuật Sống Đẹp',2);
INSERT INTO BookGrenre VALUES(N'Sách Tư Duy',2);

INSERT INTO BookCategory VALUES(N'Sách Văn Học Việt Nam');--3
INSERT INTO BookGrenre VALUES(N'Truyện Ngắn - Tản Văn',3);
INSERT INTO BookGrenre VALUES(N'Tiểu Thuyết lịch Sử',3);
INSERT INTO BookGrenre VALUES(N'Phóng Sự - Ký Sự - Du ký - Tùy Bút',3);
INSERT INTO BookGrenre VALUES(N'Thơ',3);
INSERT INTO BookGrenre VALUES(N'Tiểu thuyết',3);
INSERT INTO BookGrenre VALUES(N'Tiểu sử - Hồi ký',3);
INSERT INTO BookGrenre VALUES(N'Phê Bình Văn Học',3);

INSERT INTO BookCategory VALUES(N'Sách Văn Học Nước Ngoài');--4
INSERT INTO BookGrenre VALUES(N'Văn Học Hiện Đại',4);
INSERT INTO BookGrenre VALUES(N'Tiểu Thuyết',4);
INSERT INTO BookGrenre VALUES(N'Truyện Trinh Thám',4);
INSERT INTO BookGrenre VALUES(N'Thần Thoại - Cổ Tích',4);
INSERT INTO BookGrenre VALUES(N'Văn Học Kinh Điển',4);
INSERT INTO BookGrenre VALUES(N'Sách Giả Tưởng - Kinh Dị',4);
INSERT INTO BookGrenre VALUES(N'Truyện Kiếm Hiệp',4);

INSERT INTO BookCategory VALUES(N'Sách Thiếu Nhi');--5
INSERT INTO BookGrenre VALUES(N'Mẫu Giáo',5);
INSERT INTO BookGrenre VALUES(N'Thiếu Niên',5);
INSERT INTO BookGrenre VALUES(N'Kiến Thức - Bách Khoa',5);
INSERT INTO BookGrenre VALUES(N'Truyện Cổ Tích',5);
INSERT INTO BookGrenre VALUES(N'Nhi Đồng',5);
INSERT INTO BookGrenre VALUES(N'Văn Học Thiếu Nhi',5);
INSERT INTO BookGrenre VALUES(N'Kỹ Năng Sống',5);
INSERT INTO BookGrenre VALUES(N'Truyện Tranh',5);

INSERT INTO BookCategory VALUES(N'Sách Giáo Dục - Gia Đình');--6
INSERT INTO BookGrenre VALUES(N'Giáo dục',6);
INSERT INTO BookGrenre VALUES(N'Thai Giáo',6);
INSERT INTO BookGrenre VALUES(N'Sách Dinh Dưỡng - Chăm Sóc Trẻ',6);
INSERT INTO BookGrenre VALUES(N'Ẩm Thực - Nấu Ăn',6);
INSERT INTO BookGrenre VALUES(N'Sách Tham Khảo',6);
INSERT INTO BookGrenre VALUES(N'Giới Tính',6);
INSERT INTO BookGrenre VALUES(N'Sách Làm Cha Mẹ',6);
INSERT INTO BookGrenre VALUES(N'Kiến Thức - Kỹ Năng Cho Trẻ',6);
INSERT INTO BookGrenre VALUES(N'Ngoại Ngữ - Từ Điển',6);

INSERT INTO BookCategory VALUES(N'Sách Lịch Sử');--7
INSERT INTO BookGrenre VALUES(N'Lịch Sử Việt Nam',7);
INSERT INTO BookGrenre VALUES(N'Lịch Sử Thế Giới',7);

INSERT INTO BookCategory VALUES(N'Sách Văn Hóa - Nghệ Thuật');--8
INSERT INTO BookGrenre VALUES(N'Văn Hóa',8);
INSERT INTO BookGrenre VALUES(N'Phong Tục Tập Quán',8);
INSERT INTO BookGrenre VALUES(N'Phong Thủy',8);
INSERT INTO BookGrenre VALUES(N'Nghệ Thuật',8);
INSERT INTO BookGrenre VALUES(N'Kiến Trúc',8);
INSERT INTO BookGrenre VALUES(N'Du Lịch',8);

INSERT INTO BookCategory VALUES(N'Sách Khoa Học - Triết Học');--9
INSERT INTO BookGrenre VALUES(N'Triết Học Phương Tây',9);	
INSERT INTO BookGrenre VALUES(N'Khoa Học Cơ Bản',9);
INSERT INTO BookGrenre VALUES(N'Minh Tiết Phương Đông',9);

INSERT INTO BookCategory VALUES(N'Sách Tâm Linh - Tôn Giáo');--10

INSERT INTO BookCategory VALUES(N'Sách Y Học - Thực Dưỡng');--11
INSERT INTO BookGrenre VALUES(N'Chăm Sóc Sức Khỏe',11);
INSERT INTO BookGrenre VALUES(N'Y Học',11);
INSERT INTO BookGrenre VALUES(N'Thiền - Yoga',11);
INSERT INTO BookGrenre VALUES(N'Thực Dưỡng',11);
INSERT INTO BookGrenre VALUES(N'Đông Y - Cổ Truyền',11);

INSERT INTO BookCategory VALUES(N'Các Loại Sách Khác');--12

<<<<<<< HEAD
INSERT INTO Image VALUES(N'default.jpg', DEFAULT, NULL);
INSERT INTO Image VALUES(N'NhaGiaKim.jpg', DEFAULT, 1);
INSERT INTO Image VALUES(N'NhaGiaKim_01.jpg', DEFAULT, 1);
INSERT INTO Image VALUES(N'NhaGiaKim_02.jpg', DEFAULT, 1);
=======
<<<<<<< HEAD
INSERT INTO Image VALUES(N'default.jpg', DEFAULT, NULL);

INSERT INTO Author VALUES(N'Paulo Coelho');

INSERT INTO Supplier VALUES(N'NXB Hội Nhà Văn', N'Hà Nội', DEFAULT, 'nxbhnv@gmail.com', '0384032', DEFAULT);

INSERT INTO Book VALUES(N'Nhà Giả Kim', N'', DEFAULT, 50000, 400, 200, 67000, 1, 20, 1, DEFAULT);

INSERT INTO Cart VALUES(DEFAULT, 5, 1, 1);

=======
INSERT INTO Image VALUES(N'default.jpg', DEFAULT, NULL)
>>>>>>> refs/remotes/origin/main

<<<<<<< HEAD
=======
>>>>>>> 2f6af7fc3bcdf5009bd9e1e86a184ac5003cb289
INSERT INTO Account VALUES(N'admin', N'123456', DEFAULT, 1);
>>>>>>> refs/remotes/origin/main

INSERT INTO Author VALUES(N'Paulo Coelho');

INSERT INTO Supplier VALUES(N'NXB Hội Nhà Văn', N'Hà Nội', DEFAULT, 'nxbhnv@gmail.com', '0384032', DEFAULT);

INSERT INTO Book VALUES(N'Nhà Giả Kim', N'', DEFAULT, 50000, 400, 200, 67000, 1, 20, 1, DEFAULT);

INSERT INTO Cart VALUES(DEFAULT, 5, 1, 1);
