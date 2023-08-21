SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rajesh>
-- Create date: <2023-08-20>
-- Description:	<before insert into orderdetails check the cartorderstatus is Not completed or completed>
-- =============================================
CREATE TRIGGER jiomart.beforeInsertIntoOrderDetailsCheckCartOrderStatusInCartDetails
ON JioMart.OrderDetails
INSTEAD OF INSERT
AS
BEGIN
    -- Check if CartOrderStatus is 'Completed' in the CartDetails table
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN JioMart.CartDetails cd ON i.CartDetailsId = cd.CartDetailsId
        WHERE cd.CartOrderStatus = 'Completed'
    )
    BEGIN
        THROW 50000, 'Cannot insert data into OrderDetails table when CartOrderStatus is Completed.', 1;
    END
    ELSE
    BEGIN
        -- Insert the data into OrderDetails table
        INSERT INTO JioMart.OrderDetails (CartDetailsId,OrderPaymentMode,OrderTotalPrice,OrderDeliveryStatus,OrderDate,Createdon,Updatedon)
        SELECT i.CartDetailsId,i.OrderPaymentMode,i.OrderTotalPrice,i.OrderDeliveryStatus,i.OrderDate,GETDATE(),GETDATE()
        FROM inserted i;
    END
END;
