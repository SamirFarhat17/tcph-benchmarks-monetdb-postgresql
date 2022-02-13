
#assumes you start in the root folder

CUR_PATH=`pwd`
mkdir -p data
mkdir -p queries
DATA_PATH=${CUR_PATH}/data
QUERIES_PATH=${CUR_PATH}/queries

rm -f ${DATA_PATH}/*.tbl ${DATA_PATH}/*.csv
rm -f ${QUERIES_PATH}/*.sql




cd dbgen
make clean
make
./dbgen -s 0.5 # will create all tables for SF1 
mv *.tbl ../data
cd $CUR_PATH

cd dbgen/queries
for q in `seq 1 22`
do
    ../qgen $q > $QUERIES_PATH/$q.sql
    sed 's/^select/explain select/' $QUERIES_PATH/$q.sql > $QUERIES_PATH/$q.explain.sql
done

#convert tbl to csv to load in postgresql
cd $DATA_PATH
if [ -f customer.tbl ]; then
	echo "Converting tbl files to csv"
	for i in `ls *.tbl`; do sed 's/|$//' $i > ${i/tbl/csv}; echo $i; done;
else
	echo "TPCH tbl files not found"
fi

echo "Done generating data, sending to psql"

# create pstgres DB and load the data that we just generated into it
psql task2database_psql < ${CUR_PATH}/psql-setup/tpch-ddl.sql
psql task2database_psql < ${CUR_PATH}/psql-setup/tpch-pkeys.sql
psql task2database_psql < ${CUR_PATH}/psql-setup/tpch-load.sql

echo "Done importing to psql, sending to monetdb"

# create a monet db and load the data that we just generated into it
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/tpch-drop.sql
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/tpch-ddl.sql
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/tpch-pkeys.sql
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/sanity.sql
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/tpch-load.sql
sleep 2
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/tpch-load-orders.sql
sleep 2
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/tpch-load-lineitem.sql
echo "Done -- sanity check printing:"
mclient -d task2database_monet -p 50000 ${CUR_PATH}/monet-setup/sanity.sql

echo "All done!"
