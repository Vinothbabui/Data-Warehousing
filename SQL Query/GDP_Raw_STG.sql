USE [agriculture]
GO
TRUNCATE TABLE [dbo].[STG.WORLD_GDP]
INSERT INTO [dbo].[STG.WORLD_GDP]
           ([column1]
           ,[Country_Name]
           ,[Country_Code]
           ,[Indicator_Name]
           ,[Indicator_Code]
           ,[Year]
           ,[Total_GDP])

  select distinct 
  a.[column1],
  a.[Country_Name],
   b.[Country_code],
  a.[Indicator_Name],
  a.[Indicator_Code],
  a.[Year],
  [Total_GDP]
  from [agriculture].[dbo].[WORLD_GDP1] a
  join [dbo].[RawCrop_data] b
  on a.[Country_Code] = b.[Country_code]
  where a.Year between 2000 and 2017
GO


