USE [master]
GO
/****** Object:  Database [Grain]    Script Date: 7/11/2016 8:24:58 AM ******/
CREATE DATABASE [Grain]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Grain', FILENAME = N'E:\code\csharp\work\粮仓2.4\Grain.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Grain_log', FILENAME = N'E:\code\csharp\work\粮仓2.4\Grain_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Grain] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Grain].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Grain] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Grain] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Grain] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Grain] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Grain] SET ARITHABORT OFF 
GO
ALTER DATABASE [Grain] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Grain] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Grain] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Grain] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Grain] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Grain] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Grain] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Grain] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Grain] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Grain] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Grain] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Grain] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Grain] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Grain] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Grain] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Grain] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Grain] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Grain] SET RECOVERY FULL 
GO
ALTER DATABASE [Grain] SET  MULTI_USER 
GO
ALTER DATABASE [Grain] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Grain] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Grain] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Grain] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Grain] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Grain', N'ON'
GO
USE [Grain]
GO
/****** Object:  Table [dbo].[稻谷质量特性参数实验数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[稻谷质量特性参数实验数据表](
	[检验流水号] [nchar](6) NOT NULL,
	[实验号] [nchar](6) NULL,
	[水分] [varchar](5) NULL,
	[粮温] [varchar](5) NULL,
	[参数值] [float] NULL,
	[检测日期] [date] NULL,
	[消耗时间(/d)] [float] NULL,
 CONSTRAINT [PK_稻谷种群实验数据表] PRIMARY KEY CLUSTERED 
(
	[检验流水号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[稻谷质量特性参数实验信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[稻谷质量特性参数实验信息表](
	[实验号] [nchar](6) NOT NULL,
	[实验批次号] [nchar](6) NULL,
	[参数号] [nchar](6) NULL,
	[起始参数值] [float] NULL,
	[终点参数值] [float] NULL,
	[参数变化平均速度] [float] NULL,
	[开始时间] [date] NULL,
	[结束时间] [date] NULL,
 CONSTRAINT [PK_稻谷质量特性参数实验信息表] PRIMARY KEY CLUSTERED 
(
	[实验号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[稻谷质量特性参数信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[稻谷质量特性参数信息表](
	[参数号] [nchar](6) NOT NULL,
	[参数名] [varchar](20) NULL,
 CONSTRAINT [PK_稻谷质量参数信息表] PRIMARY KEY CLUSTERED 
(
	[参数号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[稻谷质量特性参数阈值表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[稻谷质量特性参数阈值表](
	[阈值id] [nchar](6) NOT NULL,
	[参数号] [nchar](6) NULL,
	[区间低值] [float] NULL,
	[区间高值] [float] NULL,
	[阈值表示] [float] NULL,
 CONSTRAINT [PK_稻谷质量阈值表] PRIMARY KEY CLUSTERED 
(
	[阈值id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[稻谷质量特性参数坐标轴描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[稻谷质量特性参数坐标轴描述表](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[实验号] [nchar](6) NULL,
	[标题] [varchar](50) NULL,
	[标题速率] [varchar](50) NULL,
	[x轴] [varchar](50) NULL,
	[y轴] [varchar](50) NULL,
	[y轴速率] [varchar](50) NULL,
	[描述] [ntext] NULL,
	[速率图描述] [ntext] NULL,
 CONSTRAINT [PK_稻谷质量特性参数坐标轴描述表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[害虫对小麦参数的影响数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[害虫对小麦参数的影响数据表](
	[JYLiuShuiNumber] [nchar](6) NOT NULL,
	[ShiYanNumber] [nchar](6) NULL,
	[GrainTemp] [nchar](6) NULL,
	[PeatsMiDu] [nchar](6) NULL,
	[CanShuValue] [nchar](6) NULL,
	[CheckDate] [date] NULL,
 CONSTRAINT [PK_HaiChongYingXiangValueTable] PRIMARY KEY CLUSTERED 
(
	[JYLiuShuiNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[粮食功能描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[粮食功能描述表](
	[TypeBianHao] [int] NOT NULL,
	[GongNengBianHao] [int] NOT NULL,
	[GongNengName] [varchar](30) NULL,
	[GongNengMiaoShu] [ntext] NULL,
 CONSTRAINT [PK_功能描述] PRIMARY KEY CLUSTERED 
(
	[GongNengBianHao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[粮食图片描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[粮食图片描述表](
	[TypeBianHao] [int] NULL,
	[TuPianBianHao] [int] NULL,
	[TuPianMiaoShu] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[粮食种类描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[粮食种类描述表](
	[TypeBianHao] [int] NOT NULL,
	[EnglishiName] [varchar](10) NULL,
	[MiaoShu] [ntext] NULL,
	[ChineseName] [varchar](10) NULL,
 CONSTRAINT [PK_信息描述表] PRIMARY KEY CLUSTERED 
(
	[TypeBianHao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[小麦参数名表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦参数名表](
	[CanShuNumber] [nchar](6) NOT NULL,
	[CanShuName] [nchar](10) NULL,
 CONSTRAINT [PK_ZhiLiangCanShuNumberTable] PRIMARY KEY CLUSTERED 
(
	[CanShuNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[小麦参数实验总概括表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦参数实验总概括表](
	[ShiYanNumber] [nchar](6) NOT NULL,
	[ShiYanPiCiHao] [nchar](6) NULL,
	[CanShuNumber] [nchar](6) NULL,
	[StartCanShuValue] [nchar](6) NULL,
	[EndCanShuValue] [nchar](6) NULL,
	[CanShuChangeSpeed] [nchar](6) NULL,
	[StartTime] [date] NULL,
	[EndTime] [date] NULL,
	[PeatsNum] [nchar](6) NULL,
	[Display] [nchar](300) NULL,
 CONSTRAINT [PK_ZhiLiangCanDataInformationTable] PRIMARY KEY CLUSTERED 
(
	[ShiYanNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[小麦参数阈值表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦参数阈值表](
	[id] [nchar](6) NOT NULL,
	[CanShuNumber] [nchar](6) NULL,
	[LowNum] [nchar](6) NULL,
	[HighNum] [nchar](6) NULL,
	[Display] [nchar](10) NULL,
	[PeatsNum] [nchar](6) NULL,
 CONSTRAINT [PK_ZhiLiangYuValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[小麦害虫名表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦害虫名表](
	[PeatsNum] [nchar](6) NOT NULL,
	[PeatsName] [nchar](10) NULL,
 CONSTRAINT [PK_WPInformationTable] PRIMARY KEY CLUSTERED 
(
	[PeatsNum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[小麦害虫种群变化数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦害虫种群变化数据表](
	[JYLiuShuiNumber] [nchar](6) NOT NULL,
	[ShiYanNumber] [nchar](6) NULL,
	[InTemp] [nchar](10) NULL,
	[GrainTemp] [nchar](5) NULL,
	[CanShuValue] [nchar](5) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_WPDataTable] PRIMARY KEY CLUSTERED 
(
	[JYLiuShuiNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[小麦质量特性参数数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦质量特性参数数据表](
	[JYLiushuiNumber] [nchar](6) NOT NULL,
	[ShiYanNumber] [nchar](6) NULL,
	[Water] [nchar](6) NULL,
	[GrainTemp] [nchar](6) NULL,
	[CanNumberValue] [nchar](6) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_ZhiLiangCanDataTable] PRIMARY KEY CLUSTERED 
(
	[JYLiushuiNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[小麦坐标信息描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[小麦坐标信息描述表](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ShiYanNumber] [nchar](6) NULL,
	[描述] [ntext] NULL,
	[速率图描述] [ntext] NULL,
 CONSTRAINT [PK_小麦信息描述表] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[玉米孢子检测实验数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米孢子检测实验数据表](
	[检测流水号] [nchar](6) NOT NULL,
	[实验号] [nchar](6) NULL,
	[温度] [varchar](10) NULL,
	[湿度] [varchar](10) NULL,
	[孢子个数] [float] NULL,
	[水分] [varchar](10) NULL,
	[取样点] [varchar](10) NULL,
	[检测日期] [date] NULL,
	[消耗时间(/h)] [float] NULL,
 CONSTRAINT [PK_玉米孢子检测试验数据表] PRIMARY KEY CLUSTERED 
(
	[检测流水号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米孢子检测实验信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米孢子检测实验信息表](
	[实验号] [nchar](6) NOT NULL,
	[孢子号] [nchar](6) NULL,
	[实验批次号] [nchar](6) NULL,
	[起始孢子数] [float] NULL,
	[终点孢子数] [float] NULL,
	[孢子数变化平均速度] [float] NULL,
	[开始时间] [date] NULL,
	[结束时间] [date] NULL,
	[描述] [varchar](10) NULL,
 CONSTRAINT [PK_玉米孢子检测实验信息表] PRIMARY KEY CLUSTERED 
(
	[实验号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米孢子信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米孢子信息表](
	[孢子号] [nchar](6) NOT NULL,
	[孢子名] [varchar](50) NULL,
 CONSTRAINT [PK_孢子信息表] PRIMARY KEY CLUSTERED 
(
	[孢子号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米孢子阈值表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[玉米孢子阈值表](
	[阈值id] [nchar](6) NOT NULL,
	[孢子号] [nchar](6) NULL,
	[区间低值] [float] NULL,
	[区间高值] [float] NULL,
	[阈值表示] [float] NULL,
 CONSTRAINT [PK_玉米孢子阈值表] PRIMARY KEY CLUSTERED 
(
	[阈值id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[玉米孢子坐标轴描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米孢子坐标轴描述表](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[实验号] [nchar](6) NULL,
	[标题] [varchar](50) NULL,
	[标题速率] [varchar](50) NULL,
	[x轴] [varchar](50) NULL,
	[y轴] [varchar](50) NULL,
	[y轴速率] [varchar](50) NULL,
	[描述] [ntext] NULL,
	[速率图描述] [ntext] NULL,
 CONSTRAINT [PK_玉米孢子描述表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米加热破坏实验数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[玉米加热破坏实验数据表](
	[检测流水号] [nchar](6) NOT NULL,
	[实验号] [nchar](6) NULL,
	[温度] [float] NULL,
	[破坏率] [float] NULL,
	[检测日期] [date] NULL,
	[检测时间（/day）] [int] NULL,
 CONSTRAINT [PK_玉米加热破坏试验数据表] PRIMARY KEY CLUSTERED 
(
	[检测流水号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[玉米加热破坏实验信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[玉米加热破坏实验信息表](
	[实验号] [nchar](6) NOT NULL,
	[层数号] [int] NULL,
	[实验地点号] [int] NULL,
 CONSTRAINT [PK_玉米加热破坏实验信息表] PRIMARY KEY CLUSTERED 
(
	[实验号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[玉米加热破坏实验坐标轴描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米加热破坏实验坐标轴描述表](
	[id] [int] NOT NULL,
	[实验号] [nchar](6) NULL,
	[温度标题] [varchar](50) NULL,
	[破坏率标题] [varchar](50) NULL,
	[温度标题速率] [varchar](50) NULL,
	[破坏率标题速率] [varchar](50) NULL,
	[x轴] [varchar](50) NULL,
	[y轴温度速率] [varchar](50) NULL,
	[y轴温度] [varchar](50) NULL,
	[y轴破坏率速率] [varchar](50) NULL,
	[y轴破坏率] [varchar](50) NULL,
	[温度描述] [ntext] NULL,
	[破坏率描述] [ntext] NULL,
	[温度速率图描述] [ntext] NULL,
	[破坏率速率描述] [ntext] NULL,
 CONSTRAINT [PK_玉米加热破坏实验坐标轴描述表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米特性参数实验批次表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米特性参数实验批次表](
	[实验批次号] [nchar](6) NOT NULL,
	[实验品种名] [varchar](10) NULL,
	[产地] [varchar](10) NULL,
	[购入时间] [date] NULL,
	[数量] [float] NULL,
 CONSTRAINT [PK_玉米特性参数实验批次表] PRIMARY KEY CLUSTERED 
(
	[实验批次号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米特性参数实验数据表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[玉米特性参数实验数据表](
	[检测流水号] [nchar](6) NOT NULL,
	[实验号] [nchar](6) NULL,
	[水分] [float] NULL,
	[破碎率] [float] NULL,
	[杂质含量] [float] NULL,
	[参数值] [float] NULL,
	[检测日期] [date] NULL,
 CONSTRAINT [PK_玉米特性参数实验数据表] PRIMARY KEY CLUSTERED 
(
	[检测流水号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[玉米特性参数实验信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米特性参数实验信息表](
	[实验号] [nchar](6) NOT NULL,
	[参数号] [nchar](6) NULL,
	[起始参数值] [float] NULL,
	[终点参数值] [float] NULL,
	[开始时间] [date] NULL,
	[结束时间] [date] NULL,
	[实验批次号] [nchar](6) NULL,
	[描述] [varchar](10) NULL,
 CONSTRAINT [PK_玉米特性参数实验信息表] PRIMARY KEY CLUSTERED 
(
	[实验号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米特性参数信息表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米特性参数信息表](
	[参数号] [nchar](6) NOT NULL,
	[参数名] [varchar](50) NULL,
	[参数类型] [varchar](50) NULL,
 CONSTRAINT [PK_玉米特性参数信息表] PRIMARY KEY CLUSTERED 
(
	[参数号] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[玉米特性参数阈值表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[玉米特性参数阈值表](
	[阈值id] [nchar](6) NOT NULL,
	[参数号] [nchar](6) NULL,
	[区间低值] [float] NULL,
	[区间高值] [float] NULL,
	[阈值表示] [float] NULL,
 CONSTRAINT [PK_玉米特性参数阈值表] PRIMARY KEY CLUSTERED 
(
	[阈值id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[玉米特性参数坐标轴描述表]    Script Date: 7/11/2016 8:25:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[玉米特性参数坐标轴描述表](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[实验号] [nchar](6) NULL,
	[标题] [varchar](50) NULL,
	[标题速率] [varchar](50) NULL,
	[x轴] [varchar](50) NULL,
	[y轴] [varchar](50) NULL,
	[y轴速率] [varchar](50) NULL,
	[描述] [ntext] NULL,
	[速率图描述] [ntext] NULL,
 CONSTRAINT [PK_玉米描述信息表] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000001', N'000001', N'13.5%', N'15℃', 60.16, CAST(N'2015-01-01' AS Date), 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000002', N'000001', N'13.5%', N'15℃', 60.37, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000003', N'000001', N'13.5%', N'15℃', 59.42, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000004', N'000001', N'13.5%', N'15℃', 60.105, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000005', N'000001', N'13.5%', N'15℃', 60.42, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000006', N'000001', N'13.5%', N'15℃', 59.71, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000007', N'000001', N'13.5%', N'15℃', 57.34, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000008', N'000001', N'13.5%', N'15℃', 60.285, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000009', N'000001', N'13.5%', N'15℃', 58.21, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000010', N'000001', N'13.5%', N'15℃', 59.43, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000011', N'000001', N'13.5%', N'15℃', 59.12, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000012', N'000002', N'13.5%', N'15℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000013', N'000002', N'13.5%', N'15℃', 6.24, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000014', N'000002', N'13.5%', N'15℃', 6.7, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000015', N'000002', N'13.5%', N'15℃', 6.17, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000016', N'000002', N'13.5%', N'15℃', 6.36, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000017', N'000002', N'13.5%', N'15℃', 6.48, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000018', N'000002', N'13.5%', N'15℃', 6.35, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000019', N'000002', N'13.5%', N'15℃', 6.63, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000020', N'000002', N'13.5%', N'15℃', 6.565, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000021', N'000002', N'13.5%', N'15℃', 6.75, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000022', N'000002', N'13.5%', N'15℃', 6.68, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000023', N'000003', N'13.5%', N'15℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000024', N'000003', N'13.5%', N'15℃', 28.645, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000025', N'000003', N'13.5%', N'15℃', 28.355, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000026', N'000003', N'13.5%', N'15℃', 27.645, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000027', N'000003', N'13.5%', N'15℃', 29.48, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000028', N'000003', N'13.5%', N'15℃', 29.15, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000029', N'000003', N'13.5%', N'15℃', 27.95, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000030', N'000003', N'13.5%', N'15℃', 29.56, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000031', N'000003', N'13.5%', N'15℃', 29.11, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000032', N'000003', N'13.5%', N'15℃', 29.49, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000033', N'000003', N'13.5%', N'15℃', 29.04, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000034', N'000004', N'13.5%', N'20℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000035', N'000004', N'13.5%', N'20℃', 60.77, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000036', N'000004', N'13.5%', N'20℃', 60.564, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000037', N'000004', N'13.5%', N'20℃', 59.67, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000038', N'000004', N'13.5%', N'20℃', 59.92, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000039', N'000004', N'13.5%', N'20℃', 59.62, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000040', N'000004', N'13.5%', N'20℃', 58.32, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000041', N'000004', N'13.5%', N'20℃', 59.34, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000042', N'000004', N'13.5%', N'20℃', 58.72, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000043', N'000004', N'13.5%', N'20℃', 59.92, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000044', N'000004', N'13.5%', N'20℃', 59.65, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000045', N'000005', N'13.5%', N'20℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000046', N'000005', N'13.5%', N'20℃', 6.385, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000047', N'000005', N'13.5%', N'20℃', 6.37, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000048', N'000005', N'13.5%', N'20℃', 6.765, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000049', N'000005', N'13.5%', N'20℃', 6.73, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000050', N'000005', N'13.5%', N'20℃', 6.97, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000051', N'000005', N'13.5%', N'20℃', 6.46, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000052', N'000005', N'13.5%', N'20℃', 6.75, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000053', N'000005', N'13.5%', N'20℃', 6.665, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000054', N'000005', N'13.5%', N'20℃', 6.84, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000055', N'000005', N'13.5%', N'20℃', 6.88, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000056', N'000006', N'13.5%', N'20℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000057', N'000006', N'13.5%', N'20℃', 28.725, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000058', N'000006', N'13.5%', N'20℃', 28.315, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000059', N'000006', N'13.5%', N'20℃', 28.5, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000060', N'000006', N'13.5%', N'20℃', 29.82, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000061', N'000006', N'13.5%', N'20℃', 29.48, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000062', N'000006', N'13.5%', N'20℃', 28.71, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000063', N'000006', N'13.5%', N'20℃', 29.425, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000064', N'000006', N'13.5%', N'20℃', 29.34, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000065', N'000006', N'13.5%', N'20℃', 29.64, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000066', N'000006', N'13.5%', N'20℃', 29.82, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000067', N'000007', N'13.5%', N'25℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000068', N'000007', N'13.5%', N'25℃', 59.95, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000069', N'000007', N'13.5%', N'25℃', 60.53, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000070', N'000007', N'13.5%', N'25℃', 60.35, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000071', N'000007', N'13.5%', N'25℃', 59.46, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000072', N'000007', N'13.5%', N'25℃', 58.76, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000073', N'000007', N'13.5%', N'25℃', 59.21, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000074', N'000007', N'13.5%', N'25℃', 59.045, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000075', N'000007', N'13.5%', N'25℃', 59.475, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000076', N'000007', N'13.5%', N'25℃', 58.66, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000077', N'000007', N'13.5%', N'25℃', 59.59, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000078', N'000008', N'13.5%', N'25℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000079', N'000008', N'13.5%', N'25℃', 6.45, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000080', N'000008', N'13.5%', N'25℃', 6.71, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000081', N'000008', N'13.5%', N'25℃', 6.67, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000082', N'000008', N'13.5%', N'25℃', 6.83, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000083', N'000008', N'13.5%', N'25℃', 7.12, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000084', N'000008', N'13.5%', N'25℃', 6.69, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000085', N'000008', N'13.5%', N'25℃', 6.865, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000086', N'000008', N'13.5%', N'25℃', 6.765, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000087', N'000008', N'13.5%', N'25℃', 7.36, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000088', N'000008', N'13.5%', N'25℃', 7.15, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000089', N'000009', N'13.5%', N'25℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000090', N'000009', N'13.5%', N'25℃', 28.26, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000091', N'000009', N'13.5%', N'25℃', 29.345, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000092', N'000009', N'13.5%', N'25℃', 28.635, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000093', N'000009', N'13.5%', N'25℃', 29.67, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000094', N'000009', N'13.5%', N'25℃', 29.75, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000095', N'000009', N'13.5%', N'25℃', 29.29, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000096', N'000009', N'13.5%', N'25℃', 29.63, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000097', N'000009', N'13.5%', N'25℃', 29.255, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000098', N'000009', N'13.5%', N'25℃', 30.39, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000099', N'000009', N'13.5%', N'25℃', 30.03, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000100', N'000010', N'13.5%', N'30℃', 60.16, NULL, 0)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000101', N'000010', N'13.5%', N'30℃', 59.79, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000102', N'000010', N'13.5%', N'30℃', 60.01, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000103', N'000010', N'13.5%', N'30℃', 58.77, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000104', N'000010', N'13.5%', N'30℃', 59.78, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000105', N'000010', N'13.5%', N'30℃', 58.98, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000106', N'000010', N'13.5%', N'30℃', 58.31, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000107', N'000010', N'13.5%', N'30℃', 59.235, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000108', N'000010', N'13.5%', N'30℃', 58.34, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000109', N'000010', N'13.5%', N'30℃', 58.6, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000110', N'000010', N'13.5%', N'30℃', 59.03, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000111', N'000011', N'13.5%', N'30℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000112', N'000011', N'13.5%', N'30℃', 6.67, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000113', N'000011', N'13.5%', N'30℃', 6.83, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000114', N'000011', N'13.5%', N'30℃', 6.99, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000115', N'000011', N'13.5%', N'30℃', 7.13, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000116', N'000011', N'13.5%', N'30℃', 7.48, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000117', N'000011', N'13.5%', N'30℃', 7.06, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000118', N'000011', N'13.5%', N'30℃', 7.315, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000119', N'000011', N'13.5%', N'30℃', 7.235, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000120', N'000011', N'13.5%', N'30℃', 7.65, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000121', N'000011', N'13.5%', N'30℃', 7.45, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000122', N'000012', N'13.5%', N'30℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000123', N'000012', N'13.5%', N'30℃', 29.155, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000124', N'000012', N'13.5%', N'30℃', 29.28, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000125', N'000012', N'13.5%', N'30℃', 28.46, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000126', N'000012', N'13.5%', N'30℃', 30.31, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000127', N'000012', N'13.5%', N'30℃', 31, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000128', N'000012', N'13.5%', N'30℃', 29.4, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000129', N'000012', N'13.5%', N'30℃', 29.635, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000130', N'000012', N'13.5%', N'30℃', 29.35, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000131', N'000012', N'13.5%', N'30℃', 30.31, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000132', N'000012', N'13.5%', N'30℃', 30.04, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000133', N'000013', N'14.5%', N'15℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000134', N'000013', N'14.5%', N'15℃', 61.205, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000135', N'000013', N'14.5%', N'15℃', 60.105, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000136', N'000013', N'14.5%', N'15℃', 59.91, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000137', N'000013', N'14.5%', N'15℃', 58.95, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000138', N'000013', N'14.5%', N'15℃', 59.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000139', N'000013', N'14.5%', N'15℃', 57.83, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000140', N'000013', N'14.5%', N'15℃', 59.775, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000141', N'000013', N'14.5%', N'15℃', 59.385, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000142', N'000013', N'14.5%', N'15℃', 59.505, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000143', N'000013', N'14.5%', N'15℃', 59.33, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000144', N'000014', N'14.5%', N'15℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000145', N'000014', N'14.5%', N'15℃', 6.095, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000146', N'000014', N'14.5%', N'15℃', 6.15, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000147', N'000014', N'14.5%', N'15℃', 6.5, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000148', N'000014', N'14.5%', N'15℃', 6.59, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000149', N'000014', N'14.5%', N'15℃', 6.56, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000150', N'000014', N'14.5%', N'15℃', 6.5, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000151', N'000014', N'14.5%', N'15℃', 6.55, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000152', N'000014', N'14.5%', N'15℃', 6.6, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000153', N'000014', N'14.5%', N'15℃', 6.67, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000154', N'000014', N'14.5%', N'15℃', 6.72, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000155', N'000015', N'14.5%', N'15℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000156', N'000015', N'14.5%', N'15℃', 29.24, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000157', N'000015', N'14.5%', N'15℃', 28.29, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000158', N'000015', N'14.5%', N'15℃', 28.53, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000159', N'000015', N'14.5%', N'15℃', 29.72, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000160', N'000015', N'14.5%', N'15℃', 29.77, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000161', N'000015', N'14.5%', N'15℃', 28.59, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000162', N'000015', N'14.5%', N'15℃', 29.855, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000163', N'000015', N'14.5%', N'15℃', 29.855, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000164', N'000015', N'14.5%', N'15℃', 29.555, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000165', N'000015', N'14.5%', N'15℃', 29.98, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000166', N'000016', N'14.5%', N'20℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000167', N'000016', N'14.5%', N'20℃', 60.14, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000168', N'000016', N'14.5%', N'20℃', 59.335, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000169', N'000016', N'14.5%', N'20℃', 59.565, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000170', N'000016', N'14.5%', N'20℃', 59.93, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000171', N'000016', N'14.5%', N'20℃', 59.15, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000172', N'000016', N'14.5%', N'20℃', 58.18, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000173', N'000016', N'14.5%', N'20℃', 59.485, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000174', N'000016', N'14.5%', N'20℃', 59.375, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000175', N'000016', N'14.5%', N'20℃', 59.035, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000176', N'000016', N'14.5%', N'20℃', 59.15, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000177', N'000017', N'14.5%', N'20℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000178', N'000017', N'14.5%', N'20℃', 6.31, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000179', N'000017', N'14.5%', N'20℃', 6.61, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000180', N'000017', N'14.5%', N'20℃', 6.725, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000181', N'000017', N'14.5%', N'20℃', 6.61, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000182', N'000017', N'14.5%', N'20℃', 6.88, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000183', N'000017', N'14.5%', N'20℃', 6.45, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000184', N'000017', N'14.5%', N'20℃', 6.745, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000185', N'000017', N'14.5%', N'20℃', 6.945, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000186', N'000017', N'14.5%', N'20℃', 7.095, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000187', N'000017', N'14.5%', N'20℃', 7, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000188', N'000018', N'14.5%', N'20℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000189', N'000018', N'14.5%', N'20℃', 28.7, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000190', N'000018', N'14.5%', N'20℃', 28.935, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000191', N'000018', N'14.5%', N'20℃', 28.73, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000192', N'000018', N'14.5%', N'20℃', 29.9, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000193', N'000018', N'14.5%', N'20℃', 29.9, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000194', N'000018', N'14.5%', N'20℃', 28.8, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000195', N'000018', N'14.5%', N'20℃', 29.995, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000196', N'000018', N'14.5%', N'20℃', 30.034, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000197', N'000018', N'14.5%', N'20℃', 30.43, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000198', N'000018', N'14.5%', N'20℃', 29.89, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000199', N'000019', N'14.5%', N'25℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000200', N'000019', N'14.5%', N'25℃', 59.71, NULL, 30)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000201', N'000019', N'14.5%', N'25℃', 59.8, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000202', N'000019', N'14.5%', N'25℃', 59.125, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000203', N'000019', N'14.5%', N'25℃', 59.46, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000204', N'000019', N'14.5%', N'25℃', 59.52, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000205', N'000019', N'14.5%', N'25℃', 57.07, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000206', N'000019', N'14.5%', N'25℃', 58.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000207', N'000019', N'14.5%', N'25℃', 58.53, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000208', N'000019', N'14.5%', N'25℃', 58.705, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000209', N'000019', N'14.5%', N'25℃', 58.99, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000210', N'000020', N'14.5%', N'25℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000211', N'000020', N'14.5%', N'25℃', 6.375, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000212', N'000020', N'14.5%', N'25℃', 6.83, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000213', N'000020', N'14.5%', N'25℃', 6.985, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000214', N'000020', N'14.5%', N'25℃', 7.18, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000215', N'000020', N'14.5%', N'25℃', 7.25, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000216', N'000020', N'14.5%', N'25℃', 6.97, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000217', N'000020', N'14.5%', N'25℃', 6.97, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000218', N'000020', N'14.5%', N'25℃', 7.285, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000219', N'000020', N'14.5%', N'25℃', 7.525, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000220', N'000020', N'14.5%', N'25℃', 7.41, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000221', N'000021', N'14.5%', N'25℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000222', N'000021', N'14.5%', N'25℃', 28.305, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000223', N'000021', N'14.5%', N'25℃', 29.695, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000224', N'000021', N'14.5%', N'25℃', 29.03, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000225', N'000021', N'14.5%', N'25℃', 30.4, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000226', N'000021', N'14.5%', N'25℃', 30.55, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000227', N'000021', N'14.5%', N'25℃', 29.2, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000228', N'000021', N'14.5%', N'25℃', 29.945, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000229', N'000021', N'14.5%', N'25℃', 29.94, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000230', N'000021', N'14.5%', N'25℃', 31.2, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000231', N'000021', N'14.5%', N'25℃', 30.54, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000232', N'000022', N'14.5%', N'30℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000233', N'000022', N'14.5%', N'30℃', 59.345, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000234', N'000022', N'14.5%', N'30℃', 59.665, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000235', N'000022', N'14.5%', N'30℃', 59.62, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000236', N'000022', N'14.5%', N'30℃', 59.31, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000237', N'000022', N'14.5%', N'30℃', 58.82, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000238', N'000022', N'14.5%', N'30℃', 57.32, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000239', N'000022', N'14.5%', N'30℃', 59.935, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000240', N'000022', N'14.5%', N'30℃', 59.655, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000241', N'000022', N'14.5%', N'30℃', 58.645, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000242', N'000022', N'14.5%', N'30℃', 58.81, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000243', N'000023', N'14.5%', N'30℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000244', N'000023', N'14.5%', N'30℃', 6.81, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000245', N'000023', N'14.5%', N'30℃', 7.115, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000246', N'000023', N'14.5%', N'30℃', 6.915, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000247', N'000023', N'14.5%', N'30℃', 7.39, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000248', N'000023', N'14.5%', N'30℃', 7.54, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000249', N'000023', N'14.5%', N'30℃', 7.26, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000250', N'000023', N'14.5%', N'30℃', 7.275, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000251', N'000023', N'14.5%', N'30℃', 6.98, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000252', N'000023', N'14.5%', N'30℃', 7.845, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000253', N'000023', N'14.5%', N'30℃', 8, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000254', N'000024', N'14.5%', N'30℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000255', N'000024', N'14.5%', N'30℃', 28.59, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000256', N'000024', N'14.5%', N'30℃', 29.58, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000257', N'000024', N'14.5%', N'30℃', 28.92, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000258', N'000024', N'14.5%', N'30℃', 30.87, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000259', N'000024', N'14.5%', N'30℃', 30.76, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000260', N'000024', N'14.5%', N'30℃', 29.49, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000261', N'000024', N'14.5%', N'30℃', 30.275, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000262', N'000024', N'14.5%', N'30℃', 29.705, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000263', N'000024', N'14.5%', N'30℃', 30.86, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000264', N'000024', N'14.5%', N'30℃', 30.85, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000265', N'000025', N'15.5%', N'15℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000266', N'000025', N'15.5%', N'15℃', 59.54, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000267', N'000025', N'15.5%', N'15℃', 59.07, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000268', N'000025', N'15.5%', N'15℃', 59.165, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000269', N'000025', N'15.5%', N'15℃', 59.59, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000270', N'000025', N'15.5%', N'15℃', 59.13, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000271', N'000025', N'15.5%', N'15℃', 57.85, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000272', N'000025', N'15.5%', N'15℃', 59.01, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000273', N'000025', N'15.5%', N'15℃', 59.285, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000274', N'000025', N'15.5%', N'15℃', 59.43, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000275', N'000025', N'15.5%', N'15℃', 58.66, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000276', N'000026', N'15.5%', N'15℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000277', N'000026', N'15.5%', N'15℃', 6.22, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000278', N'000026', N'15.5%', N'15℃', 6.505, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000279', N'000026', N'15.5%', N'15℃', 6.49, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000280', N'000026', N'15.5%', N'15℃', 6.64, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000281', N'000026', N'15.5%', N'15℃', 6.58, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000282', N'000026', N'15.5%', N'15℃', 6.3, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000283', N'000026', N'15.5%', N'15℃', 6.765, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000284', N'000026', N'15.5%', N'15℃', 6.595, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000285', N'000026', N'15.5%', N'15℃', 6.56, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000286', N'000026', N'15.5%', N'15℃', 7.09, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000287', N'000027', N'15.5%', N'15℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000288', N'000027', N'15.5%', N'15℃', 28.395, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000289', N'000027', N'15.5%', N'15℃', 28.73, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000290', N'000027', N'15.5%', N'15℃', 28.235, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000291', N'000027', N'15.5%', N'15℃', 29.62, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000292', N'000027', N'15.5%', N'15℃', 29.97, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000293', N'000027', N'15.5%', N'15℃', 28.46, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000294', N'000027', N'15.5%', N'15℃', 30.165, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000295', N'000027', N'15.5%', N'15℃', 29.12, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000296', N'000027', N'15.5%', N'15℃', 29.865, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000297', N'000027', N'15.5%', N'15℃', 29.96, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000298', N'000028', N'15.5%', N'20℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000299', N'000028', N'15.5%', N'20℃', 59.595, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000300', N'000028', N'15.5%', N'20℃', 59.25, NULL, 60)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000301', N'000028', N'15.5%', N'20℃', 59.79, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000302', N'000028', N'15.5%', N'20℃', 59.89, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000303', N'000028', N'15.5%', N'20℃', 59.01, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000304', N'000028', N'15.5%', N'20℃', 57.66, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000305', N'000028', N'15.5%', N'20℃', 59.185, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000306', N'000028', N'15.5%', N'20℃', 58.955, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000307', N'000028', N'15.5%', N'20℃', 59.18, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000308', N'000028', N'15.5%', N'20℃', 58.91, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000309', N'000029', N'15.5%', N'20℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000310', N'000029', N'15.5%', N'20℃', 6.255, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000311', N'000029', N'15.5%', N'20℃', 6.655, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000312', N'000029', N'15.5%', N'20℃', 6.405, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000313', N'000029', N'15.5%', N'20℃', 6.76, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000314', N'000029', N'15.5%', N'20℃', 6.85, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000315', N'000029', N'15.5%', N'20℃', 6.54, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000316', N'000029', N'15.5%', N'20℃', 6.935, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000317', N'000029', N'15.5%', N'20℃', 7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000318', N'000029', N'15.5%', N'20℃', 7.12, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000319', N'000029', N'15.5%', N'20℃', 7, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000320', N'000030', N'15.5%', N'20℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000321', N'000030', N'15.5%', N'20℃', 28.256, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000322', N'000030', N'15.5%', N'20℃', 29.255, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000323', N'000030', N'15.5%', N'20℃', 28.27, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000324', N'000030', N'15.5%', N'20℃', 29.93, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000325', N'000030', N'15.5%', N'20℃', 30.03, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000326', N'000030', N'15.5%', N'20℃', 29.14, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000327', N'000030', N'15.5%', N'20℃', 30.44, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000328', N'000030', N'15.5%', N'20℃', 29.9, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000329', N'000030', N'15.5%', N'20℃', 30.99, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000330', N'000030', N'15.5%', N'20℃', 30.11, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000331', N'000031', N'15.5%', N'25℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000332', N'000031', N'15.5%', N'25℃', 59.335, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000333', N'000031', N'15.5%', N'25℃', 59.305, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000334', N'000031', N'15.5%', N'25℃', 59.005, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000335', N'000031', N'15.5%', N'25℃', 59.68, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000336', N'000031', N'15.5%', N'25℃', 58.46, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000337', N'000031', N'15.5%', N'25℃', 56.83, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000338', N'000031', N'15.5%', N'25℃', 58.525, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000339', N'000031', N'15.5%', N'25℃', 58.735, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000340', N'000031', N'15.5%', N'25℃', 58.19, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000341', N'000031', N'15.5%', N'25℃', 58.63, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000342', N'000032', N'15.5%', N'25℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000343', N'000032', N'15.5%', N'25℃', 6.825, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000344', N'000032', N'15.5%', N'25℃', 6.645, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000345', N'000032', N'15.5%', N'25℃', 6.67, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000346', N'000032', N'15.5%', N'25℃', 6.65, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000347', N'000032', N'15.5%', N'25℃', 7.09, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000348', N'000032', N'15.5%', N'25℃', 6.78, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000349', N'000032', N'15.5%', N'25℃', 7.475, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000350', N'000032', N'15.5%', N'25℃', 7.21, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000351', N'000032', N'15.5%', N'25℃', 7.5, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000352', N'000032', N'15.5%', N'25℃', 7.33, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000353', N'000033', N'15.5%', N'25℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000354', N'000033', N'15.5%', N'25℃', 29.42, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000355', N'000033', N'15.5%', N'25℃', 29.215, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000356', N'000033', N'15.5%', N'25℃', 28.56, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000357', N'000033', N'15.5%', N'25℃', 30.34, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000358', N'000033', N'15.5%', N'25℃', 30.47, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000359', N'000033', N'15.5%', N'25℃', 29.03, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000360', N'000033', N'15.5%', N'25℃', 30.695, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000361', N'000033', N'15.5%', N'25℃', 29.885, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000362', N'000033', N'15.5%', N'25℃', 31.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000363', N'000033', N'15.5%', N'25℃', 30.66, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000364', N'000034', N'15.5%', N'30℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000365', N'000034', N'15.5%', N'30℃', 59.96, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000366', N'000034', N'15.5%', N'30℃', 59.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000367', N'000034', N'15.5%', N'30℃', 58.82, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000368', N'000034', N'15.5%', N'30℃', 58.5, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000369', N'000034', N'15.5%', N'30℃', 58.57, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000370', N'000034', N'15.5%', N'30℃', 56.67, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000371', N'000034', N'15.5%', N'30℃', 57.85, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000372', N'000034', N'15.5%', N'30℃', 58.395, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000373', N'000034', N'15.5%', N'30℃', 57.84, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000374', N'000034', N'15.5%', N'30℃', 57.89, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000375', N'000035', N'15.5%', N'30℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000376', N'000035', N'15.5%', N'30℃', 6.83, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000377', N'000035', N'15.5%', N'30℃', 6.905, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000378', N'000035', N'15.5%', N'30℃', 6.975, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000379', N'000035', N'15.5%', N'30℃', 7.22, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000380', N'000035', N'15.5%', N'30℃', 7.34, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000381', N'000035', N'15.5%', N'30℃', 7.47, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000382', N'000035', N'15.5%', N'30℃', 7.68, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000383', N'000035', N'15.5%', N'30℃', 7.23, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000384', N'000035', N'15.5%', N'30℃', 7.91, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000385', N'000035', N'15.5%', N'30℃', 7.74, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000386', N'000036', N'15.5%', N'30℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000387', N'000036', N'15.5%', N'30℃', 29.775, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000388', N'000036', N'15.5%', N'30℃', 29.72, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000389', N'000036', N'15.5%', N'30℃', 28.84, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000390', N'000036', N'15.5%', N'30℃', 30.54, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000391', N'000036', N'15.5%', N'30℃', 30.87, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000392', N'000036', N'15.5%', N'30℃', 29.83, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000393', N'000036', N'15.5%', N'30℃', 30.505, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000394', N'000036', N'15.5%', N'30℃', 29.89, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000395', N'000036', N'15.5%', N'30℃', 30.51, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000396', N'000036', N'15.5%', N'30℃', 30.99, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000397', N'000037', N'16.5%', N'15℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000398', N'000037', N'16.5%', N'15℃', 59.51, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000399', N'000037', N'16.5%', N'15℃', 59.44, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000400', N'000037', N'16.5%', N'15℃', 59.505, NULL, 90)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000401', N'000037', N'16.5%', N'15℃', 59.7, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000402', N'000037', N'16.5%', N'15℃', 58.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000403', N'000037', N'16.5%', N'15℃', 57.27, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000404', N'000037', N'16.5%', N'15℃', 59.125, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000405', N'000037', N'16.5%', N'15℃', 58.765, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000406', N'000037', N'16.5%', N'15℃', 58.895, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000407', N'000037', N'16.5%', N'15℃', 58.87, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000408', N'000038', N'16.5%', N'15℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000409', N'000038', N'16.5%', N'15℃', 6.37, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000410', N'000038', N'16.5%', N'15℃', 6.295, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000411', N'000038', N'16.5%', N'15℃', 6.35, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000412', N'000038', N'16.5%', N'15℃', 6.57, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000413', N'000038', N'16.5%', N'15℃', 6.51, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000414', N'000038', N'16.5%', N'15℃', 6.47, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000415', N'000038', N'16.5%', N'15℃', 6.665, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000416', N'000038', N'16.5%', N'15℃', 6.605, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000417', N'000038', N'16.5%', N'15℃', 6.98, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000418', N'000038', N'16.5%', N'15℃', 6.79, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000419', N'000039', N'16.5%', N'15℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000420', N'000039', N'16.5%', N'15℃', 28.815, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000421', N'000039', N'16.5%', N'15℃', 29.24, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000422', N'000039', N'16.5%', N'15℃', 28.78, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000423', N'000039', N'16.5%', N'15℃', 30.32, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000424', N'000039', N'16.5%', N'15℃', 29.45, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000425', N'000039', N'16.5%', N'15℃', 28.88, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000426', N'000039', N'16.5%', N'15℃', 30.265, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000427', N'000039', N'16.5%', N'15℃', 28.645, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000428', N'000039', N'16.5%', N'15℃', 29.605, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000429', N'000039', N'16.5%', N'15℃', 30.08, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000430', N'000040', N'16.5%', N'20℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000431', N'000040', N'16.5%', N'20℃', 59.535, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000432', N'000040', N'16.5%', N'20℃', 58.615, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000433', N'000040', N'16.5%', N'20℃', 59.55, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000434', N'000040', N'16.5%', N'20℃', 59.25, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000435', N'000040', N'16.5%', N'20℃', 59.105, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000436', N'000040', N'16.5%', N'20℃', 56.88, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000437', N'000040', N'16.5%', N'20℃', 59.49, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000438', N'000040', N'16.5%', N'20℃', 59.04, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000439', N'000040', N'16.5%', N'20℃', 58.86, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000440', N'000040', N'16.5%', N'20℃', 59.02, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000441', N'000041', N'16.5%', N'20℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000442', N'000041', N'16.5%', N'20℃', 6.28, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000443', N'000041', N'16.5%', N'20℃', 6.835, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000444', N'000041', N'16.5%', N'20℃', 6.62, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000445', N'000041', N'16.5%', N'20℃', 6.61, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000446', N'000041', N'16.5%', N'20℃', 6.99, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000447', N'000041', N'16.5%', N'20℃', 6.44, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000448', N'000041', N'16.5%', N'20℃', 6.735, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000449', N'000041', N'16.5%', N'20℃', 6.765, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000450', N'000041', N'16.5%', N'20℃', 7.035, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000451', N'000041', N'16.5%', N'20℃', 6.93, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000452', N'000042', N'16.5%', N'20℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000453', N'000042', N'16.5%', N'20℃', 28.695, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000454', N'000042', N'16.5%', N'20℃', 29.27, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000455', N'000042', N'16.5%', N'20℃', 28.885, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000456', N'000042', N'16.5%', N'20℃', 30.33, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000457', N'000042', N'16.5%', N'20℃', 30.245, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000458', N'000042', N'16.5%', N'20℃', 28.55, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000459', N'000042', N'16.5%', N'20℃', 30.345, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000460', N'000042', N'16.5%', N'20℃', 29.64, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000461', N'000042', N'16.5%', N'20℃', 30.49, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000462', N'000042', N'16.5%', N'20℃', 30.72, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000463', N'000043', N'16.5%', N'25℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000464', N'000043', N'16.5%', N'25℃', 59.37, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000465', N'000043', N'16.5%', N'25℃', 58.935, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000466', N'000043', N'16.5%', N'25℃', 59.165, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000467', N'000043', N'16.5%', N'25℃', 58.98, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000468', N'000043', N'16.5%', N'25℃', 59.24, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000469', N'000043', N'16.5%', N'25℃', 57.35, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000470', N'000043', N'16.5%', N'25℃', 58.77, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000471', N'000043', N'16.5%', N'25℃', 58.32, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000472', N'000043', N'16.5%', N'25℃', 57.64, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000473', N'000043', N'16.5%', N'25℃', 58.79, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000474', N'000044', N'16.5%', N'25℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000475', N'000044', N'16.5%', N'25℃', 6.69, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000476', N'000044', N'16.5%', N'25℃', 6.72, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000477', N'000044', N'16.5%', N'25℃', 6.78, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000478', N'000044', N'16.5%', N'25℃', 7.06, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000479', N'000044', N'16.5%', N'25℃', 6.94, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000480', N'000044', N'16.5%', N'25℃', 7.06, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000481', N'000044', N'16.5%', N'25℃', 7.085, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000482', N'000044', N'16.5%', N'25℃', 7.445, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000483', N'000044', N'16.5%', N'25℃', 7.35, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000484', N'000044', N'16.5%', N'25℃', 7.63, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000485', N'000045', N'16.5%', N'25℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000486', N'000045', N'16.5%', N'25℃', 28.66, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000487', N'000045', N'16.5%', N'25℃', 29.475, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000488', N'000045', N'16.5%', N'25℃', 28.675, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000489', N'000045', N'16.5%', N'25℃', 30.71, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000490', N'000045', N'16.5%', N'25℃', 30.675, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000491', N'000045', N'16.5%', N'25℃', 29.75, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000492', N'000045', N'16.5%', N'25℃', 30.495, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000493', N'000045', N'16.5%', N'25℃', 30.54, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000494', N'000045', N'16.5%', N'25℃', 30.835, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000495', N'000045', N'16.5%', N'25℃', 31.28, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000496', N'000046', N'16.5%', N'30℃', 60.16, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000497', N'000046', N'16.5%', N'30℃', 59.51, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000498', N'000046', N'16.5%', N'30℃', 59.03, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000499', N'000046', N'16.5%', N'30℃', 58.685, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000500', N'000046', N'16.5%', N'30℃', 58.84, NULL, 120)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000501', N'000046', N'16.5%', N'30℃', 58.16, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000502', N'000046', N'16.5%', N'30℃', 55.91, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000503', N'000046', N'16.5%', N'30℃', 58.305, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000504', N'000046', N'16.5%', N'30℃', 56.565, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000505', N'000046', N'16.5%', N'30℃', 57.765, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000506', N'000046', N'16.5%', N'30℃', 57.91, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000507', N'000047', N'16.5%', N'30℃', 6.27, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000508', N'000047', N'16.5%', N'30℃', 7, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000509', N'000047', N'16.5%', N'30℃', 7.065, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000510', N'000047', N'16.5%', N'30℃', 7.22, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000511', N'000047', N'16.5%', N'30℃', 7.41, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000512', N'000047', N'16.5%', N'30℃', 7.59, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000513', N'000047', N'16.5%', N'30℃', 7.55, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000514', N'000047', N'16.5%', N'30℃', 7.52, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000515', N'000047', N'16.5%', N'30℃', 7.805, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000516', N'000047', N'16.5%', N'30℃', 7.485, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000517', N'000047', N'16.5%', N'30℃', 7.92, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000518', N'000048', N'16.5%', N'30℃', 29.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000519', N'000048', N'16.5%', N'30℃', 29.785, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000520', N'000048', N'16.5%', N'30℃', 29.825, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000521', N'000048', N'16.5%', N'30℃', 29.355, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000522', N'000048', N'16.5%', N'30℃', 31.13, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000523', N'000048', N'16.5%', N'30℃', 31.32, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000524', N'000048', N'16.5%', N'30℃', 29.67, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000525', N'000048', N'16.5%', N'30℃', 30.92, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000526', N'000048', N'16.5%', N'30℃', 30.89, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000527', N'000048', N'16.5%', N'30℃', 30.67, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000528', N'000048', N'16.5%', N'30℃', 30.83, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000529', N'000049', N'13.5%', N'15℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000530', N'000049', N'13.5%', N'15℃', 14.41, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000531', N'000049', N'13.5%', N'15℃', 15.63, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000532', N'000049', N'13.5%', N'15℃', 15.06, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000533', N'000049', N'13.5%', N'15℃', 28.46, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000534', N'000049', N'13.5%', N'15℃', 19.19, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000535', N'000049', N'13.5%', N'15℃', 20.33, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000536', N'000049', N'13.5%', N'15℃', 28.42, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000537', N'000049', N'13.5%', N'15℃', 22.57, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000538', N'000049', N'13.5%', N'15℃', 24.32, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000539', N'000049', N'13.5%', N'15℃', 28.43, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000540', N'000050', N'13.5%', N'20℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000541', N'000050', N'13.5%', N'20℃', 14.37, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000542', N'000050', N'13.5%', N'20℃', 15.93, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000543', N'000050', N'13.5%', N'20℃', 24.17, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000544', N'000050', N'13.5%', N'20℃', 21.33, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000545', N'000050', N'13.5%', N'20℃', 21.74, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000546', N'000050', N'13.5%', N'20℃', 21.95, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000547', N'000050', N'13.5%', N'20℃', 27.76, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000548', N'000050', N'13.5%', N'20℃', 24.56, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000549', N'000050', N'13.5%', N'20℃', 30.17, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000550', N'000050', N'13.5%', N'20℃', 33.32, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000551', N'000051', N'13.5%', N'25℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000552', N'000051', N'13.5%', N'25℃', 17.01, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000553', N'000051', N'13.5%', N'25℃', 18.27, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000554', N'000051', N'13.5%', N'25℃', 20.08, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000555', N'000051', N'13.5%', N'25℃', 23.41, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000556', N'000051', N'13.5%', N'25℃', 23.23, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000557', N'000051', N'13.5%', N'25℃', 28.27, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000558', N'000051', N'13.5%', N'25℃', 24.37, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000559', N'000051', N'13.5%', N'25℃', 26.17, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000560', N'000051', N'13.5%', N'25℃', 35.35, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000561', N'000051', N'13.5%', N'25℃', 36.48, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000562', N'000052', N'13.5%', N'30℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000563', N'000052', N'13.5%', N'30℃', 18.33, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000564', N'000052', N'13.5%', N'30℃', 19.89, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000565', N'000052', N'13.5%', N'30℃', 25.89, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000566', N'000052', N'13.5%', N'30℃', 23.35, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000567', N'000052', N'13.5%', N'30℃', 24.21, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000568', N'000052', N'13.5%', N'30℃', 30.95, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000569', N'000052', N'13.5%', N'30℃', 27.51, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000570', N'000052', N'13.5%', N'30℃', 46.62, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000571', N'000052', N'13.5%', N'30℃', 37.01, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000572', N'000052', N'13.5%', N'30℃', 37.84, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000573', N'000053', N'14.5%', N'15℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000574', N'000053', N'14.5%', N'15℃', 14.58, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000575', N'000053', N'14.5%', N'15℃', 16.57, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000576', N'000053', N'14.5%', N'15℃', 18.16, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000577', N'000053', N'14.5%', N'15℃', 21.95, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000578', N'000053', N'14.5%', N'15℃', 21.37, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000579', N'000053', N'14.5%', N'15℃', 35.92, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000580', N'000053', N'14.5%', N'15℃', 34.23, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000581', N'000053', N'14.5%', N'15℃', 43.03, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000582', N'000053', N'14.5%', N'15℃', 35.74, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000583', N'000053', N'14.5%', N'15℃', 35.89, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000584', N'000054', N'14.5%', N'20℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000585', N'000054', N'14.5%', N'20℃', 16.07, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000586', N'000054', N'14.5%', N'20℃', 18.59, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000587', N'000054', N'14.5%', N'20℃', 18.89, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000588', N'000054', N'14.5%', N'20℃', 26.28, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000589', N'000054', N'14.5%', N'20℃', 38.34, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000590', N'000054', N'14.5%', N'20℃', 33.84, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000591', N'000054', N'14.5%', N'20℃', 55.06, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000592', N'000054', N'14.5%', N'20℃', 44.07, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000593', N'000054', N'14.5%', N'20℃', 47.46, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000594', N'000054', N'14.5%', N'20℃', 46.24, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000595', N'000055', N'14.5%', N'25℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000596', N'000055', N'14.5%', N'25℃', 19.17, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000597', N'000055', N'14.5%', N'25℃', 26.33, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000598', N'000055', N'14.5%', N'25℃', 34.56, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000599', N'000055', N'14.5%', N'25℃', 42.49, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000600', N'000055', N'14.5%', N'25℃', 45.36, NULL, 150)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000601', N'000055', N'14.5%', N'25℃', 55.92, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000602', N'000055', N'14.5%', N'25℃', 48.58, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000603', N'000055', N'14.5%', N'25℃', 47.17, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000604', N'000055', N'14.5%', N'25℃', 58.13, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000605', N'000055', N'14.5%', N'25℃', 48.57, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000606', N'000056', N'14.5%', N'30℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000607', N'000056', N'14.5%', N'30℃', 19.29, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000608', N'000056', N'14.5%', N'30℃', 31.08, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000609', N'000056', N'14.5%', N'30℃', 33.47, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000610', N'000056', N'14.5%', N'30℃', 45.37, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000611', N'000056', N'14.5%', N'30℃', 37.76, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000612', N'000056', N'14.5%', N'30℃', 48.98, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000613', N'000056', N'14.5%', N'30℃', 56.85, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000614', N'000056', N'14.5%', N'30℃', 67.54, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000615', N'000056', N'14.5%', N'30℃', 56.26, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000616', N'000056', N'14.5%', N'30℃', 53.79, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000617', N'000057', N'15.5%', N'15℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000618', N'000057', N'15.5%', N'15℃', 20.37, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000619', N'000057', N'15.5%', N'15℃', 21.78, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000620', N'000057', N'15.5%', N'15℃', 29.97, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000621', N'000057', N'15.5%', N'15℃', 26.81, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000622', N'000057', N'15.5%', N'15℃', 26.47, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000623', N'000057', N'15.5%', N'15℃', 49.16, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000624', N'000057', N'15.5%', N'15℃', 47.23, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000625', N'000057', N'15.5%', N'15℃', 55.93, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000626', N'000057', N'15.5%', N'15℃', 52.45, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000627', N'000058', N'15.5%', N'20℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000628', N'000058', N'15.5%', N'20℃', 23.54, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000629', N'000058', N'15.5%', N'20℃', 29.25, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000630', N'000058', N'15.5%', N'20℃', 32.48, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000631', N'000058', N'15.5%', N'20℃', 43.09, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000632', N'000058', N'15.5%', N'20℃', 56.15, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000633', N'000058', N'15.5%', N'20℃', 47.47, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000634', N'000058', N'15.5%', N'20℃', 56.57, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000635', N'000058', N'15.5%', N'20℃', 59.35, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000636', N'000058', N'15.5%', N'20℃', 58.74, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000637', N'000058', N'15.5%', N'20℃', 61.19, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000638', N'000059', N'15.5%', N'25℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000639', N'000059', N'15.5%', N'25℃', 26.07, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000640', N'000059', N'15.5%', N'25℃', 32.26, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000641', N'000059', N'15.5%', N'25℃', 43.26, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000642', N'000059', N'15.5%', N'25℃', 36.87, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000643', N'000059', N'15.5%', N'25℃', 65.17, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000644', N'000059', N'15.5%', N'25℃', 59.86, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000645', N'000059', N'15.5%', N'25℃', 60.08, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000646', N'000059', N'15.5%', N'25℃', 68.63, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000647', N'000059', N'15.5%', N'25℃', 63.68, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000648', N'000059', N'15.5%', N'25℃', 67.68, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000649', N'000060', N'15.5%', N'30℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000650', N'000060', N'15.5%', N'30℃', 31.27, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000651', N'000060', N'15.5%', N'30℃', 44.14, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000652', N'000060', N'15.5%', N'30℃', 43.04, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000653', N'000060', N'15.5%', N'30℃', 75.92, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000654', N'000060', N'15.5%', N'30℃', 58.91, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000655', N'000060', N'15.5%', N'30℃', 69.45, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000656', N'000060', N'15.5%', N'30℃', 64.67, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000657', N'000060', N'15.5%', N'30℃', 71.95, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000658', N'000060', N'15.5%', N'30℃', 80.49, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000659', N'000060', N'15.5%', N'30℃', 71.91, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000660', N'000061', N'16.5%', N'15℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000661', N'000061', N'16.5%', N'15℃', 33.24, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000662', N'000061', N'16.5%', N'15℃', 35.15, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000663', N'000061', N'16.5%', N'15℃', 52.68, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000664', N'000061', N'16.5%', N'15℃', 45.36, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000665', N'000061', N'16.5%', N'15℃', 76.46, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000666', N'000061', N'16.5%', N'15℃', 51.82, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000667', N'000061', N'16.5%', N'15℃', 69.27, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000668', N'000061', N'16.5%', N'15℃', 65.04, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000669', N'000061', N'16.5%', N'15℃', 71.95, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000670', N'000061', N'16.5%', N'15℃', 78.58, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000671', N'000062', N'16.5%', N'20℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000672', N'000062', N'16.5%', N'20℃', 34.17, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000673', N'000062', N'16.5%', N'20℃', 38.73, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000674', N'000062', N'16.5%', N'20℃', 60.35, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000675', N'000062', N'16.5%', N'20℃', 49.17, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000676', N'000062', N'16.5%', N'20℃', 58.21, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000677', N'000062', N'16.5%', N'20℃', 89.19, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000678', N'000062', N'16.5%', N'20℃', 70.86, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000679', N'000062', N'16.5%', N'20℃', 71.25, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000680', N'000062', N'16.5%', N'20℃', 83.62, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000681', N'000062', N'16.5%', N'20℃', 85.49, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000682', N'000063', N'16.5%', N'25℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000683', N'000063', N'16.5%', N'25℃', 40.74, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000684', N'000063', N'16.5%', N'25℃', 44.75, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000685', N'000063', N'16.5%', N'25℃', 54.58, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000686', N'000063', N'16.5%', N'25℃', 69.67, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000687', N'000063', N'16.5%', N'25℃', 52.79, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000688', N'000063', N'16.5%', N'25℃', 82.16, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000689', N'000063', N'16.5%', N'25℃', 74.84, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000690', N'000063', N'16.5%', N'25℃', 80.58, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000691', N'000063', N'16.5%', N'25℃', 84.68, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000692', N'000063', N'16.5%', N'25℃', 87.47, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000693', N'000064', N'16.5%', N'30℃', 13.32, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000694', N'000064', N'16.5%', N'30℃', 42.42, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000695', N'000064', N'16.5%', N'30℃', 48.29, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000696', N'000064', N'16.5%', N'30℃', 57.61, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000697', N'000064', N'16.5%', N'30℃', 43.75, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000698', N'000064', N'16.5%', N'30℃', 61.64, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000699', N'000064', N'16.5%', N'30℃', 93.49, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000700', N'000064', N'16.5%', N'30℃', 85.87, NULL, 210)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000701', N'000064', N'16.5%', N'30℃', 84.63, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000702', N'000064', N'16.5%', N'30℃', 95.19, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000703', N'000064', N'16.5%', N'30℃', 99.48, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000704', N'000065', N'13.5%', N'15℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000705', N'000065', N'13.5%', N'15℃', 69.1, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000706', N'000065', N'13.5%', N'15℃', 68.9, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000707', N'000065', N'13.5%', N'15℃', 67.7, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000708', N'000065', N'13.5%', N'15℃', 67.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000709', N'000065', N'13.5%', N'15℃', 66.3, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000710', N'000065', N'13.5%', N'15℃', 60.1, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000711', N'000065', N'13.5%', N'15℃', 65, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000712', N'000065', N'13.5%', N'15℃', 65.8, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000713', N'000065', N'13.5%', N'15℃', 64.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000714', N'000065', N'13.5%', N'15℃', 64.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000715', N'000066', N'13.5%', N'20℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000716', N'000066', N'13.5%', N'20℃', 69.5, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000717', N'000066', N'13.5%', N'20℃', 68.3, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000718', N'000066', N'13.5%', N'20℃', 67.2, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000719', N'000066', N'13.5%', N'20℃', 65, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000720', N'000066', N'13.5%', N'20℃', 66, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000721', N'000066', N'13.5%', N'20℃', 64.2, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000722', N'000066', N'13.5%', N'20℃', 58.1, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000723', N'000066', N'13.5%', N'20℃', 61.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000724', N'000066', N'13.5%', N'20℃', 62.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000725', N'000066', N'13.5%', N'20℃', 61.3, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000726', N'000067', N'13.5%', N'25℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000727', N'000067', N'13.5%', N'25℃', 68.2, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000728', N'000067', N'13.5%', N'25℃', 67.2, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000729', N'000067', N'13.5%', N'25℃', 64.9, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000730', N'000067', N'13.5%', N'25℃', 63.4, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000731', N'000067', N'13.5%', N'25℃', 62.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000732', N'000067', N'13.5%', N'25℃', 60.4, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000733', N'000067', N'13.5%', N'25℃', 59.8, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000734', N'000067', N'13.5%', N'25℃', 48.2, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000735', N'000067', N'13.5%', N'25℃', 58.6, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000736', N'000067', N'13.5%', N'25℃', 58.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000737', N'000068', N'13.5%', N'30℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000738', N'000068', N'13.5%', N'30℃', 68.4, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000739', N'000068', N'13.5%', N'30℃', 63.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000740', N'000068', N'13.5%', N'30℃', 60.8, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000741', N'000068', N'13.5%', N'30℃', 63.7, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000742', N'000068', N'13.5%', N'30℃', 52.3, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000743', N'000068', N'13.5%', N'30℃', 59.6, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000744', N'000068', N'13.5%', N'30℃', 59.2, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000745', N'000068', N'13.5%', N'30℃', 57.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000746', N'000068', N'13.5%', N'30℃', 47.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000747', N'000068', N'13.5%', N'30℃', 56.7, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000748', N'000069', N'14.5%', N'15℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000749', N'000069', N'14.5%', N'15℃', 68.9, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000750', N'000069', N'14.5%', N'15℃', 67.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000751', N'000069', N'14.5%', N'15℃', 64.2, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000752', N'000069', N'14.5%', N'15℃', 62.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000753', N'000069', N'14.5%', N'15℃', 55.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000754', N'000069', N'14.5%', N'15℃', 58.9, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000755', N'000069', N'14.5%', N'15℃', 56.4, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000756', N'000069', N'14.5%', N'15℃', 55.5, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000757', N'000069', N'14.5%', N'15℃', 54.8, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000758', N'000069', N'14.5%', N'15℃', 55.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000759', N'000070', N'14.5%', N'20℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000760', N'000070', N'14.5%', N'20℃', 68.2, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000761', N'000070', N'14.5%', N'20℃', 65.7, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000762', N'000070', N'14.5%', N'20℃', 60.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000763', N'000070', N'14.5%', N'20℃', 58.8, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000764', N'000070', N'14.5%', N'20℃', 56.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000765', N'000070', N'14.5%', N'20℃', 55.8, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000766', N'000070', N'14.5%', N'20℃', 54.7, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000767', N'000070', N'14.5%', N'20℃', 56.1, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000768', N'000070', N'14.5%', N'20℃', 44.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000769', N'000070', N'14.5%', N'20℃', 53.7, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000770', N'000071', N'14.5%', N'25℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000771', N'000071', N'14.5%', N'25℃', 66.9, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000772', N'000071', N'14.5%', N'25℃', 63.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000773', N'000071', N'14.5%', N'25℃', 62.9, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000774', N'000071', N'14.5%', N'25℃', 58.4, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000775', N'000071', N'14.5%', N'25℃', 55.1, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000776', N'000071', N'14.5%', N'25℃', 46.9, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000777', N'000071', N'14.5%', N'25℃', 53.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000778', N'000071', N'14.5%', N'25℃', 54.4, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000779', N'000071', N'14.5%', N'25℃', 53.3, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000780', N'000071', N'14.5%', N'25℃', 52.6, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000781', N'000072', N'14.5%', N'30℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000782', N'000072', N'14.5%', N'30℃', 67.6, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000783', N'000072', N'14.5%', N'30℃', 63.8, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000784', N'000072', N'14.5%', N'30℃', 59.3, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000785', N'000072', N'14.5%', N'30℃', 49.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000786', N'000072', N'14.5%', N'30℃', 54.8, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000787', N'000072', N'14.5%', N'30℃', 55.5, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000788', N'000072', N'14.5%', N'30℃', 50.4, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000789', N'000072', N'14.5%', N'30℃', 53.8, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000790', N'000072', N'14.5%', N'30℃', 40.7, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000791', N'000072', N'14.5%', N'30℃', 51.4, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000792', N'000073', N'15.5%', N'15℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000793', N'000073', N'15.5%', N'15℃', 66.4, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000794', N'000073', N'15.5%', N'15℃', 63.7, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000795', N'000073', N'15.5%', N'15℃', 52.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000796', N'000073', N'15.5%', N'15℃', 54.2, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000797', N'000073', N'15.5%', N'15℃', 53.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000798', N'000073', N'15.5%', N'15℃', 52.9, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000799', N'000073', N'15.5%', N'15℃', 49.2, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000800', N'000073', N'15.5%', N'15℃', 51.5, NULL, 240)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000801', N'000073', N'15.5%', N'15℃', 49.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000802', N'000073', N'15.5%', N'15℃', 49.3, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000803', N'000074', N'15.5%', N'20℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000804', N'000074', N'15.5%', N'20℃', 65.7, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000805', N'000074', N'15.5%', N'20℃', 60.5, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000806', N'000074', N'15.5%', N'20℃', 51.1, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000807', N'000074', N'15.5%', N'20℃', 44.5, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000808', N'000074', N'15.5%', N'20℃', 53.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000809', N'000074', N'15.5%', N'20℃', 50.8, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000810', N'000074', N'15.5%', N'20℃', 52.1, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000811', N'000074', N'15.5%', N'20℃', 44.3, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000812', N'000074', N'15.5%', N'20℃', 48.6, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000813', N'000074', N'15.5%', N'20℃', 47.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000814', N'000075', N'15.5%', N'25℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000815', N'000075', N'15.5%', N'25℃', 65.6, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000816', N'000075', N'15.5%', N'25℃', 61.7, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000817', N'000075', N'15.5%', N'25℃', 44.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000818', N'000075', N'15.5%', N'25℃', 53.3, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000819', N'000075', N'15.5%', N'25℃', 51.4, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000820', N'000075', N'15.5%', N'25℃', 48.3, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000821', N'000075', N'15.5%', N'25℃', 39.6, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000822', N'000075', N'15.5%', N'25℃', 47.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000823', N'000075', N'15.5%', N'25℃', 45.9, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000824', N'000075', N'15.5%', N'25℃', 44.4, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000825', N'000076', N'15.5%', N'30℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000826', N'000076', N'15.5%', N'30℃', 64.8, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000827', N'000076', N'15.5%', N'30℃', 60.2, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000828', N'000076', N'15.5%', N'30℃', 53.5, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000829', N'000076', N'15.5%', N'30℃', 42.3, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000830', N'000076', N'15.5%', N'30℃', 50.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000831', N'000076', N'15.5%', N'30℃', 49.4, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000832', N'000076', N'15.5%', N'30℃', 47.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000833', N'000076', N'15.5%', N'30℃', 37.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000834', N'000076', N'15.5%', N'30℃', 44.3, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000835', N'000076', N'15.5%', N'30℃', 41.2, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000836', N'000077', N'16.5%', N'15℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000837', N'000077', N'16.5%', N'15℃', 64.2, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000838', N'000077', N'16.5%', N'15℃', 60.4, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000839', N'000077', N'16.5%', N'15℃', 43.8, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000840', N'000077', N'16.5%', N'15℃', 51.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000841', N'000077', N'16.5%', N'15℃', 40.4, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000842', N'000077', N'16.5%', N'15℃', 48.7, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000843', N'000077', N'16.5%', N'15℃', 40.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000844', N'000077', N'16.5%', N'15℃', 38.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000845', N'000077', N'16.5%', N'15℃', 33.3, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000846', N'000077', N'16.5%', N'15℃', 35.2, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000847', N'000078', N'16.5%', N'20℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000848', N'000078', N'16.5%', N'20℃', 62.1, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000849', N'000078', N'16.5%', N'20℃', 53.7, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000850', N'000078', N'16.5%', N'20℃', 48.6, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000851', N'000078', N'16.5%', N'20℃', 46.2, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000852', N'000078', N'16.5%', N'20℃', 37.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000853', N'000078', N'16.5%', N'20℃', 44.8, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000854', N'000078', N'16.5%', N'20℃', 41, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000855', N'000078', N'16.5%', N'20℃', 36.6, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000856', N'000078', N'16.5%', N'20℃', 34.1, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000857', N'000078', N'16.5%', N'20℃', 32.8, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000858', N'000079', N'16.5%', N'25℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000859', N'000079', N'16.5%', N'25℃', 60.5, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000860', N'000079', N'16.5%', N'25℃', 53.8, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000861', N'000079', N'16.5%', N'25℃', 48.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000862', N'000079', N'16.5%', N'25℃', 46.7, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000863', N'000079', N'16.5%', N'25℃', 43.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000864', N'000079', N'16.5%', N'25℃', 35.4, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000865', N'000079', N'16.5%', N'25℃', 38.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000866', N'000079', N'16.5%', N'25℃', 30.5, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000867', N'000079', N'16.5%', N'25℃', 32.7, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000868', N'000079', N'16.5%', N'25℃', 31.6, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000869', N'000080', N'16.5%', N'30℃', 70.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000870', N'000080', N'16.5%', N'30℃', 60.2, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000871', N'000080', N'16.5%', N'30℃', 55.6, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000872', N'000080', N'16.5%', N'30℃', 47.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000873', N'000080', N'16.5%', N'30℃', 31.6, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000874', N'000080', N'16.5%', N'30℃', 42.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000875', N'000080', N'16.5%', N'30℃', 41.4, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000876', N'000080', N'16.5%', N'30℃', 30.6, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000877', N'000080', N'16.5%', N'30℃', 33.8, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000878', N'000080', N'16.5%', N'30℃', 30.9, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000879', N'000080', N'16.5%', N'30℃', 28.5, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000880', N'000081', N'13.5%', N'15℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000881', N'000081', N'13.5%', N'15℃', 75.2, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000882', N'000081', N'13.5%', N'15℃', 75, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000883', N'000081', N'13.5%', N'15℃', 74.9, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000884', N'000081', N'13.5%', N'15℃', 74.7, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000885', N'000081', N'13.5%', N'15℃', 74.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000886', N'000081', N'13.5%', N'15℃', 73.5, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000887', N'000081', N'13.5%', N'15℃', 73.2, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000888', N'000081', N'13.5%', N'15℃', 73.5, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000889', N'000081', N'13.5%', N'15℃', 72.8, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000890', N'000081', N'13.5%', N'15℃', 73.5, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000891', N'000082', N'13.5%', N'20℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000892', N'000082', N'13.5%', N'20℃', 75.1, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000893', N'000082', N'13.5%', N'20℃', 75, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000894', N'000082', N'13.5%', N'20℃', 74.7, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000895', N'000082', N'13.5%', N'20℃', 74.6, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000896', N'000082', N'13.5%', N'20℃', 73.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000897', N'000082', N'13.5%', N'20℃', 73, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000898', N'000082', N'13.5%', N'20℃', 73, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000899', N'000082', N'13.5%', N'20℃', 73, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000900', N'000082', N'13.5%', N'20℃', 72.6, NULL, 270)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000901', N'000082', N'13.5%', N'20℃', 73, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000902', N'000083', N'13.5%', N'25℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000903', N'000083', N'13.5%', N'25℃', 75, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000904', N'000083', N'13.5%', N'25℃', 75.3, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000905', N'000083', N'13.5%', N'25℃', 73.7, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000906', N'000083', N'13.5%', N'25℃', 74.5, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000907', N'000083', N'13.5%', N'25℃', 74.5, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000908', N'000083', N'13.5%', N'25℃', 72.8, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000909', N'000083', N'13.5%', N'25℃', 72.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000910', N'000083', N'13.5%', N'25℃', 71.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000911', N'000083', N'13.5%', N'25℃', 72.5, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000912', N'000083', N'13.5%', N'25℃', 72.5, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000913', N'000084', N'13.5%', N'30℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000914', N'000084', N'13.5%', N'30℃', 75, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000915', N'000084', N'13.5%', N'30℃', 75.2, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000916', N'000084', N'13.5%', N'30℃', 74, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000917', N'000084', N'13.5%', N'30℃', 74.2, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000918', N'000084', N'13.5%', N'30℃', 73.8, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000919', N'000084', N'13.5%', N'30℃', 72.3, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000920', N'000084', N'13.5%', N'30℃', 70.5, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000921', N'000084', N'13.5%', N'30℃', 72.3, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000922', N'000084', N'13.5%', N'30℃', 71.8, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000923', N'000084', N'13.5%', N'30℃', 70.8, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000924', N'000085', N'14.5%', N'15℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000925', N'000085', N'14.5%', N'15℃', 75.1, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000926', N'000085', N'14.5%', N'15℃', 74.8, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000927', N'000085', N'14.5%', N'15℃', 74.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000928', N'000085', N'14.5%', N'15℃', 74, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000929', N'000085', N'14.5%', N'15℃', 74.3, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000930', N'000085', N'14.5%', N'15℃', 73.1, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000931', N'000085', N'14.5%', N'15℃', 73.7, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000932', N'000085', N'14.5%', N'15℃', 72.5, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000933', N'000085', N'14.5%', N'15℃', 72.1, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000934', N'000085', N'14.5%', N'15℃', 72.4, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000935', N'000086', N'14.5%', N'20℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000936', N'000086', N'14.5%', N'20℃', 75, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000937', N'000086', N'14.5%', N'20℃', 74.5, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000938', N'000086', N'14.5%', N'20℃', 74.6, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000939', N'000086', N'14.5%', N'20℃', 73.3, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000940', N'000086', N'14.5%', N'20℃', 73.1, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000941', N'000086', N'14.5%', N'20℃', 73.7, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000942', N'000086', N'14.5%', N'20℃', 70.8, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000943', N'000086', N'14.5%', N'20℃', 72.2, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000944', N'000086', N'14.5%', N'20℃', 72, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000945', N'000086', N'14.5%', N'20℃', 71.6, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000946', N'000087', N'14.5%', N'25℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000947', N'000087', N'14.5%', N'25℃', 74.9, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000948', N'000087', N'14.5%', N'25℃', 73.7, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000949', N'000087', N'14.5%', N'25℃', 74, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000950', N'000087', N'14.5%', N'25℃', 74.3, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000951', N'000087', N'14.5%', N'25℃', 72.9, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000952', N'000087', N'14.5%', N'25℃', 73.2, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000953', N'000087', N'14.5%', N'25℃', 72.1, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000954', N'000087', N'14.5%', N'25℃', 72.4, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000955', N'000087', N'14.5%', N'25℃', 70.8, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000956', N'000087', N'14.5%', N'25℃', 71.3, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000957', N'000088', N'14.5%', N'30℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000958', N'000088', N'14.5%', N'30℃', 74.7, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000959', N'000088', N'14.5%', N'30℃', 73.3, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000960', N'000088', N'14.5%', N'30℃', 73.1, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000961', N'000088', N'14.5%', N'30℃', 73.6, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000962', N'000088', N'14.5%', N'30℃', 72.7, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000963', N'000088', N'14.5%', N'30℃', 71.3, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000964', N'000088', N'14.5%', N'30℃', 72.4, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000965', N'000088', N'14.5%', N'30℃', 70.1, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000966', N'000088', N'14.5%', N'30℃', 67.3, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000967', N'000088', N'14.5%', N'30℃', 68.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000968', N'000089', N'15.5%', N'15℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000969', N'000089', N'15.5%', N'15℃', 74.3, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000970', N'000089', N'15.5%', N'15℃', 72.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000971', N'000089', N'15.5%', N'15℃', 73.4, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000972', N'000089', N'15.5%', N'15℃', 73.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000973', N'000089', N'15.5%', N'15℃', 71.4, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000974', N'000089', N'15.5%', N'15℃', 67.2, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000975', N'000089', N'15.5%', N'15℃', 69.1, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000976', N'000089', N'15.5%', N'15℃', 66.4, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000977', N'000089', N'15.5%', N'15℃', 63.7, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000978', N'000089', N'15.5%', N'15℃', 65.3, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000979', N'000090', N'15.5%', N'20℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000980', N'000090', N'15.5%', N'20℃', 74, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000981', N'000090', N'15.5%', N'20℃', 73.6, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000982', N'000090', N'15.5%', N'20℃', 73, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000983', N'000090', N'15.5%', N'20℃', 72.4, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000984', N'000090', N'15.5%', N'20℃', 70.6, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000985', N'000090', N'15.5%', N'20℃', 66, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000986', N'000090', N'15.5%', N'20℃', 60.5, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000987', N'000090', N'15.5%', N'20℃', 65.9, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000988', N'000090', N'15.5%', N'20℃', 62.8, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000989', N'000090', N'15.5%', N'20℃', 62.4, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000990', N'000091', N'15.5%', N'25℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000991', N'000091', N'15.5%', N'25℃', 73.5, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000992', N'000091', N'15.5%', N'25℃', 73.2, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000993', N'000091', N'15.5%', N'25℃', 71.1, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000994', N'000091', N'15.5%', N'25℃', 71.6, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000995', N'000091', N'15.5%', N'25℃', 69.1, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000996', N'000091', N'15.5%', N'25℃', 60.2, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000997', N'000091', N'15.5%', N'25℃', 63.8, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000998', N'000091', N'15.5%', N'25℃', 64.5, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'000999', N'000091', N'15.5%', N'25℃', 64.3, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001000', N'000091', N'15.5%', N'25℃', 61.7, NULL, 300)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001001', N'000092', N'15.5%', N'30℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001002', N'000092', N'15.5%', N'30℃', 73.1, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001003', N'000092', N'15.5%', N'30℃', 72.3, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001004', N'000092', N'15.5%', N'30℃', 71.7, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001005', N'000092', N'15.5%', N'30℃', 71.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001006', N'000092', N'15.5%', N'30℃', 68.1, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001007', N'000092', N'15.5%', N'30℃', 60.7, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001008', N'000092', N'15.5%', N'30℃', 63.9, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001009', N'000092', N'15.5%', N'30℃', 58.1, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001010', N'000092', N'15.5%', N'30℃', 62.7, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001011', N'000092', N'15.5%', N'30℃', 60.4, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001012', N'000093', N'16.5%', N'15℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001013', N'000093', N'16.5%', N'15℃', 73.2, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001014', N'000093', N'16.5%', N'15℃', 72.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001015', N'000093', N'16.5%', N'15℃', 71.3, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001016', N'000093', N'16.5%', N'15℃', 70.4, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001017', N'000093', N'16.5%', N'15℃', 68.3, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001018', N'000093', N'16.5%', N'15℃', 55.5, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001019', N'000093', N'16.5%', N'15℃', 62.1, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001020', N'000093', N'16.5%', N'15℃', 60.7, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001021', N'000093', N'16.5%', N'15℃', 58.2, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001022', N'000093', N'16.5%', N'15℃', 59.4, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001023', N'000094', N'16.5%', N'20℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001024', N'000094', N'16.5%', N'20℃', 72.4, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001025', N'000094', N'16.5%', N'20℃', 71.3, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001026', N'000094', N'16.5%', N'20℃', 67.8, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001027', N'000094', N'16.5%', N'20℃', 54.1, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001028', N'000094', N'16.5%', N'20℃', 62.3, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001029', N'000094', N'16.5%', N'20℃', 61.8, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001030', N'000094', N'16.5%', N'20℃', 52.4, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001031', N'000094', N'16.5%', N'20℃', 56.2, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001032', N'000094', N'16.5%', N'20℃', 58.7, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001033', N'000094', N'16.5%', N'20℃', 57.7, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001034', N'000095', N'16.5%', N'25℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001035', N'000095', N'16.5%', N'25℃', 71.3, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001036', N'000095', N'16.5%', N'25℃', 70, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001037', N'000095', N'16.5%', N'25℃', 65.5, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001038', N'000095', N'16.5%', N'25℃', 61.4, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001039', N'000095', N'16.5%', N'25℃', 59.8, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001040', N'000095', N'16.5%', N'25℃', 54.2, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001041', N'000095', N'16.5%', N'25℃', 58.7, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001042', N'000095', N'16.5%', N'25℃', 57.4, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001043', N'000095', N'16.5%', N'25℃', 56.7, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001044', N'000095', N'16.5%', N'25℃', 56.3, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001045', N'000096', N'16.5%', N'30℃', 75.3, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001046', N'000096', N'16.5%', N'30℃', 70.5, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001047', N'000096', N'16.5%', N'30℃', 68.1, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001048', N'000096', N'16.5%', N'30℃', 58.1, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001049', N'000096', N'16.5%', N'30℃', 62.3, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001050', N'000096', N'16.5%', N'30℃', 52.8, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001051', N'000096', N'16.5%', N'30℃', 59, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001052', N'000096', N'16.5%', N'30℃', 57.5, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001053', N'000096', N'16.5%', N'30℃', 53.1, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001054', N'000096', N'16.5%', N'30℃', 56.4, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001055', N'000096', N'16.5%', N'30℃', 54.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001056', N'000097', N'13.5%', N'15℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001057', N'000097', N'13.5%', N'15℃', 0.14, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001058', N'000097', N'13.5%', N'15℃', 0.2, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001059', N'000097', N'13.5%', N'15℃', 0.18, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001060', N'000097', N'13.5%', N'15℃', 0.21, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001061', N'000097', N'13.5%', N'15℃', 0.51, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001062', N'000097', N'13.5%', N'15℃', 0.33, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001063', N'000097', N'13.5%', N'15℃', 0.35, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001064', N'000097', N'13.5%', N'15℃', 0.27, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001065', N'000097', N'13.5%', N'15℃', 0.43, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001066', N'000097', N'13.5%', N'15℃', 0.47, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001067', N'000098', N'13.5%', N'20℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001068', N'000098', N'13.5%', N'20℃', 0.16, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001069', N'000098', N'13.5%', N'20℃', 0.22, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001070', N'000098', N'13.5%', N'20℃', 0.3, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001071', N'000098', N'13.5%', N'20℃', 0.26, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001072', N'000098', N'13.5%', N'20℃', 0.48, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001073', N'000098', N'13.5%', N'20℃', 0.57, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001074', N'000098', N'13.5%', N'20℃', 1.38, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001075', N'000098', N'13.5%', N'20℃', 0.94, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001076', N'000098', N'13.5%', N'20℃', 1.24, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001077', N'000098', N'13.5%', N'20℃', 1.35, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001078', N'000099', N'13.5%', N'25℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001079', N'000099', N'13.5%', N'25℃', 0.21, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001080', N'000099', N'13.5%', N'25℃', 0.36, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001081', N'000099', N'13.5%', N'25℃', 0.7, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001082', N'000099', N'13.5%', N'25℃', 0.61, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001083', N'000099', N'13.5%', N'25℃', 1.24, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001084', N'000099', N'13.5%', N'25℃', 0.94, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001085', N'000099', N'13.5%', N'25℃', 1.35, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001086', N'000099', N'13.5%', N'25℃', 2.64, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001087', N'000099', N'13.5%', N'25℃', 2.43, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001088', N'000099', N'13.5%', N'25℃', 2.57, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001089', N'000100', N'13.5%', N'30℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001090', N'000100', N'13.5%', N'30℃', 0.32, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001091', N'000100', N'13.5%', N'30℃', 0.48, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001092', N'000100', N'13.5%', N'30℃', 0.51, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001093', N'000100', N'13.5%', N'30℃', 0.94, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001094', N'000100', N'13.5%', N'30℃', 2.87, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001095', N'000100', N'13.5%', N'30℃', 1.69, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001096', N'000100', N'13.5%', N'30℃', 3.06, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001097', N'000100', N'13.5%', N'30℃', 2.58, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001098', N'000100', N'13.5%', N'30℃', 3.24, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001099', N'000100', N'13.5%', N'30℃', 3.65, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001100', N'000101', N'14.5%', N'15℃', 0.12, NULL, 0)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001101', N'000101', N'14.5%', N'15℃', 0.18, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001102', N'000101', N'14.5%', N'15℃', 0.29, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001103', N'000101', N'14.5%', N'15℃', 0.37, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001104', N'000101', N'14.5%', N'15℃', 0.88, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001105', N'000101', N'14.5%', N'15℃', 0.75, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001106', N'000101', N'14.5%', N'15℃', 1.39, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001107', N'000101', N'14.5%', N'15℃', 2.51, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001108', N'000101', N'14.5%', N'15℃', 1.74, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001109', N'000101', N'14.5%', N'15℃', 2.11, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001110', N'000101', N'14.5%', N'15℃', 2.23, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001111', N'000102', N'14.5%', N'20℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001112', N'000102', N'14.5%', N'20℃', 0.33, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001113', N'000102', N'14.5%', N'20℃', 0.54, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001114', N'000102', N'14.5%', N'20℃', 1.87, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001115', N'000102', N'14.5%', N'20℃', 0.72, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001116', N'000102', N'14.5%', N'20℃', 1.51, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001117', N'000102', N'14.5%', N'20℃', 3.94, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001118', N'000102', N'14.5%', N'20℃', 2.68, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001119', N'000102', N'14.5%', N'20℃', 3.15, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001120', N'000102', N'14.5%', N'20℃', 2.79, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001121', N'000102', N'14.5%', N'20℃', 3.88, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001122', N'000103', N'14.5%', N'25℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001123', N'000103', N'14.5%', N'25℃', 0.57, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001124', N'000103', N'14.5%', N'25℃', 0.82, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001125', N'000103', N'14.5%', N'25℃', 1.79, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001126', N'000103', N'14.5%', N'25℃', 2.63, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001127', N'000103', N'14.5%', N'25℃', 5.97, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001128', N'000103', N'14.5%', N'25℃', 3.64, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001129', N'000103', N'14.5%', N'25℃', 5.54, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001130', N'000103', N'14.5%', N'25℃', 5.13, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001131', N'000103', N'14.5%', N'25℃', 5.49, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001132', N'000103', N'14.5%', N'25℃', 8.71, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001133', N'000104', N'14.5%', N'30℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001134', N'000104', N'14.5%', N'30℃', 0.78, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001135', N'000104', N'14.5%', N'30℃', 1.23, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001136', N'000104', N'14.5%', N'30℃', 1.94, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001137', N'000104', N'14.5%', N'30℃', 2.68, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001138', N'000104', N'14.5%', N'30℃', 3.72, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001139', N'000104', N'14.5%', N'30℃', 6.93, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001140', N'000104', N'14.5%', N'30℃', 5.2, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001141', N'000104', N'14.5%', N'30℃', 6.17, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001142', N'000104', N'14.5%', N'30℃', 7.35, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001143', N'000104', N'14.5%', N'30℃', 7.42, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001144', N'000105', N'15.5%', N'15℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001145', N'000105', N'15.5%', N'15℃', 0.3, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001146', N'000105', N'15.5%', N'15℃', 0.49, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001147', N'000105', N'15.5%', N'15℃', 0.87, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001148', N'000105', N'15.5%', N'15℃', 3.93, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001149', N'000105', N'15.5%', N'15℃', 1.76, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001150', N'000105', N'15.5%', N'15℃', 2.84, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001151', N'000105', N'15.5%', N'15℃', 2.78, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001152', N'000105', N'15.5%', N'15℃', 3.69, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001153', N'000105', N'15.5%', N'15℃', 3.95, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001154', N'000105', N'15.5%', N'15℃', 4.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001155', N'000106', N'15.5%', N'20℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001156', N'000106', N'15.5%', N'20℃', 0.64, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001157', N'000106', N'15.5%', N'20℃', 1.26, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001158', N'000106', N'15.5%', N'20℃', 1.87, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001159', N'000106', N'15.5%', N'20℃', 2.59, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001160', N'000106', N'15.5%', N'20℃', 4.3, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001161', N'000106', N'15.5%', N'20℃', 7.97, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001162', N'000106', N'15.5%', N'20℃', 5.54, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001163', N'000106', N'15.5%', N'20℃', 6.88, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001164', N'000106', N'15.5%', N'20℃', 6.32, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001165', N'000106', N'15.5%', N'20℃', 6.53, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001166', N'000107', N'15.5%', N'25℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001167', N'000107', N'15.5%', N'25℃', 0.97, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001168', N'000107', N'15.5%', N'25℃', 1.84, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001169', N'000107', N'15.5%', N'25℃', 3.67, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001170', N'000107', N'15.5%', N'25℃', 5.92, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001171', N'000107', N'15.5%', N'25℃', 9.31, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001172', N'000107', N'15.5%', N'25℃', 7.55, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001173', N'000107', N'15.5%', N'25℃', 8.17, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001174', N'000107', N'15.5%', N'25℃', 10.83, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001175', N'000107', N'15.5%', N'25℃', 8.49, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001176', N'000107', N'15.5%', N'25℃', 11.22, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001177', N'000108', N'15.5%', N'30℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001178', N'000108', N'15.5%', N'30℃', 1.67, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001179', N'000108', N'15.5%', N'30℃', 3.94, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001180', N'000108', N'15.5%', N'30℃', 5.18, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001181', N'000108', N'15.5%', N'30℃', 8.61, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001182', N'000108', N'15.5%', N'30℃', 6.18, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001183', N'000108', N'15.5%', N'30℃', 9.37, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001184', N'000108', N'15.5%', N'30℃', 13.54, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001185', N'000108', N'15.5%', N'30℃', 11.24, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001186', N'000108', N'15.5%', N'30℃', 11.93, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001187', N'000108', N'15.5%', N'30℃', 12.8, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001188', N'000109', N'16.5%', N'15℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001189', N'000109', N'16.5%', N'15℃', 0.71, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001190', N'000109', N'16.5%', N'15℃', 1.19, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001191', N'000109', N'16.5%', N'15℃', 6.67, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001192', N'000109', N'16.5%', N'15℃', 2.51, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001193', N'000109', N'16.5%', N'15℃', 3.88, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001194', N'000109', N'16.5%', N'15℃', 5.74, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001195', N'000109', N'16.5%', N'15℃', 8.23, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001196', N'000109', N'16.5%', N'15℃', 6.16, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001197', N'000109', N'16.5%', N'15℃', 7.45, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001198', N'000109', N'16.5%', N'15℃', 7.7, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001199', N'000110', N'16.5%', N'20℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001200', N'000110', N'16.5%', N'20℃', 1.59, NULL, 30)
GO
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001201', N'000110', N'16.5%', N'20℃', 3.82, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001202', N'000110', N'16.5%', N'20℃', 5.82, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001203', N'000110', N'16.5%', N'20℃', 12.91, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001204', N'000110', N'16.5%', N'20℃', 8.14, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001205', N'000110', N'16.5%', N'20℃', 8.95, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001206', N'000110', N'16.5%', N'20℃', 16.64, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001207', N'000110', N'16.5%', N'20℃', 10.11, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001208', N'000110', N'16.5%', N'20℃', 13.57, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001209', N'000110', N'16.5%', N'20℃', 15.61, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001210', N'000111', N'16.5%', N'25℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001211', N'000111', N'16.5%', N'25℃', 2.58, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001212', N'000111', N'16.5%', N'25℃', 6.37, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001213', N'000111', N'16.5%', N'25℃', 11.24, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001214', N'000111', N'16.5%', N'25℃', 10.37, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001215', N'000111', N'16.5%', N'25℃', 12.49, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001216', N'000111', N'16.5%', N'25℃', 16.17, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001217', N'000111', N'16.5%', N'25℃', 22.54, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001218', N'000111', N'16.5%', N'25℃', 17.25, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001219', N'000111', N'16.5%', N'25℃', 19.93, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001220', N'000111', N'16.5%', N'25℃', 19.26, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001221', N'000112', N'16.5%', N'30℃', 0.12, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001222', N'000112', N'16.5%', N'30℃', 3.67, NULL, 30)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001223', N'000112', N'16.5%', N'30℃', 8.19, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001224', N'000112', N'16.5%', N'30℃', 10.8, NULL, 90)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001225', N'000112', N'16.5%', N'30℃', 13.69, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001226', N'000112', N'16.5%', N'30℃', 20.31, NULL, 150)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001227', N'000112', N'16.5%', N'30℃', 16.48, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001228', N'000112', N'16.5%', N'30℃', 19.25, NULL, 210)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001229', N'000112', N'16.5%', N'30℃', 21.21, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001230', N'000112', N'16.5%', N'30℃', 25.36, NULL, 270)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001231', N'000112', N'16.5%', N'30℃', 23.5, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001232', N'000113', N'15.5%', N'15℃', 0.36, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001233', N'000113', N'15.5%', N'15℃', 0.33, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001234', N'000113', N'15.5%', N'15℃', 0.24, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001235', N'000113', N'15.5%', N'15℃', 1.98, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001236', N'000113', N'15.5%', N'15℃', 1.26, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001237', N'000113', N'15.5%', N'15℃', 0.2, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001238', N'000114', N'15.5%', N'30℃', 0.36, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001239', N'000114', N'15.5%', N'30℃', 0.16, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001240', N'000114', N'15.5%', N'30℃', 0.13, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001241', N'000114', N'15.5%', N'30℃', 1.14, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001242', N'000114', N'15.5%', N'30℃', 0.37, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001243', N'000114', N'15.5%', N'30℃', 0.09, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001244', N'000115', N'15.5%', N'15℃', 0, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001245', N'000115', N'15.5%', N'15℃', 0, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001246', N'000115', N'15.5%', N'15℃', 0.18, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001247', N'000115', N'15.5%', N'15℃', 0.17, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001248', N'000115', N'15.5%', N'15℃', 0.14, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001249', N'000115', N'15.5%', N'15℃', 0.04, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001250', N'000116', N'15.5%', N'30℃', 0, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001251', N'000116', N'15.5%', N'30℃', 0, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001252', N'000116', N'15.5%', N'30℃', 0.18, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001253', N'000116', N'15.5%', N'30℃', 0.28, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001254', N'000116', N'15.5%', N'30℃', 0.13, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001255', N'000116', N'15.5%', N'30℃', 0.1, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001256', N'000117', N'15.5%', N'15℃', 0.88, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001257', N'000117', N'15.5%', N'15℃', 0.09, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001258', N'000117', N'15.5%', N'15℃', 0.03, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001259', N'000117', N'15.5%', N'15℃', 0.04, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001260', N'000117', N'15.5%', N'15℃', 0.02, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001261', N'000117', N'15.5%', N'15℃', 0.04, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001262', N'000118', N'15.5%', N'30℃', 0.88, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001263', N'000118', N'15.5%', N'30℃', 0.05, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001264', N'000118', N'15.5%', N'30℃', 0.07, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001265', N'000118', N'15.5%', N'30℃', 0.05, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001266', N'000118', N'15.5%', N'30℃', 0.06, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001267', N'000118', N'15.5%', N'30℃', 0.03, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001268', N'000119', N'15.5%', N'15℃', 0.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001269', N'000119', N'15.5%', N'15℃', 0.56, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001270', N'000119', N'15.5%', N'15℃', 0.27, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001271', N'000119', N'15.5%', N'15℃', 0.39, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001272', N'000119', N'15.5%', N'15℃', 0.11, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001273', N'000119', N'15.5%', N'15℃', 0.3, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001274', N'000120', N'15.5%', N'30℃', 0.6, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001275', N'000120', N'15.5%', N'30℃', 0.38, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001276', N'000120', N'15.5%', N'30℃', 0.44, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001277', N'000120', N'15.5%', N'30℃', 0.19, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001278', N'000120', N'15.5%', N'30℃', 0.24, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001279', N'000120', N'15.5%', N'30℃', 0.17, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001280', N'000121', N'15.5%', N'15℃', 1.45, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001281', N'000121', N'15.5%', N'15℃', 1.17, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001282', N'000121', N'15.5%', N'15℃', 2.35, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001283', N'000121', N'15.5%', N'15℃', 1.13, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001284', N'000121', N'15.5%', N'15℃', 0.83, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001285', N'000121', N'15.5%', N'15℃', 0.38, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001286', N'000122', N'15.5%', N'30℃', 1.45, NULL, 0)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001287', N'000122', N'15.5%', N'30℃', 0.21, NULL, 60)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001288', N'000122', N'15.5%', N'30℃', 0.44, NULL, 120)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001289', N'000122', N'15.5%', N'30℃', 0.19, NULL, 180)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001290', N'000122', N'15.5%', N'30℃', 0.06, NULL, 240)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001291', N'000122', N'15.5%', N'30℃', 0.05, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验数据表] ([检验流水号], [实验号], [水分], [粮温], [参数值], [检测日期], [消耗时间(/d)]) VALUES (N'001292', N'000057', N'15.5%', N'15℃', 57.39, NULL, 300)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000001', N'000001', N'000003', 60.16, 59.12, -0.383, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000002', N'000001', N'000001', 6.27, 6.68, 0.029, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000003', N'000001', N'000002', 29.6, 29.04, -0.1515, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000004', N'000001', N'000003', 60.16, 59.65, -0.051, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000005', N'000001', N'000001', 6.27, 6.88, 0.024, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000006', N'000001', N'000002', 29.6, 29.82, 0.021, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000007', N'000001', N'000003', 60.16, 59.59, -0.032, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000008', N'000001', N'000001', 6.27, 7.15, 0.005, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000009', N'000001', N'000002', 29.6, 30.03, 0.024, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000010', N'000001', N'000003', 60.16, 59.03, 0.017, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000011', N'000001', N'000001', 6.27, 7.45, -0.034, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000012', N'000001', N'000002', 29.6, 30.4, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000013', N'000001', N'000003', 60.16, 59.33, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000014', N'000001', N'000001', 6.27, 6.72, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000015', N'000001', N'000002', 29.6, 29.98, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000016', N'000001', N'000003', 60.16, 59.15, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000017', N'000001', N'000001', 6.27, 7, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000018', N'000001', N'000002', 29.6, 29.98, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000019', N'000001', N'000003', 60.16, 58.99, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000020', N'000001', N'000001', 6.27, 7.41, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000021', N'000001', N'000002', 29.6, 30.54, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000022', N'000001', N'000003', 60.16, 58.81, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000023', N'000001', N'000001', 6.27, 8, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000024', N'000001', N'000002', 29.6, 30.85, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000025', N'000001', N'000003', 60.16, 58.66, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000026', N'000001', N'000001', 6.27, 7.09, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000027', N'000001', N'000002', 29.6, 29.96, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000028', N'000001', N'000003', 60.16, 58.91, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000029', N'000001', N'000001', 6.27, 7, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000030', N'000001', N'000002', 29.6, 30.11, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000031', N'000001', N'000003', 60.16, 58.63, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000032', N'000001', N'000001', 6.27, 7.33, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000033', N'000001', N'000002', 29.6, 30.66, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000034', N'000001', N'000003', 60.16, 57.89, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000035', N'000001', N'000001', 6.27, 7.74, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000036', N'000001', N'000002', 29.6, 30.99, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000037', N'000001', N'000003', 60.16, 58.87, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000038', N'000001', N'000001', 6.27, 6.79, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000039', N'000001', N'000002', 29.6, 30.08, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000040', N'000001', N'000003', 60.16, 59.02, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000041', N'000001', N'000001', 6.27, 6.93, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000042', N'000001', N'000002', 29.6, 30.72, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000043', N'000001', N'000003', 60.16, 58.79, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000044', N'000001', N'000001', 6.27, 7.63, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000045', N'000001', N'000002', 29.6, 31.28, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000046', N'000001', N'000003', 60.16, 57.91, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000047', N'000001', N'000001', 6.27, 7.92, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000048', N'000001', N'000002', 29.6, 30.83, NULL, CAST(N'2015-01-01' AS Date), CAST(N'2015-11-01' AS Date))
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000049', N'000001', N'000007', 13.32, 28.43, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000050', N'000001', N'000007', 13.32, 33.32, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000051', N'000001', N'000007', 13.32, 36.48, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000052', N'000001', N'000007', 13.32, 37.84, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000053', N'000001', N'000007', 13.32, 35.89, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000054', N'000001', N'000007', 13.32, 46.24, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000055', N'000001', N'000007', 13.32, 48.57, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000056', N'000001', N'000007', 13.32, 53.79, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000057', N'000001', N'000007', 13.32, 57.39, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000058', N'000001', N'000007', 13.32, 61.19, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000059', N'000001', N'000007', 13.32, 67.68, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000060', N'000001', N'000007', 13.32, 71.91, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000061', N'000001', N'000007', 13.32, 78.58, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000062', N'000001', N'000007', 13.32, 85.49, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000063', N'000001', N'000007', 13.32, 87.47, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000064', N'000001', N'000007', 13.32, 99.48, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000065', N'000001', N'000005', 70.6, 64.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000066', N'000001', N'000005', 70.6, 61.3, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000067', N'000001', N'000005', 70.6, 58.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000068', N'000001', N'000005', 70.6, 56.7, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000069', N'000001', N'000005', 70.6, 55.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000070', N'000001', N'000005', 70.6, 53.7, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000071', N'000001', N'000005', 70.6, 52.6, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000072', N'000001', N'000005', 70.6, 51.4, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000073', N'000001', N'000005', 70.6, 49.3, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000074', N'000001', N'000005', 70.6, 47.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000075', N'000001', N'000005', 70.6, 44.4, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000076', N'000001', N'000005', 70.6, 41.2, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000077', N'000001', N'000005', 70.6, 35.2, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000078', N'000001', N'000005', 70.6, 32.8, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000079', N'000001', N'000005', 70.6, 31.6, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000080', N'000001', N'000005', 70.6, 28.5, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000081', N'000001', N'000004', 75.3, 73.5, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000082', N'000001', N'000004', 75.3, 73, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000083', N'000001', N'000004', 75.3, 72.5, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000084', N'000001', N'000004', 75.3, 70.8, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000085', N'000001', N'000004', 75.3, 72.4, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000086', N'000001', N'000004', 75.3, 71.6, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000087', N'000001', N'000004', 75.3, 71.3, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000088', N'000001', N'000004', 75.3, 68.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000089', N'000001', N'000004', 75.3, 65.3, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000090', N'000001', N'000004', 75.3, 62.4, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000091', N'000001', N'000004', 75.3, 61.7, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000092', N'000001', N'000004', 75.3, 60.4, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000093', N'000001', N'000004', 75.3, 59.4, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000094', N'000001', N'000004', 75.3, 57.7, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000095', N'000001', N'000004', 75.3, 56.3, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000096', N'000001', N'000004', 75.3, 54.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000097', N'000001', N'000006', 0.12, 0.47, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000098', N'000001', N'000006', 0.12, 1.35, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000099', N'000001', N'000006', 0.12, 2.57, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000100', N'000001', N'000006', 0.12, 3.65, NULL, NULL, NULL)
GO
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000101', N'000001', N'000006', 0.12, 2.23, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000102', N'000001', N'000006', 0.12, 3.88, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000103', N'000001', N'000006', 0.12, 8.71, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000104', N'000001', N'000006', 0.12, 7.42, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000105', N'000001', N'000006', 0.12, 4.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000106', N'000001', N'000006', 0.12, 6.53, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000107', N'000001', N'000006', 0.12, 11.22, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000108', N'000001', N'000006', 0.12, 12.8, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000109', N'000001', N'000006', 0.12, 7.7, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000110', N'000001', N'000006', 0.12, 15.61, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000111', N'000001', N'000006', 0.12, 19.26, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000112', N'000001', N'000006', 0.12, 23.5, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000113', N'000001', N'000008', 0.36, 0.2, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000114', N'000001', N'000008', 0.36, 0.09, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000115', N'000001', N'000009', 0, 0.04, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000116', N'000001', N'000009', 0, 0.1, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000117', N'000001', N'000010', 0.88, 0.04, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000118', N'000001', N'000010', 0.88, 0.03, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000119', N'000001', N'000011', 0.6, 0.3, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000120', N'000001', N'000011', 0.6, 0.17, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000121', N'000001', N'000012', 1.45, 0.38, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数实验信息表] ([实验号], [实验批次号], [参数号], [起始参数值], [终点参数值], [参数变化平均速度], [开始时间], [结束时间]) VALUES (N'000122', N'000001', N'000012', 1.45, 0.05, NULL, NULL, NULL)
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000001', N'色泽红绿色相a*')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000002', N'色泽黄蓝色相b*')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000003', N'色泽明度L*')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000004', N'出糙率')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000005', N'整精米率')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000006', N'黄变利率')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000007', N'脂肪酸酯')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000008', N'气味烷烃类')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000009', N'气味醛酮类')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000010', N'气味醇类')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000011', N'气胃酸酯泪')
INSERT [dbo].[稻谷质量特性参数信息表] ([参数号], [参数名]) VALUES (N'000012', N'气味杂环类')
SET IDENTITY_INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ON 

INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (1, N'000001', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为15℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为15℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (2, N'000002', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (3, N'000003', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (4, N'000004', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为20℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为20℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (5, N'000005', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (6, N'000006', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (7, N'000007', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为25℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为25℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (8, N'000008', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (9, N'000009', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (11, N'000010', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为30℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%，温度为30℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (12, N'000011', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (13, N'000012', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (14, N'000013', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为15℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为15℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (15, N'000014', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (16, N'000015', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (17, N'000016', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为20℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为20℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (18, N'000017', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (19, N'000018', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (20, N'000019', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为25℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为25℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (21, N'000020', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (22, N'000021', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (23, N'000022', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为30℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%，温度为30℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (24, N'000023', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (25, N'000024', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (26, N'000025', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为15℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为15℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (27, N'000026', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (28, N'000027', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (29, N'000028', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为20℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为20℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (30, N'000029', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (31, N'000030', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (32, N'000031', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为25℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为25℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (33, N'000032', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (34, N'000033', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (35, N'000034', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为30℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%，温度为30℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (36, N'000035', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (37, N'000036', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (38, N'000037', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为15℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为15℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (39, N'000038', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (40, N'000039', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (41, N'000040', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为20℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为20℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (42, N'000041', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (43, N'000042', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (44, N'000043', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为25℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为25℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (45, N'000044', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (46, N'000045', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (47, N'000046', N'色泽明度L*随时间的变化情况', N'色泽明度L*增加速率随时间的变化情况', N'时间(天)', N'色泽明度L*(度)', N'色泽明度L*增加速率(度/天)', N'      明度L值是表示稻谷表面颜色深浅的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为30℃储粮条件下，明度L值随储藏时间的变化情况。', N'      明度L值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为明度L值的变化速率，N为明度L值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%，温度为30℃储粮条件下，明度L值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (48, N'000047', N'色泽红绿色相a*随时间的变化情况', N'色泽红绿色相a*增加速率随时间的变化情况', N'时间(天)', N'色泽红绿色相a*(度)', N'色泽红绿色相a*增加速率(度/天)', N'      色度a值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，色度a值随储藏时间的变化情况。', N'      色度a值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度a值的变化速率，N为色度a值，T为时间（d）@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，色度a值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (49, N'000048', N'色泽黄蓝色相b*随时间变化情况', N'色泽黄蓝色相b*增加速率随时间变化情况', N'时间(天)', N'色泽黄蓝色相b*', N'色泽黄蓝色相b*增加速率(度/天)', N'      色度b值是表示稻谷表面色泽的主要指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，色度b值随储藏时间的变化情况。', N'      色度b值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为色度b值的变化速率，N为色度b值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，色度b值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (50, N'000049', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (51, N'000050', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (52, N'000051', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (53, N'000052', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (54, N'000053', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (55, N'000054', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，脂肪酸值滨化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (56, N'000055', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (57, N'000056', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (58, N'000057', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (59, N'000058', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (60, N'000059', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (61, N'000060', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (62, N'000061', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (63, N'000062', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (64, N'000063', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (65, N'000064', N'脂肪酸值随时间的变化情况', N'脂肪酸值的增加速率随时间的变化情况', N'时间(天)', N'脂肪酸值(mg/Kg)', N'脂肪酸值增加速率(mg/(Kg*d))', N'      脂肪酸值是衡量稻谷新陈程度的一项重要指标。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，脂肪酸值随储藏时间的变化情况。', N'      脂肪酸值变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值的变化速率，N为脂肪酸值（mg/100g），T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，脂肪酸值变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (66, N'000065', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (67, N'000066', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (68, N'000067', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (69, N'000068', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (70, N'000069', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (71, N'000070', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (73, N'000071', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (74, N'000072', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (75, N'000073', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (76, N'000074', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (77, N'000075', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (78, N'000076', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (79, N'000077', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (80, N'000078', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，整精米率i变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (81, N'000079', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (82, N'000080', N'整精米率随时间的变化情况', N'整精米率的增加速率随时间的变化情况', N'时间(天)', N'整精米率(%)', N'整精米率增加速率(%/d)', N'      整精米率是稻谷储藏过程重要的质量指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，整精米率随储藏时间的变化情况。', N'      整精米率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为整精米率的变化速率，N为整精米率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，整精米率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (83, N'000081', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (84, N'000082', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (85, N'000083', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (86, N'000084', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (87, N'000085', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (88, N'000086', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (89, N'000087', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (90, N'000088', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (91, N'000089', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (92, N'000090', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (93, N'000091', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (94, N'000092', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (95, N'000093', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (96, N'000094', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (97, N'000095', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (98, N'000096', N'出糙率随时间的变化情况', N'出糙率的增加速率随时间的变化情况', N'时间(天)', N'出糙率(%)', N'出糙率增加速率(%/d)', N'      出糙率是判定稻谷品质的指标之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，出糙率随储藏时间的变化情况。', N'      出糙率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为出糙率的变化速率，N为出糙率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，出糙率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (99, N'000097', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为15℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (100, N'000098', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为20℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (101, N'000099', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为25℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
GO
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (102, N'000100', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为13.5%、温度为30℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (104, N'000101', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为15℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (105, N'000102', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为20℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (106, N'000103', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为25℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (107, N'000104', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为14.5%、温度为30℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (108, N'000105', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (109, N'000106', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为20℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (110, N'000107', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为25℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (111, N'000108', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (112, N'000109', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为15℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (113, N'000110', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为20℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (114, N'000111', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为25℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (115, N'000112', N'黄变粒率随时间的变化情况', N'黄变粒率的增加速率随时间的变化情况', N'时间(天)', N'黄变粒率(%)', N'黄变粒率增加速率(%/d)', N'      黄变粒率是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，黄变粒率随储藏时间的变化情况。', N'      黄变粒率变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为黄变粒率的变化速率，N为黄变粒率，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为16.5%、温度为30℃储粮条件下，黄变粒率变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (116, N'000113', N'气味烷烃类随时间的变化情况', N'气味烷烃类的增加速率随时间的变化情况', N'时间(天)', N'气味烷烃类(%)', N'气味烷烃类增加速率(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，烷烃类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，烷烃类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (117, N'000114', N'气味烷烃类随时间的变化情况', N'气味烷烃类的增加速率随时间的变化情况', N'时间(天)', N'气味烷烃类(%)', N'气味烷烃类增加速率(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，烷烃类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，烷烃类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (118, N'000115', N'气味醛酮类随时间的变化情况', N'气味醛酮类的增加速率随时间的变化情况', N'时间(天)', N'气味醛酮类(%)', N'气味醛酮类增加速率(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，醛酮类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，醛酮类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (119, N'000116', N'气味醛酮类随时间的变化情况', N'气味醛酮类的增加速率随时间的变化情况', N'时间(天)', N'气味醛酮类(%)', N'气味醛酮类增加速率(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，醛酮化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，醛酮化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (120, N'000117', N'气味醇类随时间的变化速率', N'气味醇类的增加速率随时间的变化速率', N'时间(天)', N'气味醇类(%)', N'气味醇类变化速率(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，醇类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，醇类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (121, N'000118', N'气味醇类随时间的变化速率', N'气味醇类的增加速率随时间的变化速率', N'时间(天)', N'气味醇类(%)', N'气味醇类变化速率(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，醇类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，醇类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (122, N'000119', N'气味酸酯类随时间的变化情况', N'气味酸酯类的增加速率随时间的变化情况', N'时间(天)', N'气味酸酯类(%)', N'气味酸酯类变化情况(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，酸酯类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，酸酯类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (123, N'000120', N'气味酸酯类随时间的变化情况', N'气味酸酯类的增加速率随时间的变化情况', N'时间(天)', N'气味酸酯类(%)', N'气味酸酯类变化情况(%/d)', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，酸酯类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，酸酯类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (124, N'000121', N'气味杂环类随时间的变化情况', N'气味杂环类的增加速率随时间的变化情况', N'时间(天)', N'气味杂环类(%)', N'气味杂环类变化速率', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，杂环类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为15℃储粮条件下，杂环类化合物挥发物质变化速率随储藏时间的变化情况。')
INSERT [dbo].[稻谷质量特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (125, N'000122', N'气味杂环类随时间的变化情况', N'气味杂环类的增加速率随时间的变化情况', N'时间(天)', N'气味杂环类(%)', N'气味杂环类变化速率', N'      稻谷气味是评价稻谷品质优劣的新指标之一。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，杂环类化合物挥发物质随储藏时间的变化情况。', N'      气味变化速率是单位时间内增加或减少的数值，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为气味值的变化速率，N为气味值，T为时间（d）。@      实验采用粳稻谷，模拟了在水分为15.5%、温度为30℃储粮条件下，杂环类化合物挥发物质变化速率随储藏时间的变化情况。')
SET IDENTITY_INSERT [dbo].[稻谷质量特性参数坐标轴描述表] OFF
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000001', N'000037', N'25~28 ', N'4     ', N'0     ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000002', N'000037', N'25~28 ', N'4     ', N'0.33  ', CAST(N'2014-01-15' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000003', N'000037', N'25~28 ', N'4     ', N'0.67  ', CAST(N'2014-01-29' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000004', N'000037', N'25~28 ', N'4     ', N'1.33  ', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000005', N'000037', N'25~28 ', N'4     ', N'1.67  ', CAST(N'2014-02-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000006', N'000037', N'25~28 ', N'4     ', N'2.67  ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000007', N'000037', N'25~28 ', N'4     ', N'3.67  ', CAST(N'2014-03-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000008', N'000037', N'25~28 ', N'4     ', N'5.33  ', CAST(N'2014-04-09' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000009', N'000037', N'25~28 ', N'4     ', N'10.00 ', CAST(N'2014-04-23' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000010', N'000037', N'25~28 ', N'4     ', N'13.67 ', CAST(N'2014-05-07' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000011', N'000037', N'25~28 ', N'4     ', N'25.00 ', CAST(N'2014-05-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000012', N'000038', N'25~28 ', N'6     ', N'0     ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000013', N'000038', N'25~28 ', N'6     ', N'0.40  ', CAST(N'2014-01-15' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000014', N'000038', N'25~28 ', N'6     ', N'1.00  ', CAST(N'2014-01-29' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000015', N'000038', N'25~28 ', N'6     ', N'1.53  ', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000016', N'000038', N'25~28 ', N'6     ', N'2.77  ', CAST(N'2014-02-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000017', N'000038', N'25~28 ', N'6     ', N'4.33  ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000018', N'000038', N'25~28 ', N'6     ', N'5.33  ', CAST(N'2014-03-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000019', N'000038', N'25~28 ', N'6     ', N'5.67  ', CAST(N'2014-04-09' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000020', N'000038', N'25~28 ', N'6     ', N'9.33  ', CAST(N'2014-04-23' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000021', N'000038', N'25~28 ', N'6     ', N'16.00 ', CAST(N'2014-05-07' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000022', N'000038', N'25~28 ', N'6     ', N'31.00 ', CAST(N'2014-05-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000023', N'000039', N'25~28 ', N'10    ', N'0     ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000024', N'000039', N'25~28 ', N'10    ', N'0.67  ', CAST(N'2014-01-15' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000025', N'000039', N'25~28 ', N'10    ', N'1.33  ', CAST(N'2014-01-29' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000026', N'000039', N'25~28 ', N'10    ', N'2.33  ', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000027', N'000039', N'25~28 ', N'10    ', N'4.67  ', CAST(N'2014-02-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000028', N'000039', N'25~28 ', N'10    ', N'6.00  ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000029', N'000039', N'25~28 ', N'10    ', N'8.67  ', CAST(N'2014-03-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000030', N'000039', N'25~28 ', N'10    ', N'10.33 ', CAST(N'2014-04-09' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000031', N'000039', N'25~28 ', N'10    ', N'15.33 ', CAST(N'2014-04-23' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000032', N'000039', N'25~28 ', N'10    ', N'22.00 ', CAST(N'2014-05-07' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000033', N'000039', N'25~28 ', N'10    ', N'39.33 ', CAST(N'2014-05-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000034', N'000040', N'25~28 ', N'4     ', N'0     ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000035', N'000040', N'25~28 ', N'4     ', N'0.33  ', CAST(N'2014-01-15' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000036', N'000040', N'25~28 ', N'4     ', N'0.67  ', CAST(N'2014-01-29' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000037', N'000040', N'25~28 ', N'4     ', N'1.33  ', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000038', N'000040', N'25~28 ', N'4     ', N'1.33  ', CAST(N'2014-02-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000039', N'000040', N'25~28 ', N'4     ', N'2.33  ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000040', N'000040', N'25~28 ', N'4     ', N'3.00  ', CAST(N'2014-03-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000041', N'000040', N'25~28 ', N'4     ', N'4.00  ', CAST(N'2014-04-09' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000042', N'000040', N'25~28 ', N'4     ', N'8.67  ', CAST(N'2014-04-23' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000043', N'000040', N'25~28 ', N'4     ', N'12.67 ', CAST(N'2014-05-07' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000044', N'000040', N'25~28 ', N'4     ', N'22.67 ', CAST(N'2014-05-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000045', N'000041', N'25~28 ', N'6     ', N'0     ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000046', N'000041', N'25~28 ', N'6     ', N'0.33  ', CAST(N'2014-01-15' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000047', N'000041', N'25~28 ', N'6     ', N'0.87  ', CAST(N'2014-01-29' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000048', N'000041', N'25~28 ', N'6     ', N'1.33  ', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000049', N'000041', N'25~28 ', N'6     ', N'2.33  ', CAST(N'2014-02-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000050', N'000041', N'25~28 ', N'6     ', N'3.67  ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000051', N'000041', N'25~28 ', N'6     ', N'4.00  ', CAST(N'2014-03-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000052', N'000041', N'25~28 ', N'6     ', N'4.33  ', CAST(N'2014-04-09' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000053', N'000041', N'25~28 ', N'6     ', N'8.33  ', CAST(N'2014-04-23' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000054', N'000041', N'25~28 ', N'6     ', N'14.33 ', CAST(N'2014-05-07' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000055', N'000041', N'25~28 ', N'6     ', N'29.33 ', CAST(N'2014-05-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000056', N'000042', N'25~28 ', N'10    ', N'0     ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000057', N'000042', N'25~28 ', N'10    ', N'0.67  ', CAST(N'2014-01-15' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000058', N'000042', N'25~28 ', N'10    ', N'1.33  ', CAST(N'2014-01-29' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000059', N'000042', N'25~28 ', N'10    ', N'1.67  ', CAST(N'2014-02-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000060', N'000042', N'25~28 ', N'10    ', N'3.00  ', CAST(N'2014-02-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000061', N'000042', N'25~28 ', N'10    ', N'5.00  ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000062', N'000042', N'25~28 ', N'10    ', N'7.33  ', CAST(N'2014-03-26' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000063', N'000042', N'25~28 ', N'10    ', N'9.00  ', CAST(N'2014-04-09' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000064', N'000042', N'25~28 ', N'10    ', N'13.33 ', CAST(N'2014-04-23' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000065', N'000042', N'25~28 ', N'10    ', N'18.67 ', CAST(N'2014-05-07' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000066', N'000042', N'25~28 ', N'10    ', N'31.33 ', CAST(N'2014-05-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000067', N'000043', N'20    ', N'0     ', N'767   ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000068', N'000043', N'20    ', N'0     ', N'767   ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000069', N'000043', N'20    ', N'0     ', N'766.3 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000070', N'000043', N'20    ', N'0     ', N'765.3 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000071', N'000043', N'20    ', N'0     ', N'766   ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000072', N'000043', N'20    ', N'0     ', N'764.3 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000073', N'000043', N'20    ', N'0     ', N'766   ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000074', N'000043', N'20    ', N'0     ', N'763.7 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000075', N'000043', N'20    ', N'0     ', N'763   ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000076', N'000043', N'20    ', N'0     ', N'763   ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000077', N'000043', N'20    ', N'0     ', N'761   ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000078', N'000043', N'20    ', N'0     ', N'761.3 ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000079', N'000043', N'20    ', N'0     ', N'760   ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000080', N'000044', N'20    ', N'2     ', N'767   ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000081', N'000044', N'20    ', N'2     ', N'767   ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000082', N'000044', N'20    ', N'2     ', N'766.3 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000083', N'000044', N'20    ', N'2     ', N'765.3 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000084', N'000044', N'20    ', N'2     ', N'765.7 ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000085', N'000044', N'20    ', N'2     ', N'764.3 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000086', N'000044', N'20    ', N'2     ', N'765.7 ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000087', N'000044', N'20    ', N'2     ', N'763.3 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000088', N'000044', N'20    ', N'2     ', N'762.7 ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000089', N'000044', N'20    ', N'2     ', N'762.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000090', N'000044', N'20    ', N'2     ', N'761.3 ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000091', N'000044', N'20    ', N'2     ', N'760.7 ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000092', N'000044', N'20    ', N'2     ', N'758   ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000093', N'000045', N'20    ', N'5     ', N'767.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000094', N'000045', N'20    ', N'5     ', N'767   ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000095', N'000045', N'20    ', N'5     ', N'766.7 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000096', N'000045', N'20    ', N'5     ', N'764.3 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000097', N'000045', N'20    ', N'5     ', N'763.7 ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000098', N'000045', N'20    ', N'5     ', N'760.7 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000099', N'000045', N'20    ', N'5     ', N'755.7 ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000100', N'000045', N'20    ', N'5     ', N'753.7 ', CAST(N'2014-03-12' AS Date))
GO
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000101', N'000045', N'20    ', N'5     ', N'753   ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000102', N'000045', N'20    ', N'5     ', N'751.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000103', N'000045', N'20    ', N'5     ', N'750.7 ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000104', N'000045', N'20    ', N'5     ', N'748   ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000105', N'000045', N'20    ', N'5     ', N'746.3 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000106', N'000046', N'20    ', N'10    ', N'767.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000107', N'000046', N'20    ', N'10    ', N'767.7 ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000108', N'000046', N'20    ', N'10    ', N'765   ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000109', N'000046', N'20    ', N'10    ', N'763.7 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000110', N'000046', N'20    ', N'10    ', N'762   ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000111', N'000046', N'20    ', N'10    ', N'759.3 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000112', N'000046', N'20    ', N'10    ', N'752   ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000113', N'000046', N'20    ', N'10    ', N'751.3 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000114', N'000046', N'20    ', N'10    ', N'748.3 ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000115', N'000046', N'20    ', N'10    ', N'747   ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000116', N'000046', N'20    ', N'10    ', N'744.7 ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000117', N'000046', N'20    ', N'10    ', N'743.3 ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000118', N'000046', N'20    ', N'10    ', N'740   ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000119', N'000047', N'25    ', N'0     ', N'766.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000120', N'000047', N'25    ', N'0     ', N'767   ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000121', N'000047', N'25    ', N'0     ', N'765.7 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000122', N'000047', N'25    ', N'0     ', N'766   ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000123', N'000047', N'25    ', N'0     ', N'765   ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000124', N'000047', N'25    ', N'0     ', N'764   ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000125', N'000047', N'25    ', N'0     ', N'762.7 ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000126', N'000047', N'25    ', N'0     ', N'762.3 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000127', N'000047', N'25    ', N'0     ', N'761.7 ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000128', N'000047', N'25    ', N'0     ', N'762.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000129', N'000047', N'25    ', N'0     ', N'761.3 ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000130', N'000047', N'25    ', N'0     ', N'762   ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000131', N'000047', N'25    ', N'0     ', N'760   ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000132', N'000048', N'25    ', N'2     ', N'767.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000133', N'000048', N'25    ', N'2     ', N'766.7 ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000134', N'000048', N'25    ', N'2     ', N'765.7 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000135', N'000048', N'25    ', N'2     ', N'765.3 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000136', N'000048', N'25    ', N'2     ', N'764.7 ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000137', N'000048', N'25    ', N'2     ', N'763.7 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000138', N'000048', N'25    ', N'2     ', N'762   ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000139', N'000048', N'25    ', N'2     ', N'760.7 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000140', N'000048', N'25    ', N'2     ', N'760.3 ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000141', N'000048', N'25    ', N'2     ', N'760   ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000142', N'000048', N'25    ', N'2     ', N'759   ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000143', N'000048', N'25    ', N'2     ', N'758.3 ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000144', N'000048', N'25    ', N'2     ', N'756.3 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000145', N'000049', N'25    ', N'5     ', N'767.4 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000146', N'000049', N'25    ', N'5     ', N'766   ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000147', N'000049', N'25    ', N'5     ', N'764.7 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000148', N'000049', N'25    ', N'5     ', N'764.7 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000149', N'000049', N'25    ', N'5     ', N'762.3 ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000150', N'000049', N'25    ', N'5     ', N'762.3 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000151', N'000049', N'25    ', N'5     ', N'760.7 ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000152', N'000049', N'25    ', N'5     ', N'759.7 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000153', N'000049', N'25    ', N'5     ', N'758   ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000154', N'000049', N'25    ', N'5     ', N'755.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000155', N'000049', N'25    ', N'5     ', N'751.7 ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000156', N'000049', N'25    ', N'5     ', N'747.7 ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000157', N'000049', N'25    ', N'5     ', N'743   ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000158', N'000050', N'25    ', N'10    ', N'768.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000159', N'000050', N'25    ', N'10    ', N'765   ', CAST(N'2014-01-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000160', N'000050', N'25    ', N'10    ', N'762.7 ', CAST(N'2014-01-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000161', N'000050', N'25    ', N'10    ', N'760.7 ', CAST(N'2014-01-31' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000162', N'000050', N'25    ', N'10    ', N'758.7 ', CAST(N'2014-02-10' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000163', N'000050', N'25    ', N'10    ', N'754.3 ', CAST(N'2014-02-20' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000164', N'000050', N'25    ', N'10    ', N'749   ', CAST(N'2014-03-02' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000165', N'000050', N'25    ', N'10    ', N'746.3 ', CAST(N'2014-03-12' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000166', N'000050', N'25    ', N'10    ', N'740.3 ', CAST(N'2014-03-22' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000167', N'000050', N'25    ', N'10    ', N'734   ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000168', N'000050', N'25    ', N'10    ', N'731   ', CAST(N'2014-04-11' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000169', N'000050', N'25    ', N'10    ', N'726.3 ', CAST(N'2014-04-21' AS Date))
INSERT [dbo].[害虫对小麦参数的影响数据表] ([JYLiuShuiNumber], [ShiYanNumber], [GrainTemp], [PeatsMiDu], [CanShuValue], [CheckDate]) VALUES (N'000170', N'000050', N'25    ', N'10    ', N'716.7 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (3, 1, N'小麦害虫种群变化关系模型', N'        储粮害虫是小麦储藏过程重要的生物特性参数之一，是引起小麦储藏期间数量损失和质量危害的关键因素，按照危害方式，可分为前期害虫或第一性害虫、后期害虫或第二性害虫。研究粮食储藏期间害虫的虫口密度或种群变化情况，对于储粮害虫治理措施的合理选择及科学地制定害虫防治策略有重要意义。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (3, 2, N'小麦质量特性参数变化关系模型', N'        小麦质量是小麦收购、储存、运输、加工和销售过程的重要依据，有些参数是小麦等级判定的主要指标。研究小麦储藏期间质量参数（色泽、气味、不完善度、脂肪酸值、面筋吸水率等）等变化规律，对于小麦储藏期间的质量控制及科学地制定储粮保质策略有重要意义。             ')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (3, 3, N'害虫对虫蚀率与容重影响关系模型', N'        粮食在储藏期间有害虫发生是不可避免的，不仅仅因害虫取食作用可造成储粮数量的损失，同时对粮食储存质量及后续加工品质也有影响。研究小麦储藏期间由害虫引起的质量参数变化如虫蚀粒率、容重等，对于储粮害虫治理及粮食质量控制均有重要意义。
')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 4, N'水分与容重的变化关系模型', N'        玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@        容重测定分别采用国标法和美标法测定。@        国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@        (1)郑单958两个品系随水分增加容重的降幅比较大，产地之间有一定的差异，差异较小；@        (2)先玉335和恒宇619两品种容重随水分的变化幅度很小，变化规律也不明显。
')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 5, N'水分与静止角的变化关系模型', N'        玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@        静止角测定分别采用趋势线法和两点法测定。@        不同品种玉米静止角随水分的变化趋势差异很大。@        趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@        (1)郑单958（河北）品系玉米粮堆静止角随水分的增加为增大。@        (2)郑单958（山东）和先玉335（吉林）两品系玉米粮堆静止角随水分增大基本恒定。@        (3)恒宇619（吉林）却是下降的趋势。@        
根据实验结果推测在水分11.5%-16.5%之间，玉米粮堆静止角随水分的变化趋势不确定，还有待更多品种玉米的更多实验研究。
')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 6, N'破碎率与容重的变化关系模型', N'        破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@        容重测定分别采用国标法和美标法测定。@        国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。
')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 7, N'破碎率与静止角的变化关系模型', N'        破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@        静止角测定分别采用趋势线法和两点法测定。@        用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@        (1)郑单958（河北）的静止角随破碎率的增加而呈先上升后下降，在破碎率为8%时有最大值。@        (2)郑单958（山东）、银河七（吉林）、先玉335（吉林）、恒宇619（吉林）的静止角随破碎率的增加而无规律变化。
')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 8, N'杂质含量与容重的变化关系模型', N'        容重测定分别采用国标法和美标法测定。@        国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 9, N'杂质含量与静止角的变化关系模型', N'        静止角测定分别采用趋势线法和两点法测定。@        用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 10, N'不同取样点孢子危害变化关系模型', N'        玉米入仓后对九个取样点样品进行霉变情况检测，真菌孢子总数变化情况在开启热泵之后真菌孢子总数有所上升，但各取样点基本都保持一致，同取样层靠近热壁面的偏高一些，说明高温促进真菌的发生；储存期前4周真菌孢子总数增长速度很慢，基本保持恒定，在第5周出现快速增长而且各层1点与其它两点差距逐渐拉开，说明本次试验玉米水分水平可以做较短期的储存，储存期不宜超过一个月；三层平均水平相比较a层较b和c层有一定差距，差距不太明显，说明在储存仓表层出现霉变的概率要高一些。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (2, 11, N'色泽度与时间的变化关系模型', N'        稻谷明度L值是表示稻谷颜色明暗的重要指标，是稻谷储藏过程重要的陈化程度判别参数之一，它是从0(黑)~100(白)表示颜色深浅。研究粮食储藏期间表面颜色明度L值变化情况，对于粮食品质优劣的监测、评定及科学地制定粮食仓储策略有重要意义。@      稻谷色度a值是表示稻谷表面颜色的重要指标，是稻谷储藏过程重要的陈化程度判别参数之一，它是从-120~+120表示红绿色，正值越大，越接近红色，负值绝对值越大，越接近绿色。研究粮食储藏期间表面颜色色度a值变化情况，对于粮食品质优劣的监测、评定及科学地制定粮食仓储策略有重要意义。@      稻谷色度b值是表示稻谷表面颜色的重要指标，是稻谷储藏过程重要的陈化程度判别参数之一，它是从-120~+120表示黄蓝色，正值越大，越接近黄色，负值绝对值越大，越接近蓝色。研究粮食储藏期间表面颜色色度b值变化情况，对于粮食品质优劣的监测、评定及科学地制定粮食仓储策略有重要意义。
')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (2, 13, N'整精米率与时间的变化关系模型', N'        稻谷整精米率是指达完整米粒平均长度4/5以上的精米占净稻谷质量的百分率，是稻谷储藏过程重要的质量指标之一。@        GB1350-2009规定籼稻、粳稻整精米率分别不能低于38.0%和49.0%（标准外为等外稻谷）。研究粮食储藏期间整精米率变化情况，对于粮食品质特性和种植品质优劣的监测、评定及科学地制定粮食仓储策略有重要意义。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (2, 14, N'出糙率与时间的变化关系模型', N'        稻谷出糙率是糙米的完善粒重量加上不完善粒重量的一半占净稻谷试样重量的百分率，是判定稻谷品质的指标之一，是我国稻谷定等的重要依据。@        GB1350-2009规定籼稻、粳稻出糙率分别不能低于71.0%和73.0%（标准外为等外稻谷）。研究粮食储藏期间出糙率变化情况，对于粮食品质特性和定等作价的监测、评定及科学地制定粮食仓储策略有重要意义。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (2, 15, N'黄变粒率与时间的变化关系模型', N'        稻谷黄变粒率是指呈明显黄色米粒的重量占净精米试样重量的百分率，是稻谷储藏过程重要的食用品质及营养价值优劣判别参数之一。@        GB1350-2009规定各类稻谷中黄变粒率不超过1.0%。研究粮食储藏期间黄变粒率变化情况，对于粮食品质特性和营养价值的监测、评定及科学地制定粮食仓储策略有重要意义。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (2, 16, N'脂肪酸值与时间的变化关系模型', N'        稻谷脂肪酸值稻谷中脂类物质在脂肪酶或酸碱作用下水解而产生的，是衡量稻谷新陈程度的一项重要指标。@        GB/T20569-2006规定籼稻、粳稻脂肪酸值分别大于37.0和35.0mg/100g时为重度不宜存。研究粮食储藏期间脂肪酸值变化情况，对于粮食品质变化和劣变程度的监测、评定及科学地制定粮食仓储策略有重要意义。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (2, 17, N'气味与时间的变化关系模型', N'        稻谷气味是指稻谷在储藏过程中产生的挥发性气体成分，是评价稻谷品质优劣的新指标之一，主要包括醇类、醛类、酮类、酯类、烃类、有机酸类以及杂环类化合物等六大类挥发物质。@        研究粮食储藏期间气味变化情况，对于粮食品质变化和劣变程度的监测、评定及科学地制定粮食仓储策略有重要意义。')
INSERT [dbo].[粮食功能描述表] ([TypeBianHao], [GongNengBianHao], [GongNengName], [GongNengMiaoShu]) VALUES (1, 18, N'玉米加热破坏实验模型', N'        为研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。在仓壁不同温度下，了解高水分玉米堆内粮温、粮湿的变化情况，玉米堆中不同高度上所含的危害真菌孢子数变化情况。为高水分玉米安全储藏提供科学依据。')
INSERT [dbo].[粮食图片描述表] ([TypeBianHao], [TuPianBianHao], [TuPianMiaoShu]) VALUES (1, 1, N'玉米特性参数智能数字化数据平台由课题承担单位国家粮食局科学研究院研究团队构建。')
INSERT [dbo].[粮食图片描述表] ([TypeBianHao], [TuPianBianHao], [TuPianMiaoShu]) VALUES (2, 1, N'稻谷特性参数智能数字化数据平台由课题承担单位南京财经大学研究团队构建。')
INSERT [dbo].[粮食图片描述表] ([TypeBianHao], [TuPianBianHao], [TuPianMiaoShu]) VALUES (3, 1, N'小麦特性参数智能数字化数据平台由课题牵头单位河南工业大学研究团队构建。')
INSERT [dbo].[粮食种类描述表] ([TypeBianHao], [EnglishiName], [MiaoShu], [ChineseName]) VALUES (1, N'Corn      ', N'       玉米特性参数智能数字化数据平台：针对玉米储运环节中水分控制和破碎分级问题严重等关键急需问题，结合玉米储运流通工艺仿真模拟试验数据和玉米储运环节的水分和流散特性参数变化测定方法，对不同容重、硬度、破碎和杂质的玉米，进行流散分级和含水量等特性参数进行智能数字化。', N'玉米      ')
INSERT [dbo].[粮食种类描述表] ([TypeBianHao], [EnglishiName], [MiaoShu], [ChineseName]) VALUES (2, N'Rice      ', N'       稻谷特性参数智能数字化数据平台：针对稻谷储藏中易于滋生虫霉和品质易变等问题，结合稻谷储存仿真模拟试验数据和稻谷储藏与品质控制关键特性参数的系列测定方法，对稻谷储藏重要参数如害虫发生度、害虫危害临界值、稻谷品质参数（出糙率、整精米率、黄变粒率、色泽、气味变化率、脂肪酸值等）等参数进行智能数字化。', N'水稻      ')
INSERT [dbo].[粮食种类描述表] ([TypeBianHao], [EnglishiName], [MiaoShu], [ChineseName]) VALUES (3, N'Wheate    ', N'       小麦特性参数智能数字化数据平台：针对小麦流通与储藏中的关键生态因子与变化影响问题，依照小麦储运仿真模拟试验数据和小麦特性参数模拟研究系列方法，对小麦储藏中的重要参数如害虫发生起点、害虫粮堆分布型、害虫检测规律、害虫质量危害临界值、小麦质量参数（色泽、气味、不完善度、脂肪酸值、面筋吸水率等）等参数进行智能数字化。', N'小麦      ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000001', N'不完善度      ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000002', N'脂肪酸值      ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000003', N'面筋吸水率     ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000004', N'虫蚀率       ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000005', N'容重        ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000006', N'玉米象种群     ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000007', N'谷蠹种群      ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000008', N'米象种群      ')
INSERT [dbo].[小麦参数名表] ([CanShuNumber], [CanShuName]) VALUES (N'000009', N'赤拟谷盗种群    ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000001', N'000001', N'000003', N'206.7 ', N'205.7 ', N'-0.002', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000002', N'000001', N'000003', N'206.7 ', N'205.3 ', N'-0.003', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000003', N'000001', N'000003', N'206.7 ', N'203.0 ', N'-0.010', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000004', N'000001', N'000003', N'206.7 ', N'202.0 ', N'-0.013', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000005', N'000001', N'000003', N'206.3 ', N'204.3 ', N'-0.002', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000006', N'000001', N'000003', N'206.3 ', N'203.0 ', N'-0.009', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000007', N'000001', N'000003', N'206.3 ', N'199.3 ', N'-0.019', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000008', N'000001', N'000003', N'206.3 ', N'196.0 ', N'-0.029', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000009', N'000001', N'000003', N'206.3 ', N'200.0 ', N'-0.018', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000010', N'000001', N'000003', N'206.3 ', N'198.7 ', N'-0.021', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000011', N'000001', N'000003', N'206.3 ', N'191.7 ', N'-0.041', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000012', N'000001', N'000003', N'206.3 ', N'185.3 ', N'-0.058', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000013', N'000001', N'000002', N'26.23 ', N'28.70 ', N'0.006 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000014', N'000001', N'000002', N'26.23 ', N'30.12 ', N'0.010 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000015', N'000001', N'000002', N'26.23 ', N'31.50 ', N'0.014 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000016', N'000001', N'000002', N'26.23 ', N'33.33 ', N'0.020 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000017', N'000001', N'000002', N'26.24 ', N'31.79 ', N'0.015 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000018', N'000001', N'000002', N'26.24 ', N'32.96 ', N'0.019 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000019', N'000001', N'000002', N'26.24 ', N'34.70 ', N'0.024 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000020', N'000001', N'000002', N'26.24 ', N'35.18 ', N'0.025 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000021', N'000001', N'000002', N'25.88 ', N'33.33 ', N'0.020 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000022', N'000001', N'000002', N'25.88 ', N'37.51 ', N'0.032 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000023', N'000001', N'000002', N'25.88 ', N'39.38 ', N'0.038 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000024', N'000001', N'000002', N'25.88 ', N'38.97 ', N'0.036 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000025', N'000001', N'000001', N'2.63  ', N'2.67  ', N'0.0001', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000026', N'000001', N'000001', N'2.63  ', N'2.63  ', N'0     ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000027', N'000001', N'000001', N'2.63  ', N'2.73  ', N'0.0002', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000028', N'000001', N'000001', N'2.63  ', N'2.67  ', N'0.0001', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000029', N'000001', N'000001', N'2.53  ', N'2.73  ', N'0.0005', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000030', N'000001', N'000001', N'2.53  ', N'2.73  ', N'0.0005', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000031', N'000001', N'000001', N'2.53  ', N'2.73  ', N'0.0005', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000032', N'000001', N'000001', N'2.53  ', N'2.77  ', N'0.0006', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000033', N'000001', N'000001', N'2.57  ', N'2.77  ', N'0.0005', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000034', N'000001', N'000001', N'2.57  ', N'2.93  ', N'0.001 ', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000035', N'000001', N'000001', N'2.57  ', N'3.17  ', N'0.0016', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000036', N'000001', N'000001', N'2.57  ', N'3.97  ', N'0.0039', CAST(N'2014-01-01' AS Date), CAST(N'2015-01-01' AS Date), NULL, N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000037', N'000001', N'000004', N'0     ', N'25    ', N'0.17  ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-31' AS Date), N'000002', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000038', N'000001', N'000004', N'0     ', N'31    ', N'0.22  ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-31' AS Date), N'000002', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000039', N'000001', N'000004', N'0     ', N'39.33 ', N'0.28  ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-31' AS Date), N'000002', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000040', N'000001', N'000004', N'0     ', N'22.67 ', N'0.16  ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-31' AS Date), N'000003', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000041', N'000001', N'000004', N'0     ', N'29.33 ', N'0.21  ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-31' AS Date), N'000003', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000042', N'000001', N'000004', N'0     ', N'31.33 ', N'0.22  ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-31' AS Date), N'000003', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000043', N'000001', N'000005', N'767   ', N'760   ', N'-0.058', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000044', N'000001', N'000005', N'767   ', N'758   ', N'-0.025', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000045', N'000001', N'000005', N'767.7 ', N'746.3 ', N'-0.178', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000046', N'000001', N'000005', N'767.7 ', N'740   ', N'-0.231', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000047', N'000001', N'000005', N'766.7 ', N'760   ', N'-0.019', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000048', N'000001', N'000005', N'767.3 ', N'756.3 ', N'-0.091', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000049', N'000001', N'000005', N'767.4 ', N'743   ', N'-0.203', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000050', N'000001', N'000005', N'768.3 ', N'716.7 ', N'-0.43 ', CAST(N'2014-01-01' AS Date), CAST(N'2014-05-01' AS Date), N'000001', N'描述区                                                                                                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000051', N'000001', N'000006', N'1.00  ', N'13.33 ', N'0.16  ', CAST(N'2015-05-01' AS Date), CAST(N'2015-07-17' AS Date), N'000001', N'玉米象是粮食储藏期过程中前期害虫，是危害粮食的主要害虫之一，实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，玉米象感染50kg小麦后，种群数量随时间的变化情况。                                                                                                                                                                                                                         ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000052', N'000001', N'000007', N'0.33  ', N'9.33  ', N'0.11  ', CAST(N'2015-05-01' AS Date), CAST(N'2015-07-17' AS Date), N'000002', N'谷蠹是粮食储藏期过程中前期害虫，是危害粮食的主要害虫之一，实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，谷蠹感染50kg小麦后，种群数量随时间的变化情况。                                                                                                                                                                                                                           ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000053', N'000001', N'000008', N'0.00  ', N'9.00  ', N'0.11  ', CAST(N'2015-05-01' AS Date), CAST(N'2015-07-17' AS Date), N'000003', N'米象是粮食储藏期过程中前期害虫，是危害粮食的主要害虫之一，实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，米象感染50kg小麦后，种群数量随时间的变化情况。                                                                                                                                                                                                                           ')
INSERT [dbo].[小麦参数实验总概括表] ([ShiYanNumber], [ShiYanPiCiHao], [CanShuNumber], [StartCanShuValue], [EndCanShuValue], [CanShuChangeSpeed], [StartTime], [EndTime], [PeatsNum], [Display]) VALUES (N'000054', N'000001', N'000009', N'3.00  ', N'11.33 ', N'0.11  ', CAST(N'2015-05-01' AS Date), CAST(N'2015-07-17' AS Date), N'000004', N'赤拟谷盗是粮食储藏期过程中后期害虫，是危害粮食的主要害虫之一，实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，赤拟谷盗感染50kg小麦后，种群数量随时间的变化情况。                                                                                                                                                                                                                       ')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000001', N'000001', N'0     ', N'3     ', N'正常        ', NULL)
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000002', N'000002', N'0     ', N'3     ', N'正常        ', NULL)
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000003', N'000003', N'0     ', N'3     ', N'正常        ', NULL)
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000004', N'000004', N'0     ', N'3     ', N'正常        ', N'000002')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000005', N'000004', N'0     ', N'3     ', N'正常        ', N'000003')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000006', N'000005', N'0     ', N'3     ', N'正常        ', N'000001')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000007', N'000006', N'0     ', N'3     ', N'正常粮食      ', N'000001')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000008', N'000007', N'0     ', N'3     ', N'正常粮食      ', N'000002')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000009', N'000008', N'0     ', N'3     ', N'正常粮食      ', N'000003')
INSERT [dbo].[小麦参数阈值表] ([id], [CanShuNumber], [LowNum], [HighNum], [Display], [PeatsNum]) VALUES (N'000010', N'000009', N'0     ', N'3     ', N'正常粮食      ', N'000004')
INSERT [dbo].[小麦害虫名表] ([PeatsNum], [PeatsName]) VALUES (N'000001', N'玉米象       ')
INSERT [dbo].[小麦害虫名表] ([PeatsNum], [PeatsName]) VALUES (N'000002', N'谷蠹        ')
INSERT [dbo].[小麦害虫名表] ([PeatsNum], [PeatsName]) VALUES (N'000003', N'米象        ')
INSERT [dbo].[小麦害虫名表] ([PeatsNum], [PeatsName]) VALUES (N'000004', N'赤拟谷盗      ')
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000001', N'000051', N'28.0/18.1 ', N'21.5 ', N'1.00 ', CAST(N'2015-05-01' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000002', N'000051', N'29.3/17.9 ', N'22.5 ', N'2.00 ', CAST(N'2015-05-08' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000003', N'000051', N'29.8/19.2 ', N'23.2 ', N'2.00 ', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000004', N'000051', N'31.0/20.9 ', N'26   ', N'2.67 ', CAST(N'2015-05-22' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000005', N'000051', N'34.5/25.0 ', N'28   ', N'3.33 ', CAST(N'2015-05-29' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000006', N'000051', N'32.4/25.4 ', N'29.2 ', N'4.67 ', CAST(N'2015-06-05' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000007', N'000051', N'30.8/24.4 ', N'30.1 ', N'5.67 ', CAST(N'2015-06-12' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000008', N'000051', N'30.0/24.2 ', N'31.5 ', N'9.00 ', CAST(N'2015-06-19' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000009', N'000051', N'31.8/21.1 ', N'33.2 ', N'11.00', CAST(N'2015-06-26' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000010', N'000051', N'34.8/24.9 ', N'34.2 ', N'12.33', CAST(N'2015-07-03' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000011', N'000051', N'30.1/26.0 ', N'34.5 ', N'13.00', CAST(N'2015-07-10' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000012', N'000051', N'35.2/27.3 ', N'35   ', N'13.33', CAST(N'2015-07-17' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000013', N'000052', N'28.0/18.1 ', N'21.5 ', N'0.33 ', CAST(N'2015-05-01' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000014', N'000052', N'29.3/17.9 ', N'22.5 ', N'1.33 ', CAST(N'2015-05-08' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000015', N'000052', N'29.8/19.2 ', N'23.2 ', N'1.33 ', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000016', N'000052', N'31.0/20.9 ', N'26   ', N'1.67 ', CAST(N'2015-05-22' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000017', N'000052', N'34.5/25.0 ', N'28   ', N'3.00 ', CAST(N'2015-05-29' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000018', N'000052', N'32.4/25.4 ', N'29.2 ', N'3.67 ', CAST(N'2015-06-05' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000019', N'000052', N'30.8/24.4 ', N'30.1 ', N'5.00 ', CAST(N'2015-06-12' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000020', N'000052', N'30.0/24.2 ', N'31.5 ', N'6.67 ', CAST(N'2015-06-19' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000021', N'000052', N'31.8/21.1 ', N'33.2 ', N'8.00 ', CAST(N'2015-06-26' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000022', N'000052', N'34.8/24.9 ', N'34.2 ', N'8.67 ', CAST(N'2015-07-03' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000023', N'000052', N'30.1/26.0 ', N'34.5 ', N'8.67 ', CAST(N'2015-07-10' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000024', N'000052', N'35.2/27.3 ', N'35   ', N'9.33 ', CAST(N'2015-07-17' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000025', N'000053', N'28.0/18.1 ', N'21.5 ', N'0.00 ', CAST(N'2015-05-01' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000026', N'000053', N'29.3/17.9 ', N'22.5 ', N'0.67 ', CAST(N'2015-05-08' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000027', N'000053', N'29.8/19.2 ', N'23.2 ', N'0.67 ', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000028', N'000053', N'31.0/20.9 ', N'26   ', N'1.20 ', CAST(N'2015-05-22' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000029', N'000053', N'34.5/25.0 ', N'28   ', N'2.33 ', CAST(N'2015-05-29' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000030', N'000053', N'32.4/25.4 ', N'29.2 ', N'5.00 ', CAST(N'2015-06-05' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000031', N'000053', N'30.8/24.4 ', N'30.1 ', N'5.00 ', CAST(N'2015-06-12' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000032', N'000053', N'30.0/24.2 ', N'31.5 ', N'7.00 ', CAST(N'2015-06-19' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000033', N'000053', N'31.8/21.1 ', N'33.2 ', N'8.67 ', CAST(N'2015-06-26' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000034', N'000053', N'34.8/24.9 ', N'34.2 ', N'9.00 ', CAST(N'2015-07-03' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000035', N'000053', N'30.1/26.0 ', N'34.5 ', N'9.33 ', CAST(N'2015-07-10' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000036', N'000053', N'35.2/27.3 ', N'35   ', N'9.00 ', CAST(N'2015-07-17' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000037', N'000054', N'28.0/18.1 ', N'21.5 ', N'3.00 ', CAST(N'2015-05-01' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000038', N'000054', N'29.3/17.9 ', N'22.5 ', N'1.33 ', CAST(N'2015-05-08' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000039', N'000054', N'29.8/19.2 ', N'23.2 ', N'1.33 ', CAST(N'2015-05-15' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000040', N'000054', N'31.0/20.9 ', N'26   ', N'2.33 ', CAST(N'2015-05-22' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000041', N'000054', N'34.5/25.0 ', N'28   ', N'4.33 ', CAST(N'2015-05-29' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000042', N'000054', N'32.4/25.4 ', N'29.2 ', N'5.33 ', CAST(N'2015-06-05' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000043', N'000054', N'30.8/24.4 ', N'30.1 ', N'6.00 ', CAST(N'2015-06-12' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000044', N'000054', N'30.0/24.2 ', N'31.5 ', N'7.67 ', CAST(N'2015-06-19' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000045', N'000054', N'31.8/21.1 ', N'33.2 ', N'10.0 ', CAST(N'2015-06-26' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000046', N'000054', N'34.8/24.8 ', N'34.2 ', N'10.6 ', CAST(N'2015-07-03' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000047', N'000054', N'30.1/26.0 ', N'34.5 ', N'11.3 ', CAST(N'2015-07-10' AS Date))
INSERT [dbo].[小麦害虫种群变化数据表] ([JYLiuShuiNumber], [ShiYanNumber], [InTemp], [GrainTemp], [CanShuValue], [Date]) VALUES (N'000048', N'000054', N'35.2/27.3 ', N'35   ', N'11.3 ', CAST(N'2015-07-17' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000001', N'000001', N'11.5  ', N'20    ', N'206.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000002', N'000001', N'11.5  ', N'20    ', N'208.7 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000003', N'000001', N'11.5  ', N'20    ', N'208.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000004', N'000001', N'11.5  ', N'20    ', N'208.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000005', N'000001', N'11.5  ', N'20    ', N'208.7 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000006', N'000001', N'11.5  ', N'20    ', N'207.7 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000007', N'000001', N'11.5  ', N'20    ', N'208.0 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000008', N'000001', N'11.5  ', N'20    ', N'207.7 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000009', N'000001', N'11.5  ', N'20    ', N'207.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000010', N'000001', N'11.5  ', N'20    ', N'207.3 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000011', N'000001', N'11.5  ', N'20    ', N'206.0 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000012', N'000001', N'11.5  ', N'20    ', N'205.7 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000013', N'000001', N'11.5  ', N'20    ', N'205.7 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000014', N'000002', N'11.5  ', N'25    ', N'206.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000015', N'000002', N'11.5  ', N'25    ', N'208.3 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000016', N'000002', N'11.5  ', N'25    ', N'207.7 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000017', N'000002', N'11.5  ', N'25    ', N'208.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000018', N'000002', N'11.5  ', N'25    ', N'208.3 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000019', N'000002', N'11.5  ', N'25    ', N'207.7 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000020', N'000002', N'11.5  ', N'25    ', N'207.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000021', N'000002', N'11.5  ', N'25    ', N'207.3 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000022', N'000002', N'11.5  ', N'25    ', N'207.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000023', N'000002', N'11.5  ', N'25    ', N'207.7 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000024', N'000002', N'11.5  ', N'25    ', N'206.3 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000025', N'000002', N'11.5  ', N'25    ', N'205.3 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000026', N'000002', N'11.5  ', N'25    ', N'205.3 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000027', N'000003', N'11.5  ', N'27.5  ', N'206.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000028', N'000003', N'11.5  ', N'27.5  ', N'208.7 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000029', N'000003', N'11.5  ', N'27.5  ', N'207.7 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000030', N'000003', N'11.5  ', N'27.5  ', N'207.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000031', N'000003', N'11.5  ', N'27.5  ', N'207.7 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000032', N'000003', N'11.5  ', N'27.5  ', N'207.3 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000033', N'000003', N'11.5  ', N'27.5  ', N'207.0 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000034', N'000003', N'11.5  ', N'27.5  ', N'206.0 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000035', N'000003', N'11.5  ', N'27.5  ', N'205.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000036', N'000003', N'11.5  ', N'27.5  ', N'204.7 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000037', N'000003', N'11.5  ', N'27.5  ', N'204.7 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000038', N'000003', N'11.5  ', N'27.5  ', N'204.0 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000039', N'000003', N'11.5  ', N'27.5  ', N'203.0 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000040', N'000004', N'11.5  ', N'30    ', N'206.7 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000041', N'000004', N'11.5  ', N'30    ', N'207.7 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000042', N'000004', N'11.5  ', N'30    ', N'206.7 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000043', N'000004', N'11.5  ', N'30    ', N'207.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000044', N'000004', N'11.5  ', N'30    ', N'207.0 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000045', N'000004', N'11.5  ', N'30    ', N'206.7 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000046', N'000004', N'11.5  ', N'30    ', N'206.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000047', N'000004', N'11.5  ', N'30    ', N'205.3 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000048', N'000004', N'11.5  ', N'30    ', N'205.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000049', N'000004', N'11.5  ', N'30    ', N'204.7 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000050', N'000004', N'11.5  ', N'30    ', N'203.7 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000051', N'000004', N'11.5  ', N'30    ', N'203.0 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000052', N'000004', N'11.5  ', N'30    ', N'202.0 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000053', N'000005', N'12.5  ', N'20    ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000054', N'000005', N'12.5  ', N'20    ', N'207.3 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000055', N'000005', N'12.5  ', N'20    ', N'207.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000056', N'000005', N'12.5  ', N'20    ', N'207.0 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000057', N'000005', N'12.5  ', N'20    ', N'206.7 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000058', N'000005', N'12.5  ', N'20    ', N'207.0 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000059', N'000005', N'12.5  ', N'20    ', N'206.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000060', N'000005', N'12.5  ', N'20    ', N'206.0 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000061', N'000005', N'12.5  ', N'20    ', N'205.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000062', N'000005', N'12.5  ', N'20    ', N'205.0 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000063', N'000005', N'12.5  ', N'20    ', N'204.7 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000064', N'000005', N'12.5  ', N'20    ', N'204.3 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000065', N'000005', N'12.5  ', N'20    ', N'204.3 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000066', N'000006', N'12.5  ', N'25    ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000067', N'000006', N'12.5  ', N'25    ', N'206.7 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000068', N'000006', N'12.5  ', N'25    ', N'206.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000069', N'000006', N'12.5  ', N'25    ', N'206.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000070', N'000006', N'12.5  ', N'25    ', N'206.3 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000071', N'000006', N'12.5  ', N'25    ', N'205.7 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000072', N'000006', N'12.5  ', N'25    ', N'206.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000073', N'000006', N'12.5  ', N'25    ', N'206.0 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000074', N'000006', N'12.5  ', N'25    ', N'205.7 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000075', N'000006', N'12.5  ', N'25    ', N'204.3 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000076', N'000006', N'12.5  ', N'25    ', N'204.3 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000077', N'000006', N'12.5  ', N'25    ', N'206.3 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000078', N'000006', N'12.5  ', N'25    ', N'203.0 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000079', N'000007', N'12.5  ', N'27.5  ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000080', N'000007', N'12.5  ', N'27.5  ', N'207.3 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000081', N'000007', N'12.5  ', N'27.5  ', N'206.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000082', N'000007', N'12.5  ', N'27.5  ', N'206.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000083', N'000007', N'12.5  ', N'27.5  ', N'205.7 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000084', N'000007', N'12.5  ', N'27.5  ', N'205.3 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000085', N'000007', N'12.5  ', N'27.5  ', N'204.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000086', N'000007', N'12.5  ', N'27.5  ', N'203.7 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000087', N'000007', N'12.5  ', N'27.5  ', N'203.0 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000088', N'000007', N'12.5  ', N'27.5  ', N'201.7 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000089', N'000007', N'12.5  ', N'27.5  ', N'201.3 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000090', N'000007', N'12.5  ', N'27.5  ', N'200.3 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000091', N'000007', N'12.5  ', N'27.5  ', N'199.3 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000092', N'000008', N'12.5  ', N'30.0  ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000093', N'000008', N'12.5  ', N'30.0  ', N'207.0 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000094', N'000008', N'12.5  ', N'30.0  ', N'206.7 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000095', N'000008', N'12.5  ', N'30.0  ', N'206.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000096', N'000008', N'12.5  ', N'30.0  ', N'205.7 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000097', N'000008', N'12.5  ', N'30.0  ', N'205.3 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000098', N'000008', N'12.5  ', N'30.0  ', N'204.0 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000099', N'000008', N'12.5  ', N'30.0  ', N'202.0 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000100', N'000008', N'12.5  ', N'30.0  ', N'201.0 ', CAST(N'2014-09-01' AS Date))
GO
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000101', N'000008', N'12.5  ', N'30.0  ', N'199.3 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000102', N'000008', N'12.5  ', N'30.0  ', N'198.3 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000103', N'000008', N'12.5  ', N'30.0  ', N'196.7 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000104', N'000008', N'12.5  ', N'30.0  ', N'196.0 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000105', N'000009', N'13.5  ', N'20.0  ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000106', N'000009', N'13.5  ', N'20.0  ', N'207.3 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000107', N'000009', N'13.5  ', N'20.0  ', N'207.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000108', N'000009', N'13.5  ', N'20.0  ', N'206.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000109', N'000009', N'13.5  ', N'20.0  ', N'207.0 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000110', N'000009', N'13.5  ', N'20.0  ', N'206.7 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000111', N'000009', N'13.5  ', N'20.0  ', N'206.0 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000112', N'000009', N'13.5  ', N'20.0  ', N'204.0 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000113', N'000009', N'13.5  ', N'20.0  ', N'203.7 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000114', N'000009', N'13.5  ', N'20.0  ', N'202.0 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000115', N'000009', N'13.5  ', N'20.0  ', N'202.0 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000116', N'000009', N'13.5  ', N'20.0  ', N'201.0 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000117', N'000009', N'13.5  ', N'20.0  ', N'200.0 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000118', N'000010', N'13.5  ', N'25.0  ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000119', N'000010', N'13.5  ', N'25.0  ', N'207.0 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000120', N'000010', N'13.5  ', N'25.0  ', N'206.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000121', N'000010', N'13.5  ', N'25.0  ', N'206.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000122', N'000010', N'13.5  ', N'25.0  ', N'206.0 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000123', N'000010', N'13.5  ', N'25.0  ', N'205.7 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000124', N'000010', N'13.5  ', N'25.0  ', N'204.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000125', N'000010', N'13.5  ', N'25.0  ', N'203.7 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000126', N'000010', N'13.5  ', N'25.0  ', N'202.7 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000127', N'000010', N'13.5  ', N'25.0  ', N'200.3 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000128', N'000010', N'13.5  ', N'25.0  ', N'199.7 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000129', N'000010', N'13.5  ', N'25.0  ', N'200.0 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000130', N'000010', N'13.5  ', N'25.0  ', N'198.7 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000131', N'000011', N'13.5  ', N'27.5  ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000132', N'000011', N'13.5  ', N'27.5  ', N'206.0 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000133', N'000011', N'13.5  ', N'27.5  ', N'206.3 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000134', N'000011', N'13.5  ', N'27.5  ', N'205.3 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000135', N'000011', N'13.5  ', N'27.5  ', N'204.3 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000136', N'000011', N'13.5  ', N'27.5  ', N'203.3 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000137', N'000011', N'13.5  ', N'27.5  ', N'201.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000138', N'000011', N'13.5  ', N'27.5  ', N'198.3 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000139', N'000011', N'13.5  ', N'27.5  ', N'197.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000140', N'000011', N'13.5  ', N'27.5  ', N'197.0 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000141', N'000011', N'13.5  ', N'27.5  ', N'196.3 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000142', N'000011', N'13.5  ', N'27.5  ', N'194.3 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000143', N'000011', N'13.5  ', N'27.5  ', N'191.7 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000144', N'000012', N'13.5  ', N'30.0  ', N'206.3 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000145', N'000012', N'13.5  ', N'30.0  ', N'205.7 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000146', N'000012', N'13.5  ', N'30.0  ', N'205.0 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000147', N'000012', N'13.5  ', N'30.0  ', N'204.7 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000148', N'000012', N'13.5  ', N'30.0  ', N'201.3 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000149', N'000012', N'13.5  ', N'30.0  ', N'198.0 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000150', N'000012', N'13.5  ', N'30.0  ', N'196.3 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000151', N'000012', N'13.5  ', N'30.0  ', N'193.0 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000152', N'000012', N'13.5  ', N'30.0  ', N'192.3 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000153', N'000012', N'13.5  ', N'30.0  ', N'190.0 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000154', N'000012', N'13.5  ', N'30.0  ', N'188.0 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000155', N'000012', N'13.5  ', N'30.0  ', N'187.0 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000156', N'000012', N'13.5  ', N'30.0  ', N'185.3 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000157', N'000013', N'11.5  ', N'20    ', N'26.23 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000158', N'000013', N'11.5  ', N'20    ', N'26.18 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000159', N'000013', N'11.5  ', N'20    ', N'26.30 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000160', N'000013', N'11.5  ', N'20    ', N'26.34 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000161', N'000013', N'11.5  ', N'20    ', N'26.44 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000162', N'000013', N'11.5  ', N'20    ', N'26.61 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000163', N'000013', N'11.5  ', N'20    ', N'26.79 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000164', N'000013', N'11.5  ', N'20    ', N'26.96 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000165', N'000013', N'11.5  ', N'20    ', N'27.22 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000166', N'000013', N'11.5  ', N'20    ', N'28.05 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000167', N'000013', N'11.5  ', N'20    ', N'28.03 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000168', N'000013', N'11.5  ', N'20    ', N'28.47 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000169', N'000013', N'11.5  ', N'20    ', N'28.70 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000170', N'000014', N'11.5  ', N'25    ', N'26.23 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000171', N'000014', N'11.5  ', N'25    ', N'26.53 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000172', N'000014', N'11.5  ', N'25    ', N'26.67 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000173', N'000014', N'11.5  ', N'25    ', N'26.71 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000174', N'000014', N'11.5  ', N'25    ', N'27.09 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000175', N'000014', N'11.5  ', N'25    ', N'27.77 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000176', N'000014', N'11.5  ', N'25    ', N'27.94 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000177', N'000014', N'11.5  ', N'25    ', N'28.04 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000178', N'000014', N'11.5  ', N'25    ', N'29.04 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000179', N'000014', N'11.5  ', N'25    ', N'29.57 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000180', N'000014', N'11.5  ', N'25    ', N'29.45 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000181', N'000014', N'11.5  ', N'25    ', N'29.81 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000182', N'000014', N'11.5  ', N'25    ', N'30.12 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000183', N'000015', N'11.5  ', N'27.5  ', N'26.23 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000184', N'000015', N'11.5  ', N'27.5  ', N'26.49 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000185', N'000015', N'11.5  ', N'27.5  ', N'26.73 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000186', N'000015', N'11.5  ', N'27.5  ', N'26.86 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000187', N'000015', N'11.5  ', N'27.5  ', N'27.23 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000188', N'000015', N'11.5  ', N'27.5  ', N'27.66 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000189', N'000015', N'11.5  ', N'27.5  ', N'28.90 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000190', N'000015', N'11.5  ', N'27.5  ', N'30.15 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000191', N'000015', N'11.5  ', N'27.5  ', N'30.93 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000192', N'000015', N'11.5  ', N'27.5  ', N'31.61 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000193', N'000015', N'11.5  ', N'27.5  ', N'30.24 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000194', N'000015', N'11.5  ', N'27.5  ', N'31.10 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000195', N'000015', N'11.5  ', N'27.5  ', N'31.50 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000196', N'000016', N'11.5  ', N'30.0  ', N'26.23 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000197', N'000016', N'11.5  ', N'30.0  ', N'26.44 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000198', N'000016', N'11.5  ', N'30.0  ', N'26.95 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000199', N'000016', N'11.5  ', N'30.0  ', N'26.97 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000200', N'000016', N'11.5  ', N'30.0  ', N'27.43 ', CAST(N'2014-05-01' AS Date))
GO
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000201', N'000016', N'11.5  ', N'30.0  ', N'28.55 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000202', N'000016', N'11.5  ', N'30.0  ', N'29.39 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000203', N'000016', N'11.5  ', N'30.0  ', N'30.87 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000204', N'000016', N'11.5  ', N'30.0  ', N'31.73 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000205', N'000016', N'11.5  ', N'30.0  ', N'33.68 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000206', N'000016', N'11.5  ', N'30.0  ', N'32.86 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000207', N'000016', N'11.5  ', N'30.0  ', N'32.90 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000208', N'000016', N'11.5  ', N'30.0  ', N'33.33 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000209', N'000017', N'12.5  ', N'20    ', N'26.24 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000210', N'000017', N'12.5  ', N'20    ', N'26.28 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000211', N'000017', N'12.5  ', N'20    ', N'26.66 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000212', N'000017', N'12.5  ', N'20    ', N'26.88 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000213', N'000017', N'12.5  ', N'20    ', N'27.21 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000214', N'000017', N'12.5  ', N'20    ', N'27.71 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000215', N'000017', N'12.5  ', N'20    ', N'28.43 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000216', N'000017', N'12.5  ', N'20    ', N'28.77 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000217', N'000017', N'12.5  ', N'20    ', N'29.98 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000218', N'000017', N'12.5  ', N'20    ', N'31.10 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000219', N'000017', N'12.5  ', N'20    ', N'30.97 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000220', N'000017', N'12.5  ', N'20    ', N'31.23 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000221', N'000017', N'12.5  ', N'20    ', N'31.79 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000222', N'000018', N'12.5  ', N'25    ', N'26.24 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000223', N'000018', N'12.5  ', N'25    ', N'26.68 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000224', N'000018', N'12.5  ', N'25    ', N'26.97 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000225', N'000018', N'12.5  ', N'25    ', N'26.85 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000226', N'000018', N'12.5  ', N'25    ', N'27.58 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000227', N'000018', N'12.5  ', N'25    ', N'28.36 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000228', N'000018', N'12.5  ', N'25    ', N'29.66 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000229', N'000018', N'12.5  ', N'25    ', N'31.26 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000230', N'000018', N'12.5  ', N'25    ', N'31.75 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000231', N'000018', N'12.5  ', N'25    ', N'32.05 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000232', N'000018', N'12.5  ', N'25    ', N'32.66 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000233', N'000018', N'12.5  ', N'25    ', N'32.81 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000234', N'000018', N'12.5  ', N'25    ', N'32.96 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000235', N'000019', N'12.5  ', N'27.5  ', N'26.24 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000236', N'000019', N'12.5  ', N'27.5  ', N'26.67 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000237', N'000019', N'12.5  ', N'27.5  ', N'27.00 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000238', N'000019', N'12.5  ', N'27.5  ', N'27.04 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000239', N'000019', N'12.5  ', N'27.5  ', N'28.12 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000240', N'000019', N'12.5  ', N'27.5  ', N'28.88 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000241', N'000019', N'12.5  ', N'27.5  ', N'30.99 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000242', N'000019', N'12.5  ', N'27.5  ', N'31.39 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000243', N'000019', N'12.5  ', N'27.5  ', N'33.35 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000244', N'000019', N'12.5  ', N'27.5  ', N'34.08 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000245', N'000019', N'12.5  ', N'27.5  ', N'34.05 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000246', N'000019', N'12.5  ', N'27.5  ', N'34.25 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000247', N'000019', N'12.5  ', N'27.5  ', N'37.70 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000248', N'000020', N'12.5  ', N'30.0  ', N'26.24 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000249', N'000020', N'12.5  ', N'30.0  ', N'27.02 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000250', N'000020', N'12.5  ', N'30.0  ', N'27.65 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000251', N'000020', N'12.5  ', N'30.0  ', N'29.32 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000252', N'000020', N'12.5  ', N'30.0  ', N'31.51 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000253', N'000020', N'12.5  ', N'30.0  ', N'33.36 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000254', N'000020', N'12.5  ', N'30.0  ', N'34.60 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000255', N'000020', N'12.5  ', N'30.0  ', N'34.63 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000256', N'000020', N'12.5  ', N'30.0  ', N'34.80 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000257', N'000020', N'12.5  ', N'30.0  ', N'35.20 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000258', N'000020', N'12.5  ', N'30.0  ', N'34.88 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000259', N'000020', N'12.5  ', N'30.0  ', N'35.10 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000260', N'000020', N'12.5  ', N'30.0  ', N'35.18 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000261', N'000021', N'13.5  ', N'20    ', N'25.88 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000262', N'000021', N'13.5  ', N'20    ', N'26.18 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000263', N'000021', N'13.5  ', N'20    ', N'26.44 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000264', N'000021', N'13.5  ', N'20    ', N'27.30 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000265', N'000021', N'13.5  ', N'20    ', N'29.24 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000266', N'000021', N'13.5  ', N'20    ', N'29.92 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000267', N'000021', N'13.5  ', N'20    ', N'30.60 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000268', N'000021', N'13.5  ', N'20    ', N'31.06 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000269', N'000021', N'13.5  ', N'20    ', N'31.83 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000270', N'000021', N'13.5  ', N'20    ', N'32.53 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000271', N'000021', N'13.5  ', N'20    ', N'32.65 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000272', N'000021', N'13.5  ', N'20    ', N'33.4  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000273', N'000021', N'13.5  ', N'20    ', N'33.33 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000274', N'000022', N'13.5  ', N'25    ', N'25.88 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000275', N'000022', N'13.5  ', N'25    ', N'26.89 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000276', N'000022', N'13.5  ', N'25    ', N'27.79 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000277', N'000022', N'13.5  ', N'25    ', N'28.14 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000278', N'000022', N'13.5  ', N'25    ', N'30.72 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000279', N'000022', N'13.5  ', N'25    ', N'33.06 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000280', N'000022', N'13.5  ', N'25    ', N'33.59 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000281', N'000022', N'13.5  ', N'25    ', N'34.71 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000282', N'000022', N'13.5  ', N'25    ', N'36.09 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000283', N'000022', N'13.5  ', N'25    ', N'36.37 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000284', N'000022', N'13.5  ', N'25    ', N'37.37 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000285', N'000022', N'13.5  ', N'25    ', N'37.18 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000286', N'000022', N'13.5  ', N'25    ', N'37.51 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000287', N'000023', N'13.5  ', N'27.5  ', N'25.88 ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000288', N'000023', N'13.5  ', N'27.5  ', N'27.19 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000289', N'000023', N'13.5  ', N'27.5  ', N'28.02 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000290', N'000023', N'13.5  ', N'27.5  ', N'29.36 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000291', N'000023', N'13.5  ', N'27.5  ', N'32.12 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000292', N'000023', N'13.5  ', N'27.5  ', N'34.89 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000293', N'000023', N'13.5  ', N'27.5  ', N'36.46 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000294', N'000023', N'13.5  ', N'27.5  ', N'36.75 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000295', N'000023', N'13.5  ', N'27.5  ', N'37.22 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000296', N'000023', N'13.5  ', N'27.5  ', N'37.91 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000297', N'000023', N'13.5  ', N'27.5  ', N'39.95 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000298', N'000023', N'13.5  ', N'27.5  ', N'39.88 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000299', N'000023', N'13.5  ', N'27.5  ', N'39.38 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000300', N'000024', N'13.5  ', N'30.0  ', N'25.88 ', CAST(N'2014-01-01' AS Date))
GO
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000301', N'000024', N'13.5  ', N'30.0  ', N'29.65 ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000302', N'000024', N'13.5  ', N'30.0  ', N'33.36 ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000303', N'000024', N'13.5  ', N'30.0  ', N'38.29 ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000304', N'000024', N'13.5  ', N'30.0  ', N'40.35 ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000305', N'000024', N'13.5  ', N'30.0  ', N'41.28 ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000306', N'000024', N'13.5  ', N'30.0  ', N'41.76 ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000307', N'000024', N'13.5  ', N'30.0  ', N'42.22 ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000308', N'000024', N'13.5  ', N'30.0  ', N'40.51 ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000309', N'000024', N'13.5  ', N'30.0  ', N'39.88 ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000310', N'000024', N'13.5  ', N'30.0  ', N'40.10 ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000311', N'000024', N'13.5  ', N'30.0  ', N'39.33 ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000312', N'000024', N'13.5  ', N'30.0  ', N'38.97 ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000313', N'000025', N'11.5  ', N'20    ', N'2.63  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000314', N'000025', N'11.5  ', N'20    ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000315', N'000025', N'11.5  ', N'20    ', N'2.57  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000316', N'000025', N'11.5  ', N'20    ', N'2.67  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000317', N'000025', N'11.5  ', N'20    ', N'2.57  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000318', N'000025', N'11.5  ', N'20    ', N'2.67  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000319', N'000025', N'11.5  ', N'20    ', N'2.63  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000320', N'000025', N'11.5  ', N'20    ', N'2.67  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000321', N'000025', N'11.5  ', N'20    ', N'2.63  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000322', N'000025', N'11.5  ', N'20    ', N'2.63  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000323', N'000025', N'11.5  ', N'20    ', N'2.60  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000324', N'000025', N'11.5  ', N'20    ', N'2.57  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000325', N'000025', N'11.5  ', N'20    ', N'2.67  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000326', N'000026', N'11.5  ', N'25    ', N'2.63  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000327', N'000026', N'11.5  ', N'25    ', N'2.60  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000328', N'000026', N'11.5  ', N'25    ', N'2.67  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000329', N'000026', N'11.5  ', N'25    ', N'2.60  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000330', N'000026', N'11.5  ', N'25    ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000331', N'000026', N'11.5  ', N'25    ', N'2.57  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000332', N'000026', N'11.5  ', N'25    ', N'2.67  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000333', N'000026', N'11.5  ', N'25    ', N'2.63  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000334', N'000026', N'11.5  ', N'25    ', N'2.67  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000335', N'000026', N'11.5  ', N'25    ', N'2.57  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000336', N'000026', N'11.5  ', N'25    ', N'2.63  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000337', N'000026', N'11.5  ', N'25    ', N'2.67  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000338', N'000026', N'11.5  ', N'25    ', N'2.63  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000339', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000340', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000341', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000342', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000343', N'000027', N'11.5  ', N'27.5  ', N'2.60  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000344', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000345', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000346', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000347', N'000027', N'11.5  ', N'27.5  ', N'2.60  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000348', N'000027', N'11.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000349', N'000027', N'11.5  ', N'27.5  ', N'2.60  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000350', N'000027', N'11.5  ', N'27.5  ', N'2.70  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000351', N'000027', N'11.5  ', N'27.5  ', N'2.73  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000352', N'000028', N'11.5  ', N'30    ', N'2.63  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000353', N'000028', N'11.5  ', N'30    ', N'2.67  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000354', N'000028', N'11.5  ', N'30    ', N'2.67  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000355', N'000028', N'11.5  ', N'30    ', N'2.63  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000356', N'000028', N'11.5  ', N'30    ', N'2.60  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000357', N'000028', N'11.5  ', N'30    ', N'2.63  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000358', N'000028', N'11.5  ', N'30    ', N'2.60  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000359', N'000028', N'11.5  ', N'30    ', N'2.57  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000360', N'000028', N'11.5  ', N'30    ', N'2.63  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000361', N'000028', N'11.5  ', N'30    ', N'2.67  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000362', N'000028', N'11.5  ', N'30    ', N'2.63  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000363', N'000028', N'11.5  ', N'30    ', N'2.70  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000364', N'000028', N'11.5  ', N'30    ', N'2.67  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000365', N'000029', N'12.5  ', N'20    ', N'2.53  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000366', N'000029', N'12.5  ', N'20    ', N'2.57  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000367', N'000029', N'12.5  ', N'20    ', N'2.67  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000368', N'000029', N'12.5  ', N'20    ', N'2.6   ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000369', N'000029', N'12.5  ', N'20    ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000370', N'000029', N'12.5  ', N'20    ', N'2.67  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000371', N'000029', N'12.5  ', N'20    ', N'2.63  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000372', N'000029', N'12.5  ', N'20    ', N'2.57  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000373', N'000029', N'12.5  ', N'20    ', N'2.63  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000374', N'000029', N'12.5  ', N'20    ', N'2.63  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000375', N'000029', N'12.5  ', N'20    ', N'2.67  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000376', N'000029', N'12.5  ', N'20    ', N'2.70  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000377', N'000029', N'12.5  ', N'20    ', N'2.73  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000378', N'000030', N'12.5  ', N'25    ', N'2.53  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000379', N'000030', N'12.5  ', N'25    ', N'2.60  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000380', N'000030', N'12.5  ', N'25    ', N'2.60  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000381', N'000030', N'12.5  ', N'25    ', N'2.63  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000382', N'000030', N'12.5  ', N'25    ', N'2.57  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000383', N'000030', N'12.5  ', N'25    ', N'2.63  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000384', N'000030', N'12.5  ', N'25    ', N'2.67  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000385', N'000030', N'12.5  ', N'25    ', N'2.60  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000386', N'000030', N'12.5  ', N'25    ', N'2.67  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000387', N'000030', N'12.5  ', N'25    ', N'2.63  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000388', N'000030', N'12.5  ', N'25    ', N'2.67  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000389', N'000030', N'12.5  ', N'25    ', N'2.70  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000390', N'000030', N'12.5  ', N'25    ', N'2.73  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000391', N'000031', N'12.5  ', N'27.5  ', N'2.53  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000392', N'000031', N'12.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000393', N'000031', N'12.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000394', N'000031', N'12.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000395', N'000031', N'12.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000396', N'000031', N'12.5  ', N'27.5  ', N'2.67  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000397', N'000031', N'12.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000398', N'000031', N'12.5  ', N'27.5  ', N'2.60  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000399', N'000031', N'12.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000400', N'000031', N'12.5  ', N'27.5  ', N'2.67  ', CAST(N'2014-10-01' AS Date))
GO
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000401', N'000031', N'12.5  ', N'27.5  ', N'2.67  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000402', N'000031', N'12.5  ', N'27.5  ', N'2.70  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000403', N'000031', N'12.5  ', N'27.5  ', N'2.73  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000404', N'000032', N'12.5  ', N'30    ', N'2.53  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000405', N'000032', N'12.5  ', N'30    ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000406', N'000032', N'12.5  ', N'30    ', N'2.57  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000407', N'000032', N'12.5  ', N'30    ', N'2.63  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000408', N'000032', N'12.5  ', N'30    ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000409', N'000032', N'12.5  ', N'30    ', N'2.60  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000410', N'000032', N'12.5  ', N'30    ', N'2.63  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000411', N'000032', N'12.5  ', N'30    ', N'2.67  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000412', N'000032', N'12.5  ', N'30    ', N'2.63  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000413', N'000032', N'12.5  ', N'30    ', N'2.70  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000414', N'000032', N'12.5  ', N'30    ', N'2.67  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000415', N'000032', N'12.5  ', N'30    ', N'2.73  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000416', N'000032', N'12.5  ', N'30    ', N'2.77  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000417', N'000033', N'13.5  ', N'20    ', N'2.57  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000418', N'000033', N'13.5  ', N'20    ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000419', N'000033', N'13.5  ', N'20    ', N'2.67  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000420', N'000033', N'13.5  ', N'20    ', N'2.60  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000421', N'000033', N'13.5  ', N'20    ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000422', N'000033', N'13.5  ', N'20    ', N'2.67  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000423', N'000033', N'13.5  ', N'20    ', N'2.70  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000424', N'000033', N'13.5  ', N'20    ', N'2.67  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000425', N'000033', N'13.5  ', N'20    ', N'2.63  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000426', N'000033', N'13.5  ', N'20    ', N'2.67  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000427', N'000033', N'13.5  ', N'20    ', N'2.76  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000428', N'000033', N'13.5  ', N'20    ', N'2.73  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000429', N'000033', N'13.5  ', N'20    ', N'2.77  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000430', N'000034', N'13.5  ', N'25    ', N'2.57  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000431', N'000034', N'13.5  ', N'25    ', N'2.60  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000432', N'000034', N'13.5  ', N'25    ', N'2.63  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000433', N'000034', N'13.5  ', N'25    ', N'2.63  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000434', N'000034', N'13.5  ', N'25    ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000435', N'000034', N'13.5  ', N'25    ', N'2.67  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000436', N'000034', N'13.5  ', N'25    ', N'2.63  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000437', N'000034', N'13.5  ', N'25    ', N'2.63  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000438', N'000034', N'13.5  ', N'25    ', N'2.67  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000439', N'000034', N'13.5  ', N'25    ', N'2.70  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000440', N'000034', N'13.5  ', N'25    ', N'2.73  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000441', N'000034', N'13.5  ', N'25    ', N'2.87  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000442', N'000034', N'13.5  ', N'25    ', N'2.93  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000443', N'000035', N'13.5  ', N'27.5  ', N'2.57  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000444', N'000035', N'13.5  ', N'27.5  ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000445', N'000035', N'13.5  ', N'27.5  ', N'2.67  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000446', N'000035', N'13.5  ', N'27.5  ', N'2.67  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000447', N'000035', N'13.5  ', N'27.5  ', N'2.57  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000448', N'000035', N'13.5  ', N'27.5  ', N'2.70  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000449', N'000035', N'13.5  ', N'27.5  ', N'2.76  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000450', N'000035', N'13.5  ', N'27.5  ', N'2.73  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000451', N'000035', N'13.5  ', N'27.5  ', N'2.77  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000452', N'000035', N'13.5  ', N'27.5  ', N'2.77  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000453', N'000035', N'13.5  ', N'27.5  ', N'2.97  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000454', N'000035', N'13.5  ', N'27.5  ', N'3.03  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000455', N'000035', N'13.5  ', N'27.5  ', N'3.17  ', CAST(N'2015-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000456', N'000036', N'13.5  ', N'30.0  ', N'2.57  ', CAST(N'2014-01-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000457', N'000036', N'13.5  ', N'30.0  ', N'2.63  ', CAST(N'2014-02-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000458', N'000036', N'13.5  ', N'30.0  ', N'2.63  ', CAST(N'2014-03-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000459', N'000036', N'13.5  ', N'30.0  ', N'2.67  ', CAST(N'2014-04-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000460', N'000036', N'13.5  ', N'30.0  ', N'2.63  ', CAST(N'2014-05-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000461', N'000036', N'13.5  ', N'30.0  ', N'2.73  ', CAST(N'2014-06-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000462', N'000036', N'13.5  ', N'30.0  ', N'2.73  ', CAST(N'2014-07-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000463', N'000036', N'13.5  ', N'30.0  ', N'2.80  ', CAST(N'2014-08-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000464', N'000036', N'13.5  ', N'30.0  ', N'3.07  ', CAST(N'2014-09-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000465', N'000036', N'13.5  ', N'30.0  ', N'3.20  ', CAST(N'2014-10-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000466', N'000036', N'13.5  ', N'30.0  ', N'3.50  ', CAST(N'2014-11-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000467', N'000036', N'13.5  ', N'30.0  ', N'3.77  ', CAST(N'2014-12-01' AS Date))
INSERT [dbo].[小麦质量特性参数数据表] ([JYLiushuiNumber], [ShiYanNumber], [Water], [GrainTemp], [CanNumberValue], [Date]) VALUES (N'000468', N'000036', N'13.5  ', N'30.0  ', N'3.97  ', CAST(N'2015-01-01' AS Date))
SET IDENTITY_INSERT [dbo].[小麦坐标信息描述表] ON 

INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (1, N'000001', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为11.50%，温度为20℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为11.50%，温度为20℃时，面筋吸水率增长速率随时间的变化情况')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (2, N'000002', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为11.50%，温度为25℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为11.50%，温度为25℃时，面筋吸水率增长速率随时间的变化情况')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (3, N'000003', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为11.50%，温度为27.5℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为11.50%，温度为27.5℃时，面筋吸水率增长速率随时间的变化情况')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (4, N'000004', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@       实验模拟了当水分为11.50%，温度为30℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为11.50%，温度为30℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (5, N'000005', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为12.50%，温度为20℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为12.50%，温度为20℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (6, N'000006', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为12.50%，温度为25℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为12.50%，温度为25℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (7, N'000007', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@       实验模拟了当水分为12.50%，温度为27.5℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为12.50%，温度为27.5℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (8, N'000008', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为12.50%，温度为30℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为12.50%，温度为30℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (9, N'000009', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@       实验模拟了当水分为13.50%，温度为20℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为13.50%，温度为20℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (10, N'000010', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@       实验模拟了当水分为13.50%，温度为25℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为13.50%，温度为25℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (11, N'000011', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为13.50%，温度为27.5℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为13.50%，温度为27.5℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (12, N'000012', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。@      实验模拟了当水分为13.50%，温度为30℃时，面筋吸水率随时间的变化情况。', N'      面筋吸水率是小麦粉深加工的参考指标之一，是小麦储存品质的重要指标。通过面筋吸水率的测定，判断小麦的品质变化情况，为推陈储新提供科学依据。面筋吸水率的变化速率是指单位时间内面筋吸水率的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为面筋吸水率增长速率(%/d)，N为面筋吸水率(%)，T为时间(d)。@      实验模拟了当水分为13.50%，温度为30℃时，面筋吸水率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (13, N'000013', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@       实验模拟了当水分为11.5%，温度为20℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为11.5%，温度为20℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (14, N'000014', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为11.5%，温度为25℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为11.5%，温度为25℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (15, N'000015', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为11.5%，温度为27.5℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为11.5%，温度为27.5℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (16, N'000016', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@       实验模拟了当水分为11.5%，温度为30℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为11.5%，温度为30℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (17, N'000017', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为12.5%，温度为20℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为12.5%，温度为20℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (18, N'000018', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为12.5%，温度为25℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为12.5%，温度为25℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (19, N'000019', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@       实验模拟了当水分为12.5%，温度为27.5℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为12.5%，温度为27.5℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (20, N'000020', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@       实验模拟了当水分为12.5%，温度为30℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为12.5%，温度为30℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (21, N'000021', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为13.5%，温度为20℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为13.5%，温度为20℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (22, N'000022', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为13.5%，温度为25℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为13.5%，温度为25℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (23, N'000023', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@       实验模拟了当水分为13.5%，温度为27.5℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为13.5%，温度为27.5℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (24, N'000024', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。@      实验模拟了当水分为13.5%，温度为30℃时，脂肪酸值随时间的变化情况。', N'      脂肪酸值的变化是小麦常用的品质劣变指标,新收获的小麦脂肪酸值较低,一般在10～20mgKOH/100g之间,随着储藏时间的延长而增加。脂肪酸值的变化速率是指单位时间内脂肪酸值的变化情况，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为脂肪酸值增长速率(%/d)，N为脂肪酸值(%)，T为时间(d)。@      实验模拟了当水分为13.5%，温度为30℃时，脂肪酸值增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (25, N'000025', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为11.5%，温度为20℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为11.5%，温度为20℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (26, N'000026', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为11.5%，温度为25℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为11.5%，温度为25℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (27, N'000027', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为11.5%，温度为27.5℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为11.5%，温度为27.5℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (28, N'000028', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为11.5%，温度为30℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为11.5%，温度为30℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (29, N'000029', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为12.5%，温度为20℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为12.5%，温度为20℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (30, N'000030', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为12.5%，温度为25℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为12.5%，温度为25℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (31, N'000031', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为12.5%，温度为27.5℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为12.5%，温度为27.5℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (32, N'000032', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为12.5%，温度为30℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为12.5%，温度为30℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (33, N'000033', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为13.5%，温度为20℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为13.5%，温度为20℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (34, N'000034', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为13.5%，温度为25℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为13.5%，温度为25℃，小麦不完善度的增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (35, N'000035', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为13.5%，温度为27.5℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为13.5%，温度为27.5℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (36, N'000036', N'      不完善度指受到损伤但是还具有食用价值的颗粒所占的比重。@      本实验模拟了当水分为13.5%，温度为30℃，小麦不完善度随时间的变化情况。', N'      不完善度增长速率指单位时间内受到损伤但是还具有食用价值的颗粒所占的比重的变化速率，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为不完善度增长速率(%/d)，N为不完善度(%)，T为时间(d)。@      本实验模拟了当水分为13.5%，温度为30℃，小麦不完善度增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (37, N'000037', N'      虫蚀率是小麦害虫对粮食的虫蚀个数所占的比重。@      本实验模拟温度为25℃~28℃，初始虫数为4头/kg时，谷蠹对小麦的虫蚀率随时间的变化情况。', N'      虫蚀率增长速率是指单位时间内小麦害虫对粮食的虫蚀个数所占的比重的变化速度情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为虫蚀率增长速率(%/d)，N为虫蚀率(%)，T为时间(d)。@      本实验模拟温度为25℃~28℃，初始虫数为4头/kg时，谷蠹对小麦的虫蚀率的增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (38, N'000038', N'      虫蚀率是小麦害虫对粮食的虫蚀个数所占的比重。@      本实验模拟温度为25℃~28℃，初始虫数为6头/kg时，谷蠹对小麦的虫蚀率随时间的变化情况。', N'      虫蚀率增长速率是指单位时间内小麦害虫对粮食的虫蚀个数所占的比重的变化速度情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为虫蚀率增长速率(%/d)，N为虫蚀率(%)，T为时间(d)。@      本实验模拟温度为25℃~28℃，初始虫数为6头/kg时，谷蠹对小麦的虫蚀率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (39, N'000039', N'      虫蚀率是小麦害虫对粮食的虫蚀个数所占的比重。@      本实验模拟温度为25℃~28℃，初始虫数为10头/kg时，谷蠹对小麦的虫蚀率随时间的变化情况。', N'      虫蚀率增长速率是指单位时间内小麦害虫对粮食的虫蚀个数所占的比重的变化速度情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为虫蚀率增长速率(%/d)，N为虫蚀率(%)，T为时间(d)。@      本实验模拟温度为25℃~28℃，初始虫数为10头/kg时，谷蠹对小麦的虫蚀率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (40, N'000040', N'      虫蚀率是小麦害虫对粮食的虫蚀个数所占的比重。@      本实验模拟温度为25℃~28℃，初始虫数为4头/kg时，米象对小麦的虫蚀率随时间的变化情况。', N'      虫蚀率增长速率是指单位时间内小麦害虫对粮食的虫蚀个数所占的比重的变化速度情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为虫蚀率增长速率(%/d)，N为虫蚀率(%)，T为时间(d)。@      本实验模拟温度为25℃~28℃，初始虫数为4头/kg时，米象对小麦的虫蚀率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (41, N'000041', N'      虫蚀率是小麦害虫对粮食的虫蚀个数所占的比重。@      本实验模拟温度为25℃~28℃，初始虫数为6头/kg时，米象对小麦的虫蚀率随时间的变化情况。', N'      虫蚀率增长速率是指单位时间内小麦害虫对粮食的虫蚀个数所占的比重的变化速度情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为虫蚀率增长速率(%/d)，N为虫蚀率(%)，T为时间(d)。@      本实验模拟温度为25℃~28℃，初始虫数为6头/kg时，米象对小麦的虫蚀率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (42, N'000042', N'      虫蚀率是小麦害虫对粮食的虫蚀个数所占的比重。@      本实验模拟温度为25℃~28℃，初始虫数为10头/kg时，米象对小麦的虫蚀率随时间的变化情况。', N'      虫蚀率增长速率是指单位时间内小麦害虫对粮食的虫蚀个数所占的比重的变化速度情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为虫蚀率增长速率(%/d)，N为虫蚀率(%)，T为时间(d)。@      本实验模拟温度为25℃~28℃，初始虫数为10头/kg时，米象对小麦的虫蚀率增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (43, N'000043', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@       本实验模拟温度为20℃，初始虫数为0头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为20℃，初始虫数为0头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (44, N'000044', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@      本实验模拟温度为20℃，初始虫数为2头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为20℃，初始虫数为2头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (45, N'000045', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@      本实验模拟温度为20℃，初始虫数为5头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为20℃，初始虫数为5头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (46, N'000046', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@      本实验模拟温度为20℃，初始虫数为10头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为20℃，初始虫数为10头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (47, N'000047', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@      本实验模拟温度为25℃，初始虫数为0头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为25℃，初始虫数为0头/kg时，玉米象对小麦的容重的增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (48, N'000048', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@       本实验模拟温度为25℃，初始虫数为2头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为25℃，初始虫数为2头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (49, N'000049', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@      本实验模拟温度为25℃，初始虫数为5头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为25℃，初始虫数为5头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (50, N'000050', N'      容重是指粮食籽粒在单位容积内的质量，是粮食质量的综合标志，与籽粒的组织结构，化学成分，籽粒的形状大小、含水量、比重以及含杂质等均有密切关系。@       本实验模拟温度为25℃，初始虫数为10头/kg，玉米象感染随时间的变化情况。', N'      容重增长速率是指单位时间内小麦害虫对单位体积质量的小麦感染速度的增长情况的描述，V= （N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。其中V为容重增长速率(g/L*d)，N为容重(g/L)，T为时间(d)。@      本实验模拟温度为25℃，初始虫数为10头/kg时，玉米象对小麦的容重增长速率随时间的变化情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (51, N'000051', N'      玉米象是粮食储藏期过程中前期害虫，是危害粮食的主要害虫之一。@      实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，玉米象感染50kg小麦后，种群数量的变化情况。                                                                                                                                                                                                             ', N'      种群增长速率是指单位时间内新增加的个体数，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为种群增长速率(头/kg*d) ，N为种群数量（头/kg），T为时间（d）。@      实验模拟了在常规储粮条件下，当初始虫口为2头时，玉米象感染50kg小麦后，种群增长速率情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (52, N'000052', N'      谷蠹是粮食储藏期过程中前期害虫，是危害粮食的主要害虫之一。@      实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，谷蠹感染50kg小麦后，种群数量的变化情况。                                                                                                                                                                                                                 ', N'      种群增长速率是指单位时间内新增加的个体数，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为种群增长速率(头/kg*d) ， N为种群数量（头/kg），T为时间（d）。@      实验模拟了在常规储粮条件下，当初始虫口为2头时，谷蠹感染50kg小麦后，种群增长速率情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (53, N'000053', N'      米象是粮食储藏期过程中前期害虫，是危害粮食的主要害虫之一。@      实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，米象感染50kg小麦后，种群数量的变化情况。                                                                                                                                                                                                           ', N'      种群增长速率是指单位时间内新增加的个体数，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中 V为种群增长速率(头/kg*d) ，N为种群数量（头/kg），T为时间（d）。@      实验模拟了在常规储粮条件下，当初始虫口为2头时，米象感染50kg小麦后，种群增长速率情况。')
INSERT [dbo].[小麦坐标信息描述表] ([Id], [ShiYanNumber], [描述], [速率图描述]) VALUES (54, N'000054', N'      赤拟谷盗是粮食储藏期过程中后期害虫，是危害粮食的主要害虫之一。@        实验模拟了在常规储粮条件下，当初始虫口为2头/kg时，赤拟谷盗感染50kg小麦后，种群数量的变化情况。                                                                                                                                                                                                           ', N'      种群增长速率是指单位时间内新增加的个体数，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中 V为种群增长速率(头/kg*d) ，N为种群数量（头/kg），T为时间（d）。@      实验模拟了在常规储粮条件下，当初始虫口为2头时，赤拟谷盗感染50kg小麦后，种群增长速率情况。')
SET IDENTITY_INSERT [dbo].[小麦坐标信息描述表] OFF
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000001', N'000001', NULL, NULL, 2, N'18.22%', N'36', CAST(N'2015-09-12' AS Date), 0)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000002', N'000001', NULL, NULL, 7, N'18.22%', N'36', CAST(N'2015-09-14' AS Date), 48)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000003', N'000001', NULL, NULL, 84, N'18.22%', N'36', CAST(N'2015-09-17' AS Date), 72)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000004', N'000001', NULL, NULL, 216, N'18.22%', N'36', CAST(N'2015-09-20' AS Date), 144)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000005', N'000001', NULL, NULL, 199, N'18.22%', N'36', CAST(N'2015-09-21' AS Date), 168)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000006', N'000001', NULL, NULL, 252, N'18.22%', N'36', CAST(N'2015-09-21' AS Date), 174)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000007', N'000001', NULL, NULL, 267, N'18.22%', N'36', CAST(N'2015-09-22' AS Date), 180)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000008', N'000001', NULL, NULL, 317, N'18.22%', N'36', CAST(N'2015-09-22' AS Date), 186)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000009', N'000001', NULL, NULL, 305, N'18.22%', N'36', CAST(N'2015-09-22' AS Date), 192)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000010', N'000002', NULL, NULL, 3, N'18.22%', N'36', NULL, 0)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000011', N'000002', NULL, NULL, 6, N'18.22%', N'36', NULL, 48)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000012', N'000002', NULL, NULL, 82, N'18.22%', N'36', NULL, 72)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000013', N'000002', NULL, NULL, 172, N'18.22%', N'36', NULL, 144)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000014', N'000002', NULL, NULL, 244, N'18.22%', N'36', NULL, 168)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000015', N'000002', NULL, NULL, 219, N'18.22%', N'36', NULL, 174)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000016', N'000002', NULL, NULL, 295, N'18.22%', N'36', NULL, 180)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000017', N'000002', NULL, NULL, 357, N'18.22%', N'36', NULL, 186)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000018', N'000002', NULL, NULL, 380, N'18.22%', N'36', NULL, 192)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000019', N'000003', NULL, NULL, 3, N'18.22%', N'36', NULL, 0)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000020', N'000003', NULL, NULL, 8, N'18.22%', N'36', NULL, 48)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000021', N'000003', NULL, NULL, 81, N'18.22%', N'36', NULL, 72)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000022', N'000003', NULL, NULL, 163, N'18.22%', N'36', NULL, 144)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000023', N'000003', NULL, NULL, 137, N'18.22%', N'36', NULL, 168)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000024', N'000003', NULL, NULL, 293, N'18.22%', N'36', NULL, 174)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000025', N'000003', NULL, NULL, 293, N'18.22%', N'36', NULL, 180)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000026', N'000003', NULL, NULL, 293, N'18.22%', N'36', NULL, 186)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000027', N'000003', NULL, NULL, 293, N'18.22%', N'36', NULL, 192)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000028', N'000004', NULL, NULL, 2, N'18.22%', N'66', NULL, 0)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000029', N'000004', NULL, NULL, 7, N'18.22%', N'66', NULL, 48)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000030', N'000004', NULL, NULL, 259, N'18.22%', N'66', NULL, 72)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000031', N'000004', NULL, NULL, 283, N'18.22%', N'66', NULL, 144)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000032', N'000004', NULL, NULL, 575, N'18.22%', N'66', NULL, 168)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000033', N'000004', NULL, NULL, 635, N'18.22%', N'66', NULL, 174)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000034', N'000004', NULL, NULL, 712, N'18.22%', N'66', NULL, 180)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000035', N'000004', NULL, NULL, 825, N'18.22%', N'66', NULL, 186)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000036', N'000004', NULL, NULL, 809, N'18.22%', N'66', NULL, 192)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000037', N'000005', NULL, NULL, 3, N'18.22%', N'66', NULL, 0)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000038', N'000005', NULL, NULL, 9, N'18.22%', N'66', NULL, 48)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000039', N'000005', NULL, NULL, 240, N'18.22%', N'66', NULL, 72)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000040', N'000005', NULL, NULL, 335, N'18.22%', N'66', NULL, 144)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000041', N'000005', NULL, NULL, 687, N'18.22%', N'66', NULL, 168)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000042', N'000005', NULL, NULL, 540, N'18.22%', N'66', NULL, 174)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000043', N'000005', NULL, NULL, 675, N'18.22%', N'66', NULL, 180)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000044', N'000005', NULL, NULL, 742, N'18.22%', N'66', NULL, 186)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000045', N'000005', NULL, NULL, 832, N'18.22%', N'66', NULL, 192)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000046', N'000006', NULL, NULL, 3, N'18.22%', N'66', NULL, 0)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000047', N'000006', NULL, NULL, 8, N'18.22%', N'66', NULL, 48)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000048', N'000006', NULL, NULL, 251, N'18.22%', N'66', NULL, 72)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000049', N'000006', NULL, NULL, 332, N'18.22%', N'66', NULL, 144)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000050', N'000006', NULL, NULL, 620, N'18.22%', N'66', NULL, 168)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000051', N'000006', NULL, NULL, 692, N'18.22%', N'66', NULL, 174)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000052', N'000006', NULL, NULL, 692, N'18.22%', N'66', NULL, 180)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000053', N'000006', NULL, NULL, 692, N'18.22%', N'66', NULL, 186)
INSERT [dbo].[玉米孢子检测实验数据表] ([检测流水号], [实验号], [温度], [湿度], [孢子个数], [水分], [取样点], [检测日期], [消耗时间(/h)]) VALUES (N'000054', N'000006', NULL, NULL, 692, N'18.22%', N'66', NULL, 192)
INSERT [dbo].[玉米孢子检测实验信息表] ([实验号], [孢子号], [实验批次号], [起始孢子数], [终点孢子数], [孢子数变化平均速度], [开始时间], [结束时间], [描述]) VALUES (N'000001', N'000001', N'000001', 2, 305, 152, CAST(N'2015-09-12' AS Date), CAST(N'2015-09-22' AS Date), NULL)
INSERT [dbo].[玉米孢子检测实验信息表] ([实验号], [孢子号], [实验批次号], [起始孢子数], [终点孢子数], [孢子数变化平均速度], [开始时间], [结束时间], [描述]) VALUES (N'000002', N'000001', N'000002', 3, 380, 184, CAST(N'2015-09-22' AS Date), CAST(N'2015-09-30' AS Date), NULL)
INSERT [dbo].[玉米孢子检测实验信息表] ([实验号], [孢子号], [实验批次号], [起始孢子数], [终点孢子数], [孢子数变化平均速度], [开始时间], [结束时间], [描述]) VALUES (N'000003', N'000001', N'000003', 3, 293, 158, CAST(N'2015-09-02' AS Date), CAST(N'2015-09-12' AS Date), NULL)
INSERT [dbo].[玉米孢子检测实验信息表] ([实验号], [孢子号], [实验批次号], [起始孢子数], [终点孢子数], [孢子数变化平均速度], [开始时间], [结束时间], [描述]) VALUES (N'000004', N'000001', N'000004', 2, 809, 675, CAST(N'2015-09-12' AS Date), CAST(N'2015-09-22' AS Date), NULL)
INSERT [dbo].[玉米孢子检测实验信息表] ([实验号], [孢子号], [实验批次号], [起始孢子数], [终点孢子数], [孢子数变化平均速度], [开始时间], [结束时间], [描述]) VALUES (N'000005', N'000001', N'000005', 3, 832, 654, CAST(N'2015-09-22' AS Date), CAST(N'2015-09-30' AS Date), NULL)
INSERT [dbo].[玉米孢子检测实验信息表] ([实验号], [孢子号], [实验批次号], [起始孢子数], [终点孢子数], [孢子数变化平均速度], [开始时间], [结束时间], [描述]) VALUES (N'000006', N'000001', N'000006', 3, 692, 548, NULL, NULL, NULL)
INSERT [dbo].[玉米孢子信息表] ([孢子号], [孢子名]) VALUES (N'000001', N'真菌孢子')
INSERT [dbo].[玉米孢子阈值表] ([阈值id], [孢子号], [区间低值], [区间高值], [阈值表示]) VALUES (N'000001', N'000001', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[玉米孢子坐标轴描述表] ON 

INSERT [dbo].[玉米孢子坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (1, N'000001', N'不同取样点真菌孢子个数变化情况', N'不同取样点真菌孢子个数增加速率变化情况', N'时间(h)', N'孢子个数(个/ml)', N'孢子数增加速率(个/ml*h)', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      本实验是在取样点36中取得的第一组数据。通过对数据的分析我们能够知道真菌孢子个数随时间的变化而变化的情况。', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      真菌孢子个数增加速率是指单位时间内真菌孢子个数的变化情况，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为孢子个数增长速率(个/ml*h) ，N为孢子个数数量（个/ml），T为时间（h）。@      本实验是在取样点36中取得的第一组数据。通过对数据的分析我们能够知道真菌孢子个数变化速率随时间的变化而变化的情况。')
INSERT [dbo].[玉米孢子坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (2, N'000002', N'不同取样点真菌孢子个数变化情况', N'不同取样点真菌孢子个数增加速率变化情况', N'时间(h)', N'孢子个数(个/ml)', N'孢子数增加速率(个/ml*h)', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      本实验是在取样点36中取得的第二组数据。通过对数据的分析我们能够知道真菌孢子个数随时间的变化而变化的情况。', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      真菌孢子个数增加速率是指单位时间内真菌孢子个数的变化情况，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为孢子个数增长速率(个/ml*h) ，N为孢子个数数量（个/ml），T为时间（h）。@      本实验是在取样点36中取得的第二组数据。通过对数据的分析我们能够知道真菌孢子个数变化速率随时间的变化而变化的情况。')
INSERT [dbo].[玉米孢子坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (3, N'000003', N'不同取样点真菌孢子个数变化情况', N'不同取样点真菌孢子个数增加速率变化情况', N'时间(h)', N'孢子个数(个/ml)', N'孢子数增加速率(个/ml*h)', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@       本实验是在取样点36中取得的第三组数据。通过对数据的分析我们能够知道真菌孢子个数随时间的变化而变化的情况。', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      真菌孢子个数增加速率是指单位时间内真菌孢子个数的变化情况，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为孢子个数增长速率(个/ml*h) ，N为孢子个数数量（个/ml），T为时间（h）。@      本实验是在取样点36中取得的第三组数据。通过对数据的分析我们能够知道真菌孢子个数变化速率随时间的变化而变化的情况。')
INSERT [dbo].[玉米孢子坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (4, N'000004', N'不同取样点真菌孢子个数变化情况', N'不同取样点真菌孢子个数增加速率变化情况', N'时间(h)', N'孢子个数(个/ml)', N'孢子数增加速率(个/ml*h)', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      本实验是在取样点66中取得的第一组数据。通过对数据的分析我们能够知道真菌孢子个数随时间的变化而变化的情况。', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      真菌孢子个数增加速率是指单位时间内真菌孢子个数的变化情况，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为孢子个数增长速率(个/ml*h) ，N为孢子个数数量（个/ml），T为时间（h）。@      本实验是在取样点66中取得的第一组数据。通过对数据的分析我们能够知道真菌孢子个数变化速率随时间的变化而变化的情况。')
INSERT [dbo].[玉米孢子坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (5, N'000005', N'不同取样点真菌孢子个数变化情况', N'不同取样点真菌孢子个数增加速率变化情况', N'时间(h)', N'孢子个数(个/ml)', N'孢子数增加速率(个/ml*h)', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      本实验是在取样点66中取得的第二组数据。通过对数据的分析我们能够知道真菌孢子个数随时间的变化而变化的情况。', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      真菌孢子个数增加速率是指单位时间内真菌孢子个数的变化情况，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为孢子个数增长速率(个/ml*h) ，N为孢子个数数量（个/ml），T为时间（h）。@      本实验是在取样点66中取得的第二组数据。通过对数据的分析我们能够知道真菌孢子个数变化速率随时间的变化而变化的情况。')
INSERT [dbo].[玉米孢子坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (6, N'000006', N'不同取样点真菌孢子个数变化情况', N'不同取样点真菌孢子个数增加速率变化情况', N'时间(h)', N'孢子个数(个/ml)', N'孢子数增加速率(个/ml*h)', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@       本实验是在取样点66中取得的第三组数据。通过对数据的分析我们能够知道真菌孢子个数随时间的变化而变化的情况。', N'      通过观察真菌孢子的个数，可以得到玉米霉变的变化情况。通过对温度和湿度的控制，观测出随着时间的变化真菌孢子个数的变化情况。@      真菌孢子个数增加速率是指单位时间内真菌孢子个数的变化情况，V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))。 其中V为孢子个数增长速率(个/ml*h) ，N为孢子个数数量（个/ml），T为时间（h）。@      本实验是在取样点66中取得的第三组数据。通过对数据的分析我们能够知道真菌孢子个数变化速率随时间的变化而变化的情况。')
SET IDENTITY_INSERT [dbo].[玉米孢子坐标轴描述表] OFF
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000001', N'000001', 12.1, 82, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000002', N'000001', 12.2, 84, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000003', N'000001', 15.4, 85, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000004', N'000001', 17.3, 86, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000005', N'000001', 18.3, 86, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000006', N'000001', 19.1, 86, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000007', N'000001', 19.8, 86, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000008', N'000001', 20.4, 86, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000009', N'000001', 21.1, 86, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000010', N'000001', 23.3, 86, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000011', N'000001', 25.2, 85, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000012', N'000001', 26.3, 86, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000013', N'000001', 27.3, 86, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000014', N'000001', 28.2, 86, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000015', N'000001', 29.1, 86, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000016', N'000001', 29.9, 86, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000017', N'000001', 32.5, 85, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000018', N'000001', 34.6, 85, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000019', N'000001', 36.1, 85, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000020', N'000001', 37.5, 85, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000021', N'000001', 38.4, 84, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000022', N'000001', 37.1, 85, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000023', N'000002', 12.1, 84, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000024', N'000002', 12.8, 85, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000025', N'000002', 17.5, 87, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000026', N'000002', 18.8, 88, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000027', N'000002', 19.5, 88, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000028', N'000002', 20.3, 88, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000029', N'000002', 20.8, 88, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000030', N'000002', 21.4, 88, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000031', N'000002', 21.8, 87, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000032', N'000002', 25.5, 87, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000033', N'000002', 26.8, 87, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000034', N'000002', 27.5, 87, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000035', N'000002', 28.1, 86, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000036', N'000002', 28.6, 86, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000037', N'000002', 29.2, 85, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000038', N'000002', 29.6, 85, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000039', N'000002', 33.5, 84, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000040', N'000002', 34.9, 84, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000041', N'000002', 35.7, 83, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000042', N'000002', 36.6, 83, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000043', N'000002', 37.1, 83, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000044', N'000002', 33.5, 84, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000045', N'000003', 11.6, 80, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000046', N'000003', 11.6, 80, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000047', N'000003', 15.1, 82, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000048', N'000003', 16.8, 82, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000049', N'000003', 17.8, 82, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000050', N'000003', 18.6, 82, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000051', N'000003', 19.2, 82, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000052', N'000003', 19.8, 82, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000053', N'000003', 20.4, 83, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000054', N'000003', 22.6, 82, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000055', N'000003', 24.3, 82, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000056', N'000003', 25.3, 82, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000057', N'000003', 26.1, 82, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000058', N'000003', 26.8, 83, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000059', N'000003', 27.5, 83, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000060', N'000003', 28.1, 83, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000061', N'000003', 30.6, 82, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000062', N'000003', 32.5, 82, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000063', N'000003', 33.9, 82, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000064', N'000003', 35.3, 82, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000065', N'000003', 36.3, 82, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000066', N'000003', 35, 82, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000067', N'000004', 12.2, 81, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000068', N'000004', 12.2, 82, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000069', N'000004', 15.8, 83, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000070', N'000004', 17.5, 84, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000071', N'000004', 18.4, 84, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000072', N'000004', 19.1, 84, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000073', N'000004', 19.7, 84, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000074', N'000004', 20.4, 84, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000075', N'000004', 21, 85, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000076', N'000004', 23.5, 85, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000077', N'000004', 25.1, 85, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000078', N'000004', 26.1, 85, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000079', N'000004', 27, 85, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000080', N'000004', 27.6, 85, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000081', N'000004', 28.3, 85, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000082', N'000004', 29, 84, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000083', N'000004', 31.7, 84, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000084', N'000004', 33.6, 83, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000085', N'000004', 34.8, 83, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000086', N'000004', 36.1, 83, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000087', N'000004', 37, 83, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000088', N'000004', 35.3, 83, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000089', N'000005', 12.5, 72, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000090', N'000005', 12.5, 71, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000091', N'000005', 12.5, 72, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000092', N'000005', 12.6, 73, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000093', N'000005', 12.8, 74, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000094', N'000005', 12.9, 76, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000095', N'000005', 13.3, 77, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000096', N'000005', 13.9, 79, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000097', N'000005', 14.4, 79, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000098', N'000005', 14.9, 81, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000099', N'000005', 15.3, 83, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000100', N'000005', 15.9, 85, NULL, 12)
GO
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000101', N'000005', 16.6, 86, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000102', N'000005', 17.2, 88, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000103', N'000005', 17.9, 91, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000104', N'000005', 18.8, 93, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000105', N'000005', 19.7, 96, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000106', N'000005', 20.6, 94, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000107', N'000005', 22.1, 90, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000108', N'000005', 23.3, 80, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000109', N'000005', 25.1, 80, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000110', N'000005', 27.6, 69, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000111', N'000006', 10.6, 75, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000112', N'000006', 10.6, 76, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000113', N'000006', 12.8, 78, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000114', N'000006', 14.9, 78, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000115', N'000006', 16.1, 78, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000116', N'000006', 17, 78, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000117', N'000006', 17.9, 78, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000118', N'000006', 18.6, 78, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000119', N'000006', 19.3, 78, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000120', N'000006', 20.9, 78, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000121', N'000006', 22.7, 78, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000122', N'000006', 23.9, 78, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000123', N'000006', 24.9, 78, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000124', N'000006', 25.8, 77, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000125', N'000006', 26.7, 77, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000126', N'000006', 27.5, 77, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000127', N'000006', 29.5, 76, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000128', N'000006', 31.6, 76, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000129', N'000006', 33.3, 75, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000130', N'000006', 34.8, 75, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000131', N'000006', 36, 75, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000132', N'000006', 35.3, 75, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000133', N'000007', 10.8, 81, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000134', N'000007', 13.6, 84, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000135', N'000007', 18.2, 86, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000136', N'000007', 19.1, 86, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000137', N'000007', 19.6, 85, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000138', N'000007', 20.2, 85, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000139', N'000007', 20.7, 85, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000140', N'000007', 21.1, 85, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000141', N'000007', 21.5, 85, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000142', N'000007', 25.8, 85, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000143', N'000007', 26.6, 84, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000144', N'000007', 27.1, 84, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000145', N'000007', 27.5, 84, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000146', N'000007', 27.8, 84, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000147', N'000007', 28.1, 86, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000148', N'000007', 28.4, 86, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000149', N'000007', 32.8, 82, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000150', N'000007', 33.7, 82, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000151', N'000007', 34.2, 81, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000152', N'000007', 34.8, 81, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000153', N'000007', 34.9, 81, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000154', N'000007', 29.5, 82, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000155', N'000008', 10.7, 79, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000156', N'000008', 10.7, 80, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000157', N'000008', 12.7, 83, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000158', N'000008', 14.8, 84, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000159', N'000008', 16.1, 84, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000160', N'000008', 17, 84, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000161', N'000008', 17.9, 84, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000162', N'000008', 18.7, 84, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000163', N'000008', 19.5, 84, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000164', N'000008', 21, 84, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000165', N'000008', 22.9, 83, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000166', N'000008', 24.2, 83, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000167', N'000008', 25.4, 83, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000168', N'000008', 26.5, 83, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000169', N'000008', 27.6, 83, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000170', N'000008', 28.5, 82, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000171', N'000008', 30.5, 81, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000172', N'000008', 33, 81, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000173', N'000008', 34.7, 81, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000174', N'000008', 36.3, 80, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000175', N'000008', 37.5, 80, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000176', N'000008', 37.3, 81, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000177', N'000009', 10.6, 82, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000178', N'000009', 10.7, 82, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000179', N'000009', 14.3, 83, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000180', N'000009', 16.3, 83, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000181', N'000009', 17.4, 84, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000182', N'000009', 18.2, 83, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000183', N'000009', 19, 83, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000184', N'000009', 19.6, 83, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000185', N'000009', 20.3, 84, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000186', N'000009', 22.6, 83, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000187', N'000009', 24.3, 83, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000188', N'000009', 25.3, 83, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000189', N'000009', 26.3, 83, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000190', N'000009', 27, 83, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000191', N'000009', 27.8, 83, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000192', N'000009', 28.5, 82, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000193', N'000009', 31.1, 82, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000194', N'000009', 33.2, 81, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000195', N'000009', 34.5, 81, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000196', N'000009', 35.8, 80, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000197', N'000009', 36.6, 80, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000198', N'000009', 35, 80, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000199', N'000010', 10.9, 79, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000200', N'000010', 10.8, 81, NULL, 2)
GO
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000201', N'000010', 10.9, 84, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000202', N'000010', 11.1, 84, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000203', N'000010', 11.6, 84, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000204', N'000010', 12, 84, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000205', N'000010', 13, 84, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000206', N'000010', 14, 84, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000207', N'000010', 15, 84, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000208', N'000010', 16.1, 84, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000209', N'000010', 17.3, 84, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000210', N'000010', 18.4, 84, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000211', N'000010', 19.8, 84, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000212', N'000010', 21.5, 84, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000213', N'000010', 23.3, 83, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000214', N'000010', 25.1, 83, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000215', N'000010', 27.4, 83, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000216', N'000010', 29.7, 82, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000217', N'000010', 32.2, 82, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000218', N'000010', 35.1, 81, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000219', N'000010', 37.5, 80, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000220', N'000010', 39.3, 80, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000221', N'000011', 9.5, 76, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000222', N'000011', 9.5, 77, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000223', N'000011', 12.1, 78, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000224', N'000011', 14.3, 79, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000225', N'000011', 15.6, 79, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000226', N'000011', 16.6, 79, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000227', N'000011', 17.4, 79, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000228', N'000011', 18.1, 80, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000229', N'000011', 18.9, 80, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000230', N'000011', 20.4, 80, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000231', N'000011', 21.9, 80, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000232', N'000011', 22.8, 80, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000233', N'000011', 23.5, 80, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000234', N'000011', 24.3, 80, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000235', N'000011', 24.9, 80, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000236', N'000011', 25.5, 79, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000237', N'000011', 27.3, 78, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000238', N'000011', 29.1, 78, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000239', N'000011', 30.3, 77, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000240', N'000011', 31.5, 77, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000241', N'000011', 32.4, 77, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000242', N'000011', 31.7, 76, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000243', N'000012', 9.3, 78, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000244', N'000012', 9.8, 79, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000245', N'000012', 15.2, 82, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000246', N'000012', 16.9, 82, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000247', N'000012', 17.8, 82, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000248', N'000012', 18.5, 82, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000249', N'000012', 19.1, 82, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000250', N'000012', 19.7, 82, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000251', N'000012', 20.2, 82, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000252', N'000012', 23.2, 82, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000253', N'000012', 24.5, 82, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000254', N'000012', 25.1, 81, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000255', N'000012', 25.6, 81, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000256', N'000012', 26.1, 81, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000257', N'000012', 26.5, 81, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000258', N'000012', 26.9, 80, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000259', N'000012', 30.1, 79, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000260', N'000012', 31.5, 79, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000261', N'000012', 32.2, 78, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000262', N'000012', 33, 78, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000263', N'000012', 33.5, 77, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000264', N'000012', 30, 78, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000265', N'000013', 9.4, 75, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000266', N'000013', 9.3, 75, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000267', N'000013', 11.5, 77, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000268', N'000013', 13.8, 78, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000269', N'000013', 15.2, 78, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000270', N'000013', 16.2, 79, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000271', N'000013', 17.1, 79, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000272', N'000013', 17.8, 79, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000273', N'000013', 18.5, 79, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000274', N'000013', 19.8, 79, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000275', N'000013', 21.5, 79, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000276', N'000013', 22.5, 78, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000277', N'000013', 23.4, 78, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000278', N'000013', 24.1, 78, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000279', N'000013', 24.7, 78, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000280', N'000013', 25.3, 77, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000281', N'000013', 26.7, 77, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000282', N'000013', 28.5, 76, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000283', N'000013', 29.8, 75, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000284', N'000013', 31, 75, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000285', N'000013', 31.9, 75, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000286', N'000013', 31.3, 75, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000287', N'000014', 9, 75, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000288', N'000014', 9, 75, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000289', N'000014', 11.9, 77, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000290', N'000014', 14.1, 77, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000291', N'000014', 15.5, 78, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000292', N'000014', 16.4, 78, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000293', N'000014', 17.2, 78, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000294', N'000014', 18, 79, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000295', N'000014', 18.6, 79, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000296', N'000014', 20.2, 79, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000297', N'000014', 22, 79, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000298', N'000014', 22.9, 79, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000299', N'000014', 23.6, 79, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000300', N'000014', 24.3, 79, NULL, 14)
GO
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000301', N'000014', 24.8, 78, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000302', N'000014', 25.3, 78, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000303', N'000014', 27.1, 77, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000304', N'000014', 28.8, 77, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000305', N'000014', 29.9, 76, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000306', N'000014', 31, 76, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000307', N'000014', 31.8, 76, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000308', N'000014', 30.9, 75, NULL, 22)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000309', N'000015', 9.2, 71, NULL, 1)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000310', N'000015', 9.2, 77, NULL, 2)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000311', N'000015', 9.4, 79, NULL, 3)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000312', N'000015', 9.8, 79, NULL, 4)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000313', N'000015', 10.5, 80, NULL, 5)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000314', N'000015', 11.2, 80, NULL, 6)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000315', N'000015', 12.1, 80, NULL, 7)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000316', N'000015', 13.1, 80, NULL, 8)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000317', N'000015', 14.1, 80, NULL, 9)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000318', N'000015', 15.1, 80, NULL, 10)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000319', N'000015', 16.1, 80, NULL, 11)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000320', N'000015', 17.1, 80, NULL, 12)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000321', N'000015', 18.2, 79, NULL, 13)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000322', N'000015', 19.4, 79, NULL, 14)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000323', N'000015', 20.7, 79, NULL, 15)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000324', N'000015', 21.8, 78, NULL, 16)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000325', N'000015', 23.2, 78, NULL, 17)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000326', N'000015', 24.5, 77, NULL, 18)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000327', N'000015', 26.1, 77, NULL, 19)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000328', N'000015', 28, 76, NULL, 20)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000329', N'000015', 29.6, 76, NULL, 21)
INSERT [dbo].[玉米加热破坏实验数据表] ([检测流水号], [实验号], [温度], [破坏率], [检测日期], [检测时间（/day）]) VALUES (N'000330', N'000015', 30.8, 75, NULL, 22)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000001', 1, 1)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000002', 1, 2)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000003', 1, 3)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000004', 1, 4)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000005', 1, 5)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000006', 2, 1)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000007', 2, 2)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000008', 2, 3)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000009', 2, 4)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000010', 2, 5)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000011', 3, 1)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000012', 3, 2)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000013', 3, 3)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000014', 3, 4)
INSERT [dbo].[玉米加热破坏实验信息表] ([实验号], [层数号], [实验地点号]) VALUES (N'000015', 3, 5)
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (1, N'000001', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点一的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点一的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第一层在取样点一的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第一层在取样点一的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (2, N'000002', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点二的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点二的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第一层在取样点二的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第一层在取样点二的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (3, N'000003', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点三的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点三的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第一层在取样点三的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第一层在取样点三的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (4, N'000004', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点四的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点四的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第一层在取样点四的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第一层在取样点四的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (5, N'000005', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点五的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第一层在取样点五的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第一层在取样点五的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第一层在取样点五的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (6, N'000006', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点一的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点一的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第二层在取样点一的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第二层在取样点一的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (7, N'000007', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点二的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点二的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第二层在取样点二的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第二层在取样点二的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (8, N'000008', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点三的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点三的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第二层在取样点三的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第二层在取样点三的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (9, N'000009', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点四的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点四的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第二层在取样点四的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第二层在取样点四的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (10, N'000010', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点五的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第二层在取样点五的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第二层在取样点五的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第二层在取样点五的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (11, N'000011', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点一的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点一的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第三层在取样点一的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第三层在取样点一的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (12, N'000012', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点二的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点二的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第三层在取样点二的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第三层在取样点二的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (13, N'000013', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点三的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点三的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第三层在取样点三的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第三层在取样点三的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (14, N'000014', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点四的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点四的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第三层在取样点四的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第三层在取样点四的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (15, N'000015', N'玉米加热破坏实验温度变化情况', N'玉米加热实验破坏率变化情况', N'玉米加热实验温度变化速率变化情况', N'玉米加热实验破速率变化速率变化情况', N'时间(day)', N'温度变化速率(℃/d)', N'温度(℃)', N'破坏率变化速率(%/d)', N'破坏率(%)', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点五的温度变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@      本模型是第三层在取样点五的破坏率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       温度速率是单位时间内温度的变化情况，可以有效的反应温度的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为温度速度增加速率（℃/d）,N为温度(℃),T为时间(d)。@      本模型是第三层在取样点五的温度速率变化情况。', N'      研究高水分玉米安全储存的问题，通过恒温加热试验，采用环流加热装置对高水分玉米进行恒温加热。@       破坏率速率是单位时间内破坏率的变化情况，可以有效的反应破坏率的变化速率情况。V=（N&t-N&t&-&1)/(T&t-T&(&t&-&1&))，其中V为破坏率速度增加速率（%/d）,N为破坏率(%),T为时间(d)。@      本模型是第三层在取样点五的破坏率速率变化情况。')
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米加热破坏实验坐标轴描述表] ([id], [实验号], [温度标题], [破坏率标题], [温度标题速率], [破坏率标题速率], [x轴], [y轴温度速率], [y轴温度], [y轴破坏率速率], [y轴破坏率], [温度描述], [破坏率描述], [温度速率图描述], [破坏率速率描述]) VALUES (17, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验批次表] ([实验批次号], [实验品种名], [产地], [购入时间], [数量]) VALUES (N'000001', NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000001', N'000001', 11.8, NULL, NULL, 730.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000002', N'000001', 13.08, NULL, NULL, 722.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000003', N'000001', 13.87, NULL, NULL, 718, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000004', N'000001', 15.18, NULL, NULL, 705, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000005', N'000001', 16.05, NULL, NULL, 692, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000006', N'000002', 11.8, NULL, NULL, 729.58, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000007', N'000002', 13.08, NULL, NULL, 725.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000008', N'000002', 13.87, NULL, NULL, 714.84, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000009', N'000002', 15.18, NULL, NULL, 704.01, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000010', N'000002', 16.05, NULL, NULL, 696.55, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000011', N'000003', 11.8, NULL, NULL, 27.05, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000012', N'000003', 13.08, NULL, NULL, 26.38, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000013', N'000003', 13.87, NULL, NULL, 23.78, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000014', N'000003', 15.18, NULL, NULL, 29.21, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000015', N'000003', 16.05, NULL, NULL, 25.3, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000016', N'000004', 11.8, NULL, NULL, 28.8, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000017', N'000004', 13.08, NULL, NULL, 27.73, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000018', N'000004', 13.87, NULL, NULL, 30.75, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000019', N'000004', 15.18, NULL, NULL, 27.93, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000020', N'000004', 16.05, NULL, NULL, 27.83, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000021', N'000005', NULL, 4, NULL, 750, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000022', N'000005', NULL, 6, NULL, 746.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000023', N'000005', NULL, 8, NULL, 747, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000024', N'000005', NULL, 10, NULL, 750.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000025', N'000005', NULL, 15, NULL, 741.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000026', N'000006', NULL, 4, NULL, 749.48, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000027', N'000006', NULL, 6, NULL, 744.76, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000028', N'000006', NULL, 8, NULL, 744.28, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000029', N'000006', NULL, 10, NULL, 745.68, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000030', N'000006', NULL, 15, NULL, 731.44, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000031', N'000007', NULL, 4, NULL, 26.8, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000032', N'000007', NULL, 6, NULL, 24.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000033', N'000007', NULL, 8, NULL, 26.59, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000034', N'000007', NULL, 10, NULL, 28.41, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000035', N'000007', NULL, 15, NULL, 26.4, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000036', N'000008', NULL, 4, NULL, 25.52, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000037', N'000008', NULL, 6, NULL, 23.17, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000038', N'000008', NULL, 8, NULL, 29.38, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000039', N'000008', NULL, 10, NULL, 25.08, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000040', N'000008', NULL, 15, NULL, 28.42, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000041', N'000009', NULL, NULL, 0, 757.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000042', N'000009', NULL, NULL, 0.5, 754.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000043', N'000009', NULL, NULL, 1, 752, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000044', N'000009', NULL, NULL, 1.5, 740, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000045', N'000009', NULL, NULL, 2, 739, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000046', N'000010', NULL, NULL, 0, 758.44, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000047', N'000010', NULL, NULL, 0.5, 755.72, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000048', N'000010', NULL, NULL, 1, 750.77, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000049', N'000010', NULL, NULL, 1.5, 745.01, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000050', N'000010', NULL, NULL, 2, 741.53, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000051', N'000011', NULL, NULL, 0, 24.19, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000052', N'000011', NULL, NULL, 0.5, 23.83, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000053', N'000011', NULL, NULL, 1, 23.47, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000054', N'000011', NULL, NULL, 1.5, 23.18, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000055', N'000011', NULL, NULL, 2, 24.05, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000056', N'000012', NULL, NULL, 0, 22.74, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000057', N'000012', NULL, NULL, 0.5, 23.25, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000058', N'000012', NULL, NULL, 1, 20.45, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000059', N'000012', NULL, NULL, 1.5, 25.77, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000060', N'000012', NULL, NULL, 2, 27.12, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000061', N'000013', 11.76, NULL, NULL, 724.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000062', N'000013', 12.66, NULL, NULL, 714.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000063', N'000013', 13.71, NULL, NULL, 712.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000064', N'000013', 14.76, NULL, NULL, 707, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000065', N'000013', 16.33, NULL, NULL, 687.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000066', N'000014', 11.76, NULL, NULL, 727.12, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000067', N'000014', 12.66, NULL, NULL, 716.6, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000068', N'000014', 13.71, NULL, NULL, 713.49, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000069', N'000014', 14.76, NULL, NULL, 714.71, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000070', N'000014', 16.33, NULL, NULL, 694.06, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000071', N'000015', 11.76, NULL, NULL, 23.04, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000072', N'000015', 12.66, NULL, NULL, 22.59, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000073', N'000015', 13.71, NULL, NULL, 24.02, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000074', N'000015', 14.76, NULL, NULL, 26.27, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000075', N'000015', 16.33, NULL, NULL, 27.3, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000076', N'000016', 11.76, NULL, NULL, 25.02, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000077', N'000016', 12.66, NULL, NULL, 26.55, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000078', N'000016', 13.71, NULL, NULL, 25.71, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000079', N'000016', 14.76, NULL, NULL, 30.5, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000080', N'000016', 16.33, NULL, NULL, 30.35, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000081', N'000017', NULL, 4, NULL, 735, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000082', N'000017', NULL, 6, NULL, 729, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000083', N'000017', NULL, 8, NULL, 732, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000084', N'000017', NULL, 10, NULL, 725.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000085', N'000017', NULL, 15, NULL, 722.7, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000086', N'000018', NULL, 4, NULL, 700.03, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000087', N'000018', NULL, 6, NULL, 697.61, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000088', N'000018', NULL, 8, NULL, 697.45, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000089', N'000018', NULL, 10, NULL, 693.88, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000090', N'000018', NULL, 15, NULL, 694, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000100', N'000019', NULL, 4, NULL, 25.6, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000101', N'000019', NULL, 6, NULL, 27.11, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000102', N'000019', NULL, 8, NULL, 29.54, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000103', N'000019', NULL, 10, NULL, 28.58, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000104', N'000019', NULL, 15, NULL, 26.75, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000105', N'000020', NULL, 4, NULL, 27.4, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000106', N'000020', NULL, 6, NULL, 27.36, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000107', N'000020', NULL, 8, NULL, 33.9, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000108', N'000020', NULL, 10, NULL, 32.03, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000109', N'000020', NULL, 15, NULL, 31.53, NULL)
GO
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000110', N'000021', NULL, NULL, 0, 729.7, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000111', N'000021', NULL, NULL, 0.5, 723.7, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000112', N'000021', NULL, NULL, 1, 721.7, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000113', N'000021', NULL, NULL, 1.5, 721.7, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000114', N'000021', NULL, NULL, 2, 720.3, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000115', N'000022', NULL, NULL, 0, 695.85, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000116', N'000022', NULL, NULL, 0.5, 694.96, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000117', N'000022', NULL, NULL, 1, 689.27, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000118', N'000022', NULL, NULL, 1.5, 691.55, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000119', N'000022', NULL, NULL, 2, 686.38, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000120', N'000023', NULL, NULL, 0, 24.16, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000121', N'000023', NULL, NULL, 0.5, 26.8, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000122', N'000023', NULL, NULL, 1, 27.78, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000123', N'000023', NULL, NULL, 1.5, 25.69, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000124', N'000023', NULL, NULL, 2, 26.79, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000125', N'000024', NULL, NULL, 0, 26.73, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000126', N'000024', NULL, NULL, 0.5, 28.12, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000127', N'000024', NULL, NULL, 1, 29.59, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000128', N'000024', NULL, NULL, 1.5, 30.05, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000129', N'000024', NULL, NULL, 2, 26.48, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000130', N'000025', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000131', N'000025', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000132', N'000025', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000133', N'000025', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000134', N'000025', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000135', N'000026', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000136', N'000026', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000137', N'000026', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000138', N'000026', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000139', N'000026', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000140', N'000027', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000141', N'000027', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000142', N'000027', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000143', N'000027', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000144', N'000027', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000145', N'000028', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000146', N'000028', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000147', N'000028', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000148', N'000028', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000149', N'000028', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000150', N'000029', NULL, 4, NULL, 708.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000151', N'000029', NULL, 6, NULL, 705, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000152', N'000029', NULL, 8, NULL, 707.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000153', N'000029', NULL, 10, NULL, 712, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000154', N'000029', NULL, 15, NULL, 703.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000155', N'000030', NULL, 4, NULL, 695.46, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000156', N'000030', NULL, 6, NULL, 689.49, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000157', N'000030', NULL, 8, NULL, 695.62, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000158', N'000030', NULL, 10, NULL, 698.11, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000159', N'000030', NULL, 15, NULL, 690.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000160', N'000031', NULL, 4, NULL, 27.05, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000161', N'000031', NULL, 6, NULL, 24.19, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000162', N'000031', NULL, 8, NULL, 25.04, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000163', N'000031', NULL, 10, NULL, 23.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000164', N'000031', NULL, 15, NULL, 27.7, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000165', N'000032', NULL, 4, NULL, 29.68, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000166', N'000032', NULL, 6, NULL, 27.5, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000167', N'000032', NULL, 8, NULL, 26.55, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000168', N'000032', NULL, 10, NULL, 26.48, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000169', N'000032', NULL, 15, NULL, 27.52, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000170', N'000033', NULL, NULL, 0, 707, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000171', N'000033', NULL, NULL, 0.5, 703.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000172', N'000033', NULL, NULL, 1, 700.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000173', N'000033', NULL, NULL, 1.5, 690.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000174', N'000033', NULL, NULL, 2, 688.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000175', N'000034', NULL, NULL, 0, 695.53, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000176', N'000034', NULL, NULL, 0.5, 689.79, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000177', N'000034', NULL, NULL, 1, 684.86, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000178', N'000034', NULL, NULL, 1.5, 679.19, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000179', N'000034', NULL, NULL, 2, 678.2, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000180', N'000035', NULL, NULL, 0, 26.51, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000181', N'000035', NULL, NULL, 0.5, 26.13, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000182', N'000035', NULL, NULL, 1, 27.54, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000183', N'000035', NULL, NULL, 1.5, 28.28, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000184', N'000035', NULL, NULL, 2, 28.97, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000185', N'000036', NULL, NULL, 0, 28.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000186', N'000036', NULL, NULL, 0.5, 29.08, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000187', N'000036', NULL, NULL, 1, 29.17, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000188', N'000036', NULL, NULL, 1.5, 29.69, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000189', N'000036', NULL, NULL, 2, 29.8, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000190', N'000037', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000191', N'000037', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000192', N'000037', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000193', N'000037', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000194', N'000037', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000195', N'000038', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000196', N'000038', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000197', N'000038', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000198', N'000038', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000199', N'000038', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000200', N'000039', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000201', N'000039', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000202', N'000039', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000203', N'000039', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000204', N'000039', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000205', N'000040', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000206', N'000040', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000207', N'000040', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000208', N'000040', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000209', N'000040', 16.05, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000210', N'000041', NULL, 4, NULL, 748.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000211', N'000041', NULL, 6, NULL, 748, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000212', N'000041', NULL, 8, NULL, 747, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000213', N'000041', NULL, 10, NULL, 754.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000214', N'000041', NULL, 15, NULL, 747, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000215', N'000042', NULL, 4, NULL, 745.73, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000216', N'000042', NULL, 6, NULL, 742.77, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000217', N'000042', NULL, 8, NULL, 743.05, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000218', N'000042', NULL, 10, NULL, 745.47, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000219', N'000042', NULL, 15, NULL, 743.38, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000220', N'000043', NULL, 4, NULL, 26.59, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000221', N'000043', NULL, 6, NULL, 28.08, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000222', N'000043', NULL, 8, NULL, 25.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000223', N'000043', NULL, 10, NULL, 27.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000224', N'000043', NULL, 15, NULL, 25, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000225', N'000044', NULL, 4, NULL, 28.89, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000226', N'000044', NULL, 6, NULL, 33.12, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000227', N'000044', NULL, 8, NULL, 26.17, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000228', N'000044', NULL, 10, NULL, 30.72, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000229', N'000044', NULL, 15, NULL, 30.89, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000230', N'000045', NULL, NULL, 0, 744.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000231', N'000045', NULL, NULL, 0.5, 739.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000232', N'000045', NULL, NULL, 1, 733.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000233', N'000045', NULL, NULL, 1.5, 731.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000234', N'000045', NULL, NULL, 2, 725, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000235', N'000046', NULL, NULL, 0, 746.4, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000236', N'000046', NULL, NULL, 0.5, 738.97, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000237', N'000046', NULL, NULL, 1, 734.6, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000238', N'000046', NULL, NULL, 1.5, 734.91, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000239', N'000046', NULL, NULL, 2, 734.61, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000240', N'000047', NULL, NULL, 0, 28.17, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000241', N'000047', NULL, NULL, 0.5, 29.86, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000242', N'000047', NULL, NULL, 1, 29.37, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000243', N'000047', NULL, NULL, 1.5, 29.64, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000244', N'000047', NULL, NULL, 2, 27.72, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000245', N'000048', NULL, NULL, 0, 29.35, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000246', N'000048', NULL, NULL, 0.5, 27.42, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000247', N'000048', NULL, NULL, 1, 32.08, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000248', N'000048', NULL, NULL, 1.5, 27.63, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000249', N'000048', NULL, NULL, 2, 28.06, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000250', N'000049', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000251', N'000049', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000252', N'000049', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000253', N'000049', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000254', N'000049', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000255', N'000050', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000256', N'000050', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000257', N'000050', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000258', N'000050', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000259', N'000050', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000260', N'000051', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000261', N'000051', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000262', N'000051', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000263', N'000051', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000264', N'000051', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000265', N'000052', 11.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000266', N'000052', 13.08, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000267', N'000052', 13.87, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000268', N'000052', 15.18, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000269', N'000052', 16.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000270', N'000053', NULL, 4, NULL, 734, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000271', N'000053', NULL, 6, NULL, 736.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000272', N'000053', NULL, 8, NULL, 736, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000273', N'000053', NULL, 10, NULL, 739.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000274', N'000053', NULL, 15, NULL, 733.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000275', N'000054', NULL, 4, NULL, 720.76, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000276', N'000054', NULL, 6, NULL, 721.88, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000277', N'000054', NULL, 8, NULL, 721.09, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000278', N'000054', NULL, 10, NULL, 726.3, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000279', N'000054', NULL, 15, NULL, 716.23, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000280', N'000055', NULL, 4, NULL, 29.19, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000281', N'000055', NULL, 6, NULL, 29.58, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000282', N'000055', NULL, 8, NULL, 27.59, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000283', N'000055', NULL, 10, NULL, 26.29, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000284', N'000055', NULL, 15, NULL, 29.06, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000285', N'000056', NULL, 4, NULL, 27.4, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000286', N'000056', NULL, 6, NULL, 32.23, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000287', N'000056', NULL, 8, NULL, 28.18, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000288', N'000056', NULL, 10, NULL, 27.76, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000289', N'000056', NULL, 15, NULL, 27.41, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000290', N'000057', NULL, NULL, 0, 737.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000291', N'000057', NULL, NULL, 0.5, 731, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000292', N'000057', NULL, NULL, 1, 732.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000293', N'000057', NULL, NULL, 1.5, 729.33, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000294', N'000057', NULL, NULL, 2, 724.67, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000295', N'000058', NULL, NULL, 0, 727.45, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000296', N'000058', NULL, NULL, 0.5, 719.75, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000297', N'000058', NULL, NULL, 1, 719.92, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000298', N'000058', NULL, NULL, 1.5, 715.87, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000299', N'000058', NULL, NULL, 2, 709.43, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000300', N'000059', NULL, NULL, 0, 27.56, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000301', N'000059', NULL, NULL, 0.5, 28.01, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000302', N'000059', NULL, NULL, 1, 27.12, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000303', N'000059', NULL, NULL, 1.5, 28.52, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000304', N'000059', NULL, NULL, 2, 30.75, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000305', N'000060', NULL, NULL, 0, 28.15, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000306', N'000060', NULL, NULL, 0.5, 30.03, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000307', N'000060', NULL, NULL, 1, 30.58, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000308', N'000060', NULL, NULL, 1.5, 29.06, NULL)
INSERT [dbo].[玉米特性参数实验数据表] ([检测流水号], [实验号], [水分], [破碎率], [杂质含量], [参数值], [检测日期]) VALUES (N'000309', N'000060', NULL, NULL, 2, 32.09, NULL)
GO
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000001', N'000001', 730.33, 692, CAST(N'2015-01-01' AS Date), CAST(N'2015-02-01' AS Date), N'000001', N'国标法')
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000002', N'000002', 729.58, 696.55, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000003', N'000003', 27.5, 25.3, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000004', N'000004', 28.8, 27.83, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000005', N'000001', 750, 741.33, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000006', N'000002', 749.48, 731.44, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000007', N'000003', 26.8, 26.4, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000008', N'000004', 25.52, 28.42, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000009', N'000001', 757.67, 739, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000010', N'000002', 758.44, 741.53, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000011', N'000003', 24.19, 24.05, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000012', N'000004', 22.74, 27.12, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000013', N'000001', 724.33, 687.67, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000014', N'000002', 727.12, 694.06, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000015', N'000003', 23.04, 27.3, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000016', N'000004', 25.02, 30.35, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000017', N'000001', 735, 722.7, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000018', N'000002', 700.03, 694, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000019', N'000003', 25.6, 26.75, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000020', N'000004', 27.4, 31.53, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000021', N'000001', 729.7, 720.3, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000022', N'000002', 695.85, 686.38, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000023', N'000003', 24.16, 26.79, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000024', N'000004', 26.73, 26.48, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000025', N'000001', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000026', N'000002', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000027', N'000003', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000028', N'000004', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000029', N'000001', 708.67, 703.33, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000030', N'000002', 695.46, 690.67, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000031', N'000003', 27.05, 27.7, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000032', N'000004', 29.68, 27.52, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000033', N'000001', 707, 688.67, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000034', N'000002', 695.53, 678.2, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000035', N'000003', 26.51, 28.97, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000036', N'000004', 28.67, 29.8, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000037', N'000001', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000038', N'000002', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000039', N'000003', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000040', N'000004', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000041', N'000001', 748.33, 747, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000042', N'000002', 745.73, 743.38, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000043', N'000003', 26.59, 25, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000044', N'000004', 28.89, 30.89, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000045', N'000001', 744.33, 725, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000046', N'000002', 746.4, 734.61, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000047', N'000003', 28.17, 27.72, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000048', N'000004', 29.35, 28.06, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000049', N'000001', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000050', N'000002', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000051', N'000003', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000052', N'000004', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000053', N'000001', 734, 733.33, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000054', N'000002', 720.76, 716.23, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000055', N'000003', 29.19, 29.06, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000056', N'000004', 27.4, 27.41, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000057', N'000001', 737.67, 724.67, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000058', N'000002', 727.45, 709.43, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000059', N'000003', 27.56, 30.75, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数实验信息表] ([实验号], [参数号], [起始参数值], [终点参数值], [开始时间], [结束时间], [实验批次号], [描述]) VALUES (N'000060', N'000004', 28.15, 32.09, NULL, NULL, NULL, NULL)
INSERT [dbo].[玉米特性参数信息表] ([参数号], [参数名], [参数类型]) VALUES (N'000001', N'容重(国标法)', N'g/L')
INSERT [dbo].[玉米特性参数信息表] ([参数号], [参数名], [参数类型]) VALUES (N'000002', N'容重(美标法)', N'g/L')
INSERT [dbo].[玉米特性参数信息表] ([参数号], [参数名], [参数类型]) VALUES (N'000003', N'静止角(趋势线法)', N'度')
INSERT [dbo].[玉米特性参数信息表] ([参数号], [参数名], [参数类型]) VALUES (N'000004', N'静止角(两点法)', N'度')
SET IDENTITY_INSERT [dbo].[玉米特性参数坐标轴描述表] ON 

INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (1, N'000001', N'郑单958（山东）不同水分含量容重变化情况', N'郑单958（山东）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了郑单958（山东）在国际法中不同水分含量容重的变化情况。
', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了郑单958（山东）在国际法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (2, N'000002', N'郑单958（山东）不同水分含量容重变化情况', N'郑单958（山东）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了郑单958（山东）在美标法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了郑单958（山东）在美标法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (3, N'000003', N'郑单958（山东）不同水分含量静止角变化情况', N'郑单958（山东）不同水分含量静止角变化速率变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了郑单958（山东）在趋势线法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了郑单958（山东）在趋势线法
中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (4, N'000004', N'郑单958（山东）不同水分含量静止角变化情况', N'郑单958（山东）不同水分含量静止角变化速率变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了郑单958（山东）在两点法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了郑单958（山东）在两点法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (5, N'000005', N'郑单958（山东）不同破碎率容重变化情况', N'郑单958（山东）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了郑单958（山东）在国际法中不同破碎率容重变化情况。
', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了郑单958（山东）在国际法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (6, N'000006', N'郑单958（山东）不同破碎率容重变化情况', N'郑单958（山东）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了郑单958（山东）在美标法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了郑单958（山东）在美标法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (7, N'000007', N'郑单958（山东）不同破碎率静止角变化情况', N'郑单958（山东）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了郑单958（山东）在趋势线法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@      静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了郑单958（山东）在趋势线法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (8, N'000008', N'郑单958（山东）不同破碎率静止角变化情况', N'郑单958（山东）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了郑单958（山东）在两点法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了郑单958（山东）在两点法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (9, N'000009', N'郑单958（山东）不同杂质含量容重变化情况', N'郑单958（山东）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了郑单958（山东）在国标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了郑单958（山东）在国标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (10, N'000010', N'郑单958（山东）不同杂质含量容重变化情况', N'郑单958（山东）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了郑单958（山东）在美标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了郑单958（山东）在美标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (11, N'000011', N'郑单958（山东）不同杂质含量静止角变化情况', N'郑单958（山东）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了郑单958（山东）在趋势线法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了郑单958（山东）在趋势线法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (12, N'000012', N'郑单958（山东）不同杂质含量静止角变化情况', N'郑单958（山东）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了郑单958（山东）在两点法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了郑单958（山东）在两点法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (13, N'000013', N'郑单958（河北）不同水分含量容重变化情况', N'郑单958（河北）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了郑单958（河北）在国际法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了郑单958（河北）在国际法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (14, N'000014', N'郑单958（河北）不同水分含量容重变化情况', N'郑单958（河北）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了郑单958（河北）在美标法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了郑单958（河北）在美标法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (15, N'000015', N'郑单958（河北）不同水分含量静止角变化情况', N'郑单958（河北）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了郑单958（河北）在趋势线法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了郑单958（河北）在趋势线法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (16, N'000016', N'郑单958（河北）不同水分含量静止角变化情况', N'郑单958（河北）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了郑单958（河北）在两点法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了郑单958（河北）在两点法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (17, N'000017', N'郑单958（河北）不同破碎率容重变化情况', N'郑单958（河北）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了郑单958（河北）在国际法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了郑单958（河北）在国际法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (18, N'000018', N'郑单958（河北）不同破碎率容重变化情况', N'郑单958（河北）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了郑单958（河北）在美标法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了郑单958（河北）在美标法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (19, N'000019', N'郑单958（河北）不同破碎率静止角变化情况', N'郑单958（河北）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了郑单958（河北）在趋势线法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了郑单958（河北）在趋势线法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (20, N'000020', N'郑单958（河北）不同破碎率静止角变化情况', N'郑单958（河北）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了郑单958（河北）在两点法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了郑单958（河北）在两点法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (21, N'000021', N'郑单958（河北）不同杂质含量容重变化情况', N'郑单958（河北）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了郑单958（河北）在国标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了郑单958（河北）在国标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (22, N'000022', N'郑单958（河北）不同杂质含量容重变化情况', N'郑单958（河北）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了郑单958（河北）在美标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了郑单958（河北）在美标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (23, N'000023', N'郑单958（河北）不同杂质含量静止角变化情况', N'郑单958（河北）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了郑单958（河北）在趋势线法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了郑单958（河北）在趋势线法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (24, N'000024', N'郑单958（河北）不同杂质含量静止角变化情况', N'郑单958（河北）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了郑单958（河北）在两点法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了郑单958（河北）在两点法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (25, N'000025', N'银河七（吉林）不同水分含量容重变化情况', N'银河七（吉林）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了银河七（吉林）在国际法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了银河七（吉林）在国际法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (26, N'000026', N'银河七（吉林）不同水分含量容重变化情况', N'银河七（吉林）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了银河七（吉林）在美标法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了银河七（吉林）在美标法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (27, N'000027', N'银河七（吉林）不同水分含量静止角变化情况', N'银河七（吉林）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了银河七（吉林）在趋势线法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了银河七（吉林）在趋势线法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (28, N'000028', N'银河七（吉林）不同水分含量静止角变化情况', N'银河七（吉林）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了银河七（吉林）在两点法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了银河七（吉林）在两点法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (29, N'000029', N'银河七（吉林）不同破碎率容重变化情况', N'银河七（吉林）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了银河七（吉林）在国际法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了银河七（吉林）在国际法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (30, N'000030', N'银河七（吉林）不同破碎率容重变化情况', N'银河七（吉林）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了银河七（吉林）在美标法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了银河七（吉林）在美标法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (31, N'000031', N'银河七（吉林）不同破碎率静止角变化情况', N'银河七（吉林）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了银河七（吉林）在趋势线法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了银河七（吉林）在趋势线法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (32, N'000032', N'银河七（吉林）不同破碎率静止角变化情况', N'银河七（吉林）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了银河七（吉林）在两点法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了银河七（吉林）在两点法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (33, N'000033', N'银河七（吉林）不同杂质含量容重变化情况', N'银河七（吉林）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了银河七（吉林）在国标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了银河七（吉林）在国标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (34, N'000034', N'银河七（吉林）不同杂质含量容重变化情况', N'银河七（吉林）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了银河七（吉林）在美标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了银河七（吉林）在美标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (35, N'000035', N'银河七（吉林）不同杂质含量静止角变化情况', N'银河七（吉林）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了银河七（吉林）在趋势线法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了银河七（吉林）在趋势线法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (36, N'000036', N'银河七（吉林）不同杂质含量静止角变化情况', N'银河七（吉林）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了银河七（吉林）在两点法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了银河七（吉林）在两点法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (37, N'000037', N'先玉335（吉林）不同水分含量容重变化情况', N'先玉335（吉林）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了先玉335（吉林）在国际法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了先玉335（吉林）在国际法中不同水分含量容重变化速率变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (38, N'000038', N'先玉335（吉林）不同水分含量容重变化情况', N'先玉335（吉林）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了先玉335（吉林）在美标法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了先玉335（吉林）在美标法中不同水分含量容重变化速率变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (39, N'000039', N'先玉335（吉林）不同水分含量静止角变化情况', N'先玉335（吉林）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了先玉335（吉林）在趋势线法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了先玉335（吉林）在趋势线法中不同水分含量静止角变化速率变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (40, N'000040', N'先玉335（吉林）不同水分含量静止角变化情况', N'先玉335（吉林）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了先玉335（吉林）在两点法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了先玉335（吉林）在两点法中不同水分含量静止角变化速率变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (41, N'000041', N'先玉335（吉林）不同破碎率容重变化情况', N'先玉335（吉林）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了先玉335（吉林）在国际法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了先玉335（吉林）在国际法中不同破碎率容重变化速率变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (42, N'000042', N'先玉335（吉林）不同破碎率容重变化情况', N'先玉335（吉林）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了先玉335（吉林）在美标法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了先玉335（吉林）在美标法中不同破碎率容重变化速率变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (43, N'000043', N'先玉335（吉林）不同破碎率静止角变化情况', N'先玉335（吉林）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了先玉335（吉林）在趋势线法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@      静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了先玉335（吉林）在趋势线法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (44, N'000044', N'先玉335（吉林）不同破碎率静止角变化情况', N'先玉335（吉林）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了先玉335（吉林）在两点法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了先玉335（吉林）在两点法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (45, N'000045', N'先玉335（吉林）不同杂质含量容重变化情况', N'先玉335（吉林）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了先玉335（吉林）在国标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了先玉335（吉林）在国标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (46, N'000046', N'先玉335（吉林）不同杂质含量容重变化情况', N'先玉335（吉林）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了先玉335（吉林）在美标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了先玉335（吉林）在美标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (47, N'000047', N'先玉335（吉林）不同杂质含量静止角变化情况', N'先玉335（吉林）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了先玉335（吉林）在趋势线法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了先玉335（吉林）在趋势线法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (48, N'000048', N'先玉335（吉林）不同杂质含量静止角变化情况', N'先玉335（吉林）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了先玉335（吉林）在两点法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。@      本实验模拟了先玉335（吉林）在两点法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (49, N'000049', N'恒宇619（吉林）不同水分含量容重变化情况', N'恒宇619（吉林）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了恒宇619（吉林）在国际法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了恒宇619（吉林）在国际法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (50, N'000050', N'恒宇619（吉林）不同水分含量容重变化情况', N'恒宇619（吉林）不同水分含量容重变化速率变化情况', N'含水量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       国标法和美标法测定的不同品种玉米的容重随含水量的变化趋势基本类似，总体看来均随水分的增加而降低。@       本实验模拟了恒宇619（吉林）在美标法中不同水分含量容重的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位水分内容重的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,W为水分（%）。@       本实验模拟了恒宇619（吉林）在美标法中不同水分含量容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (51, N'000051', N'恒宇619（吉林）不同水分含量静止角变化情况', N'恒宇619（吉林）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了恒宇619（吉林）在趋势线法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了恒宇619（吉林）在趋势线法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (52, N'000052', N'恒宇619（吉林）不同水分含量静止角变化情况', N'恒宇619（吉林）不同水分含量静止角变化情况', N'含水量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       不同品种玉米静止角随水分的变化趋势差异很大。趋势线法处理粮堆静止角比两点法能更好的用直线趋势线描述，多次实验的误差也较小。@       本实验模拟了恒宇619（吉林）在两点法中不同水分含量静止角的变化情况。', N'       玉米水分测定参照国标法GB/T 10362-2008粮油检测玉米水分的测定。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位水分内静止角的变化情况。V= （N&n-N&n&-&1)/(W&n-W&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,W为水分（%）。@       本实验模拟了恒宇619（吉林）在两点法中不同水分含量静止角变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (53, N'000053', N'恒宇619（吉林）不同破碎率容重变化情况', N'恒宇619（吉林）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了恒宇619（吉林）在国际法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了恒宇619（吉林）在国际法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (54, N'000054', N'恒宇619（吉林）不同破碎率容重变化情况', N'恒宇619（吉林）不同破碎率容重变化速率变化情况', N'破碎率(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       国标法和美标法测的不同品种玉米容重随破碎率的变化趋势类似，且五个品系玉米容重随破碎率的增加均较降低，变化幅度小，因此推测破碎是玉米容重变化的影响因素，但非主要因素。@       本实验模拟了恒宇619（吉林）在美标法中不同破碎率容重变化情况。', N'       破碎率测定按国标GB/T 5494-2008粮油检测粮食、油料的杂质、不完善粒检测进行破碎率检测。@       容重变化速率是指单位破碎率内容重的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为容重变化速率(g/(L*%)) ，N为容重（g/L），P为破碎率（%）。@       本实验模拟了恒宇619（吉林）在美标法中不同破碎率容重变化速率的变化情况。')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (55, N'000055', N'恒宇619（吉林）不同破碎率静止角变化情况', N'恒宇619（吉林）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了恒宇619（吉林）在趋势线法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@      静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了恒宇619（吉林）在趋势线法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (56, N'000056', N'恒宇619（吉林）不同破碎率静止角变化情况', N'恒宇619（吉林）不同破碎率静止角变化速率变化情况', N'破碎率(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随破碎率的变化趋势差异较大。@      本实验模拟了恒宇619（吉林）在两点法中不同破碎率静止角的变化情况。 ', N'       破碎率测定按国标GB/T 5494-2008粮油检测 粮食、油料的杂质、不完善粒检测进行破碎率检测。@       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位破碎率内静止角的变化情况。V= （N&n-N&n&-&1)/(P&n-P&n&-&1)，其中 V为静止角变化速率(°/%) ，N为静止角（°），P为破碎率（%）。@      本实验模拟了恒宇619（吉林）在两点法中不同破碎率静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (57, N'000057', N'恒宇619（吉林）不同杂质含量容重变化情况', N'恒宇619（吉林）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了恒宇619（吉林）在国标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了恒宇619（吉林）在国标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (58, N'000058', N'恒宇619（吉林）不同杂质含量容重变化情况', N'恒宇619（吉林）不同杂质含量容重变化速率变化情况', N'杂质含量(%)', N'容重(g/L)', N'容重变化速率(g/L*%)', N'       容重测定分别采用国标法和美标法测定。@       国标法和美标法测的不同品种玉米容重随杂质含量的变化趋势类似，都随杂质含量的增加而下降，下降幅度较破碎率的影响大。@      本实验模拟了恒宇619（吉林）在美标法中不同杂质含量容重的变化情况。 ', N'       容重测定分别采用国标法和美标法测定。@       容重变化速率是指单位杂质含量内容重的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为容重变化速率（g/(L*%)），N为容重（g/L）,Z为杂质含量（%）。@      本实验模拟了恒宇619（吉林）在美标法中不同杂质含量容重变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (59, N'000059', N'恒宇619（吉林）不同杂质含量静止角变化情况', N'恒宇619（吉林）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了恒宇619（吉林）在趋势线法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。
@      本实验模拟了恒宇619（吉林）在趋势线法中不同杂质含量静止角变化速率的变化情况。 ')
INSERT [dbo].[玉米特性参数坐标轴描述表] ([id], [实验号], [标题], [标题速率], [x轴], [y轴], [y轴速率], [描述], [速率图描述]) VALUES (60, N'000060', N'恒宇619（吉林）不同杂质含量静止角变化情况', N'恒宇619（吉林）不同杂质含量静止角变化速率变化情况', N'杂质含量(%)', N'静止角(°)', N'静止角变化速率(°/%)', N'       静止角测定分别采用趋势线法和两点法测定。@       用趋势线法和两点法处理所得静止角结果是不同品种玉米静止角随含水量的变化趋势差异很大，且都没有明显的固定的变化趋势 。@      本实验模拟了恒宇619（吉林）在两点法中不同杂质含量静止角的变化情况。 ', N'       静止角测定分别采用趋势线法和两点法测定。@       静止角变化速率是指单位杂质含量内静止角的变化情况。V= （N&n-N&n&-&1)/(Z&n-Z&n&-&1)，其中V为静止角变化速率（°/%），N为静止角（°）,Z为杂质含量（%）。
@      本实验模拟了恒宇619（吉林）在两点法中不同杂质含量静止角变化速率的变化情况。 ')
SET IDENTITY_INSERT [dbo].[玉米特性参数坐标轴描述表] OFF
/****** Object:  Index [IX_小麦坐标信息描述表]    Script Date: 7/11/2016 8:25:02 AM ******/
CREATE NONCLUSTERED INDEX [IX_小麦坐标信息描述表] ON [dbo].[小麦坐标信息描述表]
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[稻谷质量特性参数实验数据表]  WITH CHECK ADD  CONSTRAINT [FK_稻谷种群实验数据表_稻谷质量特性参数实验信息表] FOREIGN KEY([实验号])
REFERENCES [dbo].[稻谷质量特性参数实验信息表] ([实验号])
GO
ALTER TABLE [dbo].[稻谷质量特性参数实验数据表] CHECK CONSTRAINT [FK_稻谷种群实验数据表_稻谷质量特性参数实验信息表]
GO
ALTER TABLE [dbo].[稻谷质量特性参数实验信息表]  WITH CHECK ADD  CONSTRAINT [FK_稻谷质量特性参数实验信息表_稻谷质量参数信息表] FOREIGN KEY([参数号])
REFERENCES [dbo].[稻谷质量特性参数信息表] ([参数号])
GO
ALTER TABLE [dbo].[稻谷质量特性参数实验信息表] CHECK CONSTRAINT [FK_稻谷质量特性参数实验信息表_稻谷质量参数信息表]
GO
ALTER TABLE [dbo].[稻谷质量特性参数阈值表]  WITH CHECK ADD  CONSTRAINT [FK_稻谷质量阈值表_稻谷质量参数信息表] FOREIGN KEY([参数号])
REFERENCES [dbo].[稻谷质量特性参数信息表] ([参数号])
GO
ALTER TABLE [dbo].[稻谷质量特性参数阈值表] CHECK CONSTRAINT [FK_稻谷质量阈值表_稻谷质量参数信息表]
GO
ALTER TABLE [dbo].[稻谷质量特性参数坐标轴描述表]  WITH CHECK ADD  CONSTRAINT [FK_稻谷质量参数坐标轴描述_稻谷质量特性参数实验信息表] FOREIGN KEY([实验号])
REFERENCES [dbo].[稻谷质量特性参数实验信息表] ([实验号])
GO
ALTER TABLE [dbo].[稻谷质量特性参数坐标轴描述表] CHECK CONSTRAINT [FK_稻谷质量参数坐标轴描述_稻谷质量特性参数实验信息表]
GO
ALTER TABLE [dbo].[害虫对小麦参数的影响数据表]  WITH CHECK ADD  CONSTRAINT [FK_HaiChongYingXiangValueTable_ZhiLiangCanDataInformationTable] FOREIGN KEY([ShiYanNumber])
REFERENCES [dbo].[小麦参数实验总概括表] ([ShiYanNumber])
GO
ALTER TABLE [dbo].[害虫对小麦参数的影响数据表] CHECK CONSTRAINT [FK_HaiChongYingXiangValueTable_ZhiLiangCanDataInformationTable]
GO
ALTER TABLE [dbo].[粮食功能描述表]  WITH CHECK ADD  CONSTRAINT [FK_功能描述_信息描述表] FOREIGN KEY([TypeBianHao])
REFERENCES [dbo].[粮食种类描述表] ([TypeBianHao])
GO
ALTER TABLE [dbo].[粮食功能描述表] CHECK CONSTRAINT [FK_功能描述_信息描述表]
GO
ALTER TABLE [dbo].[粮食图片描述表]  WITH CHECK ADD  CONSTRAINT [FK_粮食图片描述表_粮食种类描述表] FOREIGN KEY([TypeBianHao])
REFERENCES [dbo].[粮食种类描述表] ([TypeBianHao])
GO
ALTER TABLE [dbo].[粮食图片描述表] CHECK CONSTRAINT [FK_粮食图片描述表_粮食种类描述表]
GO
ALTER TABLE [dbo].[小麦参数实验总概括表]  WITH CHECK ADD  CONSTRAINT [FK_ZhiLiangCanDataInformationTable_PeatsInformationTable] FOREIGN KEY([PeatsNum])
REFERENCES [dbo].[小麦害虫名表] ([PeatsNum])
GO
ALTER TABLE [dbo].[小麦参数实验总概括表] CHECK CONSTRAINT [FK_ZhiLiangCanDataInformationTable_PeatsInformationTable]
GO
ALTER TABLE [dbo].[小麦参数实验总概括表]  WITH CHECK ADD  CONSTRAINT [FK_ZhiLiangCanDataInformationTable_ZhiLiangCanShuNumberTable] FOREIGN KEY([CanShuNumber])
REFERENCES [dbo].[小麦参数名表] ([CanShuNumber])
GO
ALTER TABLE [dbo].[小麦参数实验总概括表] CHECK CONSTRAINT [FK_ZhiLiangCanDataInformationTable_ZhiLiangCanShuNumberTable]
GO
ALTER TABLE [dbo].[小麦参数阈值表]  WITH CHECK ADD  CONSTRAINT [FK_ZhiLiangYuValue_PeatsInformationTable] FOREIGN KEY([PeatsNum])
REFERENCES [dbo].[小麦害虫名表] ([PeatsNum])
GO
ALTER TABLE [dbo].[小麦参数阈值表] CHECK CONSTRAINT [FK_ZhiLiangYuValue_PeatsInformationTable]
GO
ALTER TABLE [dbo].[小麦参数阈值表]  WITH CHECK ADD  CONSTRAINT [FK_ZhiLiangYuValue_ZhiLiangCanShuNumberTable] FOREIGN KEY([CanShuNumber])
REFERENCES [dbo].[小麦参数名表] ([CanShuNumber])
GO
ALTER TABLE [dbo].[小麦参数阈值表] CHECK CONSTRAINT [FK_ZhiLiangYuValue_ZhiLiangCanShuNumberTable]
GO
ALTER TABLE [dbo].[小麦害虫种群变化数据表]  WITH CHECK ADD  CONSTRAINT [FK_小麦害虫种群变化数据表_小麦参数实验总概括表] FOREIGN KEY([ShiYanNumber])
REFERENCES [dbo].[小麦参数实验总概括表] ([ShiYanNumber])
GO
ALTER TABLE [dbo].[小麦害虫种群变化数据表] CHECK CONSTRAINT [FK_小麦害虫种群变化数据表_小麦参数实验总概括表]
GO
ALTER TABLE [dbo].[小麦质量特性参数数据表]  WITH CHECK ADD  CONSTRAINT [FK_ZhiLiangCanDataTable_ZhiLiangCanDataInformationTable] FOREIGN KEY([ShiYanNumber])
REFERENCES [dbo].[小麦参数实验总概括表] ([ShiYanNumber])
GO
ALTER TABLE [dbo].[小麦质量特性参数数据表] CHECK CONSTRAINT [FK_ZhiLiangCanDataTable_ZhiLiangCanDataInformationTable]
GO
ALTER TABLE [dbo].[小麦坐标信息描述表]  WITH CHECK ADD  CONSTRAINT [FK_小麦坐标信息描述表_小麦参数实验总概括表] FOREIGN KEY([ShiYanNumber])
REFERENCES [dbo].[小麦参数实验总概括表] ([ShiYanNumber])
GO
ALTER TABLE [dbo].[小麦坐标信息描述表] CHECK CONSTRAINT [FK_小麦坐标信息描述表_小麦参数实验总概括表]
GO
ALTER TABLE [dbo].[玉米孢子检测实验数据表]  WITH CHECK ADD  CONSTRAINT [FK_玉米孢子检测实验数据表_玉米孢子检测实验信息表] FOREIGN KEY([实验号])
REFERENCES [dbo].[玉米孢子检测实验信息表] ([实验号])
GO
ALTER TABLE [dbo].[玉米孢子检测实验数据表] CHECK CONSTRAINT [FK_玉米孢子检测实验数据表_玉米孢子检测实验信息表]
GO
ALTER TABLE [dbo].[玉米孢子检测实验信息表]  WITH CHECK ADD  CONSTRAINT [FK_玉米孢子检测实验信息表_玉米孢子信息表] FOREIGN KEY([孢子号])
REFERENCES [dbo].[玉米孢子信息表] ([孢子号])
GO
ALTER TABLE [dbo].[玉米孢子检测实验信息表] CHECK CONSTRAINT [FK_玉米孢子检测实验信息表_玉米孢子信息表]
GO
ALTER TABLE [dbo].[玉米孢子阈值表]  WITH CHECK ADD  CONSTRAINT [FK_玉米孢子阈值表_玉米孢子信息表] FOREIGN KEY([孢子号])
REFERENCES [dbo].[玉米孢子信息表] ([孢子号])
GO
ALTER TABLE [dbo].[玉米孢子阈值表] CHECK CONSTRAINT [FK_玉米孢子阈值表_玉米孢子信息表]
GO
ALTER TABLE [dbo].[玉米孢子坐标轴描述表]  WITH CHECK ADD  CONSTRAINT [FK_玉米孢子描述表_玉米孢子检测实验信息表] FOREIGN KEY([实验号])
REFERENCES [dbo].[玉米孢子检测实验信息表] ([实验号])
GO
ALTER TABLE [dbo].[玉米孢子坐标轴描述表] CHECK CONSTRAINT [FK_玉米孢子描述表_玉米孢子检测实验信息表]
GO
ALTER TABLE [dbo].[玉米特性参数实验数据表]  WITH CHECK ADD  CONSTRAINT [FK_玉米特性参数实验数据表_玉米特性参数实验信息表] FOREIGN KEY([实验号])
REFERENCES [dbo].[玉米特性参数实验信息表] ([实验号])
GO
ALTER TABLE [dbo].[玉米特性参数实验数据表] CHECK CONSTRAINT [FK_玉米特性参数实验数据表_玉米特性参数实验信息表]
GO
ALTER TABLE [dbo].[玉米特性参数实验信息表]  WITH CHECK ADD  CONSTRAINT [FK_玉米特性参数实验信息表_玉米特性参数实验批次表] FOREIGN KEY([实验批次号])
REFERENCES [dbo].[玉米特性参数实验批次表] ([实验批次号])
GO
ALTER TABLE [dbo].[玉米特性参数实验信息表] CHECK CONSTRAINT [FK_玉米特性参数实验信息表_玉米特性参数实验批次表]
GO
ALTER TABLE [dbo].[玉米特性参数实验信息表]  WITH CHECK ADD  CONSTRAINT [FK_玉米特性参数实验信息表_玉米特性参数信息表] FOREIGN KEY([参数号])
REFERENCES [dbo].[玉米特性参数信息表] ([参数号])
GO
ALTER TABLE [dbo].[玉米特性参数实验信息表] CHECK CONSTRAINT [FK_玉米特性参数实验信息表_玉米特性参数信息表]
GO
ALTER TABLE [dbo].[玉米特性参数阈值表]  WITH CHECK ADD  CONSTRAINT [FK_玉米特性参数阈值表_玉米特性参数阈值表] FOREIGN KEY([参数号])
REFERENCES [dbo].[玉米特性参数信息表] ([参数号])
GO
ALTER TABLE [dbo].[玉米特性参数阈值表] CHECK CONSTRAINT [FK_玉米特性参数阈值表_玉米特性参数阈值表]
GO
ALTER TABLE [dbo].[玉米特性参数坐标轴描述表]  WITH CHECK ADD  CONSTRAINT [FK_玉米描述信息表_玉米特性参数实验信息表] FOREIGN KEY([实验号])
REFERENCES [dbo].[玉米特性参数实验信息表] ([实验号])
GO
ALTER TABLE [dbo].[玉米特性参数坐标轴描述表] CHECK CONSTRAINT [FK_玉米描述信息表_玉米特性参数实验信息表]
GO
USE [master]
GO
ALTER DATABASE [Grain] SET  READ_WRITE 
GO
