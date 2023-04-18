use QLBanHang
go
***bai1***
GO
CREATE PROC bai1(@masp nvarchar(10), @tensp nvarchar(20), @tenhang nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money,  @donvitinh nvarchar(10), @mota nvarchar(30), @flag int)
AS
IF @flag = 0
BEGIN
IF @tenhang NOT IN (SELECT mahangsx FROM Sanpham )
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
IF @soluong < 0 
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
ELSE
BEGIN
INSERT INTO Sanpham(masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES(@masp, @tenhang, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
END
RAISERROR (N'Ma loi 0',16,1)
END
ELSE
BEGIN
IF @tenhang NOT IN (SELECT mahangsx FROM Sanpham )
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
IF @soluong < 0 
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
ELSE
BEGIN
UPDATE Sanpham SET mahangsx = @tenhang, tensp = @tensp, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
WHERE masp = @masp
END
END
GO
exec bai1 012315444,'galaxya20','samsung',50,'xanhla',100.000,'chiec','tam nen ips'
***bai2***
GO
CREATE PROC bai2(@masp nvarchar(10), @tensp nvarchar(20), @tenhang nvarchar(20), @soluong int, @mausac nvarchar(10), @giaban money,  @donvitinh nvarchar(10), @mota nvarchar(30), @flag int)
AS
IF @flag = 0
BEGIN
IF @tenhang NOT IN (SELECT mahangsx FROM Sanpham )
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
IF @soluong < 0 
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
IF @tenhang IN (SELECT mahangsx FROM Sanpham) AND @soluong > 0
BEGIN
INSERT INTO Sanpham(masp, mahangsx, tensp, soluong, mausac, giaban, donvitinh, mota)
VALUES(@masp, @tenhang, @tensp, @soluong, @mausac, @giaban, @donvitinh, @mota)
RAISERROR (N'Ma loi 0',16,1)
END
END
ELSE
BEGIN
IF @tenhang NOT IN (SELECT mahangsx FROM Sanpham )
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
IF @soluong < 0 
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
ELSE
BEGIN
UPDATE Sanpham SET mahangsx = @tenhang, tensp = @tensp, soluong = @soluong, mausac = @mausac, giaban = @giaban, donvitinh = @donvitinh, mota = @mota
WHERE masp = @masp
RAISERROR (N'Ma loi 0',16,1)
END
END
GO
exec bai2
***bai3***
GO
CREATE PROC bai3 (@manv nvarchar(10))
AS
	IF @manv IN (SELECT Manv FROM Nhanvien)
	BEGIN
		DELETE FROM Nhanvien WHERE manv = @manv
		DELETE FROM Nhap WHERE manv = @manv
		DELETE FROM Xuat WHERE manv = @manv
		RAISERROR(N'Ma loi 0',16,1)
	END
	ELSE 
	BEGIN
		RAISERROR (N'Ma loi 1',16,1)
		ROLLBACK TRAN
	END
GO
***bai4***

***bai5***
GO
CREATE PROC bai5(@shdn nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngaynhap date, @soluongN int, @dongiaN money)
AS
IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien)
BEGIN
IF @shdn IN (SELECT Sohdn FROM Nhap)
BEGIN
UPDATE Nhap SET masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
WHERE Sohdn = @shdn
RAISERROR (N'Ma loi 0',16,1)
END
ELSE
BEGIN
INSERT INTO Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
VALUES (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
RAISERROR (N'Ma loi 0',16,1)
END
END
ELSE
BEGIN
IF @masp NOT IN (SELECT masp FROM Sanpham) OR @manv NOT IN (SELECT manv FROM Nhanvien)
BEGIN
IF @masp NOT IN (SELECT masp FROM Sanpham)
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
ELSE
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
END
END
GO
***bai6***
GO
CREATE PROC bai6(@shdn nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngaynhap date, @soluongN int, @dongiaN money)
AS
IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien)
BEGIN
IF @shdn IN (SELECT Sohdn FROM Nhap)
BEGIN
UPDATE Nhap SET masp = @masp, manv = @manv, Ngaynhap = @ngaynhap, soluongN = @soluongN, dongiaN = @dongiaN
WHERE Sohdn = @shdn
RAISERROR (N'Ma loi 0',16,1)
END
ELSE
BEGIN
INSERT INTO Nhap(Sohdn, masp, manv, Ngaynhap, soluongN, dongiaN)
VALUES (@shdn, @masp, @manv, @ngaynhap, @soluongN, @dongiaN)
RAISERROR (N'Ma loi 0',16,1)
END
END
ELSE
BEGIN
IF @masp NOT IN (SELECT masp FROM Sanpham) OR @manv NOT IN (SELECT manv FROM Nhanvien)
BEGIN
IF @masp NOT IN (SELECT masp FROM Sanpham)
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
ELSE
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
END
END
GO
***bai7***
GO
CREATE PROC Xuathang12(@shdx nvarchar(10), @masp nvarchar(10), @manv nvarchar (10), @ngayxuat date, @soluongX int)
AS
IF @masp IN (SELECT masp FROM Sanpham) AND @manv IN (SELECT Manv FROM Nhanvien) AND @soluongX <= (SELECT TOP 1 soluong FROM Sanpham)	
BEGIN
IF @shdx IN (SELECT Sohdx FROM Xuat)
BEGIN
UPDATE Xuat SET masp = @masp, manv = @manv, Ngayxuat = @ngayxuat, soluongX = @soluongX
WHERE Sohdx = @shdx
END
ELSE
BEGIN
INSERT INTO Xuat(Sohdx, masp, manv, Ngayxuat, soluongX)
VALUES (@shdx, @masp, @manv, @ngayxuat, @soluongX)
RAISERROR (N'Ma loi 0',16,1)
END
END
ELSE
BEGIN
IF @masp NOT IN(SELECT masp FROM Sanpham) OR @manv NOT IN (SELECT manv FROM Nhanvien) OR @soluongX >= (SELECT TOP 1 soluong FROM Sanpham)	
BEGIN
IF @masp NOT IN(SELECT masp FROM Sanpham)
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
IF @manv NOT IN (SELECT manv FROM Nhanvien)
BEGIN
RAISERROR (N'Ma loi 2',16,1)
ROLLBACK TRAN
END
ELSE
BEGIN
RAISERROR (N'Ma loi 1',16,1)
ROLLBACK TRAN
END
END
END
GO

