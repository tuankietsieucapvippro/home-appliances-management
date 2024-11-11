create database QLDoGiaDung_TuanKiet
use QLDoGiaDung_TuanKiet

-- Bảng SanPham
CREATE TABLE SanPham (
    MaSanPham varchar(50) PRIMARY KEY,
    TenSanPham NVARCHAR(255) NOT NULL,
    GiaTien MONEY,
	MaLoaiSanPham varchar(20),
	MaNhaSanXuat varchar(20),
	SoLuong int,
	Anh nvarchar(100),
	GhiChu nvarchar(max),
	KichThuocKhoiLuong nvarchar(255),
    NamSanXuat int,
	MaMau varchar(20),
	MaXuatXu varchar(20),
	ChatLieu nvarchar(100),
    CONSTRAINT CK_SanPham_GiaTien CHECK (GiaTien >= 0),
	CONSTRAINT CK_SanPham_SoLuong CHECK (SoLuong >= 0)
);

-- Bảng XuatXu
CREATE TABLE XuatXu (
    MaXuatXu varchar(20) PRIMARY KEY,
    TenXuatXu NVARCHAR(255) NOT NULL,
	Anh nvarchar(100)
);

-- Bảng Mau
CREATE TABLE Mau (
    MaMau varchar(20) PRIMARY KEY,
    TenMau NVARCHAR(255) NOT NULL,
	Anh nvarchar(100)
);

-- Bảng NhaSanXuat
CREATE TABLE NhaSanXuat (
    MaNhaSanXuat varchar(20) PRIMARY KEY,
    TenNhaSanXuat NVARCHAR(255) NOT NULL,
	Anh nvarchar(100),
	GhiChu nvarchar(max)
);

-- Bảng LoaiSanPham
CREATE TABLE LoaiSanPham (
    MaLoaiSanPham varchar(20) PRIMARY KEY,
    TenLoaiSanPham NVARCHAR(255) NOT NULL,
	Anh nvarchar(100),
	GhiChu nvarchar(max)
);


-- Thêm khóa ngoại cho cột MaLoaiSanPham
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_LoaiSanPham
FOREIGN KEY (MaLoaiSanPham)
REFERENCES LoaiSanPham(MaLoaiSanPham);

-- Thêm khóa ngoại cho cột MaNhaSanXuat
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_NhaSanXuat
FOREIGN KEY (MaNhaSanXuat)
REFERENCES NhaSanXuat(MaNhaSanXuat);

-- Thêm khóa ngoại cho cột MaMau
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_Mau
FOREIGN KEY (MaMau)
REFERENCES Mau(MaMau);

-- Thêm khóa ngoại cho cột MaXuatXu
ALTER TABLE SanPham
ADD CONSTRAINT FK_SanPham_XuatXu
FOREIGN KEY (MaXuatXu)
REFERENCES XuatXu(MaXuatXu);
