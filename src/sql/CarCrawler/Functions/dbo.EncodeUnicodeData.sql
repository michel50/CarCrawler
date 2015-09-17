IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EncodeUnicodeData]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[EncodeUnicodeData]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Function EncodeUnicodeData(@Data NVarChar(4000), @Prefix VarChar(20), @Suffix VarChar(20))
Returns VarChar(8000)
As 
Begin
  Declare @i Int
  Declare @Output VarChar(8000)

  Set @i = 1
  Set @Output = ''

  While @i <= Len(@Data)	
    Begin
      If Unicode(SubString(@Data, @i, 1)) > 255
        Set @Output = @Output + @Prefix + Convert(VarChar(5),Unicode(SubString(@Data, @i, 1))) + @Suffix
      Else
        Set @Output = @Output + SubString(@Data, @i, 1)

      Set @i = @i + 1
    End

  Return @Output
End
GO
