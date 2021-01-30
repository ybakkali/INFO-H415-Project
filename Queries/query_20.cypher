MATCH (p:Publication)<-[c:cite]-()
WHERE EXISTS(p.title)
WITH p, COUNT(c) as cc
RETURN p.title as Publication, cc as Times
ORDER BY cc DESC;
