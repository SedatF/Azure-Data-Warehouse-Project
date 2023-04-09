SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [fact_trip](
	[trip_id] [varchar](50) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
	[rideable_type] [varchar](75) NULL,
	[start_at] [bigint] NULL,
	[ended_at] [bigint] NULL,
	[start_station_id] [varchar](50) NULL,
	[end_station_id] [varchar](50) NULL,
	[rider_id] [int] NULL,
	[rider_age] [int] NULL,
	[duration] [float] NULL
 
) 
GO

INSERT INTO [dbo].[fact_trip]
SELECT 
	[trip_id],
	[rideable_type],
	dim_da_start_at_table.[time_id],
	dim_da_end_at_table.[time_id],
	[start_station_id],
	[end_station_id],
	dim_rider_table.rider_id,
	DATEDIFF(YEAR,dim_rider_table.[birthday],dim_da_end_at_table.d_date),
	DATEDIFF(MINUTE,dim_da_start_at_table.d_date,dim_da_end_at_table.d_date)
 FROM 
	[dbo].[trip_stage] trip_stage_table
  	join dbo.[dim_date] dim_da_start_at_table on  CONVERT(DATE,trip_stage_table.[start_at])=  CONVERT(DATE,dim_da_start_at_table.d_date)
  	join dbo.[dim_date] dim_da_end_at_table on  CONVERT(DATE,trip_stage_table.[ended_at])= CONVERT(DATE,dim_da_end_at_table.d_date)
  	join dbo.[dim_rider] dim_rider_table on dim_rider_table.rider_id=trip_stage_table.[rider_id]  
    
    