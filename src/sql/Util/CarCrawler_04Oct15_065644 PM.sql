USE [CarCrawler]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Car_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Car_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Car_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Car_SelectByPK]

		@Id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Car].[Id],
		[dbo].[Car].[DateIn],
		[dbo].[Car].[Link],
		[dbo].[Car].[Title],
		[dbo].[Car].[Description],
		[dbo].[Car].[Make],
		[dbo].[Car].[Model],
		[dbo].[Car].[Miles],
		[dbo].[Car].[Year],
		[dbo].[Car].[Price],
		[dbo].[Car].[Color],
		[dbo].[Car].[Condition],
		[dbo].[Car].[Drive],
		[dbo].[Car].[Fuel],
		[dbo].[Car].[Size],
		[dbo].[Car].[TitleStatus],
		[dbo].[Car].[Transmission],
		[dbo].[Car].[Type],
		[dbo].[Car].[VIN],
		[dbo].[Car].[FeedId],
		[dbo].[Car].[Processed],
		[dbo].[Car].[EmailSent],
		[dbo].[Car].[HtmlDownloaded]
FROM  [dbo].[Car]

WHERE [dbo].[Car].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Car_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Car_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Car_SelectAll]

CREATE PROCEDURE [dbo].[usp_Car_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Car].[Id],
		[dbo].[Car].[DateIn],
		[dbo].[Car].[Link],
		[dbo].[Car].[Title],
		[dbo].[Car].[Description],
		[dbo].[Car].[Make],
		[dbo].[Car].[Model],
		[dbo].[Car].[Miles],
		[dbo].[Car].[Year],
		[dbo].[Car].[Price],
		[dbo].[Car].[Color],
		[dbo].[Car].[Condition],
		[dbo].[Car].[Drive],
		[dbo].[Car].[Fuel],
		[dbo].[Car].[Size],
		[dbo].[Car].[TitleStatus],
		[dbo].[Car].[Transmission],
		[dbo].[Car].[Type],
		[dbo].[Car].[VIN],
		[dbo].[Car].[FeedId],
		[dbo].[Car].[Processed],
		[dbo].[Car].[EmailSent],
		[dbo].[Car].[HtmlDownloaded]
FROM  [dbo].[Car]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Car_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Car_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Car_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Car_SelectViewByPK]

		@Id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Car].[Id],
		[dbo].[Car].[DateIn],
		[dbo].[Car].[Link],
		[dbo].[Car].[Title],
		[dbo].[Car].[Description],
		[dbo].[Car].[Make],
		[dbo].[Car].[Model],
		[dbo].[Car].[Miles],
		[dbo].[Car].[Year],
		[dbo].[Car].[Price],
		[dbo].[Car].[Color],
		[dbo].[Car].[Condition],
		[dbo].[Car].[Drive],
		[dbo].[Car].[Fuel],
		[dbo].[Car].[Size],
		[dbo].[Car].[TitleStatus],
		[dbo].[Car].[Transmission],
		[dbo].[Car].[Type],
		[dbo].[Car].[VIN],
		[dbo].[Car].[FeedId],
		[dbo].[Car].[Processed],
		[dbo].[Car].[EmailSent],
		[dbo].[Car].[HtmlDownloaded]
FROM  [dbo].[Car]

WHERE [dbo].[Car].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Car_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Car_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Car_Insert] @Id = 1, @DateIn = '2015-10-04', @Link = 'Link', @Title = 'Title', @Description = 'Description', @Make = 'Make', @Model = 'Model', @Miles = 1, @Year = 1, @Price = 1, @Color = 'Color', @Condition = 'Condition', @Drive = 'Drive', @Fuel = 'Fuel', @Size = 'Size', @TitleStatus = 'TitleStatus', @Transmission = 'Transmission', @Type = 'Type', @VIN = 'VIN', @FeedId = 1, @Processed = 1, @EmailSent = 1, @HtmlDownloaded = 1

CREATE PROCEDURE [dbo].[usp_Car_Insert]

		@Id             		int OUTPUT,
		@DateIn         		datetime2 (7),
		@Link           		nvarchar (255),
		@Title          		nvarchar (255),
		@Description    		nvarchar (1000),
		@Make           		nvarchar (255),
		@Model          		nvarchar (255),
		@Miles          		int,
		@Year           		smallint,
		@Price          		money,
		@Color          		nvarchar (50),
		@Condition      		nvarchar (50),
		@Drive          		nvarchar (50),
		@Fuel           		nvarchar (50),
		@Size           		nvarchar (50),
		@TitleStatus    		nvarchar (50),
		@Transmission   		nvarchar (50),
		@Type           		nvarchar (50),
		@VIN            		nvarchar (50),
		@FeedId         		smallint,
		@Processed      		bit = 0,
		@EmailSent      		bit = 0,
		@HtmlDownloaded 		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[Car]
(
		[DateIn],
		[Link],
		[Title],
		[Description],
		[Make],
		[Model],
		[Miles],
		[Year],
		[Price],
		[Color],
		[Condition],
		[Drive],
		[Fuel],
		[Size],
		[TitleStatus],
		[Transmission],
		[Type],
		[VIN],
		[FeedId],
		[Processed],
		[EmailSent],
		[HtmlDownloaded]
)
VALUES
(
		@DateIn,
		@Link,
		@Title,
		@Description,
		@Make,
		@Model,
		@Miles,
		@Year,
		@Price,
		@Color,
		@Condition,
		@Drive,
		@Fuel,
		@Size,
		@TitleStatus,
		@Transmission,
		@Type,
		@VIN,
		@FeedId,
		@Processed,
		@EmailSent,
		@HtmlDownloaded
)

