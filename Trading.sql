USE [master]
GO
/****** Object:  Database [Trading2022]    Script Date: 6/13/2024 7:53:19 PM ******/
CREATE DATABASE [Trading2022]
GO
ALTER DATABASE [Trading2022] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trading2022].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trading2022] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trading2022] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trading2022] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trading2022] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trading2022] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trading2022] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Trading2022] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trading2022] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trading2022] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trading2022] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trading2022] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trading2022] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trading2022] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trading2022] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trading2022] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trading2022] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trading2022] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trading2022] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trading2022] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trading2022] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trading2022] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trading2022] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trading2022] SET RECOVERY FULL 
GO
ALTER DATABASE [Trading2022] SET  MULTI_USER 
GO
ALTER DATABASE [Trading2022] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trading2022] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trading2022] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trading2022] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trading2022] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trading2022] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Trading2022', N'ON'
GO
ALTER DATABASE [Trading2022] SET QUERY_STORE = OFF
GO
USE [Trading2022]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/13/2024 7:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] NOT NULL,
	[name] [nvarchar](30) NULL,
	[describe] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 6/13/2024 7:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[ID] [varchar](10) NOT NULL,
	[name] [nvarchar](max) NULL,
	[quantity] [int] NULL,
	[price] [money] NULL,
	[releaseDate] [date] NULL,
	[describe] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[cid] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 6/13/2024 7:53:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[fullname] [nvarchar](max) NULL,
 CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (1, N'Oppo', N'gọn nhẹ, pin lâu')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (2, N'Samsung', N'dáng đẹp, nhiều chức năng')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (3, N'Iphone', N'Hiện đại, chụp ảnh 20GPixel...')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (4, N'VSmart', N'abc')
INSERT [dbo].[Categories] ([ID], [name], [describe]) VALUES (5, N'Huawei', N'Huawei')
GO
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'abc', N'ip 15 prm', 1, 1.0000, CAST(N'2023-05-23' AS Date), N'dáng yêu kiều updated', N'https://th.bing.com/th/id/R.968721caf31c01ac9e7c2aa3b9fd1c6a?rik=LEBc074FCKizFA&pid=ImgRaw&r=0', 3)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ip2       ', N'iphone 11 series', 30, 16000.0000, CAST(N'2020-10-04' AS Date), N'Chiếc iPhone siêu nhỏ gọn nhưng mang trên mình sức mạnh không đối thủ. iPhone 12 mini là sự lựa chọn hoàn hảo cho những ai đang cần một chiếc điện thoại có thể làm mọi thứ nhưng lại nằm gọn trong lòng bàn tay và độ tiện dụng đáng kinh ngạc.', N'images/ip2.jpg', 3)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ip3       ', N'iphone X series', 22, 13000.0000, CAST(N'2019-10-04' AS Date), N'Chiếc iPhone siêu nhỏ gọn nhưng mang trên mình sức mạnh không đối thủ. iPhone 12 mini là sự lựa chọn hoàn hảo cho những ai đang cần một chiếc điện thoại có thể làm mọi thứ nhưng lại nằm gọn trong lòng bàn tay và độ tiện dụng đáng kinh ngạc.', N'images/ip3.jpg', 3)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp1      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai cũng phải ngước nhìn.

', N'images/opp1.jpg', 1)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp2      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai cũng phải ngước nhìn.

', N'images/opp2.jpg', 1)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp3      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai cũng phải ngước nhìn.

', N'images/opp3.jpg', 1)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp4      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai cũng phải ngước nhìn.

', N'images/opp4.jpg', 1)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'opp5      ', N'oppo find x series', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'OPPO Reno4 - Chiếc điện thoại với cấu hình mạnh mẽ và công nghệ sạc siêu nhanh sẽ giúp bạn có được hiệu suất cao để trải nghiệm những điều thú vị trong cuộc sống, nhất là trên bộ tứ camera đẳng cấp cùng thiết kế từ nhà OPPO mà ai cũng phải ngước nhìn.

', N'images/opp5.jpg', 1)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss1       ', N'Galaxy Z series', 12, 20000.0000, CAST(N'2021-01-04' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss1.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss2       ', N'galaxy note series', 12, 18000.0000, CAST(N'2020-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss2.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss3       ', N'galaxy F series', 34, 16000.0000, CAST(N'2019-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss3.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss4       ', N'galaxy HHH', 19, 15000.0000, CAST(N'2018-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss4.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss5       ', N'galaxy KKK', 52, 14000.0000, CAST(N'2017-01-04' AS Date), N'Samsung Galaxy Note 20 Ultra được chế tác từ những vật liệu cao cấp hàng đầu hiện nay, với sự tỉ mỉ và chất lượng gia công thượng thừa, tạo nên chiếc điện thoại đẹp hơn những gì bạn có thể tưởng tượng.', N'images/ss5.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss6       ', N'galaxy note series', 12, 18000.0000, CAST(N'2020-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra du?c ch? tác t? nh?ng v?t li?u cao c?p hàng d?u hi?n nay, v?i s? t? m? và ch?t lu?ng gia công thu?ng th?a, t?o nên chi?c di?n tho?i d?p hon nh?ng gì b?n có th? tu?ng tu?ng.', N'images/ss2.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'ss7       ', N'galaxy note series', 12, 18000.0000, CAST(N'2020-10-08' AS Date), N'Samsung Galaxy Note 20 Ultra du?c ch? tác t? nh?ng v?t li?u cao c?p hàng d?u hi?n nay, v?i s? t? m? và ch?t lu?ng gia công thu?ng th?a, t?o nên chi?c di?n tho?i d?p hon nh?ng gì b?n có th? tu?ng tu?ng.', N'images/ss2.jpg', 2)
INSERT [dbo].[products] ([ID], [name], [quantity], [price], [releaseDate], [describe], [image], [cid]) VALUES (N'vsm1      ', N'Vsmart Joy 4 3GB-64GB', 60, 13000.0000, CAST(N'2020-01-04' AS Date), N'smart Live 4 6GB-64GB sở hữu cấu hình cực đỉnh, đưa bạn đến trải nghiệm giải trí bất tận với dung lượng pin lớn, màn hình tuyệt đẹp và 4 camera sau AI đầy ấn tượng.

', N'images/vsm1.jpg', 4)
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([id], [username], [password], [fullname]) VALUES (1, N'admin', N'admin', N'ADMIN')
INSERT [dbo].[users] ([id], [username], [password], [fullname]) VALUES (2, N'user1', N'user1', N'USER 1')
INSERT [dbo].[users] ([id], [username], [password], [fullname]) VALUES (3, N'tuanvm', N'tuanvm', N'TUAN VM')
INSERT [dbo].[users] ([id], [username], [password], [fullname]) VALUES (4, N'qwe', N'abc', N'QWER')
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_users]    Script Date: 6/13/2024 7:53:19 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_users] ON [dbo].[users]
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD FOREIGN KEY([cid])
REFERENCES [dbo].[Categories] ([ID])
GO
USE [master]
GO
ALTER DATABASE [Trading2022] SET  READ_WRITE 
GO
