MATCH (y:Year)-[:year]-(p:Publication)
RETURN y.year as Year, COUNT(p) as Number
ORDER BY Year;
