CREATE TABLE #Table(
	[ID] [int] NOT NULL,
	[Code] [nvarchar](2) NULL
)

INSERT #Table
VALUES 
(1, 'PA'),
(1, 'PC'),
(2, 'PA'),
(3, 'MR'),
(3, 'ST'),
(3, 'DS'),
(4, 'DS')

SELECT ID, Code FROM #Table

SELECT p1.ID,
       (SELECT Code + ', ' 
           FROM #Table p2
          WHERE p2.ID = p1.ID
          ORDER BY Code
            FOR XML PATH('') ) AS Codes
      FROM #Table p1
      GROUP BY ID