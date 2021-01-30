MATCH (p:Article)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "Article" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:Inproceedings)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "Inproceedings" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:Proceedings)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "Proceedings" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:Book)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "Book" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:Incollection)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "Incollection" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:PHDThesis)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "PHDThesis" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:MasterThesis)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "MasterThesis" as Type, sum(cp * ca) / sum(cp)  as `Authors average`

UNION ALL

MATCH (p:WWW)-[a]-(:Person)
WITH p, COUNT(a) as ca
WITH ca, COUNT(p) as cp
RETURN "WWW" as Type, sum(cp * ca) / sum(cp)  as `Authors average`;