SET @Id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Car_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Car_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Car_UpdateByPK] @Id = 1, @DateIn = '2015-10-04', @Link = 'Link', @Title = 'Title', @Description = 'Description', @Make = 'Make', @Model = 'Model', @Miles = 1, @Year = 1, @Price = 1, @Color = 'Color', @Condition = 'Condition', @Drive = 'Drive', @Fuel = 'Fuel', @Size = 'Size', @TitleStatus = 'TitleStatus', @Transmission = 'Transmission', @Type = 'Type', @VIN = 'VIN', @FeedId = 1, @Processed = 1, @EmailSent = 1, @HtmlDownloaded = 1

CREATE PROCEDURE [dbo].[usp_Car_UpdateByPK]

		@Id             		int,
		@DateIn         		datetime2 (7),
		@Link           		nvarchar (255),
		@Title          		nvarchar (255),
		@Description    		nvarchar (1000),
		@Make           		nvarchar (255),
		@Model          		nvarchar (255),
		@Miles          		int,
		@Year           		smallint,
		@Price          		money,
		@Color          		nvarchar (50),
		@Condition      		nvarchar (50),
		@Drive          		nvarchar (50),
		@Fuel           		nvarchar (50),
		@Size           		nvarchar (50),
		@TitleStatus    		nvarchar (50),
		@Transmission   		nvarchar (50),
		@Type           		nvarchar (50),
		@VIN            		nvarchar (50),
		@FeedId         		smallint,
		@Processed      		bit = 0,
		@EmailSent      		bit = 0,
		@HtmlDownloaded 		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[Car]
SET
		[DateIn] = @DateIn,
		[Link] = @Link,
		[Title] = @Title,
		[Description] = @Description,
		[Make] = @Make,
		[Model] = @Model,
		[Miles] = @Miles,
		[Year] = @Year,
		[Price] = @Price,
		[Color] = @Color,
		[Condition] = @Condition,
		[Drive] = @Drive,
		[Fuel] = @Fuel,
		[Size] = @Size,
		[TitleStatus] = @TitleStatus,
		[Transmission] = @Transmission,
		[Type] = @Type,
		[VIN] = @VIN,
		[FeedId] = @FeedId,
		[Processed] = @Processed,
		[EmailSent] = @EmailSent,
		[HtmlDownloaded] = @HtmlDownloaded
WHERE [dbo].[Car].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Car_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Car_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Car_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Car_DeleteByPK]

		@Id 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[Car]
WHERE [dbo].[Car].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Email_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Email_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Email_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Email_SelectByPK]

		@Id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Email].[Id],
		[dbo].[Email].[EmailGeneratedDate],
		[dbo].[Email].[EmailSubject],
		[dbo].[Email].[EmailMessage],
		[dbo].[Email].[EmailSent]
FROM  [dbo].[Email]

WHERE [dbo].[Email].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Email_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Email_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Email_SelectAll]

CREATE PROCEDURE [dbo].[usp_Email_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Email].[Id],
		[dbo].[Email].[EmailGeneratedDate],
		[dbo].[Email].[EmailSubject],
		[dbo].[Email].[EmailMessage],
		[dbo].[Email].[EmailSent]
FROM  [dbo].[Email]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Email_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Email_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Email_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Email_SelectViewByPK]

		@Id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Email].[Id],
		[dbo].[Email].[EmailGeneratedDate],
		[dbo].[Email].[EmailSubject],
		[dbo].[Email].[EmailMessage],
		[dbo].[Email].[EmailSent]
FROM  [dbo].[Email]

WHERE [dbo].[Email].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Email_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Email_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Email_Insert] @Id = 1, @EmailGeneratedDate = '2015-10-04', @EmailSubject = 'EmailSubject', @EmailMessage = 'EmailMessage', @EmailSent = 1

CREATE PROCEDURE [dbo].[usp_Email_Insert]

		@Id                 		int OUTPUT,
		@EmailGeneratedDate 		datetime2 (7),
		@EmailSubject       		varchar (45),
		@EmailMessage       		ntext,
		@EmailSent          		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[Email]
(
		[EmailGeneratedDate],
		[EmailSubject],
		[EmailMessage],
		[EmailSent]
)
VALUES
(
		@EmailGeneratedDate,
		@EmailSubject,
		@EmailMessage,
		@EmailSent
)

SET @Id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Email_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Email_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Email_UpdateByPK] @Id = 1, @EmailGeneratedDate = '2015-10-04', @EmailSubject = 'EmailSubject', @EmailMessage = 'EmailMessage', @EmailSent = 1

CREATE PROCEDURE [dbo].[usp_Email_UpdateByPK]

		@Id                 		int,
		@EmailGeneratedDate 		datetime2 (7),
		@EmailSubject       		varchar (45),
		@EmailMessage       		ntext,
		@EmailSent          		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[Email]
SET
		[EmailGeneratedDate] = @EmailGeneratedDate,
		[EmailSubject] = @EmailSubject,
		[EmailMessage] = @EmailMessage,
		[EmailSent] = @EmailSent
