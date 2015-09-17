IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DecodeUnicodeData]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[DecodeUnicodeData]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Function DecodeUnicodeData(@Data nVarChar(4000), @Prefix VarChar(100), @Suffix VarChar(100))
Returns nvarchar(4000)
As
Begin
  Declare @Start Int
  Declare @End Int

  While CharIndex(@Prefix, @Data) > 0
    Begin
      Set @Start = CharIndex(@Prefix, @Data)
      Set @End = CharIndex(@Suffix, @Data, @Start)

      Set @Data = Replace(@Data, SubString(@Data, @Start, @End -@Start + Len(@Suffix)),NCHAR(SubString(@Data, @Start+ Len(@Prefix),@End -@Start - Len(@Prefix))))
    End
  
  Return @Data

End

GO
