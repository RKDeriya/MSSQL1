USE [JioMart]
GO
/****** Object:  Trigger [JioMart].[AfterInsertOrderDetailsUpdateCartOrderDetailsAndProductStock]    Script Date: 20-08-2023 10:36:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rajesh>
-- Create date: <2023-08-20>
-- Description:	<create trigger for- insert data into orderdetails >> delete data from cartdetails>
-- =============================================
ALTER TRIGGER [JioMart].[AfterInsertOrderDetailsUpdateCartOrderDetailsAndProductStock]
   ON  [JioMart].[OrderDetails]
   AFTER INSERT
AS 
BEGIN

	SET NOCOUNT ON;

	declare @cartdetailsId int;
	declare @productDetailsId int;
	declare @userDetailsId int;
	declare @OrderPaymentMode varchar(10);
	select @cartdetailsId=CartDetailsId,@productDetailsId=ProductDetailsId,@userDetailsId=UserDetailsId,@OrderPaymentMode=OrderPaymentMode from inserted,JioMart.ProductDetails,JioMart.UserDetails
	--select @cartdetailsId=CartDetailsId,@productDetailsId=ProductDetailsId,@userDetailsId=UserDetailsId,@OrderPaymentMode=OrderPaymentMode from inserted,JioMart.UserDetails,JioMart.ProductDetails
	
	--update OrderTotal price as cartTotalPrice(cOMPLETE)
	update OD set OD.OrderTotalPrice = CD.CartTotalPrice
	from JioMart.OrderDetails as OD
	inner join JioMart.CartDetails as CD on CD.CartDetailsId=OD.CartDetailsId
	where CD.CartDetailsId = @cartdetailsId
	
	--Update Stock in ProDUct detail table
	update PD set PD.ProductStockQuantity=PD.ProductStockQuantity-CD.ProductQuantity
	from JioMart.ProductDetails as PD
	inner join JioMart.CartDetails as CD on CD.ProductDetailsId=PD.ProductDetailsId
	inner join JioMart.OrderDetails as OD on OD.CartDetailsId= CD.CartDetailsId
	where PD.ProductDetailsId=11
	
	--Update cartOrderstatus in cartDetails
	Update JioMart.CartDetails set CartOrderStatus='Completed' where CartDetailsId=@cartdetailsId
	
	 

	
	--Delete from JioMart.CartDetails where CartDetailsId=@cartDetailsId

END
/*
if(@OrderPaymentMode ='Wallet')
begin
	
	update UD set UD.UserWalletbalance = UD.UserWalletBalance-OD.OrderTotalPrice
	from JioMart.UserDetails as UD
	inner join JioMart.CartDetails as CD on CD.UserDetailsId=UD.UserDetailsId
	inner join JioMart.OrderDetails as OD on CD.CartDetailsId = OD.CartDetailsID
	where UD.UserDetailsId=@userDetailsId
end
*/