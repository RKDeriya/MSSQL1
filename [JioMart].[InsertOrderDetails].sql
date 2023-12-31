USE [JioMartDataBase]
GO
/****** Object:  StoredProcedure [JioMart].[InsertOrderDetails]    Script Date: 23-08-2023 11:45:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rajesh>
-- Create date: <2023-08-22>
-- Description:	<inser procecedure for inser data into orderdetails>
-- =============================================
ALTER PROCEDURE [JioMart].[InsertOrderDetails] 
	-- Add the parameters for the stored procedure here

	@cartDetailsId int,
	@orderPaymentMode varchar(10),
	@orderTotalPrice int,
	@orderdeliveryStatus varchar(10)

AS
BEGIN
	SET NOCOUNT ON;
	insert into JioMart.OrderDetails values(@cartDetailsId,@orderPaymentMode,@orderTotalPrice,@orderdeliveryStatus,GETDATE(),GETDATE(),GETDATE());
END
