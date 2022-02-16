START TRANSACTION;
COPY INTO orders FROM '/home/cs561user/project1/data/orders.csv' USING DELIMITERS '|';
COMMIT;

