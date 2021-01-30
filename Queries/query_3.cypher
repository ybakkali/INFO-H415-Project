MATCH ()-[:editor]->(p:Person)<-[:author]-()
RETURN DISTINCT p.name;