WHERE [dbo].[Email].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Email_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Email_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Email_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Email_DeleteByPK]

		@Id 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[Email]
WHERE [dbo].[Email].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_EmailBatch_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_EmailBatch_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_EmailBatch_SelectByPK] @CarId = 1, @EmailId = 1

CREATE PROCEDURE [dbo].[usp_EmailBatch_SelectByPK]

		@CarId   		int,
		@EmailId 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[EmailBatch].[CarId],
		[dbo].[EmailBatch].[EmailId]
FROM  [dbo].[EmailBatch]

WHERE [dbo].[EmailBatch].[CarId] = @CarId
AND [dbo].[EmailBatch].[EmailId] = @EmailId

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_EmailBatch_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_EmailBatch_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_EmailBatch_SelectAll]

CREATE PROCEDURE [dbo].[usp_EmailBatch_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[EmailBatch].[CarId],
		[dbo].[EmailBatch].[EmailId]
FROM  [dbo].[EmailBatch]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_EmailBatch_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_EmailBatch_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_EmailBatch_SelectViewByPK] @CarId = 1, @EmailId = 1

CREATE PROCEDURE [dbo].[usp_EmailBatch_SelectViewByPK]

		@CarId   		int,
		@EmailId 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[EmailBatch].[CarId],
		[dbo].[EmailBatch].[EmailId]
FROM  [dbo].[EmailBatch]

WHERE [dbo].[EmailBatch].[CarId] = @CarId
AND [dbo].[EmailBatch].[EmailId] = @EmailId

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_EmailBatch_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_EmailBatch_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_EmailBatch_Insert] @CarId = 1, @EmailId = 1

CREATE PROCEDURE [dbo].[usp_EmailBatch_Insert]

		@CarId   		int OUTPUT,
		@EmailId 		int OUTPUT

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[EmailBatch]
(
		[CarId],
		[EmailId]
)
VALUES
(
		@CarId,
		@EmailId
)

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_EmailBatch_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_EmailBatch_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_EmailBatch_DeleteByPK] @CarId = 1, @EmailId = 1

CREATE PROCEDURE [dbo].[usp_EmailBatch_DeleteByPK]

		@CarId   		int,
		@EmailId 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[EmailBatch]
WHERE [dbo].[EmailBatch].[CarId] = @CarId
AND [dbo].[EmailBatch].[EmailId] = @EmailId


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Feed_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Feed_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Feed_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Feed_SelectByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Feed].[Id],
		[dbo].[Feed].[FeedCity],
		[dbo].[Feed].[FeedState],
		[dbo].[Feed].[FeedRssLink],
		[dbo].[Feed].[FeedActive]
FROM  [dbo].[Feed]

WHERE [dbo].[Feed].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Feed_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Feed_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Feed_SelectAll]

CREATE PROCEDURE [dbo].[usp_Feed_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Feed].[Id],
		[dbo].[Feed].[FeedCity],
		[dbo].[Feed].[FeedState],
		[dbo].[Feed].[FeedRssLink],
		[dbo].[Feed].[FeedActive]
FROM  [dbo].[Feed]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Feed_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Feed_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Feed_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Feed_SelectViewByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Feed].[Id],
		[dbo].[Feed].[FeedCity],
		[dbo].[Feed].[FeedState],
		[dbo].[Feed].[FeedRssLink],
		[dbo].[Feed].[FeedActive]
FROM  [dbo].[Feed]

WHERE [dbo].[Feed].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Feed_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Feed_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Feed_Insert] @Id = 1, @FeedCity = 'FeedCity', @FeedState = 'FeedState', @FeedRssLink = 'FeedRssLink', @FeedActive = 1

CREATE PROCEDURE [dbo].[usp_Feed_Insert]

		@Id          		smallint OUTPUT,
		@FeedCity    		nvarchar (45),
		@FeedState   		nvarchar (2),
		@FeedRssLink 		nvarchar (150),
		@FeedActive  		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[Feed]
(
		[FeedCity],
		[FeedState],
		[FeedRssLink],
		[FeedActive]
)
VALUES
(
		@FeedCity,
		@FeedState,
		@FeedRssLink,
		@FeedActive
)

SET @Id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Feed_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Feed_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Feed_UpdateByPK] @Id = 1, @FeedCity = 'FeedCity', @FeedState = 'FeedState', @FeedRssLink = 'FeedRssLink', @FeedActive = 1

CREATE PROCEDURE [dbo].[usp_Feed_UpdateByPK]

		@Id          		smallint,
		@FeedCity    		nvarchar (45),
		@FeedState   		nvarchar (2),
		@FeedRssLink 		nvarchar (150),
		@FeedActive  		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[Feed]
SET
		[FeedCity] = @FeedCity,
		[FeedState] = @FeedState,
		[FeedRssLink] = @FeedRssLink,
		[FeedActive] = @FeedActive
WHERE [dbo].[Feed].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Feed_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Feed_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Feed_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Feed_DeleteByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[Feed]
WHERE [dbo].[Feed].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Html_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Html_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Html_SelectByPK] @CarId = 1

CREATE PROCEDURE [dbo].[usp_Html_SelectByPK]

		@CarId 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Html].[CarId],
		[dbo].[Html].[Html],
		[dbo].[Html].[Processed],
		[dbo].[Html].[DownLoadDate]
