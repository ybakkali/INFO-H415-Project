MATCH (p:Person)
OPTIONAL MATCH (p)<--(a:Publication)
RETURN p.name as Person, COUNT(a) as Publications
ORDER BY Publications DESC;
