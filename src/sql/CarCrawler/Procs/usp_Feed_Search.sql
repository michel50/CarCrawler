IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Feed_Search]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Feed_Search]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Feed_Search
(
	@FeedCity nvarchar(45), 
	@FeedState nvarchar(2), 
	@FeedRssLink nvarchar(150), 
	@FeedActive bit, 
    
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
        
    Set @FeedCity = '%' + @FeedCity + '%';
    Set @FeedState = '%' + @FeedState + '%';
    Set @FeedRssLink = '%' + @FeedRssLink + '%';
                
    Select
        AllResults.RowNumber,
        AllResults.DataCount,
        AllResults.Id,
        AllResults.FeedCity,
        AllResults.FeedState,
        AllResults.FeedRssLink,
        AllResults.FeedActive
    From
    (
        Select
            DataCount = Count(*) over(),
            ROW_NUMBER() OVER (ORDER BY 
                Case When @SortField = 'Id' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Feed].[Id] End,
                Case When @SortField = 'Id' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Feed].[Id] End DESC,
                Case When @SortField = 'FeedCity' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Feed].[FeedCity] End,
                Case When @SortField = 'FeedCity' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Feed].[FeedCity] End DESC,
                Case When @SortField = 'FeedState' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Feed].[FeedState] End,
                Case When @SortField = 'FeedState' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Feed].[FeedState] End DESC,
                Case When @SortField = 'FeedRssLink' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Feed].[FeedRssLink] End,
                Case When @SortField = 'FeedRssLink' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Feed].[FeedRssLink] End DESC,
                Case When @SortField = 'FeedActive' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Feed].[FeedActive] End,
                Case When @SortField = 'FeedActive' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Feed].[FeedActive] End DESC
            ) as RowNumber,
            [CarCrawler].[dbo].[Feed].[Id],
            [CarCrawler].[dbo].[Feed].[FeedCity],
            [CarCrawler].[dbo].[Feed].[FeedState],
            [CarCrawler].[dbo].[Feed].[FeedRssLink],
            [CarCrawler].[dbo].[Feed].[FeedActive]
        From
            [CarCrawler].[dbo].[Feed]
        Where
            (@FeedCity is null    Or    [CarCrawler].[dbo].[Feed].[FeedCity] like @FeedCity) And 
            (@FeedState is null    Or    [CarCrawler].[dbo].[Feed].[FeedState] like @FeedState) And 
            (@FeedRssLink is null    Or    [CarCrawler].[dbo].[Feed].[FeedRssLink] like @FeedRssLink) And 
            (@FeedActive is null    Or    [CarCrawler].[dbo].[Feed].[FeedActive] = @FeedActive) 
    )AllResults
	WHERE RowNumber >= @UpPageNumber AND RowNumber <= @DownPageNumber
	ORDER BY RowNumber
End

GO
