/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [id]
      ,[kenmerk]
      ,[westoost] westoostn
      ,[noordzuid]
      ,CHAR(64 + [westoost]) westoost
FROM [test_rob].[dbo].[Stuk]