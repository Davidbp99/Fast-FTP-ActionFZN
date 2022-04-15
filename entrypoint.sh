#!/bin/sh

# "to avoid continuing when errors or undefined variables are present"
set -eu

if [ $4 = "sftp" ]; then
  echo "Establishing SFTP connection..."
  sshpass -p $3 sftp -o StrictHostKeyChecking=no -P $PORT $2@$1
  echo "Connection established"
else
  
fi;

echo "Using $4 to connect to port"

echo "Uploading files..."
lftp $4://$1:$ -u $2,$3 -e "set ftp:ssl-allow no; mirror -R -P 10 -e $5 $6; quit"

echo "Action complete"
exit 0
