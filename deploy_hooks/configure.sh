#!/bin/bash
REGION=$(curl --silent http://169.254.169.254/latest/meta-data/placement/availability-zone)
REGION=${REGION%?}
aws s3 cp --region $REGION s3://trinimbus-wp/config/wp-config.php /var/www/html
cat <<EOF > /var/www/html/health-check
healthy
EOF
