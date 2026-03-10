sleep 15s

/opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P YourStrong!Pass -d master -i /usr/src/app/init-db.sql