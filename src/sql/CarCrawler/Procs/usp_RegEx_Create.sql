IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_RegEx_Create]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_RegEx_Create]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_RegEx_Create 
	@RegExOrder smallint, 
	@RegExType nvarchar(255), 
	@RegExExpression nvarchar(255),
	@InsertedId int output

As
Begin   
    Set NoCount On;
Begin Try
    Set @RegExType = @RegExType;
    Set @RegExExpression = @RegExExpression;

    Insert Into [CarCrawler].[dbo].[RegEx]
		(RegExOrder, RegExType, RegExExpression)
	Values
		(@RegExOrder, @RegExType, @RegExExpression) 
    
    Set @InsertedId = SCOPE_IDENTITY();
    
 
	End Try
	Begin Catch
		Return ERROR_NUMBER()
	End Catch
END

GO
