use agriculture_db
GO

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

GO


INSERT INTO [dbo].[FACT_AGRI]
           ([Crop_ID]
           ,[Location_ID]
           ,[Year_id]
           ,[Area in million hectares]
           ,[Total_GDP]
           ,[Harvest_Area]
           ,[Yeild_Production]
		   ,[CPI_Value])
 select  DISTINCT
				[Crop_ID]
				,[Location_ID] 
				,[Year_id]
				,[Area in million hectares]
				,cast([Total_GDP] as numeric(18,0))
				,[Harvest_Area]
				,[Yeild_Production]
				,cast(b.[CPI VALUE]  as numeric(18,0))
				from [dbo].[raw_crop_area] a
				join [dbo].[raw_CPI] b
				on a.Country_Code = b.Country_Code and a.Year = b.Year
				join [dbo].[raw_organic_farming] c
				on a.Year = c.Year
				join [dbo].[raw_global_gdp] d
				on a.Country_Code = d.Country_Code  and a.Year = d.Year
				join [dbo].[Dim_Crop] e
				on a.crop_name = e.Crop_Name and e.Crop_Type = a.Category
	 			join [dbo].[Dim_Time] f
				on A.Year = f.Year 
				join [dbo].[Dim_Location] g
				on a.Country_Code = g.Country_Code  ORDER BY Crop_ID,Location_ID,Year_id

				
GO