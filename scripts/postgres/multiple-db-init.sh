#!/bin/bash

set -e
set -u


psql=( psql -v ON_ERROR_STOP=1 )

if [ "$POSTGRES_USERS" ]; then
	USERS_ARR=$(echo $POSTGRES_USERS | tr "|" "\n")
	for USER in $USERS_ARR
	do
		USER_NAME=`echo $USER | cut -d: -f1`
		USER_PASSWORD=`echo $USER | cut -d: -f2`
		if [ "$USER_NAME" = 'postgres' ]; then
			op='ALTER'
		else
			op='CREATE'
		fi
		"${psql[@]}" --username "$POSTGRES_USER" <<-EOSQL
			$op USER "$USER_NAME" WITH SUPERUSER PASSWORD '$USER_PASSWORD' ;
		EOSQL
	done
fi

# If you want to create more than one database, please use that variable
# Variable example: POSTGRES_DATABASES="database1:user1|database2:user2|database3:user3"
if [ "$POSTGRES_DATABASES" ]; then
	DATABASES_ARR=$(echo $POSTGRES_DATABASES | tr "|" "\n")
	for DATABASE in $DATABASES_ARR
	do
		DATABASE_NAME=`echo $DATABASE | cut -d: -f1`
		DATABASE_OWNER=`echo $DATABASE | cut -d: -f2`
		if [ "$DATABASE_NAME" != 'postgres' ]; then
			if [ "$DATABASE_OWNER" ]; then
				"${psql[@]}" --username "$POSTGRES_USER" <<-EOSQL
				CREATE DATABASE "$DATABASE_NAME" owner "$DATABASE_OWNER" ;
				EOSQL
				echo
			else
				"${psql[@]}" --username "$POSTGRES_USER" <<-EOSQL
					CREATE DATABASE "$DATABASE_NAME" ;
				EOSQL
				echo
			fi
		fi
	done
fi