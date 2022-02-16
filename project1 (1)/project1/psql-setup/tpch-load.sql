BEGIN;
COPY part FROM '/home/cs561user/project1/data/part.csv' WITH (FORMAT csv, DELIMITER '|');
COPY region FROM '/home/cs561user/project1/data/region.csv' WITH (FORMAT csv, DELIMITER '|');
COPY nation FROM '/home/cs561user/project1/data/nation.csv' WITH (FORMAT csv, DELIMITER '|');
COPY supplier FROM '/home/cs561user/project1/data/supplier.csv' WITH (FORMAT csv, DELIMITER '|');
COPY customer FROM '/home/cs561user/project1/data/customer.csv' WITH (FORMAT csv, DELIMITER '|');
COPY partsupp FROM '/home/cs561user/project1/data/partsupp.csv' WITH (FORMAT csv, DELIMITER '|');
COPY orders FROM '/home/cs561user/project1/data/orders.csv' WITH (FORMAT csv, DELIMITER '|');
COPY lineitem FROM '/home/cs561user/project1/data/lineitem.csv' WITH (FORMAT csv, DELIMITER '|');
COMMIT;


