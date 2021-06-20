#!/bin/sh
# V2Ray new configuration
cat <<-EOF > /v2ray/config.json
$CONFIG_JSON
EOF
# Run V2Ray
exec /v2ray/v2ray -config=/v2ray/config.json
