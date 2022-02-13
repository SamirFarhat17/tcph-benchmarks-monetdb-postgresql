START TRANSACTION;
COPY INTO lineitem FROM '/home/cs460user/pa2-task2/data/lineitem.csv' USING DELIMITERS '|';
COMMIT;

