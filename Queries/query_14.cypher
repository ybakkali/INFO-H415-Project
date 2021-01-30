MATCH (s:Series)-[:series]-(p:Publication)
RETURN s.name as Series, COUNT(p) as Number;
