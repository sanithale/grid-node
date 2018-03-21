#!/bin/sh
echo "Running Grid Start Node"
# Get Running Instance Local IP
export EC2_INSTANCE_IP="`wget -q -O - http://169.254.169.254/latest/meta-data/local-ipv4 || die \"wget instance-id has failed: $?\"`"
# Run Docker
docker run -d -p 5555:5555 -e REMOTE_HOST="http://$EC2_INSTANCE_IP:5555" -e HUB_PORT_4444_TCP_ADDR=10.255.21.225 -e HUB_PORT_4444_TCP_PORT=4444 selenium/node-chrome
echo "Started Grid Node"
