use agriculture_db
go

IF (select object_id from sys.foreign_keys where [name] = 'fk_Crop') IS NOT NULL
BEGIN
  ALTER TABLE [dbo].[fact_agri]  DROP CONSTRAINT fk_Crop;  
END
go
IF OBJECT_ID('Dim_Crop', 'U') IS NOT NULL 
 
 drop TABLE dbo.Dim_Crop; 
go

CREATE TABLE [dbo].[Dim_Crop](
	[Crop_ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Crop_Name] [varchar](50) NULL,
	[Crop_Type] [varchar](50) NULL
	)

	
	
	
	
IF (select object_id from sys.foreign_keys where [name] = 'fk_Location') IS NOT NULL
BEGIN
  ALTER TABLE [dbo].[fact_agri]  DROP CONSTRAINT fk_Location;  
END
go
	
IF OBJECT_ID('Dim_Location', 'U') IS NOT NULL 
 drop TABLE dbo.Dim_Location; 

CREATE TABLE [dbo].[Dim_Location](
	[Location_ID] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Region] [varchar](50) NULL,
	[Sub_Region] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[Country_Code] [varchar](50) NULL
	)


	
	
	
	
IF (select object_id from sys.foreign_keys where [name] = 'fk_Year') IS NOT NULL
BEGIN
  ALTER TABLE [dbo].[fact_agri]  DROP CONSTRAINT fk_Year;  
END
go	

IF OBJECT_ID('Dim_Time', 'U') IS NOT NULL 
 drop TABLE dbo.Dim_Time; 
 

CREATE TABLE [dbo].[Dim_Time](
	[Year_id] int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Year] [varchar](50) NULL,
	[Month] [varchar](50) NULL
	)

IF OBJECT_ID('fact_agri', 'U') IS NOT NULL  
 drop TABLE dbo.fact_agri; 
go

CREATE TABLE [dbo].[FACT_AGRI](
	[Crop_ID] int NULL,
	[Location_ID] int NULL,
	[Year_id]  int NULL,
	[Area in million hectares] [numeric](18, 0) NULL,
	[Total_GDP] [numeric](18, 0) NULL,
	[Harvest_Area] int NULL,
	[Yeild_Production] int NULL,
	[CPI_Value] int NULL
) ON [PRIMARY]
GO

ALTER TABLE [FACT_AGRI]
ADD
CONSTRAINT  fk_Crop FOREIGN KEY (Crop_ID) REFERENCES [dbo].[Dim_Crop](Crop_ID),
CONSTRAINT  fk_Location FOREIGN KEY (Location_ID) REFERENCES [dbo].[Dim_Location](Location_ID),
CONSTRAINT  fk_Year FOREIGN KEY (Year_id) REFERENCES [dbo].[Dim_time](Year_id)
go


