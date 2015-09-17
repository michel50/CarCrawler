IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Query_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Query_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:          WAC
-- Create date:     8/24/2013 6:54:08 PM
-- =============================================
CREATE Procedure [dbo].[usp_Query_Create] 
	@Subject nvarchar(100), 
	@TitleAndDescripton nvarchar(MAX), 
	@AndOr tinyint, 
	@Ignore nvarchar(MAX),
	@MakePredicate tinyint, 
	@MakeValue nvarchar(50), 
	@MakeAllowNull bit, 
	@ModelPredicate tinyint, 
	@ModelValue nvarchar(50), 
	@ModelAllowNull bit, 
	@MilesPredicate tinyint, 
	@MilesValue nvarchar(50), 
	@MilesAllowNull bit, 
	@YearPredicate tinyint, 
	@YearValue nvarchar(50), 
	@YearAllowNull bit, 
	@PricePredicate tinyint, 
	@PriceValue nvarchar(50), 
	@PriceAllowNull bit, 
	@Email bit,
	@InsertedId int output

As
Begin   
    Set NoCount On;
Begin Try


    Insert Into [CarCrawler].[dbo].[Query]
		([Subject], [TitleAndDescripton], [AndOr], [Ignore], [MakePredicate], [MakeValue], [MakeAllowNull], [ModelPredicate], [ModelValue], [ModelAllowNull], [MilesPredicate], [MilesValue], [MilesAllowNull], [YearPredicate], [YearValue], [YearAllowNull], [PricePredicate], [PriceValue], [PriceAllowNull], [Email])
	Values
		(@Subject, @TitleAndDescripton, @AndOr, @Ignore, @MakePredicate, @MakeValue, @MakeAllowNull, @ModelPredicate, @ModelValue, @ModelAllowNull, @MilesPredicate, @MilesValue, @MilesAllowNull, @YearPredicate, @YearValue, @YearAllowNull, @PricePredicate, @PriceValue, @PriceAllowNull, @Email) 
    
    Set @InsertedId = SCOPE_IDENTITY();
    
 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
