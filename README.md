# crowdFunding-ETL

Build an ETL pipeline using Python, Pandas, and either Python dictionary methods or regular expressions to extract and transform the data. After transforming the data, create four CSV files and use the CSV file data to create an ERD and a table schema. Finally, upload the CSV file data into a Postgres database.

## Solution
-

## Instructions

### Create the Category and Subcategory DataFrames

1. Extract and transform the `crowdfunding.xlsx` Excel data to create a category DataFrame that has the following columns:
   - A "category_id" column that has entries going sequentially from "cat1" to "catn", where n is the number of unique categories
   - A "category" column that contains only the category titles

   The following image shows this category DataFrame:

![category DataFrame](https://github.com/user-attachments/assets/de61fa52-46d0-4c61-9a85-8e4c421973c3)

3. Export the category DataFrame as `category.csv` and save it to the GitHub repository.

4. Extract and transform the `crowdfunding.xlsx` Excel data to create a subcategory DataFrame that has the following columns:
   - A "subcategory_id" column that has entries going sequentially from "subcat1" to "subcatn", where n is the number of unique subcategories
   - A "subcategory" column that contains only the subcategory titles

   The following image shows this subcategory DataFrame:

![subcategory DataFrame](https://github.com/user-attachments/assets/168e7a0a-7d94-4cfe-9a3d-d137c7a7722f)

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

   The following image shows this campaign DataFrame:

![image](https://github.com/user-attachments/assets/4ba867bb-4625-4160-9b47-4c3c76aeb695)


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
6. Clean and export the DataFrame as `contacts.csv` and save it to your GitHub repository.

**Method 2: Use regular expressions**
1. Import the `contacts.xlsx` file into a DataFrame.
2. Extract the "contact_id", "name", and "email" columns by using regular expressions.
3. Create a new DataFrame with the extracted data.
4. Convert the "contact_id" column to the integer type.
5. Split each "name" column value into a first and last name, and place each in a new column.
6. Clean and then export the DataFrame as `contacts.csv` and save it to your GitHub repository.

Check that the final DataFrame resembles the one in the following image:

![image](https://github.com/user-attachments/assets/3116fd0a-7cca-4347-bc0d-bfe882e97670)

### Create the Crowdfunding Database

1. Inspect the four CSV files, and then sketch an ERD of the tables by using QuickDBD.

2. Use the information from the ERD to create a table schema for each CSV file.
   > **Note:** Remember to specify the data types, primary keys, foreign keys, and other constraints.

3. Save the database schema as a Postgres file named `crowdfunding_db_schema.sql`, and save it to your GitHub repository.

4. Create a new Postgres database, named `crowdfunding_db`.

5. Using the database schema, create the tables in the correct order to handle the foreign keys.

6. Verify the table creation by running a `SELECT` statement for each table.

7. Import each CSV file into its corresponding SQL table.

8. Verify that each table has the correct data by running a `SELECT` statement for each.

### Hints:

- To split each "category & sub-category" column value into "category" and "subcategory" column values, use `df[["new_column1","new_column2"]] = df["column"].str.split()`. Make sure to pass the correct parameters to the split() function.

- To get the unique category and subcategory values from the "category" and "subcategory" columns, create a NumPy array where the array length equals the number of unique categories and unique subcategories from each column. For information about how to do so, see [numpy.arange](https://numpy.org/doc/stable/reference/generated/numpy.arange.html) documentation.

- To create the category and subcategory identification numbers, use a list comprehension to add the "cat" string or the "subcat" string to each number in the category or the subcategory array, respectively.

- For more information about creating a new Pandas DataFrame, see the [pandas.DataFrame](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.html) documentation.

- To convert the "goal" and "pledged" columns to the float data type, use the `astype()` method.

- To convert the "launch_date" and "end_date" UTC times to the datetime format, see the `Transform_Grocery_Orders_Solved.ipynb` activity solution.

- For more information about how to add the "category_id" and "subcategory_id" unique identification numbers to the campaign DataFrame, see the [pandas.DataFrame.merge](https://pandas.pydata.org/pandas-docs/stable/reference/api/pandas.DataFrame.merge.html) documentation.
