USE [agriculture]
GO
TRUNCATE TABLE [dbo].[FACT_TBL]
INSERT INTO [dbo].[FACT_TBL]
           ([Crop_ID]
           ,[Location_ID]
           ,[date_id]
           ,[Organic_Production]
           ,[Total_GDP]
           ,[Population]
           ,[Yeild_Production]
		   ,[Crop_Price])
		 

select 
		   distinct h.[Crop_ID]
            ,f.[Location_ID]
           ,g.[date_id]
		   ,cast(c.[Organic Sale (billions)] as numeric(18,0)) 
		   ,cast(b.[Total_GDP] as numeric(18,0)) 
		   ,cast(e.[Population] as numeric(18,0))
		   ,cast(a.[Value] as float)
		   ,cast(i.[Value] as float)  
		   FROM [dbo].[Raw.Crop_Yield] a
		   join [dbo].[STG.WORLD_GDP] b
		   on a.Country_Code = b.Country_Code and a.Year = b.Year 
		   join [dbo].[statista-organic-sales in billions] c
		   on a.Year = c.Year 
		   join [dbo].[Country_Population] e
		   on a.[Country_Code] = e.[Country_Code]
		   join [dbo].Dim_Location f
		   on a.Country_Code = f.[Country_code]
		   join [dbo].Dim_Time g
		   on a.Year = g.Year
		   join [dbo].[Dim_Crop] h
		   on a.Item = h.Crop_Name
		   join [dbo].[Raw.Crop_Price] i
		   on a.Year = i.Year and a.Area = i.Area and g.Month = i.Months