FROM  [dbo].[Html]

WHERE [dbo].[Html].[CarId] = @CarId

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Html_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Html_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Html_SelectAll]

CREATE PROCEDURE [dbo].[usp_Html_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Html].[CarId],
		[dbo].[Html].[Html],
		[dbo].[Html].[Processed],
		[dbo].[Html].[DownLoadDate]
FROM  [dbo].[Html]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Html_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Html_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Html_SelectViewByPK] @CarId = 1

CREATE PROCEDURE [dbo].[usp_Html_SelectViewByPK]

		@CarId 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Html].[CarId],
		[dbo].[Html].[Html],
		[dbo].[Html].[Processed],
		[dbo].[Html].[DownLoadDate]
FROM  [dbo].[Html]

WHERE [dbo].[Html].[CarId] = @CarId

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Html_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Html_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Html_Insert] @CarId = 1, @Html = 'Html', @Processed = 1, @DownLoadDate = '2015-10-04'

CREATE PROCEDURE [dbo].[usp_Html_Insert]

		@CarId        		int OUTPUT,
		@Html         		nvarchar (max),
		@Processed    		bit = 0,
		@DownLoadDate 		datetime2 (7)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

SELECT @CarId = ISNULL(MAX([CarId]),0) + 1 FROM [dbo].[Html]


INSERT [dbo].[Html]
(
		[CarId],
		[Html],
		[Processed],
		[DownLoadDate]
)
VALUES
(
		@CarId,
		@Html,
		@Processed,
		ISNULL(@DownLoadDate,getdate())
)

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Html_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Html_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Html_UpdateByPK] @CarId = 1, @Html = 'Html', @Processed = 1, @DownLoadDate = '2015-10-04'

CREATE PROCEDURE [dbo].[usp_Html_UpdateByPK]

		@CarId        		int,
		@Html         		nvarchar (max),
		@Processed    		bit = 0,
		@DownLoadDate 		datetime2 (7)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[Html]
SET
		[Html] = @Html,
		[Processed] = @Processed,
		[DownLoadDate] = ISNULL(@DownLoadDate,getdate())
WHERE [dbo].[Html].[CarId] = @CarId

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Html_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Html_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Html_DeleteByPK] @CarId = 1

CREATE PROCEDURE [dbo].[usp_Html_DeleteByPK]

		@CarId 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[Html]
WHERE [dbo].[Html].[CarId] = @CarId


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_MakeModel_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_MakeModel_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_MakeModel_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_MakeModel_SelectByPK]

		@Id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[MakeModel].[Id],
		[dbo].[MakeModel].[Year],
		[dbo].[MakeModel].[Make],
		[dbo].[MakeModel].[Model],
		[dbo].[MakeModel].[Style]
FROM  [dbo].[MakeModel]

WHERE [dbo].[MakeModel].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_MakeModel_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_MakeModel_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_MakeModel_SelectAll]

CREATE PROCEDURE [dbo].[usp_MakeModel_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[MakeModel].[Id],
		[dbo].[MakeModel].[Year],
		[dbo].[MakeModel].[Make],
		[dbo].[MakeModel].[Model],
		[dbo].[MakeModel].[Style]
FROM  [dbo].[MakeModel]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_MakeModel_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_MakeModel_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_MakeModel_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_MakeModel_SelectViewByPK]

		@Id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[MakeModel].[Id],
		[dbo].[MakeModel].[Year],
		[dbo].[MakeModel].[Make],
		[dbo].[MakeModel].[Model],
		[dbo].[MakeModel].[Style]
FROM  [dbo].[MakeModel]

WHERE [dbo].[MakeModel].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_MakeModel_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_MakeModel_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_MakeModel_Insert] @Id = 1, @Year = 1, @Make = 'Make', @Model = 'Model', @Style = 'Style'

CREATE PROCEDURE [dbo].[usp_MakeModel_Insert]

		@Id    		int OUTPUT,
		@Year  		int,
		@Make  		nvarchar (25),
		@Model 		nvarchar (100),
		@Style 		nvarchar (200)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[MakeModel]
(
		[Year],
		[Make],
		[Model],
		[Style]
)
VALUES
(
		@Year,
		@Make,
		@Model,
		@Style
)

SET @Id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_MakeModel_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_MakeModel_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_MakeModel_UpdateByPK] @Id = 1, @Year = 1, @Make = 'Make', @Model = 'Model', @Style = 'Style'

CREATE PROCEDURE [dbo].[usp_MakeModel_UpdateByPK]

		@Id    		int,
		@Year  		int,
		@Make  		nvarchar (25),
		@Model 		nvarchar (100),
		@Style 		nvarchar (200)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[MakeModel]
SET
		[Year] = @Year,
		[Make] = @Make,
		[Model] = @Model,
		[Style] = @Style
WHERE [dbo].[MakeModel].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_MakeModel_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_MakeModel_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_MakeModel_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_MakeModel_DeleteByPK]

		@Id 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[MakeModel]
WHERE [dbo].[MakeModel].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Predicate_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Predicate_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Predicate_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Predicate_SelectByPK]

		@Id 		tinyint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Predicate].[Id],
		[dbo].[Predicate].[PredicateSymbol],
		[dbo].[Predicate].[PredicateFormat],
		[dbo].[Predicate].[PredicateForAll]
FROM  [dbo].[Predicate]

