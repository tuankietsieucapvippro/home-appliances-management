USE [QLDoGiaDung_TuanKiet]
GO
/****** Object:  Table [dbo].[LoaiSanPham]    Script Date: 11/11/2024 10:04:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSanPham](
	[MaLoaiSanPham] [varchar](20) NOT NULL,
	[TenLoaiSanPham] [nvarchar](255) NOT NULL,
	[Anh] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLoaiSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mau]    Script Date: 11/11/2024 10:04:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mau](
	[MaMau] [varchar](20) NOT NULL,
	[TenMau] [nvarchar](255) NOT NULL,
	[Anh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaSanXuat]    Script Date: 11/11/2024 10:04:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaSanXuat](
	[MaNhaSanXuat] [varchar](20) NOT NULL,
	[TenNhaSanXuat] [nvarchar](255) NOT NULL,
	[Anh] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaNhaSanXuat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 11/11/2024 10:04:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [varchar](50) NOT NULL,
	[TenSanPham] [nvarchar](255) NOT NULL,
	[GiaTien] [money] NULL,
	[MaLoaiSanPham] [varchar](20) NULL,
	[MaNhaSanXuat] [varchar](20) NULL,
	[SoLuong] [int] NULL,
	[Anh] [nvarchar](100) NULL,
	[GhiChu] [nvarchar](max) NULL,
	[KichThuocKhoiLuong] [nvarchar](255) NULL,
	[NamSanXuat] [int] NULL,
	[MaMau] [varchar](20) NULL,
	[MaXuatXu] [varchar](20) NULL,
	[ChatLieu] [nvarchar](100) NULL,
 CONSTRAINT [PK__SanPham__FAC7442D167030D3] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[XuatXu]    Script Date: 11/11/2024 10:04:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[XuatXu](
	[MaXuatXu] [varchar](20) NOT NULL,
	[TenXuatXu] [nvarchar](255) NOT NULL,
	[Anh] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaXuatXu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [Anh], [GhiChu]) VALUES (N'phongbep', N'Đồ gia dụng phòng bếp', N'phongbep.jpg', N'Đồ gia dụng nhà bếp là những đồ dùng phục vụ cho hoạt động nấu ăn, bảo quản thức ăn, ăn uống của gia đình như: 

Đồ dùng để sơ chế thức ăn: dao kéo, rổ rá, thớt
Đồ dùng để làm sạch thức ăn: chậu rửa chén, vòi nước rửa chén,...
Đồ dùng để làm chín thức ăn: bếp từ, bếp gas, máy hút mùi, lò vi sóng, xoong nồi, chảo,... 
Đồ dùng để làm nước uống: máy đánh trứng, máy xay sinh tố, máy ép hoa quả, ấm siêu tốc
Đồ dùng để bảo quản thức ăn: tủ lạnh
Đồ dùng để đựng thức ăn: bát chén, hộp inox, hộp nhựa, chai lọ,...
Ngoài ra, đồ gia dụng phòng bếp còn có các đồ dùng khác như giá để chén đĩa, hộp đựng gia vị, giấy ăn,.... 
Một gian bếp có đầy đủ đồ dùng sẽ giúp cho chị em nội trợ có thể tạo được những món ăn thơm ngon, gia đình có những giây phút quây quần bên mâm cơm đầm ấm sau ngày dài làm việc mệt mỏi. Nhất là trong cuộc sống hiện đại như ngày nay, gian bếp chính là nơi để gắn kết thêm tình cảm cùng những người thân yêu. 

Các đồ dùng tiếp xúc trực tiếp với các đồ ăn hàng ngày của gia đình nên bạn cần chọn những sản phẩm có chất liệu tốt, không độc hại như inox 304, inox 201, nhựa PP, gang, nhôm, đồng,... Cần tránh các đồ dùng bằng nhựa gây độc hại như nhựa số 3 và nhựa số 7. 
Ngoài ra, để bảo vệ sức khỏe, bạn có thể thay đổi và sử dụng các đồ dùng có nguồn gốc tự nhiên hoặc đồ dùng có thể tái sử dụng nhiều lần để hạn chế rác thải như: ống hút inox, ống hút giấy, nước rửa chén organic có thể refill sau khi sử dụng hết. ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [Anh], [GhiChu]) VALUES (N'phongkhach', N'Đồ gia dụng phòng khách', N'phongkhach.png', N'Có thể nói, không gian phòng khách chính là bộ mặt của các gia đình bởi đây là nơi đón tiếp những người khách quan trọng khi ghé thăm gia đình. Các đồ gia dụng phòng khách thường là các vật dụng có vai trò trang trí và sử dụng như: 

- Bộ bàn ghế, ấm chén, khay nước, máy lọc nước, tivi,... 
- Thảm lau chân, đèn chùm trang trí, bình hoa, các bức tranh hoặc ảnh gia đình,... 

Việc lựa chọn các đồ gia dụng trong phòng khách cần có sự thống nhất về màu sắc và phong cách thiết kế để đảm bảo tính thẩm mỹ. ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [Anh], [GhiChu]) VALUES (N'phongngu', N'Đồ gia dụng phòng ngủ', N'phongngu.jpg', N'Phòng ngủ sẽ bao gồm các đồ gia dụng sau: 

Đồ dùng để chứa đựng: tủ quần áo, bàn trang điểm, tủ sách, kệ tivi
Đồ dùng để trang trí: gương, tranh ảnh, nến thơm, thảm, đèn ngủ, rèm,... 
Đồ dùng để phục vụ cho giấc ngủ: chăn ga gối đệm, giường, màn
Phòng ngủ là nơi riêng tư để thư giãn thoải mái nhất sau mỗi ngày làm việc nên các đồ dùng cũng cần chọn lựa kỹ lưỡng về chất liệu và tính thẩm mỹ để có một giấc ngủ ngon. Các đồ dùng trong phòng cũng cần được sắp xếp hợp lý để tạo nên sự ngăn nắp, tiện lợi nhất. ')
INSERT [dbo].[LoaiSanPham] ([MaLoaiSanPham], [TenLoaiSanPham], [Anh], [GhiChu]) VALUES (N'phongtam', N'Đồ gia dụng phòng tắm', N'phongtam.jpg', N'Để biết thêm đồ gia dụng là gì, bạn đọc thêm các đồ dùng gia dụng phòng tắm sẽ bao gồm: 

Máy giặt, móc treo đồ, giá treo khăn mặt, bồn cầu, gương, các thiết bị vệ sinh như vòi hoa sen, bồn rửa mặt,... 
Ngoài ra còn có các đồ dùng để phục vụ cho mục đích vệ sinh như dầu gội, sữa tắm, bàn chải đánh răng, kem đánh răng, giấy vệ sinh, bột giặt, nước lau sàn, nước tẩy rửa, khăn tắm, khăn mặt,...
Phòng tắm là khu vực tiếp xúc với nước thường xuyên nên sẽ có độ ẩm cao, dễ bị ẩm mốc nên chúng ta cần sắp xếp đồ dùng một cách hợp lý và ngăn nắp: các chai lọ nên đặt trên giá, quần áo khăn tắm khi sử dụng xong thì treo gọn gàng ở những vị trí không tiếp xúc với nước để hạn chế vi khuẩn, nấm mốc phát triển. 

Ngoài ra, chúng ta cũng cần thường xuyên vệ sinh đồ gia dụng phòng tắm để hạn chế mùi, ố vàng, cặn bẩn trên tường, sàn nhà và các thiết bị vệ sinh. 

Để đảm bảo an toàn, các đồ dùng sử dụng điện trong phòng tắm cần được đặt riêng biệt để hạn chế tình trạng chập cháy, hở điện, giật điện. ')
GO
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'bacinox', N'Màu bạc inox', N'maubacinox.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'cam', N'Màu cam', N'maucam.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'den', N'Màu đen', N'mauden.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'do', N'Màu đỏ', N'maudo.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'hong', N'Màu hồng', N'mauhong.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'kem', N'Màu kem', N'maukem.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'nau', N'Màu nâu', N'maunau.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'tim', N'Màu tím', N'mautim.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'trang', N'Màu trắng', N'mautrang.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'vang', N'Màu vàng', N'mauvang.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'xam', N'Màu xám', N'mauxam.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'xanhla', N'Màu xanh lá', N'mauxanhla.jpg')
INSERT [dbo].[Mau] ([MaMau], [TenMau], [Anh]) VALUES (N'xanhnuoc', N'Màu xanh nước biển', N'mauxanhnuocbien.jpg')
GO
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'ava', N'AVA', N'ava.png', N'- Thương hiệu độc quyền của Công ty Cổ phần Thế Giới Di Động, được thành lập từ năm 2018. - Các sản phẩm của AVA đa dạng bao gồm: sạc dự phòng, cáp sạc, máy xay, máy ép, nồi chiên không dầu,... và được sản xuất tại Trung Quốc. Sản phẩm của AVA đã được phân phối sang hầu hết các nước tại Châu Á.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'bluestone', N'BlueStone', N'bluestone.png', N'- Thương hiệu của Singapore.
- Thành lập năm 1995.
- BlueStone nổi tiếng với các nhóm sản phẩm trong căn bếp người dùng như nồi áp suất, máy làm sữa đậu nành, máy xay sinh tố...
- Áp dụng công nghệ và thiết kế của Mỹ, BlueStone mang đến những sản phẩm chất lượng, kiểu dáng sang trọng, hiện đại cùng nhiều tính năng thông minh, đáp ứng nhu cầu sử dụng cho người dùng.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'bosch', N'Bosch', N'bosch.png', N'- Thương hiệu Đức.- Ra đời năm 1886 tại Stuttgart bởi Robert Bosch.- Là một tập đoàn dịch vụ và sản xuất toàn cầu với nhiều công ty con, chi nhánh và các đại diện ở nước ngoài.- Bosch bắt đầu hoạt động tại Việt Nam năm 1994 có các mặt hàng như máy giặt, máy rửa chén, các dụng cụ cầm tay như máy khoan, máy cắt, máy rửa xe,... được sản xuất và nhập khẩu từ Ấn độ, Đức,...')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'deerma', N'Deerma', N'deerma.png', N'- Thương hiệu Trung Quốc.

- Thành lập năm 2012.

- Deerma được biết đến với nhiều sản phẩm gia dụng thông minh, hiện đại máy hút bụi, robot hút bụi, máy lọc không khí,… làm sạch không khí trong gia đình.

- Sản phẩm của Deerma được tin dùng hầu hết tại Mỹ, Châu Âu, Hàn Quốc, Nhật Bản, Brazil và các nước Trung Đông.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'dreame', N'Dreame', N'dreame.png', N'- Thương hiệu của Trung Quốc.

- Được thành lập vào năm 2015.

- Dreame Technology chuyên nghiên cứu và phát triển các thiết bị gia dụng thông minh nhằm giúp người tiêu dùng toàn cầu dễ dàng tiếp cận lối sống lành mạnh và thông minh: robot hút bụi, máy hút bụi.

- Tại VN hiện nay Dreame đang đứng thứ 3 với thị phần >10% chỉ sau 6 tháng ra mắt (Theo thống kê GFK từ tháng 1 - 9/2021) và đang tăng trưởng liên tục trong các tháng 10 - 12 của năm 2021.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'ferroli', N'Ferroli', N'ferroli.png', N'- Thương hiệu Ý.
- Thành lập: năm 1955. Sản phẩm được bán tại hơn 120 quốc gia.
- Năm 2005, tập đoàn mở rộng thị trường tại châu Á và thành lập công ty TNHH Ferroli Indochina và có nhà máy sản xuất ở Việt Nam.
- Ferroli được xem như là “ngân hàng nhiệt của thế giới”, một nhà tiên phong đi đầu trong công nghệ về nhiệt.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'hafele', N'Hafele', N'hafele.png', N'- Thương hiệu Đức.- Thành lập năm 1923. Đến Việt Nam vào năm 1998.  - Với những thành công trong lĩnh vực phụ kiện nội thất, phụ kiện công trình cao cấp và hệ thống khóa điện tử tiên tiến, thiết bị nhà bếp sang trọng.- Các sản phẩm của Hafele được phát triển bằng công nghệ của Đức và theo tiêu chuẩn chất lượng Đức, đem lại tính năng vượt trội để mang đến cho khách hàng sự dễ dàng và hiệu quả.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'hoaphat', N'Hòa Phát', N'hoaphat.png', N'- Thương hiệu Hoà Phát được thành lập vào tháng 10/2021, có cơ sở sản xuất tại Thái Lan và Việt Nam. 

- Có kinh nghiệm sản xuất công nghiệp 30 năm bền vững, chủ trương mang đến các sản phẩm chất lượng với giá thành hợp lý.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'kangaroo', N'Kangaroo', N'kangaroo.png', N'- Thương hiệu Việt Nam.

- Thành lập 2003. Các sản phẩm Kangaroo hướng đến phục vụ sức khỏe và tiện nghi cuộc sống như máy lọc nước, hàng gia dụng - nhà bếp và các thiết bị điện tiêu dùng khác.

- "Không đối đầu mà luôn đi trước đón đầu" là tiêu chí trong hoạt động sản xuất và kinh doanh của Kangaroo. Đến nay, với những sáng chế và giải pháp hữu ích như công nghệ tạo nước Hydrogen trong máy lọc nước, công nghệ kháng khuẩn được áp dụng trong các thiết bị gia đình.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'karofi', N'Karofi', N'karofi.png', N'- Thương hiệu Việt Nam.

- Thành lập 04/2012.
- Karofi được biết đến nhiều với nhóm sản phẩm máy lọc nước, cây nước nóng lạnh áp dụng công nghệ hiện đại, đáp ứng nhu cầu sử dụng nước sạch của người tiêu dùng,...
- Với phương châm luôn đi tiên phong trong công nghệ, Karofi đã cho ra đời dòng máy lọc nước thông minh iRO với bộ vi xử lý thông minh - đây là phát minh đột phá lần đầu tiên xuất hiện tại Việt Nam.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'mutosi', N'Mutosi', N'mutosi.png', N'- Thương hiệu Việt Nam.

- Thành lập 10/10/2018.

- Mutosi là nhà sản xuất và phân phối trong ngành công nghiệp gia dụng và môi trường, với sứ mệnh trở thành công ty hàng đầu trong việc nâng cao sức khỏe của con người thông qua việc cải thiện chất lượng ăn uống và hít thở.

- Đội ngũ lãnh đạo có kinh nghiệm 10 năm trong ngành chăm sóc môi trường với nhóm ngành chủ đạo là lọc nước gia đình và công nghiệp. Hệ thống Quản lý chất lượng đạt Tiêu chuẩn ISO 9001:2005, đồng thời tham chiếu Tiêu chuẩn JIS S 3242 Nhật Bản trong Quản trị sản xuất. ')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'panasonic', N'Panasonic', N'panasonic.png', N'- Thương hiệu Nhật Bản.
- Thành lập năm 1918.
- Panasonic nổi tiếng với các sản phẩm tủ lạnh, máy lạnh, tivi và các thiết bị gia dụng như lò vi sóng, quạt, máy xay sinh tố,...
- Các sản phẩm Panasonic nổi tiếng với độ bền cao, tiết kiệm điện, mẫu mã đẹp.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'philips', N'Philips', N'philips.png', N'- Philips là thương hiệu gia dụng lâu đời của Hà Lan.
- Thương hiệu ra đời từ năm 1891, Philips không ngừng mở rộng và phát triển. Đến nay, các sản phẩm của Philips đã có mặt ở hơn 100 quốc gia và vùng lãnh thổ khắp hành tinh.
- Sản phẩm của Philips đa dạng từ gia dụng, phụ kiện chăm sóc sức khoẻ cá nhân đến các thiết bị đèn chiếu sáng, các thiết bị camera cho ôtô, tivi và âm thanh,...
- Bề dày kinh nghiệm lâu năm, Philips tự tin luôn mang đến các sản phẩm có chất lượng cao đến khách hàng.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'pramie', N'Pramie', N'pramie.png', N'- Pramie là thương hiệu chuyên về thiết bị gia dụng cao cấp đến từ Đức.

- Các sản phẩm gia dụng của Pramie đều được sản xuất tại Malaysia, Thái Lan không chỉ đảm bảo về mẫu mã mà còn đảm bảo về chất lượng sản phẩm.

- Đồ gia dụng chủ yếu của Pramie là bếp từ, máy hút mùi, lò nướng, lò vi sóng,...')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'rapido', N'Rapido', N'rapido.png', N'- Thương hiệu Đức.

- Thành lập năm 2001.

- Rapido được biết đến với những sản phẩm gia dụng, máy nước nóng, thiết bị bếp, máy hút bụi,...

- Rapido luôn đi tiên phong về công nghệ và nắm bắt xu thế của khách hàng. Tất cả các sản phẩm của Rapido đều được sản xuất theo tiêu chuẩn chất lượng Châu Âu đảm bảo chất lượng cao. Với tôn chỉ đặt sự tiện dụng của khách hàng lên hàng đầu, tất cả cán bộ công nhân viên Rapido đang ngày giờ cố gắng đem đến những sản phẩm chất lượng cao, dịch vụ tốt nhất tới khách hàng.

- Tất cả các sản phẩm của Rapido đều được khách hàng đón nhận và đánh giá cao. Rapido có hệ thống phân phối sản phẩm rộng khắp đến từng xã bản trên toàn quốc vì vậy sản phẩm của Rapido phổ biến ở mọi nơi.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'robot', N'ROBOT', N'robot.png', N'- Thương hiệu Việt Nam.

- Thành lập năm 1990.

- Robot là thương hiệu hàng đầu trong ngành sản xuất thiết bị điện tử tại Việt Nam, với các dòng sản phẩm: ổn áp, thiết bị điện, dây cáp điện,… luôn đảm bảo tiêu chí AN TOÀN ĐIỆN. Năm 2002, cho ra mắt dòng sản phẩm máy lọc nước ROBOT.

- Robot được công nhận là Thương Hiệu Quốc Gia năm 2008. Robot cũng là đơn vị đầu tiên trong ngành tại Việt Nam đạt chứng nhận CE Marketing (Hợp chuẩn châu Âu) dành cho Dây Cáp Điện năm 2010 và liên tục được người tiêu dùng bình chọn là Hàng Việt Nam Chất Lượng Cao từ năm 2000 đến nay. ')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'samsung', N'Samsung', N'samsung.png', N'- Samsung là thương hiệu điện tử toàn cầu của tập đoàn Samsung.

- Công ty TNHH Samsung Electronics Việt Nam được thành lập vào năm 2007.

- Các sản phẩm của Samsung đa dạng từ điện thoại đến các thiết bị gia dụng, điện tử như tivi, dàn âm thanh và còn có cả máy lạnh.

- Tại Samsung, mọi hoạt động đều xuất phát từ lòng đam mê và cam kết không ngừng nghỉ đạt chất lượng hoàn hảo trong mọi sản phẩm và dịch vụ.
- Cung cấp các sản phẩm và dịch vụ thoả mãn nhu cầu và kỳ vọng khách hàng luôn là một trong những điều quan trọng nhất tại Samsung.

- Với thế mạnh là thương hiệu của tập đoàn toàn cầu, chất lượng của sản phẩm luôn đạt mức hoàn thiện cao nhất, chế độ bảo hành tốt nên được khách hàng tin tưởng trên toàn thế giới.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'sharp', N'Sharp', N'sharp.png', N'- Thương hiệu Nhật Bản.

- Thành lập năm 1912.

- Sharp nổi tiếng với các sản phẩm tivi, tủ lạnh, nồi cơm điện, máy lạnh, lò vi sóng,...

- Các sản phẩm của Sharp nổi tiếng với độ bền, giá cả phải chăng, thiết kế đẹp mắt.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'sunhouse', N'Sunhouse', N'sunhouse.png', N'- Thương hiệu Việt Nam, có vốn liên doanh của Hàn Quốc năm 2010.
- Thành lập năm 2000.
- Được đại đa số người dùng biết đến với hơn 450 nhóm sản phẩm về điện gia dụng, đồ dùng trong gia đình như Bếp gas, bếp điện, nồi, chảo, nồi cơm điện, ấm bình điện,...
- Sản phẩm của Sunhouse chiếm được tình cảm của người Việt với giá thành phải chăng, đảm bảo chất lượng, thiết kế và mẫu mã đa dạng đáp ứng mọi đối tượng sử dụng.')
INSERT [dbo].[NhaSanXuat] ([MaNhaSanXuat], [TenNhaSanXuat], [Anh], [GhiChu]) VALUES (N'tefal', N'Tefal', N'tefal-asia.png', N'- Thương hiệu Pháp.
- Thành lập 1956.
- Tefal được biết đến với các thiết bị điện gia đình như nồi cơm điện, máy xay sinh tố, máy làm sữa hạt, quạt, bàn ủi, nồi, chảo chống dính...
- Sản phẩm của Tefal được sản xuất tại Pháp, Trung Quốc, Việt Nam.')
GO
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N' FVC-600H', N'Máy hút bụi cầm tay Ferroli FVC-600H', 690000.0000, N'phongkhach', N'ferroli', 2, N'sp46.jpg', NULL, N'Ngang 24 cm - Cao 109 cm - Sâu 13.3 cm - Nặng 1.6 kg', 2022, N'den', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'510X', N'Máy lọc nước điện giải ion kiềm nóng nguội Robot IonSmart 510X 2 lõi 5 tấm điện cực', 16330000.0000, N'phongbep', N'robot', 33, N'sp36.jpg', NULL, N'Ngang 32 cm - Cao 35.5 cm - Sâu 24.3 cm - Nặng 10 kg', 2022, N'den', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'AC0850', N'Máy lọc không khí Philips AC0850/20 20W', 3190000.0000, N'phongngu', N'philips', NULL, N'sp22.jpg', NULL, N'Ngang 21.3 cm - Cao 36.3 cm - Sâu 24.5 cm - Nặng 4.13 kg', 2022, N'trang', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'AJ02', N'Máy ép trái cây AVA AJ02', 750000.0000, N'phongbep', N'ava', 7, N'sp2.jpg', NULL, N'Ngang 28 cm - Cao 33 cm - Sâu 19.2 cm', 2021, N'xam', N'trungquoc', N'Thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'AX32BG3100GBSV', N'Máy lọc không khí Samsung AX32BG3100GBSV 41W', 4790000.0000, N'phongngu', N'samsung', 3, N'sp33.jpg', NULL, N'Ngang 34.9 cm - Cao 49.9 cm - Sâu 23.6 cm - Nặng 6.9 kg', 2022, N'trang', N'thailan', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'CHB-5149', N'Máy xay thịt BlueStone CHB-5149', 690000.0000, N'phongbep', N'bluestone', 1, N'sp31.jpg', NULL, N'Ngang 22 cm - Sâu 22 cm - Cao 26.5 cm - Nặng 2.3 kg', 2019, N'bacinox', N'trungquoc', N'Thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'CM818', N'Máy hút bụi đệm giường Deerma CM818', 770000.0000, N'phongngu', N'deerma', 22, N'sp47.jpg', NULL, N'Ngang 22 cm - Cao 15.8 cm - Sâu 38.5 cm - Nặng 2 kg', 2021, N'xanhnuoc', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'DFT63AC50', N'Máy hút mùi âm tủ Bosch DFT63AC50', 4390000.0000, N'phongngu', N'bosch', 45, N'sp18.jpg', NULL, N'Ngang 59.8 cm - Cao 18 cm - Sâu 30 cm - Nặng 8 kg', NULL, N'bacinox', N'y', N'Nhôm')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'DV90TA240AX', N'Máy sấy bơm nhiệt Samsung 9 kg DV90TA240AX/SV', 19690000.0000, N'phongtam', N'samsung', 9, N'sp56.jpg', NULL, N'Cao 85 cm - Ngang 60 cm - Sâu 60 cm - Nặng 49 kg', 2021, N'bacinox', N'trungquoc', N'Thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'DW-D20A-W ', N'Máy hút ẩm Sharp DW-D20A-W ', 7990000.0000, N'phongngu', N'sharp', 90, N'sp52.jpg', NULL, N'Ngang 37.4 cm - Cao 62 cm - Sâu 25 cm - Nặng 15 kg', 2017, N'trang', N'trungquoc', N'Mặt trước: nhựa PC - Mặt sau: nhựa ABS')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'DWK87EM60', N'Máy hút mùi kính vát Bosch DWK87EM60', 17990000.0000, N'phongbep', N'bosch', 2, N'sp19.jpg', NULL, N'Ngang 79 cm - Cao 76.5 - 112.6 cm - Sâu 43.4 cm - Nặng 14.8 kg', 2022, N'den', N'duc', N'Thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'F16001', N'Quạt hộp Asia 3 cánh F16001 45W', 619000.0000, N'phongkhach', N'tefal', 23, N'sp41.jpg', NULL, N'Ngang 54 cm - Cao 54 cm - Sâu 22 cm - Nặng 2 kg', 2017, N'xam', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'FAF-12D', N'Lò chiên không dầu Ferroli FAF-12D 12 lít', 2790000.0000, N'phongbep', N'ferroli', 222, N'sp45.jpg', NULL, N'Ngang 28.5 cm - Cao 38.5 cm - Sâu 33 cm - Nặng 10.5 kg', 2021, N'den', N'trungquoc', N'Vỏ nhựa ABS, Khoang lò bằng inox')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'FC9350', N'Máy hút bụi dạng hộp Philips FC9350', 2390000.0000, N'phongkhach', N'philips', 43, N'sp24.jpg', NULL, N'Ngang 28.1 cm - Cao 24.7 cm - Sâu 41 cm - Nặng 4.5 kg', 2019, N'den', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'GRAND-X9WKUR', N'Máy lọc nước RO nóng nguội lạnh Robot GRAND-X9WKUR 9 lõi ', 7630000.0000, N'phongbep', N'robot', 1, N'sp35.jpg', NULL, N'Ngang 25.7 cm - Cao 116.5 cm - Sâu 47.5 cm - Nặng 29 kg', 2022, N'trang', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'H12', N'Máy hút bụi lau nhà Dreame H12', 7190000.0000, N'phongngu', N'dreame', 22, N'sp50.jpg', NULL, N'Ngang 28.8 cm - Cao 110.2 cm - Sâu 23 cm - Nặng 6.7 kg', 2023, N'den', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'HD4515', N'Nồi cơm điện tử Philips 1.8 lít HD4515/55', 1390000.0000, N'phongbep', N'philips', 34, N'sp21.jpg', NULL, N'Ngang 25.5 cm - Cao 23 cm - Sâu 36 cm - Nặng 5.33 kg', 2022, N'trang', N'trungquoc', N'Hợp kim phủ đá Maifan chống dính (Bakuhanseki)')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'HDB-1827', N'Máy sấy tóc 1100W Bluestone HDB-1827 ', 199000.0000, N'phongtam', N'bluestone', 77, N'sp53.jpg', NULL, N'Ngang 13.6 cm - Cao 17 cm - Rộng 6.7 cm - Khối lượng 374g', 2020, N'hong', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'HH-B400A', N'Máy đánh trứng Hafele HH-B400A', 490000.0000, N'phongbep', N'hafele', 34, N'sp29.jpg', NULL, N'Ngang 9 cm - Cao 15 cm - Sâu 19 cm - Nặng 1.19 kg', NULL, N'xam', N'trungquoc', N'Que trộn Thép không gỉ - Vỏ máy Nhựa ABS và thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'HPN635', N'Máy lọc nước RO nóng nguội lạnh Hòa Phát HPN635 10 lõi ', 5790000.0000, N'phongbep', N'hoaphat', 34, N'sp34.jpg', NULL, N'Ngang 31.1 cm - Cao 95.9 cm - Sâu 39.6 cm - Nặng 27.5 kg', 2023, N'trang', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'HR2222', N'Máy xay sinh tố đa năng Philips HR2222/00', 1130000.0000, N'phongbep', N'philips', 34, N'sp23.jpg', NULL, N'Cao 36.4 cm - Ngang 28 cm - Sâu 20 cm - Nặng 4.41 kg', 2020, N'trang', N'trungquoc', N'Thủy tinh')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'HS-K1703X', N'Bình đun siêu tốc Hafele 1.7 lít HS-K1703X (535.43.733)', 450000.0000, N'phongbep', N'hafele', 3, N'sp30.jpg', NULL, N'Ngang 20.5 cm - Cao 25 cm - Sâu 18 cm - 0.95 kg', 2022, N'bacinox', N'trungquoc', N'Inox cao cấp 304')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KAD-N91', N'Máy lọc nước RO nóng lạnh Karofi KAD-N91 10 lõi', 12990000.0000, N'phongbep', N'karofi', 45, N'sp13.jpg', NULL, N'Ngang 32 cm - Cao 96.3 cm - Sâu 41.8 cm - Nặng 33 kg', 2022, N'xanhnuoc', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KAD-X39', N'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X39 10 lõi ', 6590000.0000, N'phongbep', N'karofi', 1, N'sp15.jpg', NULL, N'Ngang 32 cm - Cao 99 cm - Sâu 40 cm - Nặng 25 kg', 2022, N'den', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KAD-X56', N'Máy lọc nước RO nóng nguội lạnh Karofi KAD-X56 11 lõi ', 7490000.0000, N'phongbep', N'karofi', 101, N'sp16.jpg', NULL, N'Ngang 32 cm - Cao 99 cm - Sâu 42 cm - Nặng 27.5 kg', 2023, N'den', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KAQ-U95', N'Máy lọc nước không vỏ RO Karofi KAQ-U95 10 lõi', 5990000.0000, N'phongbep', N'karofi', 31, N'sp14.jpg', NULL, N'Ngang 30.4 cm - Cao 42.5 cm - Sâu 22.7 cm - Nặng 9.7 Kg', 2021, N'trang', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KDF-593D', N'Nồi chiên không dầu AVA KDF-593D 7.5 lít', 1090000.0000, N'phongbep', N'ava', 5, N'sp1.jpg', NULL, N'Ngang 29.2 cm - Cao 32.2 cm - Sâu 34 cm - Nặng 5.5 kg', 2021, N'den', N'trungquoc', N'Lòng nồi hợp kim nhôm phủ chống dínhVỏ nhựa chịu nhiệt cao cấp')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KG200SJD1', N'Máy ép chậm Kangaroo KG200SJD1', 1990000.0000, N'phongbep', N'kangaroo', 57, N'sp8.jpg', NULL, N'Ngang 20.5 cm - Cao 52 cm - Sâu 15 cm', 2021, N'do', N'trungquoc', N'Trục ép nhựa Tritan')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KG519M', N'Bếp ga đôi Kangaroo KG519M', 899000.0000, N'phongbep', N'kangaroo', 5, N'sp7.jpg', NULL, N'Ngang 68.8 cm - Dọc 39 cm - Cao 14 cm - Nặng 8 kg', 2020, N'den', N'vietnam', N'Kính chịu nhiệt')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KG8G1A ', N'Bếp ga đôi Kangaroo KG8G1A', 590000.0000, N'phongbep', N'kangaroo', 23, N'sp5.jpg', NULL, N'Ngang 69 cm - Dọc 39.5 cm - Cao 11.5 cm - Nặng 7.5 kg', 2020, N'den', N'vietnam', N'Kính cường lực')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KGBL1000X', N'Máy xay sinh tố Kangaroo KGBL1000X', 990000.0000, N'phongbep', N'kangaroo', 9, N'sp6.jpg', NULL, N'Cao 43 cm - Ngang 15.1 cm - Sâu 17 cm - Nặng 4.24 kg', 2022, N'xam', N'trungquoc', N'Inox 304')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'KS-COM183MV-WH', N'Nồi cơm điện tử Sharp 1.8 lít KS-COM183MV-WH', 890000.0000, N'phongbep', N'sharp', 34, N'sp38.jpg', NULL, N'Ngang 24.8 cm - Cao 24.8 cm - Sâu 33.5 cm - Nặng 3.4 kg', 2021, N'trang', N'vietnam', N'Nhôm phủ chống dính')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'MJ-CS100WRA', N'Máy ép trái cây Panasonic MJ-CS100WRA', 1680000.0000, N'phongbep', N'panasonic', 34, N'sp25.jpg', NULL, N'Ngang 26.2 cm - Cao 28.3 cm - Sâu 18.7 cm', 2023, N'trang', N'trungquoc', N'Thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'MK-16', N'Bình đun siêu tốc Mutosi 1.7 lít MK-16', 410000.0000, N'phongbep', N'mutosi', 14, N'sp28.jpg', NULL, N'Ngang 21.8 cm - Cao 23.3 cm - Sâu 15.5 cm - 0.9 kg', 2022, N'den', N'trungquoc', N'Thuỷ tinh')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'NC-EG3000CSY', N'Bình thủy điện Panasonic NC-EG3000CSY 3 lít', 2010000.0000, N'phongbep', N'panasonic', 7, N'sp26.jpg', NULL, N'Ngang 18 cm - Cao 24 cm - Sâu 28 cm - Nặng 2.5 kg', NULL, N'xam', N'thailan', N'Ruột bình Inox 304, vỏ bình Nhựa')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'NI-S530ARA', N'Bàn ủi hơi nước Panasonic NI-S530ARA 2300W', 730000.0000, N'phongngu', N'panasonic', 5, N'sp27.jpg', NULL, N'Ngang 27 cm - Cao 14 cm - Sâu 11.3 cm - Nặng 1.1 kg', 2022, N'xanhnuoc', N'trungquoc', N'Ceramic chống dính')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'PPI8256EVN', N'Bếp từ đôi lắp âm Bosch PPI8256EVN', 8990000.0000, N'phongbep', N'bosch', 34, N'sp17.jpg', NULL, N'Ngang 78 cm - Dọc 45 cm - Cao 6.5 cm - Nặng 10.281 kg', 2023, N'den', N'trungquoc', N'Gốm thủy tinh Schott Ceran')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'PRTH-A1', N'Bếp từ hồng ngoại lắp âm Pramie PRTH-A1', 5490000.0000, N'phongbep', N'pramie', 33, N'sp37.jpg', NULL, N'Ngang 73 cm - Dọc 43 cm - Cao 7 cm - Nặng 9 kg', 2023, N'den', N'thailan', N'Kính Ceramic')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'PXE675DC1E', N'Bếp từ 4 vùng nấu lắp âm Bosch PXE675DC1E', 24590000.0000, N'phongbep', N'bosch', 1, N'sp20.jpg', NULL, N'Ngang 60.6 cm - Dọc 52.2 cm - Cao 5.1 cm - Nặng 13.1 kg', 2016, N'den', N'duc', N'Kính Ceramic - Schott Ceran (Đức)')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'RCY-7022', N'Máy sấy tóc 1100W AVA RCY-7022', 250000.0000, N'phongtam', N'ava', 3, N'sp4.jpg', NULL, N'Ngang 11 cm - Cao 17 cm - Rộng 7.5 cm - Khối lượng 350g', 2021, N'trang', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'RHB-600D', N'Máy làm sữa hạt Rapido RHB-600D', 1590000.0000, N'phongbep', N'rapido', 1, N'sp44.jpg', NULL, N'Cao 39.7 cm - Ngang 20 cm - Sâu 23.1 cm - Nặng 3.5 kg', NULL, N'kem', N'trungquoc', N'Thủy tinh chịu nhiệt')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'RI2000ES', N'Bếp từ Rapido RI2000ES', 100000.0000, N'phongbep', N'rapido', 2, N'sp43.jpg', NULL, N'Ngang 28 cm - Dọc 36.4 cm - Cao 6.3 cm - Nặng 2.5 kg', 2018, N'den', N'trungquoc', N'Kính pha lê')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'SHD 6005(EMC)', N'Bếp hồng ngoại Sunhouse SHD 6005(EMC)', 700000.0000, N'phongbep', N'sunhouse', 5, N'sp9.jpg', NULL, N'Ngang 29 cm - Dọc 36 cm - Cao 6.5 cm - Nặng 2.1 kg', 2016, N'den', N'trungquoc', N'Kính chịu lực, chịu nhiệt')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'SHD2306', N'Máy sấy tóc 1200W Sunhouse SHD2306', 219000.0000, N'phongtam', N'sunhouse', 4, N'sp54.jpg', N'Có móc treo, Tấm nhiệt siêu bền', N'Ngang 21.5 cm - Cao 12.8 cm - Rộng 8 cm - Khối lượng 400g', 2019, N'den', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'SHD4062', N'Nồi chiên không dầu Sunhouse SHD4062 6 lít ', 1449000.0000, N'phongbep', N'sunhouse', 56, N'sp12.jpg', NULL, N' Ngang 30.5 cm - Cao 32 cm - Sâu 36 cm - Nặng 5.5 kg', 2021, N'den', N'trungquoc', N'Lòng nồi thép phủ chống dính, Vỏ inox 304 và nhựa PP')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'SHD5503', N'Máy ép chậm Sunhouse SHD5503 ', 2290000.0000, N'phongbep', N'sunhouse', 454, N'sp11.jpg', NULL, N'Ngang 16.3 cm - Cao 45 cm - Sâu 15.5 cm', 2023, N'xam', N'trungquoc', N'Nhựa PC, inox 304')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'SHD7727', N'Quạt điều hòa Sunhouse SHD7727', 3490000.0000, N'phongngu', N'sunhouse', 2, N'sp51.jpg', NULL, N'Ngang 50 cm - Cao 105 cm - Sâu 36 cm - 13.5 kg', 2019, N'trang', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'SHD8603', N'Nồi cơm nắp gài Sunhouse 1.8 lít SHD8603', 490000.0000, N'phongbep', N'sunhouse', 78, N'sp10.jpg', NULL, N'Ngang 25.5 cm - Cao 27.5 cm - Sâu 24 cm - Nặng 2.6 kg', 2020, N'trang', N'vietnam', N'Hợp kim nhôm phủ chống dính Whitford')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'sp01', N'ban chai', 79000.0000, N'phongtam', N'samsung', 4, N'ava.png', NULL, N'10cm', 2022, N'den', N'ando', N'nhua')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'Tefal BL83SD66 ', N'Máy làm sữa hạt đa năng Tefal BL83SD66 ', 3291000.0000, N'phongbep', N'tefal', 2, N'sp39.jpg', NULL, N'Cao 45.3 cm - Ngang 25.2 cm - Sâu 21.2 cm - Nặng 6 kg', NULL, N'bacinox', N'trungquoc', N'Thép không gỉ')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'TP40-CT01E', N'Nồi cơm điện tử AVA 1.8 lít TP40-CT01E', 990000.0000, N'phongbep', N'ava', 7, N'sp3.jpg', NULL, N'Ngang 29.5 cm - Cao 23 cm - Sâu 37.2 cm - Nặng 3.9 kg', 2020, N'tim', N'trungquoc', N'Hợp kim nhôm phủ chống dính Daikin')
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'VC811', N'Máy hút bụi không dây Deerma VC811', 1990000.0000, N'phongkhach', N'deerma', 34, N'sp48.jpg', NULL, N'Ngang 23.7 cm - Cao 118 cm - Sâu 15.7 cm - Nặng 2 kg', 2021, N'xanhnuoc', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'VR05R5050WK ', N'Robot hút bụi lau nhà Samsung VR05R5050WK/SV ', 4990000.0000, N'phongkhach', N'samsung', 43, N'sp32.jpg', NULL, N'Ngang 34 cm - Cao 8.5 cm - Sâu 34 cm - 3 kg', 2021, N'den', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'VY538990', N'Quạt lửng Asia 5 cánh VY538990 55W', 390000.0000, N'phongkhach', N'tefal', 22, N'sp40.jpg', NULL, N' Ngang 39 cm - Cao 78.2 - 97.2 cm - Sâu 39 cm - Nặng 5 kg', 2022, N'den', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'VY636790', N'Quạt sàn Asia 6 cánh VY636790 80W', 690000.0000, N'phongkhach', N'tefal', 2, N'sp42.jpg', NULL, N'Ngang 41.8 cm - Cao 56 cm - Sâu 28.5 cm - Nặng 4 kg', 2022, N'xam', N'vietnam', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'W10', N'Robot hút bụi lau nhà Dreame W10 Pro', 12990000.0000, N'phongngu', N'dreame', 88, N'sp49.jpg', NULL, N'Ngang 31.4 cm - Cao 10.5 cm - Sâu 32.5 cm - 4 kg', 2022, N'trang', N'trungquoc', NULL)
INSERT [dbo].[SanPham] ([MaSanPham], [TenSanPham], [GiaTien], [MaLoaiSanPham], [MaNhaSanXuat], [SoLuong], [Anh], [GhiChu], [KichThuocKhoiLuong], [NamSanXuat], [MaMau], [MaXuatXu], [ChatLieu]) VALUES (N'WW95TA046AX', N'Máy giặt Samsung Inverter 9.5 kg WW95TA046AX/SV', 8290000.0000, N'phongtam', N'samsung', 1, N'sp55.jpg', NULL, N'Cao 84.3 cm - Ngang 60 cm - Sâu 60 cm - Nặng 65 kg', 2021, N'bacinox', N'vietnam', N'Thép không gỉ')
GO
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'ando', N'Ấn Độ', N'coando.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'anh', N'Anh', N'coanh.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'canada', N'Canada', N'cocanada.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'duc', N'Đức', N'coduc.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'hanquoc', N'Hàn Quốc', N'cohanquoc.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'hoaky', N'Hoa Kỳ', N'cohoaky.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'nga', N'Nga', N'conga.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'nhatban', N'Nhật Bản', N'conhatban.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'phap', N'Pháp', N'cophap.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'thailan', N'Thái Lan', N'cothailan.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'thuydien', N'Thụy Điển', N'cothuydien.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'thuysi', N'Thụy Sĩ', N'cothuysi.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'trungquoc', N'Trung Quốc', N'cotrungquoc.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'uc', N'Úc', N'couc.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'vietnam', N'Việt Nam', N'covietnam.jpg')
INSERT [dbo].[XuatXu] ([MaXuatXu], [TenXuatXu], [Anh]) VALUES (N'y', N'Ý', N'coy.jpg')
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_LoaiSanPham] FOREIGN KEY([MaLoaiSanPham])
REFERENCES [dbo].[LoaiSanPham] ([MaLoaiSanPham])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_LoaiSanPham]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Mau] FOREIGN KEY([MaMau])
REFERENCES [dbo].[Mau] ([MaMau])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Mau]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaSanXuat] FOREIGN KEY([MaNhaSanXuat])
REFERENCES [dbo].[NhaSanXuat] ([MaNhaSanXuat])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaSanXuat]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_XuatXu] FOREIGN KEY([MaXuatXu])
REFERENCES [dbo].[XuatXu] ([MaXuatXu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_XuatXu]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_SanPham_GiaTien] CHECK  (([GiaTien]>=(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_SanPham_GiaTien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_SanPham_SoLuong] CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_SanPham_SoLuong]
GO
