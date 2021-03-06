USE [master]
GO
/****** Object:  Database [eMedCord]    Script Date: 03/01/2019 17:06:40 ******/
CREATE DATABASE [eMedCord] ON  PRIMARY 
( NAME = N'eMedCord', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLSERVERR2\MSSQL\DATA\eMedCord.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'eMedCord_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLSERVERR2\MSSQL\DATA\eMedCord_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [eMedCord] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [eMedCord].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [eMedCord] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [eMedCord] SET ANSI_NULLS OFF
GO
ALTER DATABASE [eMedCord] SET ANSI_PADDING OFF
GO
ALTER DATABASE [eMedCord] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [eMedCord] SET ARITHABORT OFF
GO
ALTER DATABASE [eMedCord] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [eMedCord] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [eMedCord] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [eMedCord] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [eMedCord] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [eMedCord] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [eMedCord] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [eMedCord] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [eMedCord] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [eMedCord] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [eMedCord] SET  DISABLE_BROKER
GO
ALTER DATABASE [eMedCord] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [eMedCord] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [eMedCord] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [eMedCord] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [eMedCord] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [eMedCord] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [eMedCord] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [eMedCord] SET  READ_WRITE
GO
ALTER DATABASE [eMedCord] SET RECOVERY SIMPLE
GO
ALTER DATABASE [eMedCord] SET  MULTI_USER
GO
ALTER DATABASE [eMedCord] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [eMedCord] SET DB_CHAINING OFF
GO
USE [eMedCord]
GO
/****** Object:  Table [dbo].[UserRelation]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRelation](
	[UserRelationId] [int] IDENTITY(1,1) NOT NULL,
	[ParentUserId] [int] NULL,
	[ChildUserId] [int] NULL,
	[IsDeleted] [bit] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_UserRelation] PRIMARY KEY CLUSTERED 
(
	[UserRelationId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserMaster]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserMaster](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NULL,
	[UserName] [varchar](30) NULL,
	[Password] [varchar](30) NULL,
	[EmailId] [varchar](200) NULL,
	[Verified] [bit] NULL,
	[VerifiedOTP] [varchar](200) NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedIp] [varchar](15) NULL,
	[UpdatedIp] [varchar](15) NULL,
	[CountryId] [int] NULL,
	[Mobile] [varchar](25) NULL,
	[Birthday] [datetime] NULL,
	[UserTypeId] [int] NULL,
	[Gender] [varchar](50) NULL,
	[Address] [varchar](50) NULL,
	[Weight] [nvarchar](50) NULL,
 CONSTRAINT [PK_UserMaster] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserForgotHistory]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserForgotHistory](
	[UserForgotHistoryId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ForgotType] [int] NULL,
	[SendOTP] [varchar](10) NULL,
	[Status] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedIp] [varchar](15) NULL,
	[UpdatedIp] [varchar](15) NULL,
 CONSTRAINT [PK_UserForgotHistoryId] PRIMARY KEY CLUSTERED 
(
	[UserForgotHistoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PrescriptionMaster]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[doc_id] [int] NULL,
	[childuser_id] [int] NULL,
	[diasease_id] [int] NULL,
	[CreatedOn] [datetime] NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_Prescriptionmaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrescriptionDetailMaster]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrescriptionDetailMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[prescription_id] [int] NULL,
	[medicinename] [nvarchar](max) NULL,
	[qty] [nvarchar](max) NULL,
	[schedule_morning] [bit] NULL,
	[schedule_noon] [bit] NULL,
	[schedule_evening] [bit] NULL,
	[schedule_night] [bit] NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_PrescriptionDetailmaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiseaseRelationMaster]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseaseRelationMaster](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[diasease_id] [int] NULL,
	[value] [nvarchar](max) NULL,
	[IsDeleted] [bit] NULL,
 CONSTRAINT [PK_DiseaseMaster] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiseaseMaster]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiseaseMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[disease] [nvarchar](50) NULL,
	[parameter] [nvarchar](max) NULL,
 CONSTRAINT [PK_Disease] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 03/01/2019 17:06:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[CountryId] [int] NOT NULL,
	[Code] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[MobileCode] [varchar](50) NULL,
 CONSTRAINT [PK_CountryMaster] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
