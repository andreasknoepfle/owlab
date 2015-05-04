
$DOCKER_CONTAINER_IP = %x(/sbin/ifconfig eth0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}') if ENV["INSIDE_DOCKER"]
Owldiff::Client.setup ENV.fetch("OVERWRITE_OWLDIFF_HOST", ENV["INSIDE_DOCKER"] ? "owldiff" : "localhost"), ENV.fetch("OVERWRITE_OWLDIFF_PORT",4567)
