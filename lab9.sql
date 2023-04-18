use QLBanHang
go
---cau1---
go
create trigger trg_Nhap
on Nhap
for insert
as
begin
declare @masp nvarchar(10), @manv nvarchar(10)
declare @sln int, @dgn float 
select @masp=masp, @manv=manv, @sln=soluongN, @dgn=dongian from inserted
if(not exists(select * from sanpham where masp = @masp))
begin
raiserror(N'Không tồn tại sản phẩm trong danh mục sản phẩm',16,1)
rollback transaction
end
else
if(not exists(select * from nhanvien where manv= @manv))
begin
raiserror(N'Không tồn tại nhân viên có mã này',16,1)
rollback transaction
end
else
if(@sln<=0 or @dgn<=0)
begin
raiserror(N'Nhập sai soluong hoặc dongia', 16, 1) rollback transaction
end
else
update Sanpham set soluong = soluong + @sln
from sanpham where masp = @masp
end
---cau2---

---cau3---

---cau4---

---cau5---

---cau6---

