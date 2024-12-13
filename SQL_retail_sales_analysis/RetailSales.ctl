LOAD DATA
INFILE 'D:\Project\Oracle_project\SQL_retail_sales_analysis\Retail Sales Analysis_utf .csv'
APPEND INTO TABLE retail_sales
FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'
TRAILING NULLCOLS
(
    transactions_id,
    sale_date,
    sale_time "TO_DATE(:sale_time, 'HH24:MI:SS')",
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs, 
    total_sale
)




