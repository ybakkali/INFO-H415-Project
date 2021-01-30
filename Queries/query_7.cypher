MATCH (p:Person)

OPTIONAL MATCH (p)<--(a:Article)
WITH p, COUNT(a) as ca

OPTIONAL MATCH (p)<--(b:Inproceedings)
WITH p, ca, COUNT(b) as cb

OPTIONAL MATCH (p)<--(c:Proceedings)
WITH p, ca, cb, COUNT(c) as cc

OPTIONAL MATCH (p)<--(d:Book)
WITH p, ca, cb, cc, COUNT(d) as cd

OPTIONAL MATCH (p)<--(e:Incollection)
WITH p, ca, cb, cc, cd, COUNT(e) as ce

OPTIONAL MATCH (p)<--(f:PHDThesis)
WITH p, ca, cb, cc, cd, ce, COUNT(f) as cf

OPTIONAL MATCH (p)<--(g:MastersThesis)
WITH p, ca, cb, cc, cd, ce, cf, COUNT(g) as cg

OPTIONAL MATCH (p)<--(h:WWW)
WITH p, ca, cb, cc, cd, ce, cf, cg, COUNT(h) as ch

RETURN p.name as Person, ca as Article, cb as Inproceedings,
cc as Proceedings, cd as Book, ce as Incollection, cf as PHDThesis,
cg as MastersThesis, ch as WWW, ca + cb + cc + cd + ce + cf + cg + ch as Total;
