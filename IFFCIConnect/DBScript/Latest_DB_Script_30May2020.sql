USE [master]
GO
/****** Object:  Database [TempIFCCI]    Script Date: 5/30/2020 12:52:09 AM ******/
CREATE DATABASE [TempIFCCI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TempIFCCI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TempIFCCI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TempIFCCI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TempIFCCI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TempIFCCI] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TempIFCCI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TempIFCCI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TempIFCCI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TempIFCCI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TempIFCCI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TempIFCCI] SET ARITHABORT OFF 
GO
ALTER DATABASE [TempIFCCI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TempIFCCI] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TempIFCCI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TempIFCCI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TempIFCCI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TempIFCCI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TempIFCCI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TempIFCCI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TempIFCCI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TempIFCCI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TempIFCCI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TempIFCCI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TempIFCCI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TempIFCCI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TempIFCCI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TempIFCCI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TempIFCCI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TempIFCCI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TempIFCCI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TempIFCCI] SET  MULTI_USER 
GO
ALTER DATABASE [TempIFCCI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TempIFCCI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TempIFCCI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TempIFCCI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TempIFCCI', N'ON'
GO
USE [TempIFCCI]
GO
/****** Object:  Table [dbo].[CountryMaster]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CountryMaster](
	[Id_CountryMaster] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Country_Master_pk] PRIMARY KEY CLUSTERED 
(
	[Id_CountryMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployerAccount]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployerAccount](
	[Id_EmployerAccount] [int] IDENTITY(1,1) NOT NULL,
	[user_type_id] [int] NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](200) NOT NULL,
	[Company_Name] [varchar](500) NOT NULL,
	[Industry] [varchar](500) NOT NULL,
	[Org_Type] [varchar](500) NOT NULL,
	[Landline_Phone] [varchar](20) NOT NULL,
	[Contact_Number] [varchar](20) NOT NULL,
	[Company_Address] [varchar](max) NULL,
	[Company_website_URL] [varchar](max) NULL,
	[Company_Video] [varchar](max) NULL,
	[Number_of_Employees] [varchar](50) NOT NULL,
	[Company_Description] [varchar](max) NULL,
	[Is_active] [bit] NOT NULL,
	[Full_Name] [varchar](100) NOT NULL,
	[Email_notification_active] [bit] NULL,
	[registration_date] [datetime] NOT NULL,
	[SMS_notification_active] [bit] NULL,
	[GST_Number] [varchar](500) NULL,
	[Designation] [varchar](500) NULL,
	[Company_logo] [varchar](255) NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[ClientIP] [varchar](500) NULL,
 CONSTRAINT [Tbl_Employer_Account_pk] PRIMARY KEY CLUSTERED 
(
	[Id_EmployerAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployerCVsReview]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployerCVsReview](
	[Id_EmployerCVsReview] [int] IDENTITY(1,1) NOT NULL,
	[JobPost_id] [int] NOT NULL,
	[Employer_id] [int] NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[SeekerJobApplyDateTime] [datetime] NULL,
	[SeekerScheduleInterviewDateTime] [datetime] NULL,
	[IsAcceptByEmployer] [bit] NULL,
	[IsRejectByEmployer] [bit] NULL,
	[IsAcceptBySeeker] [bit] NULL,
	[IsRejectBySeeker] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_Employer_CVsReview_pk] PRIMARY KEY CLUSTERED 
(
	[Id_EmployerCVsReview] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmployerJobPost]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmployerJobPost](
	[Id_EmployerJobPost] [int] IDENTITY(1,1) NOT NULL,
	[Employer_id] [int] NOT NULL,
	[Experince] [nvarchar](max) NULL,
	[Skills_set] [nvarchar](max) NULL,
	[NoOfOpening] [nvarchar](max) NULL,
	[JobTitle] [nvarchar](max) NULL,
	[JobPostDateTime] [datetime] NULL,
	[JobFile] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_Employer_JobPost_pk] PRIMARY KEY CLUSTERED 
(
	[Id_EmployerJobPost] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndustryMaster]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IndustryMaster](
	[Id_IndustryMaster] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Industry_Master_pk] PRIMARY KEY CLUSTERED 
(
	[Id_IndustryMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MyAppointments]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MyAppointments](
	[Id_MyAppointments] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[EmployerName] [nvarchar](max) NULL,
	[JobTitle] [nvarchar](max) NULL,
	[DateTime] [datetime] NULL,
	[Status] [nvarchar](max) NULL,
	[Action] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_SkillsMyAppointments_pk] PRIMARY KEY CLUSTERED 
(
	[Id_MyAppointments] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NumberOfEmployeeMaster]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NumberOfEmployeeMaster](
	[Id_NumberOfEmployeeMaster] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [NumberOfEmployee_Master_pk] PRIMARY KEY CLUSTERED 
(
	[Id_NumberOfEmployeeMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrganizationMaster]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrganizationMaster](
	[Id_OrganizationMaster] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Organization_Master_pk] PRIMARY KEY CLUSTERED 
(
	[Id_OrganizationMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeekerAccount]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeekerAccount](
	[Id_SeekerAccount] [int] IDENTITY(1,1) NOT NULL,
	[user_type_id] [int] NOT NULL,
	[email] [varchar](255) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[gender] [char](1) NOT NULL,
	[Is_active] [bit] NOT NULL,
	[contact_number] [varchar](20) NOT NULL,
	[Full_Name] [varchar](100) NOT NULL,
	[email_notification_active] [bit] NULL,
	[Home_Phone] [varchar](20) NULL,
	[registration_date] [datetime] NOT NULL,
	[Location] [varchar](100) NOT NULL,
	[City] [varchar](100) NOT NULL,
	[Nationality] [varchar](100) NOT NULL,
	[ResumeFileName] [varchar](100) NOT NULL,
	[Current_Address] [varchar](1000) NOT NULL,
	[SMS_notification_active] [bit] NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
	[ClientIP] [varchar](500) NULL,
	[LastLoginDate] [datetime] NULL,
 CONSTRAINT [Tbl_Seeker_account_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SeekerAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeekerEducationDetails]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeekerEducationDetails](
	[Id_SeekerEducationDetails] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[Certificate_Degree_Name] [varchar](255) NULL,
	[Major_Subjects] [nvarchar](max) NULL,
	[Institute_University_Name] [nvarchar](max) NULL,
	[Starting_Date] [date] NULL,
	[Completion_Date] [date] NULL,
	[Percentage] [varchar](255) NULL,
	[CGPA] [varchar](255) NULL,
	[Is_active] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_Seeker_EducationDetails_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SeekerEducationDetails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeekerExperinceDetails]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeekerExperinceDetails](
	[Id_SeekerExperinceDetails] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[Is_Current_Job] [bit] NULL,
	[Start_Date] [date] NULL,
	[End_Date] [date] NULL,
	[Job_Title] [varchar](max) NULL,
	[Company_Name] [nvarchar](max) NULL,
	[Job_Location_City] [nvarchar](max) NULL,
	[Job_Location_State] [nvarchar](max) NULL,
	[Job_Location_Country] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_Seeker_ExperinceDetails_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SeekerExperinceDetails] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeekerMyAdditionalInformation]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeekerMyAdditionalInformation](
	[Id_SeekerMyAdditionalInformation] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[Interest] [nvarchar](max) NULL,
	[Carreer_Objective] [nvarchar](max) NULL,
	[Achievements] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_Seeker_MyAdditional_Information_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SeekerMyAdditionalInformation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SeekerProfessionalSummary]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SeekerProfessionalSummary](
	[Id_SeekerProfessionalSummary] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[Professional_Summary] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_Seeker_Professional_Summary_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SeekerProfessionalSummary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillsMaster]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SkillsMaster](
	[Id_SkillsMaster] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_SkillsMaster_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SkillsMaster] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SkillsSet]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SkillsSet](
	[Id_SkillsSet] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_Id] [int] NOT NULL,
	[Skill_Id] [int] NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[Other] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_SkillsSet_pk] PRIMARY KEY CLUSTERED 
(
	[Id_SkillsSet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserType]    Script Date: 5/30/2020 12:52:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserType](
	[Id_UserType] [int] IDENTITY(1,1) NOT NULL,
	[user_type_name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[User_Type] [char](1) NOT NULL,
	[CreatedBy] [varchar](500) NULL,
	[CreatedOn] [datetime] NULL,
	[ModifiedBy] [varchar](500) NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [Tbl_User_Type_pk] PRIMARY KEY CLUSTERED 
(
	[Id_UserType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[EmployerAccount] ON 

INSERT [dbo].[EmployerAccount] ([Id_EmployerAccount], [user_type_id], [Email], [Password], [Company_Name], [Industry], [Org_Type], [Landline_Phone], [Contact_Number], [Company_Address], [Company_website_URL], [Company_Video], [Number_of_Employees], [Company_Description], [Is_active], [Full_Name], [Email_notification_active], [registration_date], [SMS_notification_active], [GST_Number], [Designation], [Company_logo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [LastLoginDate], [ClientIP]) VALUES (1, 2, N'lok@yopmail.com', N'bvA6UgkzjEI14D29DiVeIywFSKy6WwdF', N'abcghh', N'Sales', N'Organization Type*', N'9858670518', N'9958670518', NULL, NULL, NULL, N'Number of Employees*', NULL, 0, N'saikass', NULL, CAST(0x0000ABCA017FE511 AS DateTime), NULL, N'1234123478', N'softujikkkkh', N'MyCompanyLogo_cd8596371da0450e860fe7b012e64515.png', NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[EmployerAccount] ([Id_EmployerAccount], [user_type_id], [Email], [Password], [Company_Name], [Industry], [Org_Type], [Landline_Phone], [Contact_Number], [Company_Address], [Company_website_URL], [Company_Video], [Number_of_Employees], [Company_Description], [Is_active], [Full_Name], [Email_notification_active], [registration_date], [SMS_notification_active], [GST_Number], [Designation], [Company_logo], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [LastLoginDate], [ClientIP]) VALUES (2, 2, N'yuop@yopmail.com', N'bvA6UgkzjEI14D29DiVeIywFSKy6WwdF', N'kjdlkjladjasld', N'IT', N'Organization Type*', N'7678123456', N'9898976789', NULL, NULL, NULL, N'Number of Employees*', NULL, 0, N'popopopo', NULL, CAST(0x0000ABCB000D3306 AS DateTime), NULL, N'78787812345', N'asjaskjskjs', N'MyCompanyLogo_81abf33f812f4637b3c43b7ddf679732.png', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[EmployerAccount] OFF
SET IDENTITY_INSERT [dbo].[SeekerAccount] ON 

INSERT [dbo].[SeekerAccount] ([Id_SeekerAccount], [user_type_id], [email], [password], [date_of_birth], [gender], [Is_active], [contact_number], [Full_Name], [email_notification_active], [Home_Phone], [registration_date], [Location], [City], [Nationality], [ResumeFileName], [Current_Address], [SMS_notification_active], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ClientIP], [LastLoginDate]) VALUES (2, 1, N'aswal@yopmail.com', N'bvA6UgkzjEI14D29DiVeIywFSKy6WwdF', CAST(0xB1400B00 AS Date), N'M', 0, N'9958670518', N'sachin', NULL, N'9958670518', CAST(0x0000ABCA017BA62D AS DateTime), N'India', N'fd', N'US', N'sachin.docx', N'asasn', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[SeekerAccount] ([Id_SeekerAccount], [user_type_id], [email], [password], [date_of_birth], [gender], [Is_active], [contact_number], [Full_Name], [email_notification_active], [Home_Phone], [registration_date], [Location], [City], [Nationality], [ResumeFileName], [Current_Address], [SMS_notification_active], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn], [ClientIP], [LastLoginDate]) VALUES (3, 1, N'ujuju@yopmail.com', N'bvA6UgkzjEI14D29DiVeIywFSKy6WwdF', CAST(0xB7400B00 AS Date), N'M', 0, N'1234567890', N'tuasass', NULL, N'7878789867', CAST(0x0000ABCB000CD024 AS DateTime), N'US', N'ujhtgyk', N'India', N'MyResume_e4acc253630f43368e558f4a0e622a5c.pdf', N'assasaa', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[SeekerAccount] OFF
SET IDENTITY_INSERT [dbo].[UserType] ON 

INSERT [dbo].[UserType] ([Id_UserType], [user_type_name], [IsActive], [User_Type], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (1, N'SEEKER', 1, N'U', NULL, NULL, NULL, NULL)
INSERT [dbo].[UserType] ([Id_UserType], [user_type_name], [IsActive], [User_Type], [CreatedBy], [CreatedOn], [ModifiedBy], [ModifiedOn]) VALUES (2, N'EMPLOYER', 1, N'E', NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[UserType] OFF
ALTER TABLE [dbo].[EmployerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Employer_Account_Tbl_User_Type] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[UserType] ([Id_UserType])
GO
ALTER TABLE [dbo].[EmployerAccount] CHECK CONSTRAINT [FK_Tbl_Employer_Account_Tbl_User_Type]
GO
ALTER TABLE [dbo].[EmployerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_User_TypeTbl_Employer_Account] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[UserType] ([Id_UserType])
GO
ALTER TABLE [dbo].[EmployerAccount] CHECK CONSTRAINT [FK_Tbl_User_TypeTbl_Employer_Account]
GO
ALTER TABLE [dbo].[EmployerCVsReview]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Employer_AccountTbl_Employer_CVsReview] FOREIGN KEY([Employer_id])
REFERENCES [dbo].[EmployerAccount] ([Id_EmployerAccount])
GO
ALTER TABLE [dbo].[EmployerCVsReview] CHECK CONSTRAINT [FK_Tbl_Employer_AccountTbl_Employer_CVsReview]
GO
ALTER TABLE [dbo].[EmployerCVsReview]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Employer_CVsReview] FOREIGN KEY([Seeker_id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[EmployerCVsReview] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Employer_CVsReview]
GO
ALTER TABLE [dbo].[EmployerJobPost]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Employer_AccountTbl_Employer_JobPost] FOREIGN KEY([Employer_id])
REFERENCES [dbo].[EmployerAccount] ([Id_EmployerAccount])
GO
ALTER TABLE [dbo].[EmployerJobPost] CHECK CONSTRAINT [FK_Tbl_Employer_AccountTbl_Employer_JobPost]
GO
ALTER TABLE [dbo].[MyAppointments]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_SkillsMyAppointments] FOREIGN KEY([Seeker_id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[MyAppointments] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_SkillsMyAppointments]
GO
ALTER TABLE [dbo].[SeekerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_User_TypeTbl_Seeker_Account] FOREIGN KEY([user_type_id])
REFERENCES [dbo].[UserType] ([Id_UserType])
GO
ALTER TABLE [dbo].[SeekerAccount] CHECK CONSTRAINT [FK_Tbl_User_TypeTbl_Seeker_Account]
GO
ALTER TABLE [dbo].[SeekerEducationDetails]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_EducationDetails] FOREIGN KEY([Seeker_id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[SeekerEducationDetails] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_EducationDetails]
GO
ALTER TABLE [dbo].[SeekerExperinceDetails]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_ExperinceDetails] FOREIGN KEY([Seeker_id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[SeekerExperinceDetails] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_ExperinceDetails]
GO
ALTER TABLE [dbo].[SeekerMyAdditionalInformation]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_MyAdditional_Information] FOREIGN KEY([Seeker_id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[SeekerMyAdditionalInformation] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_MyAdditional_Information]
GO
ALTER TABLE [dbo].[SeekerProfessionalSummary]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_Professional_Summary] FOREIGN KEY([Seeker_id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[SeekerProfessionalSummary] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_Seeker_Professional_Summary]
GO
ALTER TABLE [dbo].[SkillsSet]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Seeker_AccountTbl_SkillsSet] FOREIGN KEY([Seeker_Id])
REFERENCES [dbo].[SeekerAccount] ([Id_SeekerAccount])
GO
ALTER TABLE [dbo].[SkillsSet] CHECK CONSTRAINT [FK_Tbl_Seeker_AccountTbl_SkillsSet]
GO
USE [master]
GO
ALTER DATABASE [TempIFCCI] SET  READ_WRITE 
GO
