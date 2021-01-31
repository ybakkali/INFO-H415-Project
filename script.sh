for query in $1/*
    do
    echo $query >> $2
    cat $query | cypher-shell -u neo4j -p password --format verbose | tail -1 >> $2
    done
