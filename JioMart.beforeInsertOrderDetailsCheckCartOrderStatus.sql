SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Rajesh>
-- Create date: <2023-08-20>
-- Description:	<before insert into orderdetails check the cartorderstatus is Not completed or completed>
-- =============================================
CREATE TRIGGER JioMart.beforeInsertOrderDetailsCheckCartOrderStatus 
   ON JioMart.OrderDetails
   Before insert
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for trigger here

END
GO
