function add_connection() {
    name=$1
    type=$2
    login=$3
    password=$4
    host=$5
    port=$6
    schema=$7

    echo $port

    cmd=""

    $cmd=$($cmd + "a")

    echo $cmd
    echo airflow connections add \
        $name \
        --conn-type $type \
        --conn-login $login \
        --conn-password $password \
        --conn-host $host \
        [[ -z $port ]] && --conn-port $port \
        --conn-schema $schema
}

function add_all_connections() {
    connections_file=$1

    [[ -z $connections_file ]] && echo "Provide a filename. " && return

    entries=$(jq -c '.[]' $connections_file)

    for entry in $entries; do
        name=$(echo $entry | jq '.name')
        type=$(echo $entry | jq '.type')
        login=$(echo $entry | jq '.login')
        password=$(echo $entry | jq '.password')
        host=$(echo $entry | jq '.host')
        port=$(echo $entry | jq '.port')
        schema=$(echo $entry | jq '.schema')

        add_connection $name $type $login $password $host $port $schema
    done
}

connections_file=$1
add_all_connections $connections_file
