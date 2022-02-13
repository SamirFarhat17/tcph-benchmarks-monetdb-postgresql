START TRANSACTION;
COPY INTO orders FROM '/home/cs460user/pa2-task2/data/orders.csv' USING DELIMITERS '|';
COMMIT;

