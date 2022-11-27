dump-db:
	docker-compose exec club-postgres pg_dumpall -c -U postgres > dump_`date +%d-%m-%Y"_"%H_%M_%S`.sql

restore-db: 
	cat your_dump.sql | docker exec -i your-db-container psql -U postgres