WHERE [dbo].[Predicate].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Predicate_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Predicate_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Predicate_SelectAll]

CREATE PROCEDURE [dbo].[usp_Predicate_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Predicate].[Id],
		[dbo].[Predicate].[PredicateSymbol],
		[dbo].[Predicate].[PredicateFormat],
		[dbo].[Predicate].[PredicateForAll]
FROM  [dbo].[Predicate]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Predicate_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Predicate_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Predicate_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Predicate_SelectViewByPK]

		@Id 		tinyint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Predicate].[Id],
		[dbo].[Predicate].[PredicateSymbol],
		[dbo].[Predicate].[PredicateFormat],
		[dbo].[Predicate].[PredicateForAll]
FROM  [dbo].[Predicate]

WHERE [dbo].[Predicate].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Predicate_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Predicate_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Predicate_Insert] @Id = 1, @PredicateSymbol = 'PredicateSymbol', @PredicateFormat = 'PredicateFormat', @PredicateForAll = 1

CREATE PROCEDURE [dbo].[usp_Predicate_Insert]

		@Id              		tinyint OUTPUT,
		@PredicateSymbol 		nvarchar (50),
		@PredicateFormat 		nvarchar (50),
		@PredicateForAll 		bit

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

SELECT @Id = ISNULL(MAX([Id]),0) + 1 FROM [dbo].[Predicate]


INSERT [dbo].[Predicate]
(
		[Id],
		[PredicateSymbol],
		[PredicateFormat],
		[PredicateForAll]
)
VALUES
(
		@Id,
		@PredicateSymbol,
		@PredicateFormat,
		@PredicateForAll
)

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Predicate_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Predicate_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Predicate_UpdateByPK] @Id = 1, @PredicateSymbol = 'PredicateSymbol', @PredicateFormat = 'PredicateFormat', @PredicateForAll = 1

CREATE PROCEDURE [dbo].[usp_Predicate_UpdateByPK]

		@Id              		tinyint,
		@PredicateSymbol 		nvarchar (50),
		@PredicateFormat 		nvarchar (50),
		@PredicateForAll 		bit

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[Predicate]
SET
		[PredicateSymbol] = @PredicateSymbol,
		[PredicateFormat] = @PredicateFormat,
		[PredicateForAll] = @PredicateForAll
WHERE [dbo].[Predicate].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Predicate_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Predicate_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Predicate_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Predicate_DeleteByPK]

		@Id 		tinyint

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[Predicate]
WHERE [dbo].[Predicate].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Query_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Query_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Query_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Query_SelectByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Query].[Id],
		[dbo].[Query].[Subject],
		[dbo].[Query].[TitleAndDescripton],
		[dbo].[Query].[AndOr],
		[dbo].[Query].[Ignore],
		[dbo].[Query].[MakePredicate],
		[dbo].[Query].[MakeValue],
		[dbo].[Query].[MakeAllowNull],
		[dbo].[Query].[ModelPredicate],
		[dbo].[Query].[ModelValue],
		[dbo].[Query].[ModelAllowNull],
		[dbo].[Query].[MilesPredicate],
		[dbo].[Query].[MilesValue],
		[dbo].[Query].[MilesAllowNull],
		[dbo].[Query].[YearPredicate],
		[dbo].[Query].[YearValue],
		[dbo].[Query].[YearAllowNull],
		[dbo].[Query].[PricePredicate],
		[dbo].[Query].[PriceValue],
		[dbo].[Query].[PriceAllowNull],
		[dbo].[Query].[Email]
FROM  [dbo].[Query]

WHERE [dbo].[Query].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Query_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Query_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Query_SelectAll]

CREATE PROCEDURE [dbo].[usp_Query_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Query].[Id],
		[dbo].[Query].[Subject],
		[dbo].[Query].[TitleAndDescripton],
		[dbo].[Query].[AndOr],
		[dbo].[Query].[Ignore],
		[dbo].[Query].[MakePredicate],
		[dbo].[Query].[MakeValue],
		[dbo].[Query].[MakeAllowNull],
		[dbo].[Query].[ModelPredicate],
		[dbo].[Query].[ModelValue],
		[dbo].[Query].[ModelAllowNull],
		[dbo].[Query].[MilesPredicate],
		[dbo].[Query].[MilesValue],
		[dbo].[Query].[MilesAllowNull],
		[dbo].[Query].[YearPredicate],
		[dbo].[Query].[YearValue],
		[dbo].[Query].[YearAllowNull],
		[dbo].[Query].[PricePredicate],
		[dbo].[Query].[PriceValue],
		[dbo].[Query].[PriceAllowNull],
		[dbo].[Query].[Email]
FROM  [dbo].[Query]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Query_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Query_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Query_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Query_SelectViewByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[Query].[Id],
		[dbo].[Query].[Subject],
		[dbo].[Query].[TitleAndDescripton],
		[dbo].[Query].[AndOr],
		[dbo].[Query].[Ignore],
		[dbo].[Query].[MakePredicate],
		[dbo].[Query].[MakeValue],
		[dbo].[Query].[MakeAllowNull],
		[dbo].[Query].[ModelPredicate],
		[dbo].[Query].[ModelValue],
		[dbo].[Query].[ModelAllowNull],
		[dbo].[Query].[MilesPredicate],
		[dbo].[Query].[MilesValue],
		[dbo].[Query].[MilesAllowNull],
		[dbo].[Query].[YearPredicate],
		[dbo].[Query].[YearValue],
		[dbo].[Query].[YearAllowNull],
		[dbo].[Query].[PricePredicate],
		[dbo].[Query].[PriceValue],
		[dbo].[Query].[PriceAllowNull],
		[dbo].[Query].[Email]
