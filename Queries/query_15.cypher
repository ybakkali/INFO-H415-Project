MATCH (y:Year)-[:year]-(a:Publication)-[:publisher]-(d:Publisher)
WITH y, d, COUNT(a) as ca
ORDER BY ca DESC
WITH y, collect(d)[0] as dd

MATCH (p:Person)<--(a:Publication)-[:publisher]-(dd)
MATCH (dd)--(a)--(y)
WITH y, dd, p, COUNT(a) as c
WITH y, dd, max(c) as m

MATCH (p:Person)<--(a:Publication)-[:publisher]-(dd)
MATCH (dd)--(a)--(y)
WITH y, dd, p, COUNT(a) as c, m
WHERE c = m
RETURN y.year as Year, dd.name as Publisher, collect(p.name) as Person, m as Publications
ORDER BY Year;
