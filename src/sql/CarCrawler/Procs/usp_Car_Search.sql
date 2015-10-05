IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Car_Search]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Car_Search]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
CREATE Procedure [dbo].[usp_Car_Search]
(
	@DateIn datetime2, 
	@Link nvarchar(255), 
	@Title nvarchar(255), 
	@Description nvarchar(1000), 
	@Make nvarchar(255), 
	@Model nvarchar(255), 
	@Miles int, 
	@Year smallint, 
	@Price money, 
	@FeedId smallint, 
	@Processed bit, 
	@EmailSent bit, 
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
        
    Set @Link = '%' + @Link + '%';
    Set @Title = '%' + @Title + '%';
    Set @Description = '%' + @Description + '%';
    Set @Make = '%' + @Make + '%';
    Set @Model = '%' + @Model + '%';
                
    Select
        AllResults.RowNumber,
        AllResults.DataCount,
        AllResults.Id,
        AllResults.DateIn,
        AllResults.Link,
        AllResults.Title,
        AllResults.Description,
        AllResults.Make,
        AllResults.Model,
        AllResults.Miles,
        AllResults.Year,
        AllResults.Price,
        AllResults.FeedId,
        AllResults.Processed,
        AllResults.EmailSent
    From
    (
        Select
            DataCount = Count(*) over(),
            ROW_NUMBER() OVER (ORDER BY 
                Case When @SortField = 'Id' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Id] End,
                Case When @SortField = 'Id' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Id] End DESC,
                Case When @SortField = 'DateIn' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[DateIn] End,
                Case When @SortField = 'DateIn' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[DateIn] End DESC,
                Case When @SortField = 'Link' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Link] End,
                Case When @SortField = 'Link' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Link] End DESC,
                Case When @SortField = 'Title' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Title] End,
                Case When @SortField = 'Title' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Title] End DESC,
                Case When @SortField = 'Description' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Description] End,
                Case When @SortField = 'Description' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Description] End DESC,
                Case When @SortField = 'Make' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Make] End,
                Case When @SortField = 'Make' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Make] End DESC,
                Case When @SortField = 'Model' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Model] End,
                Case When @SortField = 'Model' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Model] End DESC,
                Case When @SortField = 'Miles' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Miles] End,
                Case When @SortField = 'Miles' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Miles] End DESC,
                Case When @SortField = 'Year' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Year] End,
                Case When @SortField = 'Year' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Year] End DESC,
                Case When @SortField = 'Price' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Price] End,
                Case When @SortField = 'Price' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Price] End DESC,
                Case When @SortField = 'FeedId' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[FeedId] End,
                Case When @SortField = 'FeedId' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[FeedId] End DESC,
                Case When @SortField = 'Processed' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[Processed] End,
                Case When @SortField = 'Processed' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[Processed] End DESC,
                Case When @SortField = 'EmailSent' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Car].[EmailSent] End,
                Case When @SortField = 'EmailSent' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Car].[EmailSent] End DESC
            ) as RowNumber,
            [CarCrawler].[dbo].[Car].[Id],
            [CarCrawler].[dbo].[Car].[DateIn],
            [CarCrawler].[dbo].[Car].[Link],
            [CarCrawler].[dbo].[Car].[Title],
            [CarCrawler].[dbo].[Car].[Description],
            [CarCrawler].[dbo].[Car].[Make],
            [CarCrawler].[dbo].[Car].[Model],
            [CarCrawler].[dbo].[Car].[Miles],
            [CarCrawler].[dbo].[Car].[Year],
            [CarCrawler].[dbo].[Car].[Price],
            [CarCrawler].[dbo].[Car].[FeedId],
            [CarCrawler].[dbo].[Car].[Processed],
            [CarCrawler].[dbo].[Car].[EmailSent]
        From
            [CarCrawler].[dbo].[Car]
        Where
            (@Link is null    Or    [CarCrawler].[dbo].[Car].[Link] like @Link) And 
            (@Title is null    Or    [CarCrawler].[dbo].[Car].[Title] like @Title) And 
            (@Description is null    Or    [CarCrawler].[dbo].[Car].[Description] like @Description) And 
            (@Make is null    Or    [CarCrawler].[dbo].[Car].[Make] like @Make) And 
            (@Model is null    Or    [CarCrawler].[dbo].[Car].[Model] like @Model) And 
            (@DateIn is null    Or    [CarCrawler].[dbo].[Car].[DateIn] = @DateIn) And 
            (@Miles is null    Or    [CarCrawler].[dbo].[Car].[Miles] = @Miles) And 
            (@Year is null    Or    [CarCrawler].[dbo].[Car].[Year] = @Year) And 
            (@Price is null    Or    [CarCrawler].[dbo].[Car].[Price] = @Price) And 
            (@FeedId is null    Or    [CarCrawler].[dbo].[Car].[FeedId] = @FeedId) And 
            (@Processed is null    Or    [CarCrawler].[dbo].[Car].[Processed] = @Processed) And 
            (@EmailSent is null    Or    [CarCrawler].[dbo].[Car].[EmailSent] = @EmailSent) 
    )AllResults
	WHERE RowNumber >= @UpPageNumber AND RowNumber <= @DownPageNumber
	ORDER BY RowNumber
End

GO
