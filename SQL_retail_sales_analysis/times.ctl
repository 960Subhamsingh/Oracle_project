LOAD DATA
INFILE 'D:\Project\Oracle_project\SQL_retail_sales_analysis\times.csv'
insert 
INTO TABLE my_table
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    transactions_id,
    sale_date date,
    event_time "TO_DATE(:event_time, 'HH24:MI:SS')",
    customer_id,
    gender,
    age
)