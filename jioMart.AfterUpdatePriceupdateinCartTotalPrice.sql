
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
	UPDATE cd
    SET CartTotalPrice = i.ProductPrice * cd.ProductQuantity
    FROM JioMart.CartDetails cd
    INNER JOIN inserted i ON cd.ProductDetailsId = i.ProductDetailsId
    INNER JOIN deleted d ON cd.ProductDetailsId = d.ProductDetailsId
    WHERE i.ProductPrice <> d.ProductPrice

END
GO
