OPTIONAL MATCH (p:Article) RETURN "Article" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:Inproceedings) RETURN "Inproceedings" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:Proceedings) RETURN "Proceedings" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:Book) RETURN "Book" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:Incollection) RETURN "Incollection" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:PHDThesis) RETURN "PHDThesis" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:MasterThesis) RETURN "MasterThesis" as Type, COUNT(p) as Number
UNION ALL
OPTIONAL MATCH (p:WWW) RETURN "WWW" as Type, COUNT(p) as Number;
