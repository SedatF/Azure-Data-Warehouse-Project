IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacityabdabd_udacityabdabd_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacitysedatf_udacitysedatf_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacitysedatf@udacitysedatf.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.trip_stage (
	trip_id nvarchar(100),
	rideable_type nvarchar(100),
	start_at VARCHAR(50),
	ended_at VARCHAR(50),
	start_station_id nvarchar(100),
	end_station_id nvarchar(100),
	rider_id bigint
	)
	WITH (
	LOCATION = 'publictrip.txt',
	DATA_SOURCE = [udacitysedatf_udacitysedatf_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.trip_stage
GO