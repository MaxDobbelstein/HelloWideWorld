USE [master]
GO
/****** Object:  Database [HelloWideWorld]    Script Date: 23.10.2018 17:57:26 ******/
CREATE DATABASE [HelloWideWorld]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'HelloWideWorld', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HelloWideWorld.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'HelloWideWorld_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\HelloWideWorld_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [HelloWideWorld] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HelloWideWorld].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HelloWideWorld] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HelloWideWorld] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HelloWideWorld] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HelloWideWorld] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HelloWideWorld] SET ARITHABORT OFF 
GO
ALTER DATABASE [HelloWideWorld] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HelloWideWorld] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HelloWideWorld] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HelloWideWorld] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HelloWideWorld] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HelloWideWorld] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HelloWideWorld] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HelloWideWorld] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HelloWideWorld] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HelloWideWorld] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HelloWideWorld] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HelloWideWorld] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HelloWideWorld] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HelloWideWorld] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HelloWideWorld] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HelloWideWorld] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HelloWideWorld] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HelloWideWorld] SET RECOVERY FULL 
GO
ALTER DATABASE [HelloWideWorld] SET  MULTI_USER 
GO
ALTER DATABASE [HelloWideWorld] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HelloWideWorld] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HelloWideWorld] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HelloWideWorld] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HelloWideWorld] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'HelloWideWorld', N'ON'
GO
USE [HelloWideWorld]
GO
/****** Object:  Table [dbo].[HelloWideWorldTable]    Script Date: 23.10.2018 17:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HelloWideWorldTable](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Text] [nchar](10) NULL,
 CONSTRAINT [PK_HelloWideWorld] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [HelloWideWorld] SET  READ_WRITE 
GO
