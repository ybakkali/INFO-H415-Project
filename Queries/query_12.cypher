MATCH (j:Journal)-[]-(p)
RETURN j.name as Journal, COUNT(p) as Number
ORDER BY Number DESC;
