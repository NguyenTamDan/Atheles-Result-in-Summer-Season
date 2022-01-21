-- Cleansed Athletes Even Results --
SELECT TOP (1000) [ID]
      ,[Name] as 'CompetitorName' -- renamed column
      ,case when [Sex] = 'M' then 'Male' else 'Female' end as Sex 
      ,[Age] 
	  ,case when Age < 18 then 'Under 18' when Age between 18 and 25 then '18-25' when Age between 25 and 30 then '25-30' when Age > 30 then 'Over 30' end as AgeGrouping
      ,[Height]
      ,[Weight]
      ,[NOC] as NationCode --explained abbreviation
      ,left(Games, CHARINDEX(' ', Games)-1) as 'Year'
	  ,right(Games, CHARINDEX(' ', reverse(Games))-1) as 'Season'
	  ,[Games]
      --,[City]
      ,[Sport]
      ,[Event]
      ,case when [Medal] = 'NA' then 'Not Registered' else Medal end as Medal -- replaced NA with Not Registered
  FROM [olympic_games].[dbo].[athletes_event_results]
  where right(Games, CHARINDEX(' ', reverse(Games))-1) = 'Summer' -- for only summer season