# crowdFunding-ETL

Build an ETL pipeline using Python, Pandas, and either Python dictionary methods or regular expressions to extract and transform the data. After transforming the data, create four CSV files and use the CSV file data to create an ERD and a table schema. Finally, upload the CSV file data into a Postgres database.

## Solution
- [ETL-crowdfunding](https://github.com/Saurabh-Lakhanpal/crowdFunding-ETL/blob/main/ETL.ipynb)
- [Db-Schema](https://github.com/Saurabh-Lakhanpal/crowdFunding-ETL/blob/main/crowdfunding_db_schema.sql)
- [ERD](https://github.com/Saurabh-Lakhanpal/crowdFunding-ETL/blob/main/ERD-crowdfunding_db.png)
- [Verify-db](https://github.com/Saurabh-Lakhanpal/crowdFunding-ETL/blob/main/crowdfunding_db_queries.sql)

## Instructions

### Create the Category and Subcategory DataFrames

1. Extract and transform the `crowdfunding.xlsx` Excel data to create a category DataFrame that has the following columns:
   - A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories
   - A "category" column that contains only the category titles

| category_id | category | category_name  |
|-------------|----------|----------------|
| 0           | cat1     | food           |
| 1           | cat2     | music          |
| 2           | cat3     | technology     |
| 3           | cat4     | theater        |
| 4           | cat5     | film & video   |
| 5           | cat6     | publishing     |
| 6           | cat7     | games          |
| 7           | cat8     | photography    |
| 8           | cat9     | journalism     | 


3. Export the category DataFrame as `category.csv` and save it to the GitHub repository.

4. Extract and transform the `crowdfunding.xlsx` Excel data to create a subcategory DataFrame that has the following columns:
   - A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories
   - A "subcategory" column that contains only the subcategory titles

| subcategory_id | subcategory   |
|----------------|---------------|
| subcat1        | food trucks   |
| subcat2        | rock          |
| subcat3        | web           |
| subcat4        | plays         |
| subcat5        | documentary   |
| subcat6        | electric music|
| subcat7        | drama         |
| subcat8        | indie rock    |
| subcat9        | wearables     |
| subcat10       | nonfiction    |


6. Export the subcategory DataFrame as `subcategory.csv` and save it to the GitHub repository.

### Create the Campaign DataFrame

1. Extract and transform the `crowdfunding.xlsx` Excel data to create a campaign DataFrame that has the following columns:
   - The "cf_id" column
   - The "contact_id" column
   - The "company_name" column
   - The "blurb" column, renamed to "description"
   - The "goal" column, converted to the float data type
   - The "pledged" column, converted to the float data type
   - The "outcome" column
   - The "backers_count" column
   - The "country" column
   - The "currency" column
   - The "launched_at" column, renamed to "launch_date" and with the UTC times converted to the datetime format
   - The "deadline" column, renamed to "end_date" and with the UTC times converted to the datetime format
   - The "category_id" column, with unique identification numbers matching those in the "category_id" column of the category DataFrame
   - The "subcategory_id" column, with the unique identification numbers matching those in the "subcategory_id" column of the subcategory DataFrame

| cf_id | contact_id | company_name | description | goal | pledged | outcome | backers_count | country | currency | launch_date | end_date | category_id | subcategory_id |
|-------|------------|--------------|-------------|------|---------|---------|---------------|---------|----------|-------------|--------- |-------------|-----------------|
| cf1  | con1       | Example Co.   | A great product | 10000 | 15000   | funded | 200           | US      | USD      | 2023-05-01  | 2023-06-01 | cat1        | subcat1          |
| cf2  | con2       | Another Co.   | Innovative idea | 20000 | 18000   | failed | 150           | UK      | GBP      | 2023-05-10  | 2023-07-10 | cat2        | subcat2          |
| cf3  | con3       | Startup Inc.  | New software   | 5000  | 5500    | funded | 100           | CA      | CAD      | 2023-06-01  | 2023-07-01 | cat3        | subcat3          |
| cf4  | con4       | Techie Tech   | Cutting-edge gadget | 15000 | 12000   | funded | 250           | US      | USD      | 2023-04-15  | 2023-06-15 | cat4        | subcat4          |

2. Export the campaign DataFrame as `campaign.csv` and save it to the GitHub repository.

### Create the Contacts DataFrame

Extracting and transforming the data from the `contacts.xlsx` Excel file:

**Method 1: Use Python dictionary methods**
1. Import the `contacts.xlsx` file into a DataFrame.
2. Iterate through the DataFrame, converting each row to a dictionary.
3. Iterate through each dictionary, doing the following:
   - Extract the dictionary values from the keys by using a Python list comprehension.
   - Add the values for each row to a new list.
4. Create a new DataFrame that contains the extracted data.
5. Split each "name" column value into a first and last name, and place each in a new column.
6. Clean and export the DataFrame as `contacts.csv` and save it to the GitHub repository.

**Method 2: Use regular expressions**
1. Import the `contacts.xlsx` file into a DataFrame.
2. Extract the "contact_id", "name", and "email" columns by using regular expressions.
3. Create a new DataFrame with the extracted data.
4. Convert the "contact_id" column to the integer type.
5. Split each "name" column value into a first and last name, and place each in a new column.
6. Clean and then export the DataFrame as `contacts.csv` and save it to the GitHub repository.

Check that the final DataFrame resembles this output:

| contact_id | first_name | last_name | email                |
|------------|------------|-----------|----------------------|
| con1       | John       | Doe       | johndoe@example.com  |
| con2       | Jane       | Smith     | janesmith@example.com|
| con3       | Mike       | Johnson   | mikejohnson@example.com|
| con4       | Emily      | Davis     | emilydavis@example.com|
| con5       | David      | White     | davidwhite@example.com|
| con6       | Sarah      | Brown     | sarahbrown@example.com|
| con7       | Chris      | Wilson    | chriswilson@example.com|
| con8       | Amanda     | Taylor    | amandataylor@example.com|
| con9       | James      | Thomas    | jamesthomas@example.com|
| con10      | Laura      | Lopez     | lauralopez@example.com|

### Create the Crowdfunding Database

1. Inspect the four CSV files, and then sketch an ERD of the tables by using QuickDBD.

2. Use the information from the ERD to create a table schema for each CSV file.

3. Save the database schema as a Postgres file named `crowdfunding_db_schema.sql`, and save it to the GitHub repository.

4. Create a new Postgres database, named `crowdfunding_db`.

5. Using the database schema, create the tables in the correct order to handle the foreign keys.

6. Verify the table creation by running a `SELECT` statement for each table.

7. Import each CSV file into its corresponding SQL table.

8. Verify that each table has the correct data by running a `SELECT` statement for each.
