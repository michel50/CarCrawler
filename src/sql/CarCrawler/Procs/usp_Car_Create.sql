IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Car_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Car_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_Car_Create] 
	@DateIn datetime2, 
	@Link nvarchar(255), 
	@Title nvarchar(255), 
	@Description nvarchar(1000), 
	@Make nvarchar(255)=null, 
	@Model nvarchar(255)=null, 
	@Miles int=null, 
	@Year smallint=null, 
	@Price money=null, 
	@Color nvarchar(50)=null,
	@Condition nvarchar(50)=null,
	@Drive nvarchar(50)=null,
	@Fuel nvarchar(50)=null,
	@Size nvarchar(50)=null,
	@TitleStatus nvarchar(50)=null,
	@Transmission nvarchar(50)=null,
	@Type nvarchar(50)=null,
	@VIN nvarchar(50)=null,
	@FeedId smallint=null, 
	@Processed bit=0, 
	@EmailSent bit=0,
	@HtmlDownloaded bit = 0



As
Begin   
    Set NoCount On;
BEGIN TRY
BEGIN TRAN

    --Set @Link = @Link;
    --Set @Title = @Title;
    --Set @Description = @Description;
    --Set @Make = @Make;
    --Set @Model = @Model;

	if not exists(select 1 from [CarCrawler].[dbo].[Car] where Title = @Title and DateIn = @DateIn) 
	begin
	Insert into Car (DateIn,Link,Title,Description,Make,Model,Miles,[Year],Price,Color,[Condition],Drive,Fuel,[Size],TitleStatus,Transmission,[Type],VIN,FeedId,Processed,EmailSent,HtmlDownloaded)
	values(@DateIn,@Link,@Title,@Description,@Make,@Model,@Miles,@Year,@Price,@Color,@Condition,@Drive,@Fuel,@Size,@TitleStatus,@Transmission,@Type,@VIN,@FeedId,@Processed,@EmailSent,@HtmlDownloaded)
    
    
	end


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
END


GO
