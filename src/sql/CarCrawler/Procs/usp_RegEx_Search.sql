IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_RegEx_Search]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_RegEx_Search]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_RegEx_Search
(
	@RegExOrder smallint, 
	@RegExType nvarchar(255), 
	@RegExExpression nvarchar(255), 
    
	@PageIndex int = 0,
	@PageSize int = 20,
	@SortField varchar(100),
	@SortDirection varchar(5)
)

AS
BEGIN
    Set NoCount On;
        
    Declare @UpPageNumber int;
    Declare @DownPageNumber int;
    Set @UpPageNumber = @PageIndex * @PageSize ;
    Set @DownPageNumber = @UpPageNumber + @PageSize;
    Set @UpPageNumber = @UpPageNumber + 1;
        
    Set @RegExType = '%' + @RegExType + '%';
    Set @RegExExpression = '%' + @RegExExpression + '%';
                
    Select
        AllResults.RowNumber,
        AllResults.DataCount,
        AllResults.Id,
        AllResults.RegExOrder,
        AllResults.RegExType,
        AllResults.RegExExpression
    From
    (
        Select
            DataCount = Count(*) over(),
            ROW_NUMBER() OVER (ORDER BY 
                Case When @SortField = 'Id' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[RegEx].[Id] End,
                Case When @SortField = 'Id' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[RegEx].[Id] End DESC,
                Case When @SortField = 'RegExOrder' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[RegEx].[RegExOrder] End,
                Case When @SortField = 'RegExOrder' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[RegEx].[RegExOrder] End DESC,
                Case When @SortField = 'RegExType' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[RegEx].[RegExType] End,
                Case When @SortField = 'RegExType' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[RegEx].[RegExType] End DESC,
                Case When @SortField = 'RegExExpression' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[RegEx].[RegExExpression] End,
                Case When @SortField = 'RegExExpression' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[RegEx].[RegExExpression] End DESC
            ) as RowNumber,
            [CarCrawler].[dbo].[RegEx].[Id],
            [CarCrawler].[dbo].[RegEx].[RegExOrder],
            [CarCrawler].[dbo].[RegEx].[RegExType],
            [CarCrawler].[dbo].[RegEx].[RegExExpression]
        From
            [CarCrawler].[dbo].[RegEx]
        Where
            (@RegExType is null    Or    [CarCrawler].[dbo].[RegEx].[RegExType] like @RegExType) And 
            (@RegExExpression is null    Or    [CarCrawler].[dbo].[RegEx].[RegExExpression] like @RegExExpression) And 
            (@RegExOrder is null    Or    [CarCrawler].[dbo].[RegEx].[RegExOrder] = @RegExOrder) 
    )AllResults
	WHERE RowNumber >= @UpPageNumber AND RowNumber <= @DownPageNumber
	ORDER BY RowNumber
End

GO