FROM  [dbo].[Query]

WHERE [dbo].[Query].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Query_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Query_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Query_Insert] @Id = 1, @Subject = 'Subject', @TitleAndDescripton = 'TitleAndDescripton', @AndOr = 1, @Ignore = 'Ignore', @MakePredicate = 1, @MakeValue = 'MakeValue', @MakeAllowNull = 1, @ModelPredicate = 1, @ModelValue = 'ModelValue', @ModelAllowNull = 1, @MilesPredicate = 1, @MilesValue = 'MilesValue', @MilesAllowNull = 1, @YearPredicate = 1, @YearValue = 'YearValue', @YearAllowNull = 1, @PricePredicate = 1, @PriceValue = 'PriceValue', @PriceAllowNull = 1, @Email = 1

CREATE PROCEDURE [dbo].[usp_Query_Insert]

		@Id                 		smallint OUTPUT,
		@Subject            		nvarchar (100),
		@TitleAndDescripton 		nvarchar (max) = '',
		@AndOr              		tinyint,
		@Ignore             		nvarchar (max),
		@MakePredicate      		tinyint = 0,
		@MakeValue          		nvarchar (50),
		@MakeAllowNull      		bit,
		@ModelPredicate     		tinyint = 0,
		@ModelValue         		nvarchar (50),
		@ModelAllowNull     		bit,
		@MilesPredicate     		tinyint = 0,
		@MilesValue         		nvarchar (50),
		@MilesAllowNull     		bit,
		@YearPredicate      		tinyint = 0,
		@YearValue          		nvarchar (50),
		@YearAllowNull      		bit,
		@PricePredicate     		tinyint = 0,
		@PriceValue         		nvarchar (50),
		@PriceAllowNull     		bit = 0,
		@Email              		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[Query]
(
		[Subject],
		[TitleAndDescripton],
		[AndOr],
		[Ignore],
		[MakePredicate],
		[MakeValue],
		[MakeAllowNull],
		[ModelPredicate],
		[ModelValue],
		[ModelAllowNull],
		[MilesPredicate],
		[MilesValue],
		[MilesAllowNull],
		[YearPredicate],
		[YearValue],
		[YearAllowNull],
		[PricePredicate],
		[PriceValue],
		[PriceAllowNull],
		[Email]
)
VALUES
(
		@Subject,
		@TitleAndDescripton,
		@AndOr,
		@Ignore,
		@MakePredicate,
		@MakeValue,
		@MakeAllowNull,
		@ModelPredicate,
		@ModelValue,
		@ModelAllowNull,
		@MilesPredicate,
		@MilesValue,
		@MilesAllowNull,
		@YearPredicate,
		@YearValue,
		@YearAllowNull,
		@PricePredicate,
		@PriceValue,
		@PriceAllowNull,
		@Email
)

SET @Id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Query_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Query_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Query_UpdateByPK] @Id = 1, @Subject = 'Subject', @TitleAndDescripton = 'TitleAndDescripton', @AndOr = 1, @Ignore = 'Ignore', @MakePredicate = 1, @MakeValue = 'MakeValue', @MakeAllowNull = 1, @ModelPredicate = 1, @ModelValue = 'ModelValue', @ModelAllowNull = 1, @MilesPredicate = 1, @MilesValue = 'MilesValue', @MilesAllowNull = 1, @YearPredicate = 1, @YearValue = 'YearValue', @YearAllowNull = 1, @PricePredicate = 1, @PriceValue = 'PriceValue', @PriceAllowNull = 1, @Email = 1

CREATE PROCEDURE [dbo].[usp_Query_UpdateByPK]

		@Id                 		smallint,
		@Subject            		nvarchar (100),
		@TitleAndDescripton 		nvarchar (max) = '',
		@AndOr              		tinyint,
		@Ignore             		nvarchar (max),
		@MakePredicate      		tinyint = 0,
		@MakeValue          		nvarchar (50),
		@MakeAllowNull      		bit,
		@ModelPredicate     		tinyint = 0,
		@ModelValue         		nvarchar (50),
		@ModelAllowNull     		bit,
		@MilesPredicate     		tinyint = 0,
		@MilesValue         		nvarchar (50),
		@MilesAllowNull     		bit,
		@YearPredicate      		tinyint = 0,
		@YearValue          		nvarchar (50),
		@YearAllowNull      		bit,
		@PricePredicate     		tinyint = 0,
		@PriceValue         		nvarchar (50),
		@PriceAllowNull     		bit = 0,
		@Email              		bit = 0

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[Query]
SET
		[Subject] = @Subject,
		[TitleAndDescripton] = @TitleAndDescripton,
		[AndOr] = @AndOr,
		[Ignore] = @Ignore,
		[MakePredicate] = @MakePredicate,
		[MakeValue] = @MakeValue,
		[MakeAllowNull] = @MakeAllowNull,
		[ModelPredicate] = @ModelPredicate,
		[ModelValue] = @ModelValue,
		[ModelAllowNull] = @ModelAllowNull,
		[MilesPredicate] = @MilesPredicate,
		[MilesValue] = @MilesValue,
		[MilesAllowNull] = @MilesAllowNull,
		[YearPredicate] = @YearPredicate,
		[YearValue] = @YearValue,
		[YearAllowNull] = @YearAllowNull,
		[PricePredicate] = @PricePredicate,
		[PriceValue] = @PriceValue,
		[PriceAllowNull] = @PriceAllowNull,
		[Email] = @Email
