MATCH (s:School)-[:school]-(b:Publication)
RETURN s.name as School, COUNT(b) as Number;
