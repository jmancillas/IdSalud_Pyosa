USE [master]
GO
/****** Object:  Database [dbINMEDIK]    Script Date: 03/06/2018 5:23:43 PM ******/
CREATE DATABASE [dbINMEDIK] ON  PRIMARY 
( NAME = N'dbINMEDIK', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\dbINMEDIK.mdf' , SIZE = 6144KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbINMEDIK_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\dbINMEDIK_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbINMEDIK].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbINMEDIK] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbINMEDIK] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbINMEDIK] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbINMEDIK] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbINMEDIK] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbINMEDIK] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbINMEDIK] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [dbINMEDIK] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbINMEDIK] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbINMEDIK] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbINMEDIK] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbINMEDIK] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbINMEDIK] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbINMEDIK] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbINMEDIK] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbINMEDIK] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbINMEDIK] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbINMEDIK] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbINMEDIK] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbINMEDIK] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbINMEDIK] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbINMEDIK] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbINMEDIK] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbINMEDIK] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbINMEDIK] SET  MULTI_USER 
GO
ALTER DATABASE [dbINMEDIK] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbINMEDIK] SET DB_CHAINING OFF 
GO
USE [dbINMEDIK]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CountyId] [int] NOT NULL,
	[AddressLine] [nvarchar](200) NOT NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Advertisement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[ActiveAlways] [bit] NOT NULL,
	[FromDate] [datetime] NULL,
	[ToDate] [datetime] NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Applications]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Applications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Applications] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Audit]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Audit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[Comment] [varchar](2000) NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditDetail]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AuditId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[InStock] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_AuditDetail] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cart]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[EmployeeId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CartConcepts]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartConcepts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCartId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[MedicId] [int] NULL,
	[ClinicId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Scheduled] [datetime] NULL,
	[Medicname] [varchar](50) NOT NULL,
	[Decree] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_CartConcepts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartPackage]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeCartId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[MedicId] [int] NULL,
	[ClinicId] [int] NOT NULL,
	[Medicname] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Scheduled] [datetime] NOT NULL,
 CONSTRAINT [PK_CartPackage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CashClosing]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CashClosing](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ClinicId] [int] NOT NULL,
	[InitialCash] [numeric](8, 2) NOT NULL,
	[FinalCash] [numeric](8, 2) NULL,
	[RemainingOrMissing] [numeric](8, 2) NULL,
	[DateOpened] [datetime] NOT NULL,
	[UserIdWhoOpened] [int] NOT NULL,
	[DateClosed] [datetime] NULL,
	[UserIdWhoClosed] [int] NULL,
	[TotalCash] [numeric](8, 2) NULL,
	[TotalCrediCard] [numeric](8, 2) NULL,
	[TotalVoucher] [numeric](8, 2) NULL,
	[TotalExpense] [numeric](8, 2) NULL,
	[TotalCancelation] [numeric](8, 2) NULL,
	[TotalSell] [numeric](8, 2) NULL,
	[TotalConsult] [int] NULL,
	[TotalProductSell] [numeric](8, 2) NULL,
 CONSTRAINT [PK_CashClosing] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChronicDisease]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChronicDisease](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_ChronicDisease] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[City]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[City](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StateId] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clinic]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clinic](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
	[AllowDonations] [bit] NOT NULL,
	[MinDonation] [numeric](15, 2) NULL,
	[RFC] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Clinic] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ClinicMenuView]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicMenuView](
	[ClinicId] [int] NOT NULL,
	[MenuViewId] [int] NOT NULL,
 CONSTRAINT [PK_ClinicMenuView] PRIMARY KEY CLUSTERED 
(
	[ClinicId] ASC,
	[MenuViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClinicWarehouse]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClinicWarehouse](
	[ClinicId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
 CONSTRAINT [PK_ClinicWarehouse] PRIMARY KEY CLUSTERED 
(
	[ClinicId] ASC,
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Concept]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Concept](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Cost] [numeric](8, 2) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[Discount] [numeric](8, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Iva] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Concept] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consult]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consult](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[MedicId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[Scheduled] [datetime] NOT NULL,
	[Age] [varchar](20) NULL,
	[Temperature] [varchar](20) NULL,
	[BloodPressure] [varchar](20) NULL,
	[HeartRate] [varchar](20) NULL,
	[Weight] [numeric](8, 2) NULL,
	[Height] [numeric](8, 2) NULL,
	[Alergics] [varchar](200) NULL,
	[AHF] [varchar](5000) NULL,
	[APP] [varchar](5000) NULL,
	[APNP] [varchar](5000) NULL,
	[AGO] [varchar](5000) NULL,
	[PA] [varchar](5000) NULL,
	[PhisicalExploration] [varchar](5000) NULL,
	[Treatment] [varchar](5000) NULL,
	[NurseId] [int] NULL,
	[Updated] [datetime] NOT NULL,
	[OrderConceptId] [int] NOT NULL,
 CONSTRAINT [PK_Consult] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[County]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[County](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DayOfWeek]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DayOfWeek](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DayNumber] [int] NOT NULL,
 CONSTRAINT [PK_DayOfWeek] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Denomination]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Denomination](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Value] [numeric](8, 2) NOT NULL,
	[MoneyCode] [varchar](10) NOT NULL,
	[Active] [bit] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
 CONSTRAINT [PK_Denomination] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DenominationByCashClose]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DenominationByCashClose](
	[idCashClosing] [int] NOT NULL,
	[idDenomination] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_DenominationByCashClose] PRIMARY KEY CLUSTERED 