WHERE [dbo].[Query].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_Query_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_Query_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_Query_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_Query_DeleteByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[Query]
WHERE [dbo].[Query].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_RegEx_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_RegEx_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_RegEx_SelectByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_RegEx_SelectByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[RegEx].[Id],
		[dbo].[RegEx].[RegExOrder],
		[dbo].[RegEx].[RegExType],
		[dbo].[RegEx].[RegExExpression]
FROM  [dbo].[RegEx]

WHERE [dbo].[RegEx].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_RegEx_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_RegEx_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_RegEx_SelectAll]

CREATE PROCEDURE [dbo].[usp_RegEx_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[RegEx].[Id],
		[dbo].[RegEx].[RegExOrder],
		[dbo].[RegEx].[RegExType],
		[dbo].[RegEx].[RegExExpression]
FROM  [dbo].[RegEx]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_RegEx_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_RegEx_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_RegEx_SelectViewByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_RegEx_SelectViewByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[RegEx].[Id],
		[dbo].[RegEx].[RegExOrder],
		[dbo].[RegEx].[RegExType],
		[dbo].[RegEx].[RegExExpression]
FROM  [dbo].[RegEx]

WHERE [dbo].[RegEx].[Id] = @Id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_RegEx_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_RegEx_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_RegEx_Insert] @Id = 1, @RegExOrder = 1, @RegExType = 'RegExType', @RegExExpression = 'RegExExpression'

CREATE PROCEDURE [dbo].[usp_RegEx_Insert]

		@Id              		smallint OUTPUT,
		@RegExOrder      		smallint,
		@RegExType       		nvarchar (255),
		@RegExExpression 		nvarchar (255)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[RegEx]
(
		[RegExOrder],
		[RegExType],
		[RegExExpression]
)
VALUES
(
		@RegExOrder,
		@RegExType,
		@RegExExpression
)

SET @Id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_RegEx_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_RegEx_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_RegEx_UpdateByPK] @Id = 1, @RegExOrder = 1, @RegExType = 'RegExType', @RegExExpression = 'RegExExpression'

CREATE PROCEDURE [dbo].[usp_RegEx_UpdateByPK]

		@Id              		smallint,
		@RegExOrder      		smallint,
		@RegExType       		nvarchar (255),
		@RegExExpression 		nvarchar (255)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[RegEx]
SET
		[RegExOrder] = @RegExOrder,
		[RegExType] = @RegExType,
		[RegExExpression] = @RegExExpression
WHERE [dbo].[RegEx].[Id] = @Id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_RegEx_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_RegEx_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_RegEx_DeleteByPK] @Id = 1

CREATE PROCEDURE [dbo].[usp_RegEx_DeleteByPK]

		@Id 		smallint

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[RegEx]
WHERE [dbo].[RegEx].[Id] = @Id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_sysdiagrams_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_sysdiagrams_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_sysdiagrams_SelectByPK] @diagram_id = 1

CREATE PROCEDURE [dbo].[usp_sysdiagrams_SelectByPK]

		@diagram_id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[sysdiagrams].[name],
		[dbo].[sysdiagrams].[principal_id],
		[dbo].[sysdiagrams].[diagram_id],
		[dbo].[sysdiagrams].[version],
		[dbo].[sysdiagrams].[definition]
FROM  [dbo].[sysdiagrams]

WHERE [dbo].[sysdiagrams].[diagram_id] = @diagram_id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_sysdiagrams_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_sysdiagrams_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_sysdiagrams_SelectAll]

CREATE PROCEDURE [dbo].[usp_sysdiagrams_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[sysdiagrams].[name],
		[dbo].[sysdiagrams].[principal_id],
		[dbo].[sysdiagrams].[diagram_id],
		[dbo].[sysdiagrams].[version],
		[dbo].[sysdiagrams].[definition]
FROM  [dbo].[sysdiagrams]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_sysdiagrams_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_sysdiagrams_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_sysdiagrams_SelectViewByPK] @diagram_id = 1

CREATE PROCEDURE [dbo].[usp_sysdiagrams_SelectViewByPK]

		@diagram_id 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[sysdiagrams].[name],
		[dbo].[sysdiagrams].[principal_id],
		[dbo].[sysdiagrams].[diagram_id],
		[dbo].[sysdiagrams].[version],
		[dbo].[sysdiagrams].[definition]
FROM  [dbo].[sysdiagrams]

WHERE [dbo].[sysdiagrams].[diagram_id] = @diagram_id

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_sysdiagrams_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_sysdiagrams_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_sysdiagrams_Insert] @name = 'name', @principal_id = 1, @diagram_id = 1, @version = 1, @definition = NULL

CREATE PROCEDURE [dbo].[usp_sysdiagrams_Insert]

		@name         		nvarchar (128),
		@principal_id 		int,
		@diagram_id   		int OUTPUT,
		@version      		int,
		@definition   		varbinary (max)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

