START TRANSACTION;
COPY INTO lineitem FROM '/home/cs561user/project1/data/lineitem.csv' USING DELIMITERS '|';
COMMIT;

