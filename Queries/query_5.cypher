MATCH (y:Year)-[:year]-(a:Publication)-[:publisher]-(p:Publisher)
WITH y, p, COUNT(a) as ca
ORDER BY ca DESC
RETURN y.year as Year, collect(p)[0].name as Publisher
ORDER BY Year;
