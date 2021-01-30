MATCH (a:Person)<-[:author]-(:Publication)--(y:Year)
WITH a, MIN(y.year) as minp
MATCH (a)<-[:author]-(:Publication)--(y:Year)
WITH a, minp, MAX(y.year) as maxp
RETURN a.name as Author, maxp - minp as Interval
ORDER BY Interval DESC LIMIT 5;
