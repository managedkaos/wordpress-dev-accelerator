#!/bin/bash
echo "Checking DB..."
/usr/bin/mysqlcheck --user=wordpress --password=wordpress wordpress > /dev/null 2>&1

while [ $? -ne 0 ]; do
    echo "Waiting for DB to be ready..."
    /usr/bin/mysqlcheck --user=wordpress --password=wordpress wordpress > /dev/null 2>&1
    sleep 1
done

echo "DB is ready! :D"
