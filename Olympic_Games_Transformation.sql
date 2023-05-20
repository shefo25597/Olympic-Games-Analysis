/****** Script for Select Rows command from SSMS  ******/
SELECT 
	   [ID]
      ,[Name] as [Competitor Name]		-- Better name for filters and visualisations
      ,Case When [Sex] ='M' Then 'Male' Else 'Female' End As Sex
      ,[Age]
			 , Case When Age < 18 Then 'Under 18'
						When Age between 18 and 25 Then '18-25'
						When Age between 25 and 30 Then '25-30'
						When Age > 30 Then 'Over 30'
				End AS [Age Grouping]
      ,[Height]
      ,[Weight]
      ,[NOC] As 'Nation Code'	-- Explained abbreviation
	--  , CHARINDEX(' ',Games)-1 as Example1
	--  , CHARINDEX(' ',reverse(games))-1 as Example2
	  , Left(Games,CHARINDEX(' ',Games)-1 )as Year		-- Split column to isolate Year, based on space
	-- , Right(Games,CHARINDEX(' ',reverse(games))-1) as Session	 -- Split column to isolate Season, based on space
    --  ,[Games]
    --  ,[City]		-- Commented out as it is not necessary for the analysis
      ,[Sport]
      ,[Event]
      , Case When [Medal] = 'NA' Then 'Not Registered' Else Medal End As Medal		-- Replaced NA with Not Registered
  FROM [olympic_gamess].[dbo].[athletes_event_results]
    WHERE RIGHT(Games,CHARINDEX(' ', REVERSE(Games))-1) = 'Summer' -- Where Clause to isolate Summer Season
