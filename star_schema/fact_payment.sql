SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fact_payment](
 [payment_id] [int] PRIMARY KEY NONCLUSTERED NOT ENFORCED,
 [time_id] [int](50) NULL,
 [amount] [float] NULL,
 [rider_id] [int] NULL
 
)
GO

INSERT INTO [dbo].[fact_payment]
SELECT [payment_id],
dim_da_table.time_id'
[amount]'
[rider_id]'
 FROM [dbo].[payment_stage] pay_sta_table
 JOIN [dbo].[dim_date] dim_da_table
  ON CONVERT(DATE,pay_sta_table.date_date)= CONVERT(DATE,dim_da_table.d_date)
 
SELECT TOP (100) [payment_id],
[time_id],
[amount],
[rider_id],
 FROM [dbo].[fact_payment]

