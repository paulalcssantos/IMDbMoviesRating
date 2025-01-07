SET LANGUAGE English;

--Cria uma nova coluna para armazenar apenas a data contida na coluna RELEASE_DATE
/*
CREATE OR ALTER TABLE DBO.IMDB_MOVIES
  ADD Date DATE;
GO

UPDATE DBO.IMDB_MOVIES
SET Date = CONVERT(DATE, TRIM(LEFT(RELEASE_DATE, CHARINDEX('(', RELEASE_DATE + '(') - 1)))
GO
*/

SELECT DISTINCT TOP 10 Title, Date, Average_Rating / 10 As Rating, Director, Cast, Country_of_Origin, Languages, Runtime
FROM DBO.IMDB_MOVIES
WHERE YEAR(Date) = 2024
ORDER BY Rating DESC

SELECT DISTINCT TOP 10 Title, Date, Average_Rating / 10 As Rating, Director, Cast, Country_of_Origin, Languages, Runtime
FROM DBO.IMDB_MOVIES
WHERE Country_of_Origin LIKE 'Brazil%' AND Languages LIKE 'Portuguese%'
ORDER BY Rating DESC


SELECT DISTINCT Title, Date, Average_Rating / 10 As Rating, Director, Cast
FROM DBO.IMDB_MOVIES 
WHERE Cast LIKE '%FERNANDA TORRES%' 


SELECT DISTINCT Title, Date, Average_Rating / 10 As Rating, Director, Cast
FROM DBO.IMDB_MOVIES
WHERE Cast LIKE '%FERNANDA MONTENEGRO%'


SELECT Title, Date, Director, Cast 
FROM DBO.IMDB_MOVIES
WHERE Cast LIKE '%FERNANDA TORRES%' 
  AND Cast LIKE '%FERNANDA MONTENEGRO%';

SELECT TRIM(value)  AS Director, 
       COUNT(Title) AS Total_Filmes
FROM DBO.IMDB_MOVIES
   CROSS APPLY STRING_SPLIT(Director, ',')
WHERE Languages LIKE 'Portuguese%'
GROUP BY TRIM(value)
HAVING COUNT(Title) > 1
ORDER BY Total_Filmes DESC;

