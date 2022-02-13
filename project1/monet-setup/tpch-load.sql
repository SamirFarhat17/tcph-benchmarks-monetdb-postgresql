START TRANSACTION;
COPY INTO part FROM '/home/cs561user/project1/data/part.csv' USING DELIMITERS '|';
COMMIT;
START TRANSACTION;
COPY INTO region FROM '/home/cs561user/project1/data/region.csv' DELIMITERS '|';
COMMIT;
START TRANSACTION;
COPY INTO nation FROM '/home/cs561user/project1/data/nation.csv' USING DELIMITERS '|';
COMMIT;
START TRANSACTION;
COPY INTO supplier FROM '/home/cs561user/project1/data/supplier.csv' USING DELIMITERS '|';
COMMIT;
START TRANSACTION;
COPY INTO customer FROM '/home/cs561user/project1/data/customer.csv' USING DELIMITERS '|';
COMMIT;
START TRANSACTION;
COPY INTO partsupp FROM '/home/cs561user/project1/data/partsupp.csv' USING DELIMITERS '|';
COMMIT;

