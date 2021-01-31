for query in $1/*
    do
    echo $query >> $2
    cat $query | cypher-shell -u $3 -p $4 --format verbose | tail -1 >> $2
    done
