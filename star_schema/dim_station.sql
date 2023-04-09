SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim_station](
	[station_id] [varchar](50) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
	[name] [varchar](75) NULL,
	[latitude] [float] NULL,
	[longitude] [float] NULL
 
) 
GO
INSERT INTO dbo.dim_station
SELECT [station_id]
,[name]
,[latitude]
,[longitude]

 FROM [dbo].[station_stage]