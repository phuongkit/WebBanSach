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

CREATE PROCEDURE sp_setImageDefaultofBook(@nameBook NVARCHAR(255),@nameImage NVARCHAR(255) )
AS
BEGIN
	DECLARE @image_id NUMERIC(19, 0)
	SELECT @image_id = id FROM Image WHERE name = @nameImage
	IF @image_id IS NULL
	BEGIN
		PRINT N'Không tìm thấy ảnh'
		ROLLBACK
	END
	UPDATE Book SET image_id = @image_id WHERE name = @nameBook
END
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


INSERT INTO Author VALUES(N'Paulo Coelho');
INSERT INTO Author VALUES(N'Brian Finch');

INSERT INTO Supplier VALUES(N'NXB Hội Nhà Văn', N'Hà Nội', DEFAULT, 'nxbhnv@gmail.com', '0384032', DEFAULT);
INSERT INTO Supplier VALUES(N'Nhà Xuất Bản Thanh Niên', N'Hà Nội', DEFAULT, 'nxbtn@gmail.com', '0384032', DEFAULT);

INSERT INTO Book VALUES(N'Nhà Giả Kim', N'', DEFAULT, 50000, 400, 200, 67000, 1, 20, 1, DEFAULT);
INSERT INTO Book VALUES(N'Lập Kế Hoạch Kinh Doanh Hiệu Quả', N'Khi bắt đầu thành lập doanh nghiệp hay mở rộng quy mô hoạt động, lập ra một bản kế hoạch kinh doanh là bước đi đầu tiên không thể thiếu. Bản kế hoạch kinh doanh càng được chuẩn bị kỹ lưỡng và lôi cuốn bao nhiêu, cơ hội ghi điểm trước các nhà đầu tư càng lớn bấy nhiêu.', DEFAULT, 100000, 300, 100, 120000, 2, 1, 2, DEFAULT);

INSERT INTO Image VALUES(N'default.jpg', DEFAULT, NULL);
INSERT INTO Image VALUES(N'NhaGiaKim.jpg', DEFAULT, 1);
INSERT INTO Image VALUES(N'NhaGiaKim_01.jpg', DEFAULT, 1);
INSERT INTO Image VALUES(N'NhaGiaKim_02.jpg', DEFAULT, 1);
INSERT INTO Image VALUES(N'lap-ke-hoach-kinh-doanh-hieu-qua.jpg', DEFAULT, 2);
INSERT INTO Image VALUES(N'lap-ke-hoach-kinh-doanh-hieu-qua-ms.jpg', DEFAULT, 2);
INSERT INTO Image VALUES(N'lap-ke-hoach-kinh-doanh-hieu-qua-mt.jpg', DEFAULT, 2);

EXEC sp_setImageDefaultofBook N'Nhà Giả Kim', N'NhaGiaKim.jpg';
EXEC sp_setImageDefaultofBook N'Lập Kế Hoạch Kinh Doanh Hiệu Quả', N'lap-ke-hoach-kinh-doanh-hieu-qua.jpg';

INSERT INTO Cart VALUES(DEFAULT, 5, 1, 1);

INSERT INTO Author VALUES(N'Riichiro Inagaki');
INSERT INTO Supplier VALUES(N'NXB Kim Đồng', N'Hà Nội', DEFAULT, 'nxbkd@gmail.com', '056462', DEFAULT);
INSERT INTO Book VALUES(N'Dr.STONE - Tập 10: Đôi Cánh Của Nhân Loại', N'', DEFAULT, 20000, 100, 150, 25000, 3, 37, 3, DEFAULT);
INSERT INTO Image VALUES(N'dr.-stone---tap-10.jpg', DEFAULT, 3);
INSERT INTO Image VALUES(N'dr._stone_-_tap_10.jpg', DEFAULT, 3);
EXEC sp_setImageDefaultofBook N'Dr.STONE - Tập 10: Đôi Cánh Của Nhân Loại', N'dr.-stone---tap-10.jpg';

