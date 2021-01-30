MATCH (p:Proceedings)-[:editor]-(a:Person), (a)-[:author]-(:Inproceedings)-[:crossref]-(p)
RETURN DISTINCT p.title as Proceedings;
