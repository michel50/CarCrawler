IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_MakeModel_Search]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_MakeModel_Search]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_MakeModel_Search
(
	@Year int, 
	@Make nvarchar(25), 
	@Model nvarchar(100), 
	@Style nvarchar(200), 
    
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
        
    Set @Make = '%' + @Make + '%';
    Set @Model = '%' + @Model + '%';
    Set @Style = '%' + @Style + '%';
                
    Select
        AllResults.RowNumber,
        AllResults.DataCount,
        AllResults.Id,
        AllResults.Year,
        AllResults.Make,
        AllResults.Model,
        AllResults.Style
    From
    (
        Select
            DataCount = Count(*) over(),
            ROW_NUMBER() OVER (ORDER BY 
                Case When @SortField = 'Id' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[MakeModel].[Id] End,
                Case When @SortField = 'Id' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[MakeModel].[Id] End DESC,
                Case When @SortField = 'Year' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[MakeModel].[Year] End,
                Case When @SortField = 'Year' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[MakeModel].[Year] End DESC,
                Case When @SortField = 'Make' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[MakeModel].[Make] End,
                Case When @SortField = 'Make' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[MakeModel].[Make] End DESC,
                Case When @SortField = 'Model' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[MakeModel].[Model] End,
                Case When @SortField = 'Model' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[MakeModel].[Model] End DESC,
                Case When @SortField = 'Style' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[MakeModel].[Style] End,
                Case When @SortField = 'Style' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[MakeModel].[Style] End DESC
            ) as RowNumber,
            [CarCrawler].[dbo].[MakeModel].[Id],
            [CarCrawler].[dbo].[MakeModel].[Year],
            [CarCrawler].[dbo].[MakeModel].[Make],
            [CarCrawler].[dbo].[MakeModel].[Model],
            [CarCrawler].[dbo].[MakeModel].[Style]
        From
            [CarCrawler].[dbo].[MakeModel]
        Where
            (@Make is null    Or    [CarCrawler].[dbo].[MakeModel].[Make] like @Make) And 
            (@Model is null    Or    [CarCrawler].[dbo].[MakeModel].[Model] like @Model) And 
            (@Style is null    Or    [CarCrawler].[dbo].[MakeModel].[Style] like @Style) And 
            (@Year is null    Or    [CarCrawler].[dbo].[MakeModel].[Year] = @Year) 
    )AllResults
	WHERE RowNumber >= @UpPageNumber AND RowNumber <= @DownPageNumber
	ORDER BY RowNumber
End

GO
