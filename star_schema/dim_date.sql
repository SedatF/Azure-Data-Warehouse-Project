SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dim_date](
 [Time_id] [bigint] IDENTITY(1,1) PRIMARY KEY NONCLUSTERED NOT ENFORCED,
 [d_date] [DATETIME2] NULL,
 [day_of_month] [int] NULL,
 [day_of_week] [varchar](25) NULL,
 [month] [int] NULL,
 [month_name] [varchar](25) NULL,
 [year] [int] NULL,
 [quarter] [int] NULL,
 [week_of_year] [int] NULL
)
GO

DECLARE @StartDate DATETIME
DECLARE @EndDate DATETIME
SET @StartDate = (SELECT MIN(TRY_CONVERT(datetime, left(start_at, 19))) FROM [dbo].[trip_stage])
SET @EndDate = DATEADD(year, 5, (SELECT MAX(TRY_CONVERT(datetime, left(start_at, 19))) FROM [dbo].[trip_stage]))

WHILE @StartDate <= @EndDate
 BEGIN
 INSERT INTO [dbo].[dim_date]
 SELECT
 @StartDate,
 DATEPART(DAY,@StartDate),
 DATENAME(WEEKDAY,@StartDate),
 DATEPART(MONTH,@StartDate),
 DATENAME(MONTH,@StartDate),
 DATEPART(year,@StartDate),
 DATEPART(Quarter,@StartDate) ,
 DATEPART(WEEK,@StartDate)

 SET @StartDate = DATEADD(dd, 1, @StartDate)
 END
 