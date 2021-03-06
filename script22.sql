USE [master]
GO
/****** Object:  Database [SportsEquipment]    Script Date: 3/22/2014 11:07:52 PM ******/
CREATE DATABASE [SportsEquipment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportsEquipment', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SportsEquipment.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SportsEquipment_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\SportsEquipment_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SportsEquipment] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportsEquipment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportsEquipment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportsEquipment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportsEquipment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportsEquipment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportsEquipment] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportsEquipment] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SportsEquipment] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SportsEquipment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportsEquipment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportsEquipment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportsEquipment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportsEquipment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportsEquipment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportsEquipment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportsEquipment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportsEquipment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SportsEquipment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportsEquipment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportsEquipment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportsEquipment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportsEquipment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportsEquipment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportsEquipment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportsEquipment] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportsEquipment] SET  MULTI_USER 
GO
ALTER DATABASE [SportsEquipment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportsEquipment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportsEquipment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportsEquipment] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SportsEquipment]
GO
/****** Object:  StoredProcedure [dbo].[CreateAddress]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateAddress]
	@Street VARCHAR(30)
	,@City VARCHAR(30)
	,@State VARCHAR(30)
	,@Zip VARCHAR(30)
AS
BEGIN
	INSERT INTO [Address]
	VALUES (@Street, @City, @State, @Zip)
END


GO
/****** Object:  StoredProcedure [dbo].[CreateCategory]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateCategory]
	@Category VARCHAR(20)
AS
BEGIN
	INSERT INTO Category
	VALUES (@Category)
END


GO
/****** Object:  StoredProcedure [dbo].[CreateEquipment]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateEquipment]
	@CategoryId INT
	,@TypeId INT
AS
BEGIN
	INSERT INTO Equipment
	VALUES (@CategoryId, @TypeId)
END


GO
/****** Object:  StoredProcedure [dbo].[CreateOrder]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateOrder]
	@EquipmentId INT
	,@UserId INT
AS
BEGIN
	INSERT INTO [Order]
	VALUES (@EquipmentId, @UserId)
END


GO
/****** Object:  StoredProcedure [dbo].[CreatePerson]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreatePerson]
	@LastName VARCHAR(30)
	,@FirstName VARCHAR(30)
	,@Email VARCHAR(60)
	,@DateOfBirth DATETIME
AS
BEGIN
	INSERT INTO Person
	VALUES (@LastName, @FirstName, @Email, @DateOfBirth)
END


GO
/****** Object:  StoredProcedure [dbo].[CreatePersonAddress]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreatePersonAddress]
	@PersonId INT
	,@AddressId INT
	,@TypeId INT
AS
BEGIN
	INSERT INTO PersonAddress
	VALUES (@PersonId, @AddressId, @TypeId)
END


GO
/****** Object:  StoredProcedure [dbo].[CreatePersonPhone]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreatePersonPhone]
	@PersonId INT
	,@PhoneId INT
	,@TypeId INT
AS
BEGIN
	INSERT INTO PersonPhone
	VALUES (@PersonId, @PhoneId, @TypeId)
END


GO
/****** Object:  StoredProcedure [dbo].[CreatePhone]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreatePhone]
	@Number VARCHAR(15)
AS
BEGIN
	INSERT INTO Phone
	VALUES (@Number)
END


GO
/****** Object:  StoredProcedure [dbo].[CreateType]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateType]
	@Type VARCHAR(30)
AS
BEGIN
	INSERT INTO [Type]
	VALUES (@Type)
END


GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[CreateUser]
	@PersonAddressId INT
	,@PersonPhoneId INT
AS
BEGIN
	INSERT INTO [User]
	VALUES (@PersonAddressId, @PersonPhoneId)
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteEquipmentById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteEquipmentById]
	@Id INT
AS
BEGIN
	DELETE FROM Equipment
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteOrder]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteOrder] 
	@Id INT
	
AS
BEGIN
	DELETE FROM [Order]
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[DeleteUserById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserById]
	@Id INT
AS
BEGIN
	DELETE FROM [User]
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetAddressById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAddressById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM [Address]
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetAddressId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAddressId]
	@Street VARCHAR(30)
	,@City VARCHAR(30)
	,@State VARCHAR(30)
	,@Zip VARCHAR(30)
AS
BEGIN
	SELECT *
	FROM [Address]
	WHERE street = @Street AND city =  @City AND [state] =  @State AND	zip = @Zip
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllEquipment]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllEquipment]

AS
BEGIN
	SELECT id AS EquipmentId, categoryId, typeId
	FROM Equipment	
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllOrders]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllOrders]
	
AS
BEGIN
	SELECT id AS OrderId, equipmentId, userId
	FROM [Order]
END


GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllUsers]
	
AS
BEGIN
	SELECT id AS userId, personAddressId, personPhoneId
	FROM [User]
END


GO
/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoryById]
	@Id	INT
AS
BEGIN
	SELECT *
	FROM Category
	WHERE id = @Id
END




GO
/****** Object:  StoredProcedure [dbo].[GetCategoryIdByCategoryName]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoryIdByCategoryName]
	@Category VARCHAR(20)
AS
BEGIN
	SELECT * 
	FROM Category
	WHERE category = @Category
END


GO
/****** Object:  StoredProcedure [dbo].[GetEquipment]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEquipment]
	@CategoryId INT
	,@TypeId INT
AS
BEGIN
	SELECT id AS equipmentId, categoryId, typeId
	FROM Equipment
	WHERE categoryId = @CategoryId AND typeId = @TypeId
END


GO
/****** Object:  StoredProcedure [dbo].[GetEquipmentById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEquipmentById]
	@Id INT
AS
BEGIN
	SELECT id AS EquipmentId, categoryId, typeId
	FROM Equipment
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetEquipmentId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetEquipmentId]
	@CategoryId INT
	,@TypeId INT
AS
BEGIN
	SELECT *
	FROM Equipment
	WHERE categoryId = @CategoryId AND typeId = @TypeId
END


GO
/****** Object:  StoredProcedure [dbo].[GetOrderById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOrderById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM [Order]
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetOrderId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetOrderId]
	@EquipmentId INT
	,@UserId INT
AS
BEGIN
	SELECT *
	FROM [Order]
	WHERE equipmentId = @EquipmentId AND userId = @UserId
END


GO
/****** Object:  StoredProcedure [dbo].[GetPersonAddressById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersonAddressById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM PersonAddress
	WHERE id = @Id
END




GO
/****** Object:  StoredProcedure [dbo].[GetPersonAddressId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersonAddressId]
	@PersonId INT
	,@AddressId INT
	,@TypeId INT
AS
BEGIN
	SELECT *
	FROM PersonAddress
	WHERE personId = @PersonId AND addressId = @AddressId AND typeId = @TypeId
END


GO
/****** Object:  StoredProcedure [dbo].[GetPersonById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersonById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Person
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetPersonId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersonId]
	@LastName VARCHAR(30)
	,@FirstName VARCHAR(30)
	,@Email	VARCHAR(60)
	,@DateOfBirth DATETIME
AS
BEGIN
	SELECT *
	FROM Person
	WHERE lastName = @LastName AND firstName = @FirstName AND email = @Email AND dateOfBirth = @DateOfBirth
END


GO
/****** Object:  StoredProcedure [dbo].[GetPersonPhoneById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersonPhoneById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM PersonPhone
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetPersonPhoneId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPersonPhoneId]
	@PersonId INT
	,@PhoneId INT
	,@TypeId INT
AS
BEGIN
	SELECT *
	FROM PersonPhone
	WHERE personId = @PersonId AND phoneId = @PhoneId AND typeId = @TypeId
END


GO
/****** Object:  StoredProcedure [dbo].[GetPhoneById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPhoneById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM Phone
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetPhoneId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetPhoneId]
	@Number VARCHAR(15)
AS
BEGIN
	SELECT *
	FROM Phone
	WHERE number = @Number
END


GO
/****** Object:  StoredProcedure [dbo].[GetTypeById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTypeById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM [Type]
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetTypeId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTypeId]
	@Type VARCHAR(30)
AS
BEGIN
	SELECT *
	FROM [Type]
	WHERE [type] = @Type
END


GO
/****** Object:  StoredProcedure [dbo].[GetUser]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUser]
	@PersonAddressId INT
	,@PersonPhoneId INT
AS
BEGIN
	SELECT id AS UserId, personAddressId, personPhoneId
	FROM [User]
	WHERE personAddressId = @PersonAddressId AND personPhoneId = @PersonPhoneId
END


GO
/****** Object:  StoredProcedure [dbo].[GetUserById]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserById]
	@Id INT
AS
BEGIN
	SELECT *
	FROM [User]
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[GetUserId]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetUserId]
	@PersonAddressId INT
	,@PersonPhoneId INT
AS
BEGIN
	SELECT id AS userId, personAddressId, personPhoneId
	FROM [User]
	WHERE personAddressId = @PersonAddressId AND personPhoneId = @PersonPhoneId
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateEquipment]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateEquipment]
	@Id INT
	,@CategoryId INT
	,@TypeId INT
AS
BEGIN
	UPDATE Equipment
	SET categoryId = @CategoryId,
		typeId = @TypeId
	WHERE id = @Id
END

GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrder]
	@Id INT
	,@EquipmentId INT
	,@UserId INT
AS
BEGIN
	UPDATE [Order]
	SET equipmentId = @EquipmentId,
		userId = @UserId
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdatePersonAddress]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePersonAddress]
	@Id INT
	,@PersonId INT
	,@AddressId INT
	,@TypeId INT
AS
BEGIN
	UPDATE PersonAddress
	SET personId = @PersonId,
		addressId = @AddressId,
		typeId = @TypeId
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdatePersonPhone]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdatePersonPhone]
	@Id INT
	,@PersonId INT
	,@PhoneId INT
	,@TypeId INT
AS
BEGIN
	UPDATE PersonPhone
	SET personId = @PersonId,
		phoneId = @PhoneId,
		typeId = @TypeId
	WHERE id = @Id
END


GO
/****** Object:  StoredProcedure [dbo].[UpdateUser]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUser]
	@Id INT
	,@PersonAddressId INT
	,@PersonPhoneId INT
AS
BEGIN
	UPDATE [User]
	SET personAddressId = @PersonAddressId,
		personPhoneId = @PersonPhoneId
	WHERE id = @Id
END


GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Address](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[street] [varchar](30) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[state] [varchar](30) NOT NULL,
	[zip] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[categoryId] [int] NOT NULL,
	[typeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[equipmentId] [int] NOT NULL,
	[userId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Person]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Person](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lastName] [varchar](30) NOT NULL,
	[firstName] [varchar](30) NOT NULL,
	[email] [varchar](60) NULL,
	[dateOfBirth] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PersonAddress]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personId] [int] NOT NULL,
	[addressId] [int] NOT NULL,
	[typeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PersonPhone]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PersonPhone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personId] [int] NOT NULL,
	[phoneId] [int] NOT NULL,
	[typeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Phone]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Phone](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Type]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Type](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 3/22/2014 11:07:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[personAddressId] [int] NOT NULL,
	[personPhoneId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([equipmentId])
REFERENCES [dbo].[Equipment] ([id])
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[User] ([id])
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD FOREIGN KEY([addressId])
REFERENCES [dbo].[Address] ([id])
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD FOREIGN KEY([personId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[PersonAddress]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[PersonPhone]  WITH CHECK ADD FOREIGN KEY([personId])
REFERENCES [dbo].[Person] ([id])
GO
ALTER TABLE [dbo].[PersonPhone]  WITH CHECK ADD FOREIGN KEY([phoneId])
REFERENCES [dbo].[Phone] ([id])
GO
ALTER TABLE [dbo].[PersonPhone]  WITH CHECK ADD FOREIGN KEY([typeId])
REFERENCES [dbo].[Type] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([personAddressId])
REFERENCES [dbo].[PersonAddress] ([id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([personPhoneId])
REFERENCES [dbo].[PersonPhone] ([id])
GO
USE [master]
GO
ALTER DATABASE [SportsEquipment] SET  READ_WRITE 
GO
