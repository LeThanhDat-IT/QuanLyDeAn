use QuanLyDeAn
go
select*
from PHONGBAN
--1. Cho biết danh sách các nhân viên gồm mã nhân viên, họ và tên nhân viên (được
--ghép từ 3 trường honv, tenlot, tennv) và tên phòng ban mà các nhân viên đó làm
--việc.
select concat(honv,tenlot,tennv)as 'Họ và tên',TENPHG
from NHANVIEN NV, PHONGBAN PB
where NV.PHONG=PB.MAPHG

--2. Cho biết tên các đề án mà nhân viên Đinh Bá Tiến tham gia.
select concat(honv,tenlot,tennv)as 'Họ và tên',TENDA
from NHANVIEN nv, DEAN da
where HONV=N'Đinh' and TENLOT=N'Bá' and TENNV=N'Tiến' 

--3. Tìm tên những nhân viên, tên người thân, ngày sinh và tuổi của thân nhân với
--điều kiện tuổi của thân nhân <=15. Săp xếp giảm dần theo tuổi.
select concat(honv,tenlot,tennv) as 'Họ và tên',TENTN, DATEDIFF(year,ngaysinh,getdate()) as tuoi
from NHANVIEN nv, THANNHAN tn
where DATEDIFF(year,ngaysinh,getdate()) <=15
order by tuoi desc
--4. Với mỗi đề án ở Hà Nội, cho biết tên đề án, tên phòng ban, họ tên và ngày nhận
--chức của trưởng phòng của phòng ban chủ trì đề án đó.
select tenda,tenphg,concat(honv,tenlot,tennv) as 'Họ và tên',ng_nhanchuc
from DEAN da join PHONGBAN pb on da.PHONG = pb.MAPHG
			 join NHANVIEN nv on nv.PHONG = pb.MAPHG
where DDIEM_DA=N'Hà Nội'

--5. Cho biết mã đề án, tên đề án, tên công viêc, tên nhân viên được phân công cho
--các đề án do phòng 'Nghiên cứu' phụ trách. Sắp xếp tăng dần theo mã đề án, tên
--công việc.
select mada,tenda,TEN_CONG_VIEC,concat(honv,tenlot,tennv) as 'Họ và tên'
from NHANVIEN nv join PHONGBAN pb on nv.PHONG = pb.MAPHG
				 join DEAN da on da.PHONG = pb.MAPHG	
				 join CONGVIEC cv on cv.SODA = da.MADA
where TENPHG=N'Nghiên cứu'
order by mada,ten_cong_viec asc

--6. Cho biết danh sách các nhân viên chưa có thông tin thân nhân. (HD: dùng phép
--kết left join hoặc right join)
select concat(honv,tenlot,tennv) as 'Họ và tên',TENTN
from NHANVIEN nv left join THANNHAN tn on nv.manv = tn.ma_nvien
where tentn is null
--7. Cho biết danh sách các nhân viên chưa được phân công đề án làm việc.
select honv,tenlot,tennv
from NHANVIEN nv join PHANCONG pc on nv.manv = pc.MA_NVIEN		
				 join CONGVIEC cv on cv.soda = pc.mada
where ten_cong_viec is null
--Bài 4: Ngôn ngữ SQL (DML) – Truy vấn dữ liệu cơ bản (tiếp theo)

--Khoa CNTT – Trường ĐH Công Nghệ Sài Gòn Trang 68

--8. Cho biết danh sách các đề án có địa điểm đề án trùng với địa điểm của phòng
--ban phụ trách đề án đó. Thông tin hiển thị gồm: tên đề án, địa điểm đề án, tên
--phòng phụ trách đề án, địa điểm phòng, họ tên trưởng phòng.
select tenda, ddiem_da,tenphg,ddiem,concat(honv,tenlot,tennv) as 'Họ và tên'
from DEAN da join PHONGBAN pb on da.phong = pb.maphg		
			 join DDIEMPHG dd on dd.maphg = pb.maphg
			 join NHANVIEN nv on nv.phong = pb.maphg
where DDIEM_DA=DDIEM and TRUONGPHG=MANV

--9. Cho biết danh sách các đề án ở cùng mộ-t địa điểm và do cùng một phòng ban
--chủ trì (Lưu ý: Nếu thông tin hiển thị bị trùng lắp thì sv tìm cách xử lý để bỏ bớt
--các dòng dữ liệu trùng lắp với nhau)
select distinct MADA,TENDA,DDIEM_DA,DDIEM,TENPHG
from DEAN da join PHONGBAN pb on da.phong = pb.maphg
			 join DDIEMPHG dd on dd.maphg = pb.maphg
			 join NHANVIEN nv on nv.phong = pb.maphg
where DDIEM_DA=DDIEM
--10. Cho biết danh sách các nhân viên thuộc cùng 1 phòng ban được phân công
--vào cùng 1 đề án và làm cùng 1 công việc. Thông tin hiển thị gồm: Manv, họ tên
--NV, tên phòng ban, mã đề án, tên công việc.
select manv,concat(honv,tenlot,tennv) as 'Họ và tên', tenphg,mada,ten_cong_viec
from NHANVIEN nv join PHONGBAN pb on nv.PHONG = pb.MAPHG
				 join DEAN da on da.PHONG=pb.MAPHG
				 join CONGVIEC cv on cv.SODA = da.MADA
--11. Với mỗi nhân viên, cho biết họ tên nhân viên và họ tên người quản lý trực tiếp
--của nhân viên đó.
select CONCAT(NV2.HONV,NV2.TENLOT,NV2.TENNV) as 'Họ tên NV', CONCAT(NV1.HONV,NV1.TENLOT,NV1.TENNV) as 'Họ tên NQL'
from NHANVIEN NV1 right join NHANVIEN NV2 on NV1.MANV=NV2.MA_NQL
--12. Tên những nhân viên phòng số 5 có tham gia vào đề án "Sản phẩm X" và nhân
--viên này do "Nguyễn Thanh Tùng" quản lý trực tiếp.
select distinct CONCAT(NV1.HONV,NV1.TENLOT,NV1.TENNV) as 'họ tên nv',nv.phong,tenda,CONCAT(NV2.HONV,NV2.TENLOT,NV2.TENNV) as Ho_Ten_NQL
from NHANVIEN NV join PHONGBAN pb on pb.maphg=nv.phong
				 join DEAN da on pb.maphg=da.phong ,NHANVIEN NV1 join NHANVIEN NV2 on NV2.MANV=NV1.MA_NQL
where NV.PHONG='005' and TENDA=N'Sản phẩm X' and NV2.HONV=N'Nguyễn' and NV2.TENLOT=N'Thanh' and NV2.TENNV=N'Tùng'
--13. Với mỗi nhân viên, cho biết họ tên của nhân viên đó, họ tên người trưởng
--phòng và họ tên người quản lý trực tiếp của nhân viên đó.
select distinct CONCAT(NV1.HONV,NV1.TENLOT,NV1.TENNV) as 'họ tên nv',CONCAT(NV2.HONV,NV2.TENLOT,NV2.TENNV) as Ho_Ten_NQL,CONCAT(NV.HONV,NV.TENLOT,NV.TENNV) as Ho_ten_TRGPHOG
from NHANVIEN nv1 join NHANVIEN nv2 on nv2.manv = nv1.ma_nql,
	 NHANVIEN nv join PHONGBAN pb on pb.maphg =nv.phong
where NV.MANV=PB.TRUONGPHG and NV2.PHONG=PB.MAPHG
	 