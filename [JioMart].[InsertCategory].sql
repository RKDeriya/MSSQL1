USE [JioMart]
GO
/****** Object:  StoredProcedure [dbo].[InsertCategoryJioMart]    Script Date: 20-08-2023 10:30:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rajesh
-- Create date: 2023-08-14
-- Description: insert,U,D,S data to the  Category table
-- =============================================
Create procedure [JioMart].[InsertCategory]
	-- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>
	@categoryId int,
	@categoryName varchar(20),
	@opType char(1)
AS
BEGIN

	SET NOCOUNT ON;

	if(@categoryId = 0 and @opType = 'I')
	BEGIN
	insert into JioMart.Category values(@categoryName,GETDATE(),GETDATE())
	END
		
	else if(@opType = 'U')
	BEGIN
		update JioMart.Category set CategoryName=@categoryName where CategoryId=@categoryId
	END

	else if (@opType = 'D')
	BEGIN
		delete from JioMart.Category where CategoryId=@categoryId
	END

	else if (@categoryId !=0)
	begin
		select * from JioMart.Category where CategoryId=@categoryId
	end
	else
	begin 
		select * from JioMart.Category
	end
END
