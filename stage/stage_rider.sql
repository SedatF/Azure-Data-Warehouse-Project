IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'udacitysedatf_udacitysedatf_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [udacitysedatf_udacitysedatf_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://udacitysedatf@udacitysedatf.dfs.core.windows.net', 
		TYPE = HADOOP 
	)
GO

CREATE EXTERNAL TABLE dbo.rider_stage (
	rider_id bigint,
	first_name nvarchar(100),
	last_name nvarchar(100),
	address nvarchar(100),
	birthday VARCHAR(50),
	account_start_date VARCHAR(50),
	account_end_date VARCHAR(50),
	is_member bit
	)
	WITH (
	LOCATION = 'publicrider.txt',
	DATA_SOURCE = [udacityabdabd_udacitysedatf_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.rider_stage
GO