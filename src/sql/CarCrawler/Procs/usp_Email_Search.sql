IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[usp_Email_Search]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[usp_Email_Search]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:          WAC
-- Create date:     8/20/2013 10:43:19 PM
-- =============================================
Create Procedure dbo.usp_Email_Search
(
	@EmailGeneratedDate datetime2, 
	@EmailSubject varchar(45), 
	@EmailMessage ntext, 
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
        
    Set @EmailSubject = '%' + @EmailSubject + '%';
                
    Select
        AllResults.RowNumber,
        AllResults.DataCount,
        AllResults.Id,
        AllResults.EmailGeneratedDate,
        AllResults.EmailSubject,
        AllResults.EmailMessage,
        AllResults.EmailSent
    From
    (
        Select
            DataCount = Count(*) over(),
            ROW_NUMBER() OVER (ORDER BY 
                Case When @SortField = 'Id' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Email].[Id] End,
                Case When @SortField = 'Id' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Email].[Id] End DESC,
                Case When @SortField = 'EmailGeneratedDate' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Email].[EmailGeneratedDate] End,
                Case When @SortField = 'EmailGeneratedDate' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Email].[EmailGeneratedDate] End DESC,
                Case When @SortField = 'EmailSubject' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Email].[EmailSubject] End,
                Case When @SortField = 'EmailSubject' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Email].[EmailSubject] End DESC,
                 Case When @SortField = 'EmailSent' AND @SortDirection = 'ASC' Then [CarCrawler].[dbo].[Email].[EmailSent] End,
                Case When @SortField = 'EmailSent' AND @SortDirection = 'DESC' Then [CarCrawler].[dbo].[Email].[EmailSent] End DESC
            ) as RowNumber,
            [CarCrawler].[dbo].[Email].[Id],
            [CarCrawler].[dbo].[Email].[EmailGeneratedDate],
            [CarCrawler].[dbo].[Email].[EmailSubject],
            [CarCrawler].[dbo].[Email].[EmailMessage],
            [CarCrawler].[dbo].[Email].[EmailSent]
        From
            [CarCrawler].[dbo].[Email]
        Where
            (@EmailSubject is null    Or    [CarCrawler].[dbo].[Email].[EmailSubject] like @EmailSubject) And 
            (@EmailMessage is null    Or    [CarCrawler].[dbo].[Email].[EmailMessage] like @EmailMessage) And 
            (@EmailGeneratedDate is null    Or    [CarCrawler].[dbo].[Email].[EmailGeneratedDate] = @EmailGeneratedDate) And 
            (@EmailSent is null    Or    [CarCrawler].[dbo].[Email].[EmailSent] = @EmailSent) 
    )AllResults
	WHERE RowNumber >= @UpPageNumber AND RowNumber <= @DownPageNumber
	ORDER BY RowNumber
End

GO
