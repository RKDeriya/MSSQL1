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
Alter PROCEDURE [JioMart].[UpdateOrderDetailsOrderDeliveryStatus] 
	-- Add the parameters for the stored procedure here
	@orderDetailsId int,
	@orderdeliveryStatus varchar(10)

AS
BEGIN
	SET NOCOUNT ON;
	update JioMart.OrderDetails set OrderDeliverystatus = @orderdeliveryStatus,Updatedon=getdate() where OrderDetailsId=@orderDetailsId;
END
