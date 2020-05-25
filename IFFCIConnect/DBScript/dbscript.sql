USE [master]
GO
/****** Object:  Database [IFCCI]    Script Date: 5/25/2020 7:25:53 PM ******/
CREATE DATABASE [IFCCI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IFCCI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\IFCCI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'IFCCI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\IFCCI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [IFCCI] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IFCCI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IFCCI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IFCCI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IFCCI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IFCCI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IFCCI] SET ARITHABORT OFF 
GO
ALTER DATABASE [IFCCI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IFCCI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IFCCI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IFCCI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IFCCI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IFCCI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IFCCI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IFCCI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IFCCI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IFCCI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IFCCI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IFCCI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IFCCI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IFCCI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IFCCI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IFCCI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IFCCI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IFCCI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IFCCI] SET  MULTI_USER 
GO
ALTER DATABASE [IFCCI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IFCCI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IFCCI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IFCCI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [IFCCI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [IFCCI] SET QUERY_STORE = OFF
GO
USE [IFCCI]
GO
/****** Object:  Table [dbo].[Country_Master]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [Country_Master_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Industry_Master]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Industry_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [Industry_Master_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberOfEmployee_Master]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberOfEmployee_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [NumberOfEmployee_Master_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization_Master]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization_Master](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [Organization_Master_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Employer_Account]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Employer_Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [Tbl_Employer_Account_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Employer_CVsReview]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Employer_CVsReview](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [Tbl_Employer_CVsReview_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Employer_JobPost]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Employer_JobPost](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Employer_id] [int] NOT NULL,
	[Experince] [nvarchar](max) NULL,
	[Skills_set] [nvarchar](max) NULL,
	[NoOfOpening] [nvarchar](max) NULL,
	[JobTitle] [nvarchar](max) NULL,
	[JobPostDateTime] [datetime] NULL,
	[JobFile] [nvarchar](max) NULL,
	[Status] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [Tbl_Employer_JobPost_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Seeker_Account]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Seeker_Account](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [Tbl_Seeker_account_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Seeker_EducationDetails]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Seeker_EducationDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [Tbl_Seeker_EducationDetails_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Seeker_ExperinceDetails]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Seeker_ExperinceDetails](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [Tbl_Seeker_ExperinceDetails_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Seeker_MyAdditional_Information]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Seeker_MyAdditional_Information](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[Interest] [nvarchar](max) NULL,
	[Carreer_Objective] [nvarchar](max) NULL,
	[Achievements] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [Tbl_Seeker_MyAdditional_Information_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Seeker_Professional_Summary]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Seeker_Professional_Summary](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[Professional_Summary] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [Tbl_Seeker_Professional_Summary_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SkillsMaster]    Script Date: 5/25/2020 7:25:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SkillsMaster](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [Tbl_SkillsMaster_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SkillsMyAppointments]    Script Date: 5/25/2020 7:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SkillsMyAppointments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Seeker_id] [int] NOT NULL,
	[EmployerName] [nvarchar](max) NULL,
	[JobTitle] [nvarchar](max) NULL,
	[DateTime] [datetime] NULL,
	[Status] [nvarchar](max) NULL,
	[Action] [bit] NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [Tbl_SkillsMyAppointments_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_SkillsSet]    Script Date: 5/25/2020 7:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_SkillsSet](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[User_Id] [int] NOT NULL,
	[Skill_Id] [int] NOT NULL,
	[SkillName] [nvarchar](max) NULL,
	[Other] [nvarchar](max) NULL,
	[IsActive] [bit] NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [Tbl_SkillsSet_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_User_Type]    Script Date: 5/25/2020 7:25:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_User_Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_type_name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserType] [char](1) NOT NULL,
 CONSTRAINT [Tbl_User_Type_pk] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [IFCCI] SET  READ_WRITE 
GO
