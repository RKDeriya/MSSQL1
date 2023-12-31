USE [JioMart]
GO
/****** Object:  StoredProcedure [dbo].[InsertProductDetailsJioMart]    Script Date: 20-08-2023 10:26:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Rajesh
-- Create date: 2023-08-20
-- Description:	Perform I,U,D,S operation on ProductName Table
-- =============================================
create PROCEDURE [JioMart].[InsertProductDetails] 
	-- Add the parameters for the stored procedure here
	@productDetailsId int, 
	@productName Varchar(40),
	@productPrice float,
	@productStockQuantity int,
	@categoryId int,
	@opType char(1)
AS
BEGIN

	SET NOCOUNT ON;

	if(@productDetailsId = 0 and @opType = 'I')
	BEGIN
	insert into Jiomart.ProductDetails values(@productName,@productPrice,@productStockQuantity,@categoryId,GETDATE(),GETDATE())
	END
		
	else if(@opType = 'U')
	BEGIN
		update JioMart.ProductDetails set ProductName=@productName,ProductPrice=@productPrice,ProductStockQuantity=@productStockQuantity,CategoryId=@categoryId where ProductDetailsId=@productDetailsId
	END

	else if (@opType = 'D')
	BEGIN
		delete from JioMart.ProductDetails where ProductDetailsId=@productDetailsid
	END

	else if (@productDetailsId !=0)
	begin
		select * from JioMart.ProductDetails where ProductDetailsId=@productDetailsid
	end
	else
	begin 
		select * from JioMart.ProductDetails
	end
END
