
--tao database, chi chay lan dau
CREATE DATABASE QuanLyTapHoa
GO
--chọn database
USE QuanLyTapHoa
GO
-- xoa cac bang cũ trong database , lan dau chay thi comment lai
DROP TABLE dbo.tbl_Contain
DROP TABLE dbo.tbl_SanPham
DROP TABLE dbo.tbl_LoaiSanPham
DROP TABLE dbo.tbl_HoaDon
DROP TABLE dbo.tbl_User
GO
--tạo các bảng
CREATE TABLE dbo.tbl_User(
	id int IDENTITY(1,1) PRIMARY KEY,
    userName varchar(20) NOT NULL ,
    password varchar(30) NOT NULL,
    isAdmin bit DEFAULT(0),
    UNIQUE(userName)
)
GO
CREATE TABLE dbo.tbl_HoaDon(
	id int IDENTITY(1,1) PRIMARY KEY,
	idUser int NOT NULL,
	ngayTao date,
	trangThaiThanhToan bit DEFAULT(0),
	FOREIGN KEY (idUser) REFERENCES tbl_User (id)
	 	
)
GO
CREATE TABLE dbo.tbl_LoaiSanPham(
	id int IDENTITY(1,1) PRIMARY KEY,
	ten nvarchar(50)
)
GO
CREATE TABLE dbo.tbl_SanPham(
	id int IDENTITY(1,1) PRIMARY KEY,
	ten nvarchar(100) NOT NULL,
	giaNhap money NOT NULL,
	giaBan money NOT NULL,
	nhaSanXuat nvarchar(50),
	hanSuDung date NOT NULL,
	soLuong int NOT NULL,
	idLoaiSanPham int NOT NULL,
	moTa nvarchar(100),
	FOREIGN KEY (idLoaiSanPham) REFERENCES tbl_LoaiSanPham (id)
	
)
GO
CREATE TABLE dbo.tbl_Contain(
	idHoaDon int NOT NULL,
	idSanPham int NOT NULL,
	soLuong int NOT nULL,
	CONSTRAINT pk_Contain PRIMARY KEY (idHoaDon,idSanPham),
    FOREIGN KEY (idHoaDon) REFERENCES tbl_HoaDon (id),
    FOREIGN KEY (idSanPham) REFERENCES tbl_SanPham (id)
)
GO

-- ADD RECORD
INSERT INTO dbo.tbl_User
    VALUES('demo','demo',''),
          ('admin','admin','1');
GO
INSERT INTO dbo.tbl_LoaiSanPham
	VALUES(N'Thực Phẩm'),
			(N'Mỹ Phẩm'),
			(N'Văn phòng Phẩm'),
			(N'Đồ sinh hoạt cá nhân'),
			(N'Các đồ dùng khác');

GO
INSERT INTO dbo.tbl_HoaDon
	VALUES(1,GETDATE(),'');
GO
INSERT INTO dbo.tbl_SanPham
	VALUES(N'Kem đánh răng thường',20000,30000,N'made in china','2020-10-10',30,4,N'Hàng kém chất lượng càng đánh răng càng đen');
GO
INSERT INTO dbo.tbl_Contain
	VALUES	(1,1,5);
	
--CHECK
SELECT * FROM dbo.tbl_User
SELECT * FROM dbo.tbl_LoaiSanPham
SELECT * FROM dbo.tbl_HoaDon
SELECT * FROM dbo.tbl_SanPham
SELECT * FROM dbo.tbl_Contain