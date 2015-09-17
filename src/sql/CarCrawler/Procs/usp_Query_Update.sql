IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Query_Update]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Query_Update]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/24/2013 6:54:08 PM
-- =============================================
CREATE Procedure [dbo].[usp_Query_Update] 
	@Id smallint, 
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
	@Email bit 
AS
BEGIN
    Set NoCount On;
Begin Try
                
	Update [CarCrawler].[dbo].[Query]
	Set
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
	Where
		[Id] = @Id

 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
