# Run migration scripts in alphabetical order against a remote mysql database

# Loop through migrations (quitting if one fails)
echo MAKING SURE SCHEMA $MYSQL_DBSCHEMA EXISTS
mysql \
	    --host=$MYSQL_HOST \
	    --port=$MYSQL_PORT \
	    --user=$MYSQL_USER \
	    "--password=$MYSQL_PASS" \
	    $MYSQL_EXTRA_CLI_PARAMS \
	    --execute="CREATE SCHEMA IF NOT EXISTS $MYSQL_DBSCHEMA;"

set -e
for FILE in `ls ./migrations/*.sql | sort -g`; 
do
	# Build Script File, auto-embedding script filename
	echo "\n\n---------------------------------------------------------"
	echo RUNNING MIGRATION $FILE
	export MIGRATION_FILE=$FILE
	echo "SET @SCRIPTNAME='$FILE';" > temp.sql
	cat $FILE >> temp.sql

	# Run migration
	mysql \
	    --host=$MYSQL_HOST \
	    --port=$MYSQL_PORT \
	    --user=$MYSQL_USER \
	    "--password=$MYSQL_PASS" \
	    --database="$MYSQL_DBSCHEMA" \
	    $MYSQL_EXTRA_CLI_PARAMS \
	    < temp.sql
    rm -f temp.sql
	echo "DONE RUNNING MIGRATION $FILE\n"
done