INSERT [dbo].[sysdiagrams]
(
		[name],
		[principal_id],
		[version],
		[definition]
)
VALUES
(
		@name,
		@principal_id,
		@version,
		@definition
)

SET @diagram_id = @@IDENTITY

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_sysdiagrams_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_sysdiagrams_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_sysdiagrams_UpdateByPK] @name = 'name', @principal_id = 1, @diagram_id = 1, @version = 1, @definition = NULL

CREATE PROCEDURE [dbo].[usp_sysdiagrams_UpdateByPK]

		@name         		nvarchar (128),
		@principal_id 		int,
		@diagram_id   		int,
		@version      		int,
		@definition   		varbinary (max)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[sysdiagrams]
SET
		[name] = @name,
		[principal_id] = @principal_id,
		[version] = @version,
		[definition] = @definition
WHERE [dbo].[sysdiagrams].[diagram_id] = @diagram_id

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_sysdiagrams_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_sysdiagrams_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_sysdiagrams_DeleteByPK] @diagram_id = 1

CREATE PROCEDURE [dbo].[usp_sysdiagrams_DeleteByPK]

		@diagram_id 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[sysdiagrams]
WHERE [dbo].[sysdiagrams].[diagram_id] = @diagram_id


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_UserAgent_SelectByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_UserAgent_SelectByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_UserAgent_SelectByPK] @UAId = 1

CREATE PROCEDURE [dbo].[usp_UserAgent_SelectByPK]

		@UAId 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[UserAgent].[UAId],
		[dbo].[UserAgent].[UserAgents]
FROM  [dbo].[UserAgent]

WHERE [dbo].[UserAgent].[UAId] = @UAId

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_UserAgent_SelectAll]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_UserAgent_SelectAll]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_UserAgent_SelectAll]

CREATE PROCEDURE [dbo].[usp_UserAgent_SelectAll]

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[UserAgent].[UAId],
		[dbo].[UserAgent].[UserAgents]
FROM  [dbo].[UserAgent]

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_UserAgent_SelectViewByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_UserAgent_SelectViewByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_UserAgent_SelectViewByPK] @UAId = 1

CREATE PROCEDURE [dbo].[usp_UserAgent_SelectViewByPK]

		@UAId 		int

AS

SET NOCOUNT ON;

SELECT  
		[dbo].[UserAgent].[UAId],
		[dbo].[UserAgent].[UserAgents]
FROM  [dbo].[UserAgent]

WHERE [dbo].[UserAgent].[UAId] = @UAId

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_UserAgent_Insert]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_UserAgent_Insert]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_UserAgent_Insert] @UAId = 1, @UserAgents = 'UserAgents'

CREATE PROCEDURE [dbo].[usp_UserAgent_Insert]

		@UAId       		int OUTPUT,
		@UserAgents 		nvarchar (250)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

SELECT @UAId = ISNULL(MAX([UAId]),0) + 1 FROM [dbo].[UserAgent]


INSERT [dbo].[UserAgent]
(
		[UAId],
		[UserAgents]
)
VALUES
(
		@UAId,
		@UserAgents
)

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_UserAgent_UpdateByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_UserAgent_UpdateByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_UserAgent_UpdateByPK] @UAId = 1, @UserAgents = 'UserAgents'

CREATE PROCEDURE [dbo].[usp_UserAgent_UpdateByPK]

		@UAId       		int,
		@UserAgents 		nvarchar (250)

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

UPDATE [dbo].[UserAgent]
SET
		[UserAgents] = @UserAgents
WHERE [dbo].[UserAgent].[UAId] = @UAId

COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF EXISTS (SELECT * FROM sys.sysobjects WHERE id = object_id(N'[dbo].[usp_UserAgent_DeleteByPK]') AND OBJECTPROPERTY(id, N'IsProcedure') = 1)
BEGIN
		DROP PROCEDURE [dbo].[usp_UserAgent_DeleteByPK]
END
GO

/*
==================================
Author      : <Author,,Name>
Create date : <Create Date,,>
Description : <Description,,>
==================================
*/

--   [dbo].[usp_UserAgent_DeleteByPK] @UAId = 1

CREATE PROCEDURE [dbo].[usp_UserAgent_DeleteByPK]

		@UAId 		int

AS

SET NOCOUNT ON;

BEGIN TRY
BEGIN TRAN

DELETE FROM [dbo].[UserAgent]
WHERE [dbo].[UserAgent].[UAId] = @UAId


COMMIT TRAN
END TRY

BEGIN CATCH
ROLLBACK TRAN

DECLARE @ErrorNumber_INT INT;
DECLARE @ErrorSeverity_INT INT;
DECLARE @ErrorProcedure_VC VARCHAR(200);
DECLARE @ErrorLine_INT INT;
DECLARE @ErrorMessage_NVC NVARCHAR(4000);

SELECT
		@ErrorMessage_NVC = ERROR_MESSAGE(),
		@ErrorSeverity_INT = ERROR_SEVERITY(),
		@ErrorNumber_INT = ERROR_NUMBER(),
		@ErrorProcedure_VC = ERROR_PROCEDURE(),
		@ErrorLine_INT = ERROR_LINE()

RAISERROR(@ErrorMessage_NVC,@ErrorSeverity_INT,1);

END CATCH

GO
--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~