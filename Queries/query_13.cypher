MATCH (j:Journal)-[:journal]-(a)-[:author]-(p:Person)
WITH j, COUNT(a) as ca, p
WITH j, MAX(ca) as mca

MATCH (j)-[:journal]-(b)-[:author]-(p:Person)
WITH j, mca, COUNT(b) as cb, p
WHERE cb = mca
RETURN j.name as Journal, collect(p.name) as Authors, cb as Number;