(
	[idCashClosing] ASC,
	[idDenomination] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Disease]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Disease](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Disease] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[UserId] [int] NULL,
	[SpecialtyId] [int] NULL,
	[Code] [nvarchar](8) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmployeeClinic]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmployeeClinic](
	[EmployeeId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
 CONSTRAINT [PK_EmployeeClinic] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[ClinicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Exam](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[MedicId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[Notes] [varchar](100) NULL,
	[NurseId] [int] NULL,
	[Updated] [datetime] NULL,
	[Age] [varchar](20) NULL,
	[OrderConceptId] [int] NOT NULL,
 CONSTRAINT [PK_Exams] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Expenses]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Expenses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CashClosingId] [int] NOT NULL,
	[Number] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Amount] [numeric](8, 2) NOT NULL,
	[Created] [datetime] NOT NULL,
	[idUser] [int] NOT NULL,
 CONSTRAINT [PK_Expenses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FileDb]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FileDb](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](500) NOT NULL,
	[Created] [datetime] NOT NULL,
	[OriginalName] [varchar](500) NOT NULL,
	[ContentType] [varchar](500) NOT NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HoursOfDay]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoursOfDay](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Text] [nvarchar](50) NOT NULL,
	[HourOrder] [int] NOT NULL,
 CONSTRAINT [PK_HoursOfDay] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Internment]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Internment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[InternmentDate] [datetime] NOT NULL,
	[Room] [nvarchar](10) NULL,
	[ClinicId] [int] NOT NULL,
 CONSTRAINT [PK_Internment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InternmentMaterial]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InternmentMaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idInternment] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[MedicId] [int] NULL,
	[ClinicId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Medicname] [varchar](50) NULL,
	[Decree] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[EmployeeCreatedId] [int] NOT NULL,
	[Requested] [bit] NOT NULL,
 CONSTRAINT [PK_InternmentMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [nvarchar](20) NOT NULL,
	[Created] [datetime] NULL,
	[CreatedBy] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceMovement]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceMovement](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ConceptId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Cost] [numeric](18, 3) NOT NULL,
	[Iva] [bit] NOT NULL,
	[Price] [numeric](18, 3) NOT NULL,
	[InvoiceId] [int] NOT NULL,
	[CurrentIva] [int] NOT NULL,
 CONSTRAINT [PK_InvoiceMovement] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Keywords]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Keywords](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Keywords] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Laboratory]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Laboratory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[OrderConceptId] [int] NOT NULL,
	[Age] [varchar](50) NOT NULL,
	[Comment] [varchar](300) NOT NULL,
	[StatusId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[ExamId] [int] NOT NULL,
 CONSTRAINT [PK_Laboratory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicalIndication]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalIndication](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InternmentId] [int] NOT NULL,
	[Concept] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_MedicalIndication] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalIndicationApplication]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalIndicationApplication](
	[MedicalIndicationId] [int] NOT NULL,
	[ApplicationId] [int] NOT NULL,
 CONSTRAINT [PK_MedicalIndicationApplication] PRIMARY KEY CLUSTERED 
(
	[MedicalIndicationId] ASC,
	[ApplicationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MedicalNotes]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalNotes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InternmentId] [int] NOT NULL,
	[Note] [text] NOT NULL,
	[Created] [datetime] NOT NULL,
 CONSTRAINT [PK_MedicalNotes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuView]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MenuView](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Controller] [nvarchar](70) NOT NULL,
	[Action] [nvarchar](70) NOT NULL,
	[Icon] [nvarchar](30) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_MenuView] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NurseryMeasurements]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NurseryMeasurements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](100) NULL,
 CONSTRAINT [PK_NurseryMeasurements] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NurserySummary]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NurserySummary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[InternmentId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Value] [nvarchar](255) NULL,
	[NurseryMeasurementId] [int] NOT NULL,
 CONSTRAINT [PK_NurserySummary] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderPackage]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderPackage](
	[OrderId] [int] NOT NULL,
	[PackageId] [int] NOT NULL,
	[MedicId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[Scheduled] [datetime] NULL,
	[Medicname] [varchar](50) NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_OrderPackage] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[PackageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderPromotion]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderPromotion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[TextPromotion] [varchar](50) NOT NULL,
	[AmountSaved] [numeric](8, 2) NOT NULL,
 CONSTRAINT [PK_OrderPromotion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[Discount] [numeric](8, 2) NOT NULL,
	[Total] [numeric](8, 2) NOT NULL,
	[Rounding] [numeric](8, 2) NULL,
	[Paid] [bit] NOT NULL,
	[Pack] [bit] NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[InternmentId] [int] NULL,
	[ClinicId] [int] NOT NULL,
	[IsCanceled] [bit] NOT NULL,
	[DateCanceled] [datetime] NULL,
	[Iva] [numeric](8, 2) NOT NULL,
	[Donation] [numeric](8, 2) NOT NULL,
	[EmployeeCancelId] [int] NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdersConcepts]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrdersConcepts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[MedicId] [int] NULL,
	[ClinicId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [numeric](8, 2) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[Cost] [numeric](8, 2) NOT NULL,
	[Total] [numeric](8, 2) NOT NULL,
	[Scheduled] [datetime] NULL,
	[Medicname] [varchar](50) NULL,
	[Decree] [varchar](20) NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[Stockid] [int] NULL,
 CONSTRAINT [PK_orders_concepts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Package]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Package](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Cost] [numeric](8, 2) NOT NULL,
	[Price] [numeric](8, 2) NOT NULL,
	[Discount] [numeric](8, 2) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Iva] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Package] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PackageConcept]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PackageConcept](
	[PackageId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK_PackageConcept] PRIMARY KEY CLUSTERED 
(
	[PackageId] ASC,
	[ConceptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parameter](
	[Name] [nvarchar](50) NOT NULL,
	[Value] [nvarchar](50) NOT NULL,
	[Type] [nvarchar](50) NOT NULL,
	[ShowName] [nvarchar](75) NULL,
 CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Patient]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PersonId] [int] NOT NULL,
	[Reference] [nvarchar](100) NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Amount] [numeric](8, 2) NOT NULL,
	[Commission] [numeric](8, 2) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentType](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
 CONSTRAINT [PK_PaymentType] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Person]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[BirthDate] [date] NOT NULL,
	[Sex] [varchar](10) NOT NULL,
	[Email] [nvarchar](100) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Sale] [nvarchar](15) NULL,
	[LicenseRequired] [bit] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[code] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductWarehouse]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductWarehouse](
	[ProductId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[MinStock] [int] NOT NULL,
 CONSTRAINT [PK_ProductWarehouse] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC,
	[WarehouseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelAdvertisementFile]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelAdvertisementFile](
	[AdvertisementId] [int] NOT NULL,
	[FileId] [int] NOT NULL,
 CONSTRAINT [PK_RelAdvertisementFile] PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC,
	[FileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelAdvertisementKeyword]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelAdvertisementKeyword](
	[AdvertisementId] [int] NOT NULL,
	[KeywordId] [int] NOT NULL,
 CONSTRAINT [PK_RelAdvertisementKeyword] PRIMARY KEY CLUSTERED 
(
	[AdvertisementId] ASC,
	[KeywordId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelConsultChronicDisease]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelConsultChronicDisease](
	[idChronicDisease] [int] NOT NULL,
	[idConsult] [int] NOT NULL,
 CONSTRAINT [PK_RelConsultChronicDisease] PRIMARY KEY CLUSTERED 
(
	[idChronicDisease] ASC,
	[idConsult] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelConsultDisease]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelConsultDisease](
	[idConsult] [int] NOT NULL,
	[idDisease] [int] NOT NULL,
 CONSTRAINT [PK_RelConsultDisease] PRIMARY KEY CLUSTERED 
(
	[idConsult] ASC,
	[idDisease] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RelLaboratoryFile]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelLaboratoryFile](
	[FileId] [int] NOT NULL,
	[LaboratoyId] [int] NOT NULL,
 CONSTRAINT [PK_RelLaboratoryFile] PRIMARY KEY CLUSTERED 
(
	[FileId] ASC,
	[LaboratoyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestedMaterial]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestedMaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[RequestId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[QuantityRequested] [int] NOT NULL,
	[QuantityRestoked] [int] NULL,
 CONSTRAINT [PK_RequestedMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RequestMaterial]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RequestMaterial](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StatusId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[EmployeeCreatedId] [int] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[EmployeeUpdatedId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
 CONSTRAINT [PK_RequestMaterial] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Role]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](10) NOT NULL,
	[Description] [varchar](50) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleMenuView]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleMenuView](
	[RoleId] [int] NOT NULL,
	[MenuViewId] [int] NOT NULL,
 CONSTRAINT [PK_RoleMenuView] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC,
	[MenuViewId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Schedule]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Schedule](
	[EmployeeId] [int] NOT NULL,
	[DayOfWeekId] [int] NOT NULL,
	[HourOfDayId] [int] NOT NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC,
	[DayOfWeekId] ASC,
	[HourOfDayId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Service]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Service](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
	[MedicId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[Notes] [varchar](100) NULL,
	[NurseId] [int] NULL,
	[Updated] [datetime] NULL,
	[Age] [varchar](20) NULL,
	[OrderConceptId] [int] NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Specialty]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Specialty] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[State]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[State](
	[id] [int] IDENTITY(32,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_state] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Status]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ConceptId] [int] NOT NULL,
	[InStock] [int] NOT NULL,
	[Cost] [numeric](18, 3) NOT NULL,
	[ClinicId] [int] NOT NULL,
	[Iva] [bit] NOT NULL,
	[CurrIva] [float] NOT NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Test]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Test](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[XRay] [bit] NOT NULL,
	[Laboratory] [bit] NOT NULL,
	[ConceptId] [int] NOT NULL,
 CONSTRAINT [PK_Test] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[UserAccount] [varchar](50) NOT NULL,
	[UserPassword] [varchar](500) NOT NULL,
	[UserActive] [bit] NULL,
	[Authenticator] [bit] NOT NULL,
	[UpdatedBy] [int] NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[UpdatedDate] [datetime] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserMenuView]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserMenuView](
	[MenuViewId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_UserMenuView] PRIMARY KEY CLUSTERED 
(
	[MenuViewId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_User_Role] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouse](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Created] [datetime] NULL,
	[Updated] [datetime] NULL,
 CONSTRAINT [PK_Warehouse] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WarehouseSuply]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseSuply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[StockId] [int] NOT NULL,
	[ConceptId] [int] NOT NULL,
	[WarehouseId] [int] NOT NULL,
	[quantity] [int] NULL,
	[Created] [datetime] NULL,
	[Employeid] [int] NOT NULL,
	[ClinicId] [int] NOT NULL,
 CONSTRAINT [PK__Warehous__3213E83F986DECBE] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Xray]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Xray](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[OrderConceptId] [int] NOT NULL,
	[Age] [varchar](50) NOT NULL,
	[Comment] [varchar](300) NOT NULL,
	[StatusId] [int] NOT NULL,
	[Created] [datetime] NOT NULL,
	[Updated] [datetime] NOT NULL,
	[ExamId] [int] NOT NULL,
 CONSTRAINT [PK_Xray] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[vwAllConcepts]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwAllConcepts]
AS
SELECT c1.id, c2.Name AS CategoryName, c1.Name, Cost, Price, Discount, Deleted, Iva from Concept c1 INNER JOIN Category c2 ON c1.CategoryId = c2.id 
UNION
SELECT p.id, c2.Name AS CategoryName, p.Name, Cost, Price, Discount, Deleted, Iva from Package p INNER JOIN Category c2 ON p.CategoryId = c2.id;

