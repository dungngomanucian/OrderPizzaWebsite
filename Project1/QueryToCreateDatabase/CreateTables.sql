--drop database PizzaOnline
CREATE DATABASE PizzaOnline
USE [PizzaOnline]
GO
/****** Object:  Table [dbo].[tUser]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tUser](
	[User_ID] [bigint],
	[Role_ID] [bigint],
	[Google_ID] [nvarchar] (60),
	[Code] [varchar] (15),
	[Nickname] [nvarchar] (25),
	[Password] [nvarchar](100),
	[Email] [varchar] (30),
	[Address] [nvarchar] (50),
	[First_name] [nvarchar](20),
	[Last_name] [nvarchar](20),
	[Point] [bigint],
	[PhoneNumber] [char] (10),
	[ResetToken] [nvarchar](100),
	[ResetTokenExpiry] [datetime],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
	[Deleted] [bit],
	[IsGoogleAccount] [bit],
	[RememberMe] [bit]
 CONSTRAINT [PK_tUser] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tRole]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tRole](
	[Role_ID] [bigint],
	[Code] [varchar] (15),
	[Name] [nvarchar] (25),
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime]
 CONSTRAINT [PK_tRole] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tVoucher]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tVoucher](
	[Voucher_ID] [bigint],
	[Code] [varchar] (15),
	[Number] [bigint],
	[Is_Percent_Discount_Type] [bit],
	[Min_Order_Value] [float],
	[Discount_Value] [float],
	[Max_Discount_Value] [float],
	[Apply_Condition] [nvarchar] (400),
	[Start_date] [datetime],
	[Expiration_date] [datetime],
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime]
 CONSTRAINT [PK_tVoucher] PRIMARY KEY CLUSTERED 
(
	[Voucher_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrder]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder](
	[Order_ID] [bigint],
	[Code] [varchar] (50),
	[Date] [datetime],
	[Address] [nvarchar] (200),
	[Note] [nvarchar] (50),
	[Customer_feeling] [nvarchar] (50),
	[Total_price] [float],
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
	[PaymentMethod_ID] [bigint],
	[Status_ID] [bigint],
	[Customer_ID] [bigint],
	[Manager_ID] [bigint],
	[Voucher_ID] [bigint] NULL
 CONSTRAINT [PK_tOrder] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tStatus]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tStatus](
	[Status_ID] [bigint],
	[Name] [nvarchar] (25),
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
 CONSTRAINT [PK_tStatus] PRIMARY KEY CLUSTERED 
(
	[Status_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tPaymentMethod]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tPaymentMethod](
	[PaymentMethod_ID] [bigint],
	[Name] [nvarchar] (25),
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
 CONSTRAINT [PK_tPaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethod_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderDetail]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrderDetail](
	[Order_ID] [bigint],
	[ProductDetail_ID] [bigint],
	[Number] [bigint],
	[Name] [nvarchar] (25),
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
 CONSTRAINT [PK_tOrderDetail] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC,
	[ProductDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tOrderCombo]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tOrder_Combo](
	[Order_ID] [bigint],
	[Combo_ID] [bigint],
	[Number] [bigint],
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
 CONSTRAINT [PK_tOrder_Combo] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC,
	[Combo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCombo]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCombo](
	[Combo_ID] [bigint],
	[Name] [nvarchar] (25),
	[Image] [nvarchar] (30),
	[Price] [float],
	[Deleted] [bit],
	[Start_date] [datetime],
	[Expiration_date] [datetime],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
 CONSTRAINT [PK_tCombo] PRIMARY KEY CLUSTERED 
(
	[Combo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductDetail]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductDetail](
	[ProductDetail_ID] [bigint],
	[Number] [bigint],
	[Price] [float],
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
	[Product_ID] [bigint],
	[Size_ID] [bigint],
	[Crust_ID] [bigint]
 CONSTRAINT [PK_tProductDetail] PRIMARY KEY CLUSTERED 
(
	[ProductDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProductDetail_Combo]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProductDetail_Combo](
	[ProductDetail_ID] [bigint],
	[Combo_ID] [bigint],
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
 CONSTRAINT [PK_tProductDetail_Combo] PRIMARY KEY CLUSTERED 
(
	[ProductDetail_ID] ASC,
	[Combo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tSize]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tSize](
	[Size_ID] [bigint],
	[Name] [nvarchar] (25),
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime]
 CONSTRAINT [PK_tSize] PRIMARY KEY CLUSTERED 
(
	[Size_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCrust]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCrust](
	[Crust_ID] [bigint],
	[Name] [nvarchar] (25),
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime]
 CONSTRAINT [PK_tCrust] PRIMARY KEY CLUSTERED 
(
	[Crust_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tProduct]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tProduct](
	[Product_ID] [bigint],
	[Image] [nvarchar] (50),
	[Description] [nvarchar] (400),
	[Name] [nvarchar] (100),
	[Deleted] [bit],
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime],
	[Category_ID] [bigint],
 CONSTRAINT [PK_tProduct] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tCategory]    Script Date: 10/03/2024 9:51:36 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tCategory](
	[Category_ID] [bigint],
	[Name] [nvarchar] (25),
	[Deleted] [bit],
	[Image] [nvarchar] (50),
	[Created_by] [nvarchar] (20),
	[Created_date] [datetime],
	[Last_Modified_by] [nvarchar] (20),
	[Last_Modified_date] [datetime]
 CONSTRAINT [PK_tCategory] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



ALTER TABLE [dbo].[tUser]  WITH CHECK ADD  CONSTRAINT [FK_tUser_tRole] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[tRole] ([Role_ID])
GO
ALTER TABLE [dbo].[tUser] CHECK CONSTRAINT [FK_tUser_tRole]
GO

ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tStatus] FOREIGN KEY([Status_ID])
REFERENCES [dbo].[tStatus] ([Status_ID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tStatus]
GO

ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tPaymentMethod] FOREIGN KEY([PaymentMethod_ID])
REFERENCES [dbo].[tPaymentMethod] ([PaymentMethod_ID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tPaymentMethod]
GO

ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tUser_Customer] FOREIGN KEY([Customer_ID])
REFERENCES [dbo].[tUser] ([User_ID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tUser_Customer]
GO

ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tUser_Manager] FOREIGN KEY([Manager_ID])
REFERENCES [dbo].[tUser] ([User_ID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tUser_Manager]
GO

ALTER TABLE [dbo].[tOrder]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_tVoucher] FOREIGN KEY([Voucher_ID])
REFERENCES [dbo].[tVoucher] ([Voucher_ID])
GO
ALTER TABLE [dbo].[tOrder] CHECK CONSTRAINT [FK_tOrder_tVoucher]
GO

ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tOrder] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[tOrder] ([Order_ID])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tOrder]
GO

ALTER TABLE [dbo].[tOrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_tOrderDetail_tProductDetail] FOREIGN KEY([ProductDetail_ID])
REFERENCES [dbo].[tProductDetail] ([ProductDetail_ID])
GO
ALTER TABLE [dbo].[tOrderDetail] CHECK CONSTRAINT [FK_tOrderDetail_tProductDetail]
GO

ALTER TABLE [dbo].[tOrder_Combo]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_Combo_tOrder] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[tOrder] ([Order_ID])
GO
ALTER TABLE [dbo].[tOrder_Combo] CHECK CONSTRAINT [FK_tOrder_Combo_tOrder]
GO

ALTER TABLE [dbo].[tOrder_Combo]  WITH CHECK ADD  CONSTRAINT [FK_tOrder_Combo_tCombo] FOREIGN KEY([Combo_ID])
REFERENCES [dbo].[tCombo] ([Combo_ID])
GO
ALTER TABLE [dbo].[tOrder_Combo] CHECK CONSTRAINT [FK_tOrder_Combo_tCombo]
GO

ALTER TABLE [dbo].[tProductDetail_Combo]  WITH CHECK ADD  CONSTRAINT [FK_tProductDetail_Combo_tCombo] FOREIGN KEY([Combo_ID])
REFERENCES [dbo].[tCombo] ([Combo_ID])
GO
ALTER TABLE [dbo].[tProductDetail_Combo] CHECK CONSTRAINT [FK_tProductDetail_Combo_tCombo]
GO

ALTER TABLE [dbo].[tProductDetail_Combo]  WITH CHECK ADD  CONSTRAINT [FK_tProductDetail_Combo_tProductDetail] FOREIGN KEY([ProductDetail_ID])
REFERENCES [dbo].[tProductDetail] ([ProductDetail_ID])
GO
ALTER TABLE [dbo].[tProductDetail_Combo] CHECK CONSTRAINT [FK_tProductDetail_Combo_tProductDetail]
GO

ALTER TABLE [dbo].[tProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_tProductDetail_tSize] FOREIGN KEY([Size_ID])
REFERENCES [dbo].[tSize] ([Size_ID])
GO
ALTER TABLE [dbo].[tProductDetail] CHECK CONSTRAINT [FK_tProductDetail_tSize]
GO

ALTER TABLE [dbo].[tProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_tProductDetail_tCrust] FOREIGN KEY([Crust_ID])
REFERENCES [dbo].[tCrust] ([Crust_ID])
GO
ALTER TABLE [dbo].[tProductDetail] CHECK CONSTRAINT [FK_tProductDetail_tCrust]
GO

ALTER TABLE [dbo].[tProductDetail]  WITH CHECK ADD  CONSTRAINT [FK_tProductDetail_tProduct] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[tProduct] ([Product_ID])
GO
ALTER TABLE [dbo].[tProductDetail] CHECK CONSTRAINT [FK_tProductDetail_tProduct]
GO

ALTER TABLE [dbo].[tProduct]  WITH CHECK ADD  CONSTRAINT [FK_tProduct_tCategory] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[tCategory] ([Category_ID])
GO
ALTER TABLE [dbo].[tProduct] CHECK CONSTRAINT [FK_tProduct_tCategory]
GO

INSERT [dbo].[tCategory] ([Category_ID], [Name], [Deleted], [Image], [Created_by], [Created_date],
[Last_Modified_by], [Last_Modified_date]) VALUES 
('1', N'Pizza', 0, N'pizza.jpg', N'Dung',
'2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('2', N'Món khai vị', 0, N'dessert.jpg', N'Dung',
'2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('3', N'Món gà', 0, N'chicken.png', N'vinhtraha',
'2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('4', N'Combo', 0, N'combo.jpg', N'Dung',
'2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('5', N'Thức uống', 0, N'drink.jpg', N'Dung',
'2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000')

INSERT [dbo].[tSize] ([Size_ID], [Name], [Deleted], [Created_by], [Created_date],
[Last_Modified_by], [Last_Modified_date]) VALUES 
('1', N'Nhỏ', 0, N'Dung', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('2', N'Vừa', 0, N'Dung', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('3', N'Lớn', 0, N'Dung', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000')

INSERT [dbo].[tCrust] ([Crust_ID], [Name], [Deleted], [Created_by], [Created_date],
[Last_Modified_by], [Last_Modified_date]) VALUES 
('1', N'Đế mỏng', 0, N'Dung', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('2', N'Đế dày', 0, N'Dung', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('3', N'Đế viền phô mai', 0, N'Dung', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000')

INSERT [dbo].[tStatus] ([Status_ID], [Name], [Deleted], [Created_by], [Created_date],
[Last_Modified_by], [Last_Modified_date]) VALUES 
('1', N'Đang xác nhận', 0, N'Khanh', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('2', N'Đã xác nhận', 0, N'Khanh', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('3', N'Đang làm món ăn', 0, N'Khanh', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('4', N'Đang giao hàng', 0, N'Khanh', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('5', N'Giao hàng thành công', 0, N'Khanh', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000'),
('6', N'Hủy', 0, N'Khanh', '2024-04-01T00:00:00.000',
N'Dung', '2024-04-01T00:00:00.000')

INSERT [dbo].[tPaymentMethod] ([PaymentMethod_ID], [Name]) VALUES 
('1', N'COD'),
('2', N'VNPAY'),
('3', N'PAYPAL')