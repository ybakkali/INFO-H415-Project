MATCH (p:Person)<--(a:Publication)
WITH p, COUNT(a) as c
WITH max(c) as m
MATCH (p:Person)<--(a:Publication)
WITH p, COUNT(a) as c, m
WHERE c = m
RETURN p.name as Name;