GO
/****** Object:  View [dbo].[vwCancelledTickets]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCancelledTickets]
AS
SELECT        o.id, o.Total, FORMAT(o.Created, 'dd/MM/yyyy HH:mm') AS Created, p.Name + ' ' + p.LastName AS EmployeeName, FORMAT(o.DateCanceled, 'dd/MM/yyyy HH:mm') AS DateCancelled
FROM            dbo.Orders AS o INNER JOIN
                         dbo.Employee AS e ON o.EmployeeCancelId = e.id INNER JOIN
                         dbo.Person AS p ON e.PersonId = p.id
WHERE        (o.IsCanceled = 1)

GO
/****** Object:  View [dbo].[vwCardPayments]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCardPayments]
AS
SELECT        e.id AS EmployeeId, p.Created, pe.Name + ' ' + pe.LastName AS EmployeeName, o.id AS Ticket, p.Amount, p.Commission
FROM            dbo.Payment AS p INNER JOIN
                         dbo.PaymentType AS pt ON p.PaymentTypeId = pt.id INNER JOIN
                         dbo.Orders AS o ON p.OrderId = o.id INNER JOIN
                         dbo.Employee AS e ON p.EmployeeId = e.id INNER JOIN
                         dbo.Person AS pe ON e.PersonId = pe.id
WHERE        (pt.Name = 'Tarjeta')
GO
/****** Object:  View [dbo].[vwCashClosing]    Script Date: 03/12/2018 6:24:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vwCashClosing]
AS
SELECT        cc.id, p.id AS EmployeeId, pe.Name + ' ' + pe.LastName AS EmployeeName, cc.TotalCash AS Efective, cc.TotalCrediCard AS CreditCard, cc.TotalVoucher AS Vales, 
                         cc.TotalCash + cc.TotalVoucher + cc.TotalCrediCard AS TotalFisic, cc.DateClosed AS Date, COUNT(oc.Id) AS SoldItems
FROM            dbo.CashClosing AS cc INNER JOIN
                         dbo.Employee AS p ON p.UserId = cc.UserIdWhoClosed INNER JOIN
                         dbo.Person AS pe ON p.PersonId = pe.id LEFT OUTER JOIN
                         dbo.OrdersConcepts AS oc ON oc.Created BETWEEN cc.DateOpened AND COALESCE (cc.DateClosed, GETDATE())
GROUP BY cc.id, p.id, pe.Name + ' ' + pe.LastName, cc.TotalCash, cc.TotalCrediCard, cc.TotalVoucher, cc.DateClosed
GO
/****** Object:  View [dbo].[vwChronicDiseasePatients]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwChronicDiseasePatients]
AS
SELECT        p.Name AS PatientName, p.LastName AS PatientLastName, p.BirthDate AS PatientBirthDate, (CASE p.Sex WHEN 'M' THEN 'Masculino' WHEN 'F' THEN 'Femenino' END) AS PatientSex, ISNULL(coun.Name, 'SIN NOMBRE') 
                         AS CountyName, ISNULL(p.PhoneNumber, 'SIN NÚMERO') AS PatientPhoneNumber, cd.Code AS ChronicDiseaseCode
FROM            dbo.ChronicDisease AS cd INNER JOIN
                         dbo.RelConsultChronicDisease AS rcd ON cd.id = rcd.idChronicDisease INNER JOIN
                         dbo.Consult AS c ON rcd.idConsult = c.id INNER JOIN
                         dbo.Person AS p ON c.PatientId = p.id LEFT OUTER JOIN
                         dbo.Address AS a ON p.AddressId = a.id LEFT OUTER JOIN
                         dbo.County AS coun ON a.CountyId = coun.id

GO
/****** Object:  View [dbo].[vwConceptProductivity]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwConceptProductivity]
AS
SELECT      
  dbo.Orders.id AS Orderid,  
  ISNULL(dbo.Concept.Name, dbo.Package.Name) AS ConceptName, 
  ISNULL(dbo.OrdersConcepts.Created, dbo.OrderPackage.Created) AS DateCreated, 
  ISNULL(ISNULL(dbo.OrdersConcepts.Price, dbo.Package.Price), 0) AS Price, 
  ISNULL(ISNULL(dbo.OrdersConcepts.Cost, dbo.Package.Cost), 0) AS Cost, 
  ISNULL((ISNULL(dbo.OrdersConcepts.Price, dbo.Package.Price) - ISNULL(dbo.OrdersConcepts.Cost, dbo.Package.Cost)) * ISNULL(dbo.OrdersConcepts.Quantity, 1), 0) AS Profit, 
  ISNULL(dbo.Category.id, a.id) AS CategoryId, 
  ISNULL(dbo.Category.Name, a.Name) AS CategoryName, 
  ISNULL(dbo.OrdersConcepts.Quantity, 1) AS Quantity,
  ISNULL(dbo.Test.XRay, 0) AS XRay,
  ISNULL(dbo.Test.Laboratory, 0) AS Laboratory
FROM
  dbo.Orders 
LEFT OUTER JOIN dbo.OrdersConcepts 
  ON dbo.OrdersConcepts.OrderId = dbo.Orders.id 
LEFT OUTER JOIN dbo.Concept 
  ON dbo.Concept.id = dbo.OrdersConcepts.ConceptId 
LEFT OUTER JOIN dbo.Test 
  ON dbo.Concept.id = dbo.Test.ConceptId 
LEFT OUTER JOIN dbo.Category 
  ON dbo.Concept.CategoryId = dbo.Category.id 
LEFT OUTER JOIN dbo.OrderPackage 
  ON dbo.OrderPackage.OrderId = dbo.Orders.id 
LEFT OUTER JOIN dbo.Package 
  ON dbo.Package.id = dbo.OrderPackage.PackageId 
LEFT OUTER JOIN dbo.Category AS a 
  ON dbo.Package.CategoryId = a.id
GO
/****** Object:  View [dbo].[vwCountyServices]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwCountyServices]
AS
SELECT        ISNULL(coun.id, 0) AS CountyId, oc.Scheduled, c.id AS ConceptId, ISNULL(coun.Name, 'SIN NOMBRE') AS CountyName, c.Name AS ConceptName, oc.Quantity, oc.Price, oc.Cost, (oc.Price - oc.Cost) * oc.Quantity AS Profit
FROM            dbo.Orders AS o INNER JOIN
                         dbo.OrdersConcepts AS oc ON o.id = oc.OrderId INNER JOIN
                         dbo.Concept AS c ON oc.ConceptId = c.id INNER JOIN
                         dbo.Category AS ca ON c.CategoryId = ca.id LEFT OUTER JOIN
                         dbo.Person AS p ON o.PatientId = p.id LEFT OUTER JOIN
                         dbo.Address AS a ON p.AddressId = a.id LEFT OUTER JOIN
                         dbo.County AS coun ON coun.id = a.CountyId
WHERE        (ca.Name = 'Consultas')

GO
/****** Object:  View [dbo].[vwHealthReport]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwHealthReport]
AS
SELECT        d.id AS DiseaseId, d.Name AS DiseaseName, per.Sex, c.Scheduled, DATEDIFF(hour, per.BirthDate, GETDATE()) / 8766 AS Age
FROM            dbo.Disease AS d INNER JOIN
                         dbo.RelConsultDisease AS rcd ON d.id = rcd.idDisease INNER JOIN
                         dbo.Consult AS c ON rcd.idConsult = c.id INNER JOIN
                         dbo.Patient AS p ON c.PatientId = p.id INNER JOIN
                         dbo.Person AS per ON per.id = p.PersonId

GO
/****** Object:  View [dbo].[vwInternment]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwInternment]
AS
SELECT        o.id, o.EmployeeId, o.PatientId, o.Total, o.Created, o.Updated, op.ClinicId, pepa.Name + ' ' + pepa.LastName AS PatientName, peemp.Name + ' ' + peemp.LastName AS MedicName, pk.Name, FORMAT(o.Created, 
                         'dd/MM/yyyy HH:mm') AS sCreated, FORMAT(o.Updated, 'dd/MM/yyyy HH:mm') AS sUpdated
FROM            dbo.Orders AS o LEFT OUTER JOIN
                         dbo.Patient AS pa ON pa.id = o.PatientId LEFT OUTER JOIN
                         dbo.Person AS pepa ON pepa.id = pa.PersonId LEFT OUTER JOIN
                         dbo.OrderPackage AS op ON op.OrderId = o.id LEFT OUTER JOIN
                         dbo.Package AS pk ON pk.id = op.PackageId LEFT OUTER JOIN
                         dbo.Employee AS emp ON emp.id = op.MedicId LEFT OUTER JOIN
                         dbo.Person AS peemp ON peemp.id = emp.PersonId
WHERE        EXISTS
                             (SELECT        id, OrderId, PatientId, PackageId, InternmentDate, Room
                               FROM            dbo.Internment AS i
                               WHERE        (OrderId = o.id)) AND EXISTS
                             (SELECT        OrderId, PackageId, MedicId, ClinicId, Scheduled, Medicname, Created, Updated
                               FROM            dbo.OrderPackage AS op
                               WHERE        (OrderId = o.id))

GO
/****** Object:  View [dbo].[vwLaboratoryXray]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwLaboratoryXray]
AS
SELECT        pp.Name + ' ' + pp.LastName AS PatientName, pe.Name + ' ' + pe.LastName AS MedicName, s.Name AS StatusName, co.Name AS ConceptName, e.Notes, a.id, a.PatientId, a.OrderConceptId, a.Age, a.Comment, a.StatusId, 
                         a.Created, a.Updated, a.ExamId, a.sCreated, a.ExamDepartment, a.sUpdated, cli.id AS ClinicId, cli.Name AS ClinicName
FROM            (SELECT        id, PatientId, OrderConceptId, Age, Comment, StatusId, Created, Updated, ExamId, FORMAT(Created, 'dd/MM/yyyy HH:mm:ss') AS sCreated, 'LAB' AS ExamDepartment, FORMAT(Updated, 'dd/MM/yyyy HH:mm:ss') 
                                                    AS sUpdated
                          FROM            dbo.Laboratory AS l
                          UNION
                          SELECT        id, PatientId, OrderConceptId, Age, Comment, StatusId, Created, Updated, ExamId, FORMAT(Created, 'dd/MM/yyyy HH:mm:ss') AS sCreated, 'XRAY' AS ExamDepartment, FORMAT(Updated, 'dd/MM/yyyy HH:mm:ss') 
                                                   AS sUpdated
                          FROM            dbo.Xray AS x) AS a LEFT OUTER JOIN
                         dbo.Exam AS e ON e.id = a.ExamId LEFT OUTER JOIN
                         dbo.Patient AS p ON p.id = a.PatientId LEFT OUTER JOIN
                         dbo.Person AS pp ON pp.id = p.PersonId LEFT OUTER JOIN
                         dbo.Employee AS med ON med.id = e.MedicId LEFT OUTER JOIN
                         dbo.Person AS pe ON pe.id = med.PersonId LEFT OUTER JOIN
                         dbo.Status AS s ON s.id = a.StatusId LEFT OUTER JOIN
                         dbo.OrdersConcepts AS oc ON oc.Id = a.OrderConceptId LEFT OUTER JOIN
                         dbo.Concept AS co ON co.id = oc.ConceptId LEFT OUTER JOIN
                         dbo.Clinic AS cli ON cli.id = e.ClinicId

GO
/****** Object:  View [dbo].[vwMaterialForRequest]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwMaterialForRequest]
AS
SELECT        im.ConceptId, im.ClinicId, SUM(im.Quantity) AS Quantity, co.Name
FROM            dbo.InternmentMaterial AS im LEFT OUTER JOIN
                         dbo.Concept AS co ON co.id = im.ConceptId
WHERE        (im.Requested = 0) AND (co.CategoryId =
                             (SELECT        id
                               FROM            dbo.Category
                               WHERE        (Name = 'Productos')))
GROUP BY im.ConceptId, im.ClinicId, co.Name


GO
/****** Object:  View [dbo].[vwMedicProductivity]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwMedicProductivity]
AS
SELECT        dbo.Concept.id AS ConceptId, dbo.Category.id AS CategoryId, dbo.Employee.id AS EmployeeId, dbo.Concept.Name AS ConceptName, dbo.OrdersConcepts.Created AS DateCreated, dbo.OrdersConcepts.Price, 
                         dbo.OrdersConcepts.Cost, ISNULL((dbo.OrdersConcepts.Price - dbo.OrdersConcepts.Cost) * dbo.OrdersConcepts.Quantity, 0) AS Profit, dbo.Category.Name AS CategoryName, dbo.Role.Name AS RoleName, 
                         dbo.Person.Name + '  ' + dbo.Person.LastName AS MedicName, dbo.OrdersConcepts.Quantity
FROM            dbo.UserRole INNER JOIN
                         dbo.Role ON dbo.UserRole.RoleId = dbo.Role.id INNER JOIN
                         dbo.Concept INNER JOIN
                         dbo.OrdersConcepts ON dbo.Concept.id = dbo.OrdersConcepts.ConceptId INNER JOIN
                         dbo.Category ON dbo.Concept.CategoryId = dbo.Category.id INNER JOIN
                         dbo.Employee ON dbo.OrdersConcepts.MedicId = dbo.Employee.id INNER JOIN
                         dbo.Person ON dbo.Employee.PersonId = dbo.Person.id INNER JOIN
                         dbo.[User] ON dbo.Employee.UserId = dbo.[User].id ON dbo.UserRole.UserId = dbo.[User].id

GO
/****** Object:  View [dbo].[vwPharmacyProductivity]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwPharmacyProductivity]
AS
SELECT        dbo.Concept.id AS ConceptId, dbo.Category.id AS CategoryId, dbo.Employee.id AS EmployeeId, dbo.Concept.Name AS ConceptName, dbo.OrdersConcepts.Created AS DateCreated, dbo.OrdersConcepts.Price, 
                         dbo.OrdersConcepts.Cost, ISNULL((dbo.OrdersConcepts.Price - dbo.OrdersConcepts.Cost) * dbo.OrdersConcepts.Quantity, 0) AS Profit, dbo.Category.Name AS CategoryName, dbo.Role.Name AS RoleName, 
                         dbo.Person.Name + '  ' + dbo.Person.LastName AS MedicName, dbo.OrdersConcepts.Quantity
FROM            dbo.Concept INNER JOIN
                         dbo.OrdersConcepts ON dbo.Concept.id = dbo.OrdersConcepts.ConceptId INNER JOIN
                         dbo.Category ON dbo.Concept.CategoryId = dbo.Category.id INNER JOIN
                         dbo.Orders ON dbo.OrdersConcepts.OrderId = dbo.Orders.id INNER JOIN
                         dbo.Person INNER JOIN
                         dbo.Employee ON dbo.Person.id = dbo.Employee.PersonId INNER JOIN
                         dbo.[User] ON dbo.Employee.UserId = dbo.[User].id INNER JOIN
                         dbo.UserRole INNER JOIN
                         dbo.Role ON dbo.UserRole.RoleId = dbo.Role.id ON dbo.[User].id = dbo.UserRole.UserId ON dbo.Orders.EmployeeId = dbo.Employee.id

GO
/****** Object:  View [dbo].[vwRoundings]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwRoundings]
AS
SELECT        e.id AS EmployeeId, p.Name + ' ' + p.LastName AS EmployeeName, o.Created, o.id AS OrderId, o.Total, o.Rounding
FROM            dbo.Orders AS o INNER JOIN
                         dbo.Employee AS e ON o.EmployeeId = e.id INNER JOIN
                         dbo.Person AS p ON e.PersonId = p.id
WHERE        (o.Rounding > 0)

GO
/****** Object:  View [dbo].[vwSchedule]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwSchedule]
AS
SELECT        a.id, a.OrderId, a.PatientId, a.ClinicId, a.MedicId, a.StatusId, a.ConceptId, a.Scheduled, FORMAT(a.Scheduled, 'dd/MM/yyyy HH:mm:ss') AS sScheduled, pp.Name + ' ' + pp.LastName AS PatientName, 
                         pp.BirthDate AS PatientBirthDate, FORMAT(pp.BirthDate, 'dd/MM/yyyy') AS sPatientBirthDate, cl.Name AS ClinicName, pe.Name + ' ' + pe.LastName AS MedicName, s.Name AS StatusName, co.Name AS ConceptName, 
                         ca.Name AS CategoryName, o.Created AS OrderCreated, FORMAT(o.Created, 'dd/MM/yyyy HH:mm:ss') AS sOrderCreated
FROM            (SELECT        id, OrderId, PatientId, ClinicId, MedicId, StatusId, ConceptId, Scheduled
                          FROM            dbo.Consult
                          UNION
                          SELECT        id, OrderId, PatientId, ClinicId, MedicId, StatusId, ConceptId, NULL AS Expr1
                          FROM            dbo.Exam
                          UNION
                          SELECT        id, OrderId, PatientId, ClinicId, MedicId, StatusId, ConceptId, NULL AS Expr1
                          FROM            dbo.Service) AS a LEFT OUTER JOIN
                         dbo.Patient AS p ON p.id = a.PatientId LEFT OUTER JOIN
                         dbo.Person AS pp ON pp.id = p.PersonId LEFT OUTER JOIN
                         dbo.Clinic AS cl ON cl.id = a.ClinicId LEFT OUTER JOIN
                         dbo.Employee AS e ON e.id = a.MedicId LEFT OUTER JOIN
                         dbo.Person AS pe ON pe.id = e.PersonId LEFT OUTER JOIN
                         dbo.Status AS s ON s.id = a.StatusId LEFT OUTER JOIN
                         dbo.Concept AS co ON co.id = a.ConceptId LEFT OUTER JOIN
                         dbo.Category AS ca ON ca.id = co.CategoryId LEFT OUTER JOIN
                         dbo.Orders AS o ON o.id = a.OrderId

GO
/****** Object:  View [dbo].[vwWarehouseStock]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwWarehouseStock]
AS
SELECT        c.Name AS name, p.code, SUM(s.InStock) AS inStock, pw.MinStock AS minStock, ws.quantity AS sentMaterial, w.Name AS warehouseName, COALESCE (im.quantity, 0) AS spentMaterial, 
                         ws.quantity - COALESCE (im.quantity, 0) AS warehouseStock, dbo.Clinic.id AS clinicId
FROM            dbo.Concept AS c INNER JOIN
                         dbo.Product AS p ON c.id = p.ConceptId INNER JOIN
                         dbo.ProductWarehouse AS pw ON pw.ProductId = p.id INNER JOIN
                         dbo.Warehouse AS w ON pw.WarehouseId = w.id INNER JOIN
                         dbo.Stock AS s ON s.ConceptId = c.id INNER JOIN
                         dbo.Clinic ON s.ClinicId = dbo.Clinic.id LEFT OUTER JOIN
                             (SELECT        ConceptId, WarehouseId, SUM(quantity) AS quantity
                               FROM            dbo.WarehouseSuply
                               GROUP BY ConceptId, WarehouseId) AS ws ON ws.ConceptId = c.id AND ws.WarehouseId = w.id LEFT OUTER JOIN
                             (SELECT        ConceptId, ClinicId, SUM(Quantity) AS quantity
                               FROM            dbo.InternmentMaterial
                               GROUP BY ConceptId, ClinicId) AS im ON im.ConceptId = c.id AND im.ClinicId = s.ClinicId
WHERE        (c.Deleted = 0) AND (w.Name <> 'Farmacia')
GROUP BY c.Name, p.code, pw.MinStock, w.Name, ws.ConceptId, ws.WarehouseId, ws.quantity, im.quantity, dbo.Clinic.id

GO
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Address] ADD  CONSTRAINT [DF_Address_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DF_Advertisement_ActiveAlways]  DEFAULT ((0)) FOR [ActiveAlways]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DF_Advertisement_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DF_Advertisement_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DF_Advertisement_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Audit] ADD  CONSTRAINT [DF_Audit_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Audit] ADD  CONSTRAINT [DF_Audit_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[AuditDetail] ADD  CONSTRAINT [DF_AuditDetail_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[AuditDetail] ADD  CONSTRAINT [DF_AuditDetail_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Cart] ADD  CONSTRAINT [DF_Cart_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[CartConcepts] ADD  CONSTRAINT [DF_CartConcepts_created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[CartPackage] ADD  CONSTRAINT [DF_CartPackage_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Table_1_Created1]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DF_Category_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[ChronicDisease] ADD  CONSTRAINT [DF_ChronicDisease_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[ChronicDisease] ADD  CONSTRAINT [DF_ChronicDisease_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_Active]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Clinic] ADD  CONSTRAINT [DF_Clinic_AllowDonations]  DEFAULT ((0)) FOR [AllowDonations]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Iva]  DEFAULT ((0)) FOR [Iva]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Concept] ADD  CONSTRAINT [DF_Concept_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Consult] ADD  CONSTRAINT [DF_Consult_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[County] ADD  CONSTRAINT [DF_County_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[County] ADD  CONSTRAINT [DF_County_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[County] ADD  CONSTRAINT [DF_County_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_Active]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Disease] ADD  CONSTRAINT [DF_Disease_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_UserId]  DEFAULT (NULL) FOR [UserId]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Employee] ADD  CONSTRAINT [DF_Employee_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Expenses] ADD  CONSTRAINT [DF_Expenses_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[FileDb] ADD  CONSTRAINT [DF_File_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Internment] ADD  CONSTRAINT [DF_Internment_InternmentDate]  DEFAULT (getdate()) FOR [InternmentDate]
GO
ALTER TABLE [dbo].[InternmentMaterial] ADD  CONSTRAINT [DF_InternmentMaterial_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[InternmentMaterial] ADD  CONSTRAINT [DF_InternmentMaterial_Requested]  DEFAULT ((0)) FOR [Requested]
GO
ALTER TABLE [dbo].[Invoice] ADD  CONSTRAINT [DF_Invoice_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[InvoiceMovement] ADD  CONSTRAINT [DF_InvoiceMovement_Iva]  DEFAULT ((0)) FOR [Iva]
GO
ALTER TABLE [dbo].[InvoiceMovement] ADD  CONSTRAINT [DF_InvoiceMovement_CurrentIva]  DEFAULT ((0)) FOR [CurrentIva]
GO
ALTER TABLE [dbo].[MedicalIndication] ADD  CONSTRAINT [DF_Table_1_Applied]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[MedicalIndication] ADD  CONSTRAINT [DF_MedicalIndication_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MedicalIndication] ADD  CONSTRAINT [DF_MedicalIndication_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[MedicalNotes] ADD  CONSTRAINT [DF_MedicalNotes_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[MenuView] ADD  CONSTRAINT [DF_MenuView_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[OrderPackage] ADD  CONSTRAINT [DF_OrderPackage_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[OrderPackage] ADD  CONSTRAINT [DF_OrderPackage_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_orders_created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Orders] ADD  CONSTRAINT [DF_orders_updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[OrdersConcepts] ADD  CONSTRAINT [DF_orders_concepts_created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[OrdersConcepts] ADD  CONSTRAINT [DF_orders_concepts_updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Cost]  DEFAULT ((0)) FOR [Cost]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Price]  DEFAULT ((0)) FOR [Price]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Discount]  DEFAULT ((0)) FOR [Discount]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Iva]  DEFAULT ((0)) FOR [Iva]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Package] ADD  CONSTRAINT [DF_Package_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[PackageConcept] ADD  CONSTRAINT [DF_PackageConcept_Quantity]  DEFAULT ((0)) FOR [Quantity]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_Patient_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Payment] ADD  CONSTRAINT [DF_Payment_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[PaymentType] ADD  CONSTRAINT [DF_PaymentType_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[PaymentType] ADD  CONSTRAINT [DF_PaymentType_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Person] ADD  CONSTRAINT [DF_Person_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_LicenseRequired]  DEFAULT ((0)) FOR [LicenseRequired]
GO
ALTER TABLE [dbo].[ProductWarehouse] ADD  CONSTRAINT [DF_ProductWarehouse_MinStock]  DEFAULT ((0)) FOR [MinStock]
GO
ALTER TABLE [dbo].[RequestMaterial] ADD  CONSTRAINT [DF_RequestMaterial_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[RequestMaterial] ADD  CONSTRAINT [DF_RequestMaterial_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Service] ADD  CONSTRAINT [DF_Service_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Specialty] ADD  CONSTRAINT [DF_Specialty_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Specialty] ADD  CONSTRAINT [DF_Specialty_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Iva]  DEFAULT ((0)) FOR [Iva]
GO
ALTER TABLE [dbo].[Stock] ADD  CONSTRAINT [DF_Stock_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Supplier] ADD  CONSTRAINT [DF_Supplier_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [DF_Test_XRay]  DEFAULT ((0)) FOR [XRay]
GO
ALTER TABLE [dbo].[Test] ADD  CONSTRAINT [DF_Test_Laboratory]  DEFAULT ((0)) FOR [Laboratory]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_User_active]  DEFAULT ((0)) FOR [UserActive]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_UpdatedDate]  DEFAULT (getdate()) FOR [UpdatedDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_Created]  DEFAULT (getdate()) FOR [Created]
GO
ALTER TABLE [dbo].[Warehouse] ADD  CONSTRAINT [DF_Warehouse_Updated]  DEFAULT (getdate()) FOR [Updated]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_County] FOREIGN KEY([CountyId])
REFERENCES [dbo].[County] ([id])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FK_Address_County]
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD  CONSTRAINT [FK_Audit_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_Clinic]
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD  CONSTRAINT [FK_Audit_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_Employee]
GO
ALTER TABLE [dbo].[AuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_AuditDetail_Audit] FOREIGN KEY([AuditId])
REFERENCES [dbo].[Audit] ([id])
GO
ALTER TABLE [dbo].[AuditDetail] CHECK CONSTRAINT [FK_AuditDetail_Audit]
GO
ALTER TABLE [dbo].[AuditDetail]  WITH CHECK ADD  CONSTRAINT [FK_AuditDetail_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[AuditDetail] CHECK CONSTRAINT [FK_AuditDetail_Concept]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Clinic]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Employee]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Patient]
GO
ALTER TABLE [dbo].[CartConcepts]  WITH CHECK ADD  CONSTRAINT [FK_CartConcepts_Cart] FOREIGN KEY([EmployeeCartId])
REFERENCES [dbo].[Cart] ([EmployeeId])
GO
ALTER TABLE [dbo].[CartConcepts] CHECK CONSTRAINT [FK_CartConcepts_Cart]
GO
ALTER TABLE [dbo].[CartConcepts]  WITH CHECK ADD  CONSTRAINT [FK_CartConcepts_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[CartConcepts] CHECK CONSTRAINT [FK_CartConcepts_Clinic]
GO
ALTER TABLE [dbo].[CartConcepts]  WITH CHECK ADD  CONSTRAINT [FK_CartConcepts_Concepts] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[CartConcepts] CHECK CONSTRAINT [FK_CartConcepts_Concepts]
GO
ALTER TABLE [dbo].[CartConcepts]  WITH CHECK ADD  CONSTRAINT [FK_CartConcepts_Medic] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[CartConcepts] CHECK CONSTRAINT [FK_CartConcepts_Medic]
GO
ALTER TABLE [dbo].[CartPackage]  WITH CHECK ADD  CONSTRAINT [FK_CartPackage_Cart] FOREIGN KEY([EmployeeCartId])
REFERENCES [dbo].[Cart] ([EmployeeId])
GO
ALTER TABLE [dbo].[CartPackage] CHECK CONSTRAINT [FK_CartPackage_Cart]
GO
ALTER TABLE [dbo].[CartPackage]  WITH CHECK ADD  CONSTRAINT [FK_CartPackage_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[CartPackage] CHECK CONSTRAINT [FK_CartPackage_Clinic]
GO
ALTER TABLE [dbo].[CartPackage]  WITH CHECK ADD  CONSTRAINT [FK_CartPackage_Employee] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[CartPackage] CHECK CONSTRAINT [FK_CartPackage_Employee]
GO
ALTER TABLE [dbo].[CartPackage]  WITH CHECK ADD  CONSTRAINT [FK_CartPackage_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([id])
GO
ALTER TABLE [dbo].[CartPackage] CHECK CONSTRAINT [FK_CartPackage_Package]
GO
ALTER TABLE [dbo].[CashClosing]  WITH CHECK ADD  CONSTRAINT [FK_CashClosing_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[CashClosing] CHECK CONSTRAINT [FK_CashClosing_Clinic]
GO
ALTER TABLE [dbo].[CashClosing]  WITH CHECK ADD  CONSTRAINT [FK_CashClosing_UserClosed] FOREIGN KEY([UserIdWhoClosed])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[CashClosing] CHECK CONSTRAINT [FK_CashClosing_UserClosed]
GO
ALTER TABLE [dbo].[CashClosing]  WITH CHECK ADD  CONSTRAINT [FK_CashClosing_UserOpened] FOREIGN KEY([UserIdWhoOpened])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[CashClosing] CHECK CONSTRAINT [FK_CashClosing_UserOpened]
GO
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([id])
GO
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_State]
GO
ALTER TABLE [dbo].[Clinic]  WITH CHECK ADD  CONSTRAINT [FK_Clinic_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Clinic] CHECK CONSTRAINT [FK_Clinic_Address]
GO
ALTER TABLE [dbo].[ClinicMenuView]  WITH CHECK ADD  CONSTRAINT [FK_ClinicMenuView_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[ClinicMenuView] CHECK CONSTRAINT [FK_ClinicMenuView_Clinic]
GO
ALTER TABLE [dbo].[ClinicMenuView]  WITH CHECK ADD  CONSTRAINT [FK_ClinicMenuView_MenuView] FOREIGN KEY([MenuViewId])
REFERENCES [dbo].[MenuView] ([id])
GO
ALTER TABLE [dbo].[ClinicMenuView] CHECK CONSTRAINT [FK_ClinicMenuView_MenuView]
GO
ALTER TABLE [dbo].[ClinicWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_ClinicWarehouse_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[ClinicWarehouse] CHECK CONSTRAINT [FK_ClinicWarehouse_Clinic]
GO
ALTER TABLE [dbo].[ClinicWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_ClinicWarehouse_Warehouse] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[ClinicWarehouse] CHECK CONSTRAINT [FK_ClinicWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[Concept]  WITH CHECK ADD  CONSTRAINT [FK_Concept_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Concept] CHECK CONSTRAINT [FK_Concept_Category]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Clinic]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Concept]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Medic] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Medic]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Nurse] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Nurse]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Order]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_OrderConcept] FOREIGN KEY([OrderConceptId])
REFERENCES [dbo].[OrdersConcepts] ([Id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_OrderConcept]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Patient]
GO
ALTER TABLE [dbo].[Consult]  WITH CHECK ADD  CONSTRAINT [FK_Consult_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Consult] CHECK CONSTRAINT [FK_Consult_Status]
GO
ALTER TABLE [dbo].[County]  WITH CHECK ADD  CONSTRAINT [FK_County_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([id])
GO
ALTER TABLE [dbo].[County] CHECK CONSTRAINT [FK_County_City]
GO
ALTER TABLE [dbo].[Denomination]  WITH CHECK ADD  CONSTRAINT [FK_Denomination_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([id])
GO
ALTER TABLE [dbo].[Denomination] CHECK CONSTRAINT [FK_Denomination_PaymentType]
GO
ALTER TABLE [dbo].[DenominationByCashClose]  WITH CHECK ADD  CONSTRAINT [FK_DenominationByCashClose_CashClose] FOREIGN KEY([idCashClosing])
REFERENCES [dbo].[CashClosing] ([id])
GO
ALTER TABLE [dbo].[DenominationByCashClose] CHECK CONSTRAINT [FK_DenominationByCashClose_CashClose]
GO
ALTER TABLE [dbo].[DenominationByCashClose]  WITH CHECK ADD  CONSTRAINT [FK_DenominationByCashClose_Denomination] FOREIGN KEY([idDenomination])
REFERENCES [dbo].[Denomination] ([id])
GO
ALTER TABLE [dbo].[DenominationByCashClose] CHECK CONSTRAINT [FK_DenominationByCashClose_Denomination]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Person1] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Person1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Specialty] FOREIGN KEY([SpecialtyId])
REFERENCES [dbo].[Specialty] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Specialty]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User]
GO
ALTER TABLE [dbo].[EmployeeClinic]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeClinic_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[EmployeeClinic] CHECK CONSTRAINT [FK_EmployeeClinic_Clinic]
GO
ALTER TABLE [dbo].[EmployeeClinic]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeClinic_EmployeeClinic] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[EmployeeClinic] CHECK CONSTRAINT [FK_EmployeeClinic_EmployeeClinic]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Nurse] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_Nurse]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_OrderConcept] FOREIGN KEY([OrderConceptId])
REFERENCES [dbo].[OrdersConcepts] ([Id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_OrderConcept]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Clinic]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Concept]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Medic] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Medic]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Order]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Patient]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exams_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exams_Status]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_CashClosing] FOREIGN KEY([CashClosingId])
REFERENCES [dbo].[CashClosing] ([id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_CashClosing]
GO
ALTER TABLE [dbo].[Expenses]  WITH CHECK ADD  CONSTRAINT [FK_Expenses_UserCreated] FOREIGN KEY([idUser])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[Expenses] CHECK CONSTRAINT [FK_Expenses_UserCreated]
GO
ALTER TABLE [dbo].[Internment]  WITH CHECK ADD  CONSTRAINT [FK_Internment_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Internment] CHECK CONSTRAINT [FK_Internment_Clinic]
GO
ALTER TABLE [dbo].[Internment]  WITH CHECK ADD  CONSTRAINT [FK_Internment_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Internment] CHECK CONSTRAINT [FK_Internment_Orders]
GO
ALTER TABLE [dbo].[Internment]  WITH CHECK ADD  CONSTRAINT [FK_Internment_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([id])
GO
ALTER TABLE [dbo].[Internment] CHECK CONSTRAINT [FK_Internment_Package]
GO
ALTER TABLE [dbo].[Internment]  WITH CHECK ADD  CONSTRAINT [FK_Internment_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Internment] CHECK CONSTRAINT [FK_Internment_Patient]
GO
ALTER TABLE [dbo].[InternmentMaterial]  WITH CHECK ADD  CONSTRAINT [FK_InternmentMaterial_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[InternmentMaterial] CHECK CONSTRAINT [FK_InternmentMaterial_Clinic]
GO
ALTER TABLE [dbo].[InternmentMaterial]  WITH CHECK ADD  CONSTRAINT [FK_InternmentMaterial_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[InternmentMaterial] CHECK CONSTRAINT [FK_InternmentMaterial_Concept]
GO
ALTER TABLE [dbo].[InternmentMaterial]  WITH CHECK ADD  CONSTRAINT [FK_InternmentMaterial_Employee] FOREIGN KEY([EmployeeCreatedId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[InternmentMaterial] CHECK CONSTRAINT [FK_InternmentMaterial_Employee]
GO
ALTER TABLE [dbo].[InternmentMaterial]  WITH CHECK ADD  CONSTRAINT [FK_InternmentMaterial_Internment] FOREIGN KEY([idInternment])
REFERENCES [dbo].[Internment] ([id])
GO
ALTER TABLE [dbo].[InternmentMaterial] CHECK CONSTRAINT [FK_InternmentMaterial_Internment]
GO
ALTER TABLE [dbo].[InternmentMaterial]  WITH CHECK ADD  CONSTRAINT [FK_InternmentMaterial_Medic] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[InternmentMaterial] CHECK CONSTRAINT [FK_InternmentMaterial_Medic]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Clinic]
GO
ALTER TABLE [dbo].[InvoiceMovement]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceMovement_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[InvoiceMovement] CHECK CONSTRAINT [FK_InvoiceMovement_Concept]
GO
ALTER TABLE [dbo].[InvoiceMovement]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceMovement_Invoice] FOREIGN KEY([InvoiceId])
REFERENCES [dbo].[Invoice] ([id])
GO
ALTER TABLE [dbo].[InvoiceMovement] CHECK CONSTRAINT [FK_InvoiceMovement_Invoice]
GO
ALTER TABLE [dbo].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_Exam] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([id])
GO
ALTER TABLE [dbo].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_Exam]
GO
ALTER TABLE [dbo].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_OrderConcept] FOREIGN KEY([OrderConceptId])
REFERENCES [dbo].[OrdersConcepts] ([Id])
GO
ALTER TABLE [dbo].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_OrderConcept]
GO
ALTER TABLE [dbo].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_Patient]
GO
ALTER TABLE [dbo].[Laboratory]  WITH CHECK ADD  CONSTRAINT [FK_Laboratory_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Laboratory] CHECK CONSTRAINT [FK_Laboratory_Status]
GO
ALTER TABLE [dbo].[MedicalIndication]  WITH CHECK ADD  CONSTRAINT [FK_MedicalIndication_Internment] FOREIGN KEY([InternmentId])
REFERENCES [dbo].[Internment] ([id])
GO
ALTER TABLE [dbo].[MedicalIndication] CHECK CONSTRAINT [FK_MedicalIndication_Internment]
GO
ALTER TABLE [dbo].[MedicalIndicationApplication]  WITH CHECK ADD  CONSTRAINT [FK_MedicalIndicationApplication_Applications] FOREIGN KEY([ApplicationId])
REFERENCES [dbo].[Applications] ([id])
GO
ALTER TABLE [dbo].[MedicalIndicationApplication] CHECK CONSTRAINT [FK_MedicalIndicationApplication_Applications]
GO
ALTER TABLE [dbo].[MedicalIndicationApplication]  WITH CHECK ADD  CONSTRAINT [FK_MedicalIndicationApplication_MedicalIndication] FOREIGN KEY([MedicalIndicationId])
REFERENCES [dbo].[MedicalIndication] ([id])
GO
ALTER TABLE [dbo].[MedicalIndicationApplication] CHECK CONSTRAINT [FK_MedicalIndicationApplication_MedicalIndication]
GO
ALTER TABLE [dbo].[MedicalNotes]  WITH CHECK ADD  CONSTRAINT [FK_MedicalNotes_Internment] FOREIGN KEY([InternmentId])
REFERENCES [dbo].[Internment] ([id])
GO
ALTER TABLE [dbo].[MedicalNotes] CHECK CONSTRAINT [FK_MedicalNotes_Internment]
GO
ALTER TABLE [dbo].[NurserySummary]  WITH CHECK ADD  CONSTRAINT [FK_NurserySummary_Internment] FOREIGN KEY([InternmentId])
REFERENCES [dbo].[Internment] ([id])
GO
ALTER TABLE [dbo].[NurserySummary] CHECK CONSTRAINT [FK_NurserySummary_Internment]
GO
ALTER TABLE [dbo].[NurserySummary]  WITH CHECK ADD  CONSTRAINT [FK_NurserySummary_NurseryMeasurements] FOREIGN KEY([NurseryMeasurementId])
REFERENCES [dbo].[NurseryMeasurements] ([id])
GO
ALTER TABLE [dbo].[NurserySummary] CHECK CONSTRAINT [FK_NurserySummary_NurseryMeasurements]
GO
ALTER TABLE [dbo].[OrderPackage]  WITH CHECK ADD  CONSTRAINT [FK_OrderPackage_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[OrderPackage] CHECK CONSTRAINT [FK_OrderPackage_Clinic]
GO
ALTER TABLE [dbo].[OrderPackage]  WITH CHECK ADD  CONSTRAINT [FK_OrderPackage_Employee] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[OrderPackage] CHECK CONSTRAINT [FK_OrderPackage_Employee]
GO
ALTER TABLE [dbo].[OrderPackage]  WITH CHECK ADD  CONSTRAINT [FK_OrderPackage_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderPackage] CHECK CONSTRAINT [FK_OrderPackage_Orders]
GO
ALTER TABLE [dbo].[OrderPackage]  WITH CHECK ADD  CONSTRAINT [FK_OrderPackage_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([id])
GO
ALTER TABLE [dbo].[OrderPackage] CHECK CONSTRAINT [FK_OrderPackage_Package]
GO
ALTER TABLE [dbo].[OrderPromotion]  WITH CHECK ADD  CONSTRAINT [FK_OrderPromotion_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[OrderPromotion] CHECK CONSTRAINT [FK_OrderPromotion_Concept]
GO
ALTER TABLE [dbo].[OrderPromotion]  WITH CHECK ADD  CONSTRAINT [FK_OrderPromotion_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrderPromotion] CHECK CONSTRAINT [FK_OrderPromotion_Order]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_order_employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_order_employee]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Clinic]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_EmployeeCancel] FOREIGN KEY([EmployeeCancelId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_EmployeeCancel]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_orders_patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_orders_patient]
GO
ALTER TABLE [dbo].[OrdersConcepts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersConcepts_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[OrdersConcepts] CHECK CONSTRAINT [FK_OrdersConcepts_Clinic]
GO
ALTER TABLE [dbo].[OrdersConcepts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersConcepts_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[OrdersConcepts] CHECK CONSTRAINT [FK_OrdersConcepts_Concept]
GO
ALTER TABLE [dbo].[OrdersConcepts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersConcepts_Employee] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[OrdersConcepts] CHECK CONSTRAINT [FK_OrdersConcepts_Employee]
GO
ALTER TABLE [dbo].[OrdersConcepts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersConcepts_orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[OrdersConcepts] CHECK CONSTRAINT [FK_OrdersConcepts_orders]
GO
ALTER TABLE [dbo].[OrdersConcepts]  WITH CHECK ADD  CONSTRAINT [FK_OrdersConcepts_Stock] FOREIGN KEY([Stockid])
REFERENCES [dbo].[Stock] ([id])
GO
ALTER TABLE [dbo].[OrdersConcepts] CHECK CONSTRAINT [FK_OrdersConcepts_Stock]
GO
ALTER TABLE [dbo].[Package]  WITH CHECK ADD  CONSTRAINT [FK_Package_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Package] CHECK CONSTRAINT [FK_Package_Category]
GO
ALTER TABLE [dbo].[PackageConcept]  WITH CHECK ADD  CONSTRAINT [FK_PackageConcept_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[PackageConcept] CHECK CONSTRAINT [FK_PackageConcept_Concept]
GO
ALTER TABLE [dbo].[PackageConcept]  WITH CHECK ADD  CONSTRAINT [FK_PackageConcept_Package] FOREIGN KEY([PackageId])
REFERENCES [dbo].[Package] ([id])
GO
ALTER TABLE [dbo].[PackageConcept] CHECK CONSTRAINT [FK_PackageConcept_Package]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_Patient_Person1] FOREIGN KEY([PersonId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_Patient_Person1]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Employee]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Orders] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Orders]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_PaymentType] FOREIGN KEY([PaymentTypeId])
REFERENCES [dbo].[PaymentType] ([id])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_PaymentType]
GO
ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Address]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Concept]
GO
ALTER TABLE [dbo].[ProductWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_ProductWarehouse_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([id])
GO
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_Product]
GO
ALTER TABLE [dbo].[ProductWarehouse]  WITH CHECK ADD  CONSTRAINT [FK_ProductWarehouse_Warehouse] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[ProductWarehouse] CHECK CONSTRAINT [FK_ProductWarehouse_Warehouse]
GO
ALTER TABLE [dbo].[RelAdvertisementFile]  WITH CHECK ADD  CONSTRAINT [FK_RelAdvertisementFile_Advertisement] FOREIGN KEY([AdvertisementId])
REFERENCES [dbo].[Advertisement] ([id])
GO
ALTER TABLE [dbo].[RelAdvertisementFile] CHECK CONSTRAINT [FK_RelAdvertisementFile_Advertisement]
GO
ALTER TABLE [dbo].[RelAdvertisementFile]  WITH CHECK ADD  CONSTRAINT [FK_RelAdvertisementFile_FileDb] FOREIGN KEY([FileId])
REFERENCES [dbo].[FileDb] ([id])
GO
ALTER TABLE [dbo].[RelAdvertisementFile] CHECK CONSTRAINT [FK_RelAdvertisementFile_FileDb]
GO
ALTER TABLE [dbo].[RelAdvertisementKeyword]  WITH CHECK ADD  CONSTRAINT [FK_RelAdvertisementKeyword_Advertisement] FOREIGN KEY([AdvertisementId])
REFERENCES [dbo].[Advertisement] ([id])
GO
ALTER TABLE [dbo].[RelAdvertisementKeyword] CHECK CONSTRAINT [FK_RelAdvertisementKeyword_Advertisement]
GO
ALTER TABLE [dbo].[RelAdvertisementKeyword]  WITH CHECK ADD  CONSTRAINT [FK_RelAdvertisementKeyword_Keywords] FOREIGN KEY([KeywordId])
REFERENCES [dbo].[Keywords] ([id])
GO
ALTER TABLE [dbo].[RelAdvertisementKeyword] CHECK CONSTRAINT [FK_RelAdvertisementKeyword_Keywords]
GO
ALTER TABLE [dbo].[RelConsultChronicDisease]  WITH CHECK ADD  CONSTRAINT [FK_RelConsultChronicDisease_ChronicDisease] FOREIGN KEY([idChronicDisease])
REFERENCES [dbo].[ChronicDisease] ([id])
GO
ALTER TABLE [dbo].[RelConsultChronicDisease] CHECK CONSTRAINT [FK_RelConsultChronicDisease_ChronicDisease]
GO
ALTER TABLE [dbo].[RelConsultChronicDisease]  WITH CHECK ADD  CONSTRAINT [FK_RelConsultChronicDisease_Consult] FOREIGN KEY([idConsult])
REFERENCES [dbo].[Consult] ([id])
GO
ALTER TABLE [dbo].[RelConsultChronicDisease] CHECK CONSTRAINT [FK_RelConsultChronicDisease_Consult]
GO
ALTER TABLE [dbo].[RelConsultDisease]  WITH CHECK ADD  CONSTRAINT [FK_RelConsultDisease_Consult] FOREIGN KEY([idConsult])
REFERENCES [dbo].[Consult] ([id])
GO
ALTER TABLE [dbo].[RelConsultDisease] CHECK CONSTRAINT [FK_RelConsultDisease_Consult]
GO
ALTER TABLE [dbo].[RelConsultDisease]  WITH CHECK ADD  CONSTRAINT [FK_RelConsultDisease_Disease] FOREIGN KEY([idDisease])
REFERENCES [dbo].[Disease] ([id])
GO
ALTER TABLE [dbo].[RelConsultDisease] CHECK CONSTRAINT [FK_RelConsultDisease_Disease]
GO
ALTER TABLE [dbo].[RelLaboratoryFile]  WITH CHECK ADD  CONSTRAINT [FK_RelLaboratoryFile_File] FOREIGN KEY([FileId])
REFERENCES [dbo].[FileDb] ([id])
GO
ALTER TABLE [dbo].[RelLaboratoryFile] CHECK CONSTRAINT [FK_RelLaboratoryFile_File]
GO
ALTER TABLE [dbo].[RelLaboratoryFile]  WITH CHECK ADD  CONSTRAINT [FK_RelLaboratoryFile_Laboratory] FOREIGN KEY([LaboratoyId])
REFERENCES [dbo].[Laboratory] ([id])
GO
ALTER TABLE [dbo].[RelLaboratoryFile] CHECK CONSTRAINT [FK_RelLaboratoryFile_Laboratory]
GO
ALTER TABLE [dbo].[RequestedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RequestedMaterial_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[RequestedMaterial] CHECK CONSTRAINT [FK_RequestedMaterial_Concept]
GO
ALTER TABLE [dbo].[RequestedMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RequestedMaterial_Request] FOREIGN KEY([RequestId])
REFERENCES [dbo].[RequestMaterial] ([id])
GO
ALTER TABLE [dbo].[RequestedMaterial] CHECK CONSTRAINT [FK_RequestedMaterial_Request]
GO
ALTER TABLE [dbo].[RequestMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RequestMaterial_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[RequestMaterial] CHECK CONSTRAINT [FK_RequestMaterial_Clinic]
GO
ALTER TABLE [dbo].[RequestMaterial]  WITH CHECK ADD  CONSTRAINT [FK_RequestMaterial_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[RequestMaterial] CHECK CONSTRAINT [FK_RequestMaterial_Status]
GO
ALTER TABLE [dbo].[RoleMenuView]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenuView_MenuView] FOREIGN KEY([MenuViewId])
REFERENCES [dbo].[MenuView] ([id])
GO
ALTER TABLE [dbo].[RoleMenuView] CHECK CONSTRAINT [FK_RoleMenuView_MenuView]
GO
ALTER TABLE [dbo].[RoleMenuView]  WITH CHECK ADD  CONSTRAINT [FK_RoleMenuView_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[RoleMenuView] CHECK CONSTRAINT [FK_RoleMenuView_Role]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_DayOfWeek] FOREIGN KEY([DayOfWeekId])
REFERENCES [dbo].[DayOfWeek] ([id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_DayOfWeek]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_Employee] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_Employee]
GO
ALTER TABLE [dbo].[Schedule]  WITH CHECK ADD  CONSTRAINT [FK_Schedule_HoursOfDay] FOREIGN KEY([HourOfDayId])
REFERENCES [dbo].[HoursOfDay] ([id])
GO
ALTER TABLE [dbo].[Schedule] CHECK CONSTRAINT [FK_Schedule_HoursOfDay]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Clinic]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Concept]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Medic] FOREIGN KEY([MedicId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Medic]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Nurse] FOREIGN KEY([NurseId])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Nurse]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Orders] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Order]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_OrderConcept] FOREIGN KEY([OrderConceptId])
REFERENCES [dbo].[OrdersConcepts] ([Id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_OrderConcept]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Patient]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Status]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Clinic]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Concept]
GO
ALTER TABLE [dbo].[Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[Supplier] CHECK CONSTRAINT [FK_Supplier_Address]
GO
ALTER TABLE [dbo].[Test]  WITH CHECK ADD  CONSTRAINT [FK_Test_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[Test] CHECK CONSTRAINT [FK_Test_Concept]
GO
ALTER TABLE [dbo].[UserMenuView]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuView_MenuView] FOREIGN KEY([MenuViewId])
REFERENCES [dbo].[MenuView] ([id])
GO
ALTER TABLE [dbo].[UserMenuView] CHECK CONSTRAINT [FK_UserMenuView_MenuView]
GO
ALTER TABLE [dbo].[UserMenuView]  WITH CHECK ADD  CONSTRAINT [FK_UserMenuView_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserMenuView] CHECK CONSTRAINT [FK_UserMenuView_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_User_Role_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_User_Role_User]
GO
ALTER TABLE [dbo].[WarehouseSuply]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseSuply_Clinic] FOREIGN KEY([ClinicId])
REFERENCES [dbo].[Clinic] ([id])
GO
ALTER TABLE [dbo].[WarehouseSuply] CHECK CONSTRAINT [FK_WarehouseSuply_Clinic]
GO
ALTER TABLE [dbo].[WarehouseSuply]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseSuply_Concept] FOREIGN KEY([ConceptId])
REFERENCES [dbo].[Concept] ([id])
GO
ALTER TABLE [dbo].[WarehouseSuply] CHECK CONSTRAINT [FK_WarehouseSuply_Concept]
GO
ALTER TABLE [dbo].[WarehouseSuply]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseSuply_Employee] FOREIGN KEY([Employeid])
REFERENCES [dbo].[Employee] ([id])
GO
ALTER TABLE [dbo].[WarehouseSuply] CHECK CONSTRAINT [FK_WarehouseSuply_Employee]
GO
ALTER TABLE [dbo].[WarehouseSuply]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseSuply_Stock] FOREIGN KEY([StockId])
REFERENCES [dbo].[Stock] ([id])
GO
ALTER TABLE [dbo].[WarehouseSuply] CHECK CONSTRAINT [FK_WarehouseSuply_Stock]
GO
ALTER TABLE [dbo].[WarehouseSuply]  WITH CHECK ADD  CONSTRAINT [FK_WarehouseSuply_Warehouse] FOREIGN KEY([WarehouseId])
REFERENCES [dbo].[Warehouse] ([id])
GO
ALTER TABLE [dbo].[WarehouseSuply] CHECK CONSTRAINT [FK_WarehouseSuply_Warehouse]
GO
ALTER TABLE [dbo].[Xray]  WITH CHECK ADD  CONSTRAINT [FK_Xray_Exam] FOREIGN KEY([ExamId])
REFERENCES [dbo].[Exam] ([id])
GO
ALTER TABLE [dbo].[Xray] CHECK CONSTRAINT [FK_Xray_Exam]
GO
ALTER TABLE [dbo].[Xray]  WITH CHECK ADD  CONSTRAINT [FK_Xray_OrderConcept] FOREIGN KEY([OrderConceptId])
REFERENCES [dbo].[OrdersConcepts] ([Id])
GO
ALTER TABLE [dbo].[Xray] CHECK CONSTRAINT [FK_Xray_OrderConcept]
GO
ALTER TABLE [dbo].[Xray]  WITH CHECK ADD  CONSTRAINT [FK_Xray_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([id])
GO
ALTER TABLE [dbo].[Xray] CHECK CONSTRAINT [FK_Xray_Patient]
GO
ALTER TABLE [dbo].[Xray]  WITH CHECK ADD  CONSTRAINT [FK_Xray_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([id])
GO
ALTER TABLE [dbo].[Xray] CHECK CONSTRAINT [FK_Xray_Status]
GO
/****** Object:  Trigger [dbo].[trg_InsertAddress]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertAddress]
ON [dbo].[Address]
AFTER INSERT
AS
    UPDATE dbo.Address
    SET Updated = GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateAddress]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateAddress]
ON [dbo].[Address]
AFTER UPDATE
AS
    UPDATE dbo.Address
    SET Updated = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertClinic]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertClinic]
ON [dbo].[Clinic]
AFTER INSERT
AS
    UPDATE dbo.Clinic
    SET Updated = GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateClinic]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateClinic]
ON [dbo].[Clinic]
AFTER UPDATE
AS
    UPDATE dbo.Clinic
    SET Updated = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateConcept]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateConcept]
ON [dbo].[Concept]
AFTER UPDATE
AS
    UPDATE [dbo].[Concept]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertCounty]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_InsertCounty]
ON [dbo].[County]
AFTER INSERT
AS
    UPDATE dbo.County
    SET Updated = GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateCounty]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_UpdateCounty]
ON [dbo].[County]
AFTER UPDATE
AS
    UPDATE dbo.County
    SET Updated = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertDisease]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_InsertDisease]
ON [dbo].[Disease]
AFTER INSERT
AS
    UPDATE dbo.Disease
    SET Updated = GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateDisease]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_UpdateDisease]
ON [dbo].[Disease]
AFTER UPDATE
AS
    UPDATE dbo.Disease
    SET Updated = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertEmployee]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertEmployee]
ON [dbo].[Employee]
AFTER INSERT
AS
    UPDATE [dbo].[Employee]
    SET Updated = GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateEmployee]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateEmployee]
ON [dbo].[Employee]
AFTER UPDATE
AS
    UPDATE [dbo].[Employee]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertPatient]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_InsertPatient]
ON [dbo].[Patient]
AFTER INSERT
AS
    UPDATE [dbo].[Patient]
    SET Updated= GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdatePatient]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdatePatient]
ON [dbo].[Patient]
AFTER UPDATE
AS
    UPDATE [dbo].[Patient]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertPerson]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertPerson]
ON [dbo].[Person]
AFTER INSERT
AS
    UPDATE [dbo].[Person]
    SET Updated= GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdatePerson]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdatePerson]
ON [dbo].[Person]
AFTER UPDATE
AS
    UPDATE [dbo].[Person]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertSpecialty]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_InsertSpecialty]
ON [dbo].[Specialty]
AFTER INSERT
AS
    UPDATE [dbo].[Specialty]
    SET Updated = GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateSpecialty]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateSpecialty]
ON [dbo].[Specialty]
AFTER UPDATE
AS
    UPDATE [dbo].[Specialty]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateSupplier]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_UpdateSupplier]
ON [dbo].[Supplier]
AFTER UPDATE
AS
    UPDATE [dbo].[Supplier]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertUser]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_InsertUser]
ON [dbo].[User]
AFTER INSERT
AS
    UPDATE [dbo].[User]
    SET UpdatedDate = GETDATE()
	,
	CreatedDate = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateUser]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateUser]
ON [dbo].[User]
AFTER UPDATE
AS
    UPDATE dbo.[User]
    SET UpdatedDate = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_InsertWarehouse]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[trg_InsertWarehouse]
ON [dbo].[Warehouse]
AFTER INSERT
AS
    UPDATE [dbo].[Warehouse]
    SET Updated= GETDATE()
	,
	Created = GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
/****** Object:  Trigger [dbo].[trg_UpdateWarehouse]    Script Date: 03/06/2018 5:23:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[trg_UpdateWarehouse]
ON [dbo].[Warehouse]
AFTER UPDATE
AS
    UPDATE [dbo].[Warehouse]
    SET Updated= GETDATE()
    WHERE id IN (SELECT DISTINCT id FROM Inserted)

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAllConcepts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwAllConcepts'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 136
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCancelledTickets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCancelledTickets'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "cd"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rcd"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 426
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 464
               Bottom = 136
               Right = 652
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 690
               Bottom = 136
               Right = 860
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 898
               Bottom = 136
               Right = 1068
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "coun"
            Begin Extent = 
               Top = 102
               Left = 246
               Bottom = 232
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 5235
         Table = 1170
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwChronicDiseasePatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'       Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwChronicDiseasePatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwChronicDiseasePatients'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Orders"
            Begin Extent = 
               Top = 27
               Left = 631
               Bottom = 157
               Right = 818
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrdersConcepts"
            Begin Extent = 
               Top = 11
               Left = 326
               Bottom = 141
               Right = 496
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Concept"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 170
               Left = 237
               Bottom = 300
               Right = 407
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrderPackage"
            Begin Extent = 
               Top = 6
               Left = 856
               Bottom = 136
               Right = 1026
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Package"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 138
               Left = 856
               Bottom = 268
               Right = 1026
            End
            DisplayFlags' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwConceptProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 11880
         Alias = 4725
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwConceptProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwConceptProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "oc"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ca"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 270
               Left = 246
               Bottom = 400
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "coun"
            Begin Extent = 
               Top = 402
               Left = 38
               Bottom = 532
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         E' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCountyServices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'nd
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCountyServices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwCountyServices'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "d"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "rcd"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 102
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 642
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 680
               Bottom = 136
               Right = 850
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "per"
            Begin Extent = 
               Top = 6
               Left = 888
               Bottom = 136
               Right = 1058
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 3615
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwHealthReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwHealthReport'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pa"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pepa"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "op"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pk"
            Begin Extent = 
               Top = 6
               Left = 870
               Bottom = 136
               Right = 1040
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "emp"
            Begin Extent = 
               Top = 6
               Left = 1078
               Bottom = 136
               Right = 1248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "peemp"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInternment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'   End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInternment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwInternment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 218
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 256
               Bottom = 136
               Right = 430
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 468
               Bottom = 136
               Right = 638
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pp"
            Begin Extent = 
               Top = 6
               Left = 676
               Bottom = 136
               Right = 846
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "med"
            Begin Extent = 
               Top = 6
               Left = 884
               Bottom = 136
               Right = 1054
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pe"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 251
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwLaboratoryXray'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "oc"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 268
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "co"
            Begin Extent = 
               Top = 138
               Left = 662
               Bottom = 268
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cli"
            Begin Extent = 
               Top = 138
               Left = 870
               Bottom = 268
               Right = 1043
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwLaboratoryXray'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwLaboratoryXray'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserRole"
            Begin Extent = 
               Top = 201
               Left = 247
               Bottom = 297
               Right = 417
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 160
               Left = 43
               Bottom = 273
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Concept"
            Begin Extent = 
               Top = 0
               Left = 250
               Bottom = 130
               Right = 420
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrdersConcepts"
            Begin Extent = 
               Top = 2
               Left = 526
               Bottom = 132
               Right = 696
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 0
               Left = 12
               Bottom = 130
               Right = 182
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 21
               Left = 753
               Bottom = 151
               Right = 923
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 143
               Left = 960
               Bottom = 273
               Right = 1130
            End
            DisplayFlags =' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMedicProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' 280
            TopColumn = 1
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 276
               Left = 38
               Bottom = 406
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2010
         Table = 2100
         Output = 1830
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 2880
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMedicProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMedicProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "UserRole"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Role"
            Begin Extent = 
               Top = 136
               Left = 267
               Bottom = 249
               Right = 437
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Concept"
            Begin Extent = 
               Top = 166
               Left = 545
               Bottom = 296
               Right = 715
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "OrdersConcepts"
            Begin Extent = 
               Top = 181
               Left = 933
               Bottom = 311
               Right = 1103
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Category"
            Begin Extent = 
               Top = 205
               Left = 751
               Bottom = 335
               Right = 921
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employee"
            Begin Extent = 
               Top = 31
               Left = 585
               Bottom = 126
               Right = 755
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 248
               Left = 265
               Bottom = 378
               Right = 435
            End
            DisplayFl' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPharmacyProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'ags = 280
            TopColumn = 0
         End
         Begin Table = "User"
            Begin Extent = 
               Top = 4
               Left = 282
               Bottom = 134
               Right = 452
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Orders"
            Begin Extent = 
               Top = 10
               Left = 852
               Bottom = 140
               Right = 1039
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPharmacyProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwPharmacyProductivity'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "o"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 433
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 471
               Bottom = 136
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 2790
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRoundings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwRoundings'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[32] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "a"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pp"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 136
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "cl"
            Begin Extent = 
               Top = 6
               Left = 662
               Bottom = 136
               Right = 835
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "e"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pe"
            Begin Extent = 
               Top = 138
               Left = 246
               Bottom = 268
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 138
               Left = 454
               Bottom = 251
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "co"
            Begin Extent = 
               Top = 138
               Left = 662
               Bottom = 268
               Right = 832
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ca"
            Begin Extent = 
               Top = 252
               Left = 454
               Bottom = 382
               Right = 624
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "o"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 400
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwSchedule'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "c"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "p"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 453
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "pw"
            Begin Extent = 
               Top = 6
               Left = 491
               Bottom = 119
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "w"
            Begin Extent = 
               Top = 6
               Left = 715
               Bottom = 136
               Right = 901
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "s"
            Begin Extent = 
               Top = 6
               Left = 939
               Bottom = 136
               Right = 1125
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ws"
            Begin Extent = 
               Top = 6
               Left = 1163
               Bottom = 119
               Right = 1349
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "im"
            Begin Extent = 
               Top = 120
               Left = 491
               Bottom = 233
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWarehouseStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'         Begin Table = "Clinic"
            Begin Extent = 
               Top = 120
               Left = 1163
               Bottom = 250
               Right = 1352
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWarehouseStock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwWarehouseStock'
GO
USE [master]
GO
ALTER DATABASE [dbINMEDIK] SET  READ_WRITE 
GO
