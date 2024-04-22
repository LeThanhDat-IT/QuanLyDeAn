use master
go
if exists (select name from sysdatabases where name='QuanLyDeAn')
	drop database QuanLyDeAn
go
create database QuanLyDeAn
go
USE QuanLyDeAn
GO
/****** Object:  Table [dbo].[CONGVIEC]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONGVIEC](
	[SODA] [int] NOT NULL,
	[STT] [int] NOT NULL,
	[TEN_CONG_VIEC] [nchar](50) NULL,
 CONSTRAINT [PK_CongViec] PRIMARY KEY CLUSTERED 
(
	[SODA] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DDIEMPHG]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DDIEMPHG](
	[MAPHG] [int] NOT NULL,
	[DDIEM] [nchar](15) NOT NULL,
 CONSTRAINT [PK_DDPHG] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC,
	[DDIEM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DEAN]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEAN](
	[TENDA] [nchar](15) NULL,
	[MADA] [int] NOT NULL,
	[DDIEM_DA] [nchar](15) NULL,
	[PHONG] [int] NULL,
 CONSTRAINT [PK_DeAn] PRIMARY KEY CLUSTERED 
(
	[MADA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NHANVIEN](
	[HONV] [nchar](15) NOT NULL,
	[TENLOT] [nchar](15) NOT NULL,
	[TENNV] [nchar](15) NOT NULL,
	[MANV] [char](9) NOT NULL,
	[NGSINH] [datetime] NULL,
	[DCHI] [nchar](30) NULL,
	[PHAI] [nchar](3) NULL,
	[LUONG] [float] NULL,
	[MA_NQL] [char](9) NULL,
	[PHONG] [int] NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHANCONG]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHANCONG](
	[MA_NVIEN] [char](9) NOT NULL,
	[MADA] [int] NOT NULL,
	[STT] [int] NOT NULL,
	[THOIGIAN] [float] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[MADA] ASC,
	[STT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PHONGBAN]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PHONGBAN](
	[TENPHG] [nchar](15) NULL,
	[MAPHG] [int] NOT NULL,
	[TRUONGPHG] [char](9) NULL,
	[NG_NHANCHUC] [datetime] NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MAPHG] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[THANNHAN]    Script Date: 24/05/2020 10:41:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[THANNHAN](
	[MA_NVIEN] [char](9) NOT NULL,
	[TENTN] [nchar](15) NOT NULL,
	[PHAI] [nchar](3) NULL,
	[NGAYSINH] [datetime] NULL,
	[QUANHE] [nchar](15) NULL,
 CONSTRAINT [PK_ThanNhan] PRIMARY KEY CLUSTERED 
(
	[MA_NVIEN] ASC,
	[TENTN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (1, 1, N'Thiết Kế Sản Phẩm X                               ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (1, 2, N'Thí Nghiệm Sản Phẩm X                             ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (2, 1, N'Sản Xuất Sản Phẩm Y                               ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (2, 2, N'Quảng Cáo Sản Phẩm Y                              ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (3, 1, N'Khuyến Mãi Sản Phẩm Z                             ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (10, 1, N'Tin Học Hóa Nhân Sự                               ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (10, 2, N'Tin Học Hóa Phòng Kinh Doanh                      ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (20, 1, N'Lắp Ðặt Cáp Quang                                 ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (30, 1, N'Ðào Tạo Nhân Viên Marketing                       ')
INSERT [dbo].[CONGVIEC] ([SODA], [STT], [TEN_CONG_VIEC]) VALUES (30, 2, N'Ðào Tạo Chuyên Viên Thiết Kế                      ')
INSERT [dbo].[DDIEMPHG] ([MAPHG], [DDIEM]) VALUES (1, N'TP HCM         ')
INSERT [dbo].[DDIEMPHG] ([MAPHG], [DDIEM]) VALUES (4, N'Hà Nội         ')
INSERT [dbo].[DDIEMPHG] ([MAPHG], [DDIEM]) VALUES (5, N'NHA TRANG      ')
INSERT [dbo].[DEAN] ([TENDA], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Sản Phẩm X     ', 1, N'Vũng Tàu       ', 5)
INSERT [dbo].[DEAN] ([TENDA], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Sản Phẩm Y     ', 2, N'Nha Trang      ', 5)
INSERT [dbo].[DEAN] ([TENDA], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Sản Phẩm Z     ', 3, N'Nha Trang      ', 5)
INSERT [dbo].[DEAN] ([TENDA], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Tin Học Hóa    ', 10, N'Hà Nội         ', 4)
INSERT [dbo].[DEAN] ([TENDA], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Cáp Quang      ', 20, N'TP HCM         ', 1)
INSERT [dbo].[DEAN] ([TENDA], [MADA], [DDIEM_DA], [PHONG]) VALUES (N'Ðào Tạo        ', 30, N'TP HCM         ', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Lê             ', N'Quỳnh          ', N'Như            ', N'001      ', CAST(0x00005FB600000000 AS DateTime), N'291 Hồ Văn Huê, TP HCM        ', N'Nữ ', 4300000, N'006      ', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Trần           ', N'Thanh          ', N'Tâm            ', N'003      ', CAST(0x000051CE00000000 AS DateTime), N'34 Mai Thị Lự, TP HCM         ', N'Nam', 2500000, N'005      ', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Nguyễn         ', N'Mạnh           ', N'Hùng           ', N'004      ', CAST(0x00005FD500000000 AS DateTime), N'95 Bà Rịa, Vũng Tàu           ', N'Nam', 3800000, N'005      ', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Nguyễn         ', N'Thanh          ', N'Tùng           ', N'005      ', CAST(0x0000595C00000000 AS DateTime), N'222 Nguyễn Văn Cừ, TP HCM     ', N'Nam', 4000000, N'006      ', 5)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Phạm           ', N'Văn            ', N'Vinh           ', N'006      ', CAST(0x00005CBD00000000 AS DateTime), N'45 Trưng Vương,Hà Nội         ', N'Nam', 5500000, NULL, 1)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Bùi            ', N'Ngọc           ', N'Hằng           ', N'007      ', CAST(0x00004D5000000000 AS DateTime), N'332 Nguyễn Thái Học, TP HCM   ', N'Nữ ', 2500000, N'001      ', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Trần           ', N'Hồng           ', N'Quang          ', N'008      ', CAST(0x0000608A00000000 AS DateTime), N'80 Lê Hồng Phong, TP HCM      ', N'Nam', 2500000, N'001      ', 4)
INSERT [dbo].[NHANVIEN] ([HONV], [TENLOT], [TENNV], [MANV], [NGSINH], [DCHI], [PHAI], [LUONG], [MA_NQL], [PHONG]) VALUES (N'Đinh           ', N'Bá             ', N'Tiến           ', N'009      ', CAST(0x000055C300000000 AS DateTime), N'119 Cống Quỳnh, TP HCM        ', N'Nam', 3000000, N'005      ', 5)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'001      ', 20, 1, 15)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'001      ', 30, 1, 20)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'003      ', 1, 2, 20)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'003      ', 2, 1, 20)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'004      ', 3, 1, 40)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'005      ', 3, 1, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'005      ', 10, 2, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'005      ', 20, 1, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'006      ', 20, 1, 30)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'007      ', 10, 2, 10)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'007      ', 30, 2, 30)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'008      ', 10, 1, 35)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'008      ', 30, 2, 5)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'009      ', 1, 1, 32)
INSERT [dbo].[PHANCONG] ([MA_NVIEN], [MADA], [STT], [THOIGIAN]) VALUES (N'009      ', 2, 2, 8)
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRUONGPHG], [NG_NHANCHUC]) VALUES (N'Quản Lý        ', 1, N'006      ', CAST(0x000066B200000000 AS DateTime))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRUONGPHG], [NG_NHANCHUC]) VALUES (N'Ðiều Hành      ', 4, N'001      ', CAST(0x0000794600000000 AS DateTime))
INSERT [dbo].[PHONGBAN] ([TENPHG], [MAPHG], [TRUONGPHG], [NG_NHANCHUC]) VALUES (N'Nghiên Cứu     ', 5, N'005      ', CAST(0x000070A000000000 AS DateTime))
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'001      ', N'Minh           ', N'Nam', CAST(0x00005FD000000000 AS DateTime), N'Vợ Chồng       ')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'005      ', N'Khang          ', N'Nam', CAST(0x00009E1A00000000 AS DateTime), N'Con Trai       ')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'005      ', N'Phương         ', N'Nữ ', CAST(0x0000617F00000000 AS DateTime), N'Vợ Chồng       ')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'005      ', N'Trinh          ', N'Nữ ', CAST(0x0000A47100000000 AS DateTime), N'Con Gái        ')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'009      ', N'Châu           ', N'Nữ ', CAST(0x0000A6EC00000000 AS DateTime), N'Con Gái        ')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'009      ', N'Phương         ', N'Nữ ', CAST(0x00005D3900000000 AS DateTime), N'Vợ Chồng       ')
INSERT [dbo].[THANNHAN] ([MA_NVIEN], [TENTN], [PHAI], [NGAYSINH], [QUANHE]) VALUES (N'009      ', N'Tiến           ', N'Nam', CAST(0x0000946100000000 AS DateTime), N'Con Trai       ')
ALTER TABLE [dbo].[CONGVIEC]  WITH CHECK ADD  CONSTRAINT [FK_CongViec] FOREIGN KEY([SODA])
REFERENCES [dbo].[DEAN] ([MADA])
GO
ALTER TABLE [dbo].[CONGVIEC] CHECK CONSTRAINT [FK_CongViec]
GO
ALTER TABLE [dbo].[DDIEMPHG]  WITH CHECK ADD  CONSTRAINT [FK_DDPHG] FOREIGN KEY([MAPHG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DDIEMPHG] CHECK CONSTRAINT [FK_DDPHG]
GO
ALTER TABLE [dbo].[DEAN]  WITH CHECK ADD  CONSTRAINT [FK_DeAn] FOREIGN KEY([PHONG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[DEAN] CHECK CONSTRAINT [FK_DeAn]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK1_NhanVien] FOREIGN KEY([MA_NQL])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK1_NhanVien]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK2_NhanVien] FOREIGN KEY([PHONG])
REFERENCES [dbo].[PHONGBAN] ([MAPHG])
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK2_NhanVien]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK1_PhanCong] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK1_PhanCong]
GO
ALTER TABLE [dbo].[PHANCONG]  WITH CHECK ADD  CONSTRAINT [FK2_PhanCong] FOREIGN KEY([MADA], [STT])
REFERENCES [dbo].[CONGVIEC] ([SODA], [STT])
GO
ALTER TABLE [dbo].[PHANCONG] CHECK CONSTRAINT [FK2_PhanCong]
GO
ALTER TABLE [dbo].[PHONGBAN]  WITH CHECK ADD  CONSTRAINT [FK_PhongBan] FOREIGN KEY([TRUONGPHG])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[PHONGBAN] CHECK CONSTRAINT [FK_PhongBan]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [FK_ThanNhan] FOREIGN KEY([MA_NVIEN])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [FK_ThanNhan]
GO
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [C_PHAI_NHANVIEN] CHECK  (([PHAI]=N'Nữ' OR [PHAI]=N'Nam'))
GO
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [C_PHAI_NHANVIEN]
GO
ALTER TABLE [dbo].[THANNHAN]  WITH CHECK ADD  CONSTRAINT [C_PHAI_THANNHAN] CHECK  (([PHAI]=N'Nữ' OR [PHAI]=N'Nam'))
GO
ALTER TABLE [dbo].[THANNHAN] CHECK CONSTRAINT [C_PHAI_THANNHAN]