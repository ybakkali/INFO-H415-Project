MATCH (p:Person)<-[:author]-(a:Publication)-[:author]->(c:Person)
WITH p, c, COUNT(a) as number
RETURN p.name as Person, collect(c { .name, number}) as `Co-authors`;
