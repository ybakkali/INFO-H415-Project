MATCH (p:Person)<-[:author]-()
RETURN DISTINCT p.name as Name;
