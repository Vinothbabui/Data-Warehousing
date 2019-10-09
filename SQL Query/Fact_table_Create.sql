USE [agriculture]
GO

/****** Object:  Table [dbo].[FACT_TBL]    Script Date: 02-11-2018 00:21:05 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
DROP TABLE [dbo].[FACT_TBL]
CREATE TABLE [dbo].[FACT_TBL](
	[Crop_ID] int not null FOREIGN KEY REFERENCES [dbo].[Dim_Crop] (Crop_ID),
	[Location_ID] [numeric](18, 0) FOREIGN KEY REFERENCES [dbo].[Dim_Location] (Location_ID) not null,
	[date_id] [numeric](18, 0) FOREIGN KEY REFERENCES [dbo].[Dim_Time] (date_id),
	[Organic_Production] [float] NULL,
	[Total_GDP] [numeric](18, 0) NULL,
	[Population] [numeric](18, 0) NULL,
	[Yeild_Production] [numeric](18, 0) NULL
) ON [PRIMARY]
GO


