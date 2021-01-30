MATCH p = ShortestPath((a1:Person{name:"Hector Garcia-Molina"})-[:author *]-(a2:Person))
WHERE a1 <> a2
RETURN a2.name as Author, length(p)/2-1 as Distance;
