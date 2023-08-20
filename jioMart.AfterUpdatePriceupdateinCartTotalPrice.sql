
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rajesh>
-- Create date: <2023-08-20>
-- Description:	<After update product price update cartTotalprice>
-- =============================================
Alter TRIGGER JioMart.AfterUpdatePriceupdateinCartTotalPrice
   ON JioMart.Productdetails
   AFTER UPDATE
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @productDetailsId int;
	select @productDetailsId=ProductDetailsId from ProductDetails;
	--update Cartdetails table>>carttotalprice
    update CD set CD.CartTotalPrice = (CD.ProductQuantity * PD.ProductPrice)
	from JioMart.CartDetails as CD
	inner join JioMart.ProductDetails as PD on PD.ProductDetailsId=CD.ProductDetailsId
	where PD.ProductDetailsId=@productDetailsId

END
GO
