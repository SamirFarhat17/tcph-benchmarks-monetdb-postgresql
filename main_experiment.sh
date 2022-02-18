#!/bin/bash
echo 'PSQL:\n'
for i in {1..10}
do
	echo 'Loop Iteration\n'
	psql -d task2database_psql -c '\timing' -f queries/5.sql >> query_results/psql_5.log
	psql -d task2database_psql -c '\timing' -f queries/8.sql >> query_results/psql_8.log
	psql -d task2database_psql -c '\timing' -f queries/20.sql >> query_results/psql_20.log
done
echo 'MonetDB\n'
for i in {1..10}
do
	echo 'Loop Iteration\n'
        mclient --timer performance -dtask2database_monet < queries/5.sql >> query_results/monet_5.log
        mclient --timer performance -dtask2database_monet < queries/8.sql >> query_results/monet_8.log
        mclient --timer performance -dtask2database_monet < queries/20.sql >> query_results/monet_20.log
done