INSERT INTO Author VALUES(N'Tomohito Oda');
INSERT INTO Book VALUES(N'Komi - Nữ Thần Sợ Giao Tiếp - Tập 2', N'', DEFAULT, 20000, 100, 150, 25000, 4, 37, 3, DEFAULT);
INSERT INTO Image VALUES(N'komi_-nu-than-so-giao-tiep---tap-2.jpg', DEFAULT, 4);
INSERT INTO Image VALUES(N'komi__nu_than_so_giao_tiep_-_tap_2', DEFAULT, 4);
EXEC sp_setImageDefaultofBook N'Komi - Nữ Thần Sợ Giao Tiếp - Tập 2', N'komi_-nu-than-so-giao-tiep---tap-2.jpg';


INSERT INTO Author VALUES(N'Mario Puzo');
INSERT INTO Supplier VALUES(N'NXB Dân Trí', N'Hà Nội', DEFAULT, 'nxbdt@gmail.com', '0534542', DEFAULT);
INSERT INTO Book VALUES(N'Bố Già (Đông A)', N'', DEFAULT, 80000, 150, 100, 88000, 6, 20, 5, DEFAULT);
INSERT INTO Image VALUES(N'8936071673381.jpg', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_1-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_2-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_3-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_4-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_5-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_6-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_7-390x510.gif', DEFAULT, 6);
INSERT INTO Image VALUES(N'2019_09_19_10_59_54_8-390x510.gif', DEFAULT, 6);
EXEC sp_setImageDefaultofBook N'Bố Già (Đông A)', N'8936071673381.jpg';

INSERT INTO Author VALUES(N'Nguyễn Nhật Ánh');
INSERT INTO Supplier VALUES(N'NXB Trẻ', N'Hà Nội', DEFAULT, 'nxbt@gmail.com', '042344542', DEFAULT);
INSERT INTO Book VALUES(N'Con Chim Xanh Biếc Bay Về', N'', DEFAULT, 100000, 150, 100, 112000, 7, 20, 6, DEFAULT);
INSERT INTO Image VALUES(N'biamem.jpg', DEFAULT, 7);
INSERT INTO Image VALUES(N'con_chim_xanh_bia_mem_bia_1.jpg', DEFAULT, 7);
INSERT INTO Image VALUES(N'con_chim_xanh_bia_mem_3d.jpg', DEFAULT, 7);
INSERT INTO Image VALUES(N'con_chim_xanh_biec_bay_ve_bia-mem.jpg', DEFAULT, 7);
EXEC sp_setImageDefaultofBook N'Con Chim Xanh Biếc Bay Về', N'biamem.jpg';

INSERT INTO Book VALUES(N'Mắt Biếc', N'', DEFAULT, 100000, 150, 100, 112000, 7, 20, 6, DEFAULT);
INSERT INTO Image VALUES(N'mat-biec_bia-mem_in-lan-thu-44.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'mat_biec_bia_mem_1.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'mat_biec_bia_mem_2.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_2-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_3-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_4-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_5-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_6-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_7-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_8-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_9-390x510.jpg', DEFAULT, 8);
INSERT INTO Image VALUES(N'2019_11_05_09_36_21_10-390x510.jpg', DEFAULT, 8);
EXEC sp_setImageDefaultofBook N'Mắt Biếc', N'mat-biec_bia-mem_in-lan-thu-44.jpg';

INSERT INTO Book VALUES(N'Cảm Ơn Người Lớn', N'', DEFAULT, 80000, 100, 90, 110000, 7, 20, 6, DEFAULT);
INSERT INTO Image VALUES(N'cam_on_nguoi_lon_bia_mem_1_2018_11_15_13_40_08.jpg', DEFAULT, 9);
EXEC sp_setImageDefaultofBook N'Cảm Ơn Người Lớn', N'cam_on_nguoi_lon_bia_mem_1_2018_11_15_13_40_08.jpg';

INSERT INTO Author VALUES(N'Sumino Yoru');
INSERT INTO Book VALUES(N'Tớ Muốn Ăn Tụy Của Cậu', N'', DEFAULT, 80000, 150, 100, 96000, 8, 20, 1, DEFAULT);
INSERT INTO Image VALUES(N'to_muon_an_tuy_cua_cau_1_2018_08_07_11_02_04.jpg', DEFAULT, 10);
EXEC sp_setImageDefaultofBook N'Tớ Muốn Ăn Tụy Của Cậu', N'to_muon_an_tuy_cua_cau_1_2018_08_07_11_02_04.jpg';

INSERT INTO Author VALUES(N'Vũ Trọng Phụng');
INSERT INTO Supplier VALUES(N'NXB Văn Học', N'Hà Nội', DEFAULT, 'nxbvh@gmail.com', '054354542', DEFAULT);
INSERT INTO Book VALUES(N'Số Đỏ', N'', DEFAULT, 100000, 150, 100, 112000, 9, 20, 7, DEFAULT);
INSERT INTO Image VALUES(N'image_220968.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'8935095630752.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'bia_sodo3b4.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'2021_05_10_08_08_57_1-390x510.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'2021_05_10_08_08_57_2-390x510.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'2021_05_10_08_08_57_3-390x510.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'2021_05_10_08_08_57_4-390x510.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'2021_05_10_08_08_57_5-390x510.jpg', DEFAULT, 11);
INSERT INTO Image VALUES(N'2021_05_10_08_08_57_6-390x510.jpg', DEFAULT, 11);
EXEC sp_setImageDefaultofBook N'Số Đỏ', N'image_220968.jpg';

INSERT INTO Author VALUES(N'Dazai Osamu');
INSERT INTO Book VALUES(N'Chiếc Hộp Pandora', N'', DEFAULT, 70000, 150, 100, 90000, 10, 20, 1, DEFAULT);
INSERT INTO Image VALUES(N'image_228453.jpg', DEFAULT, 12);
EXEC sp_setImageDefaultofBook N'Chiếc Hộp Pandora', N'image_228453.jpg';

INSERT INTO Author VALUES(N'Jim Collins');
INSERT INTO Book VALUES(N'Từ Tốt Đến Vĩ Đại', N'', DEFAULT, 100000, 150, 100, 112000, 11, 6, 6, DEFAULT);
INSERT INTO Image VALUES(N'nxbtre_full_09462021_024609.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'nxbtre_full_09462021_024609_1.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'2021_05_14_14_13_53_1-390x510.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'2021_05_14_14_13_53_2-390x510.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'2021_05_14_14_13_53_3-390x510.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'2021_05_14_14_13_53_4-390x510.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'2021_05_14_14_13_53_5-390x510.jpg', DEFAULT, 13);
INSERT INTO Image VALUES(N'2021_05_14_14_13_53_6-390x510.jpg', DEFAULT, 13);
EXEC sp_setImageDefaultofBook N'Từ Tốt Đến Vĩ Đại', N'nxbtre_full_09462021_024609.jpg';

INSERT INTO Author VALUES(N'Napoleon Hill');
INSERT INTO Supplier VALUES(N'NXB Tổng Hợp TPHCM', N'TP HCM', DEFAULT, 'nxbth@gmail.com', '0843442', DEFAULT);
INSERT INTO Book VALUES(N'Nghĩ Giàu & Làm Giàu', N'', DEFAULT, 90000, 150, 100, 112000, 12, 2, 8, DEFAULT);
INSERT INTO Image VALUES(N'nghigiaulamgiau_110k-01_bia-1.jpg', DEFAULT, 14);
INSERT INTO Image VALUES(N'nghigiaulamgiau_110k-01_bia_2.jpg', DEFAULT, 14);
INSERT INTO Image VALUES(N'nghigiaulamgiau_110k-01_bia_sau.jpg', DEFAULT, 14);
INSERT INTO Image VALUES(N'20.6.26_nghi_giau_lam_giau_11k.jpg', DEFAULT, 14);
EXEC sp_setImageDefaultofBook N'Nghĩ Giàu & Làm Giàu', N'nghigiaulamgiau_110k-01_bia-1.jpg';


