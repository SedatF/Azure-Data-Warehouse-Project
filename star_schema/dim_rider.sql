SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim_rider](
 [rider_id] [int] PRIMARY KEY NONCLUSTERED NOT ENFORCED,
 [first] [varchar](50) NULL,
 [last] [varchar](50) NULL,
 [address] [varchar](100) NULL,
 [birthday] [date] NULL,
 [account_start_date] [date] NULL,
 [account_end_date] [date] NULL,
 [is_member] [bit] NULL,
 [rider_age_at_acc_start] [int] NULL
)
GO

INSER INTO dbo.dim_rider
SELECT [rider_id],
[first_name],
[last_name],
[address],
[birthday],
[account_start_date],
[account_end_date],
[is_member],
DATEDIFF(year,[birthday],[account_start_date]) as age
 FROM [dbo].[rider_stage]