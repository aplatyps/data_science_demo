# Data Science Demo

This is a simple data science project with three example scenarios:
1. Petrol formulation analysis and clustering
2. Oil palm fresh fruit brunch yield analysis
3. Natural language text processing and analysis of a paragraph


## Methodology

For the purpose of this demo, an example MS SQL server is hosted locally for storing the dataset. The following works for Windows.

Create and run a Docker Container for MS SQL Server, with a password that fulfills MS SQL's password requirements.

`docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Pwd@1234!!" -p 1433:1433 -d mcr.microsoft.com/mssql/server:2022-latest`


Upload the files into MS SQL Server storage path that does not requires permission because WSL does not mount drives correctly and there is a bug in MS SQL server in Docker container system admin connection.

`docker cp C:/Users/Test/Desktop/folder/q1/ingredient.csv docker_container_name:/var/opt/mssql/data/q1/ingredient.csv`

`docker cp C:/Users/Test/Desktop/folder/q2/palm_ffb.csv docker_container_name:/var/opt/mssql/data/q2/palm_ffb.csv`


Then, connect Azure to the MS SQL Server in Docker container through the Azure Data Studio GUI. Create a database in MS SQL and tables for the .csv files via SQL querying. See the SQL query files in the respective example folders.

Now the server and database is all set, ready for data analysis.

There are several ways to do a data analysis or visualisation, such as using extensions in Azure called Sanddance. In this demo, I'm using SQL to query data to Python notebook for analysis and visualisation. It is possible to write your own functions to perform statistical calculations such as the mean, median, correlation coefficient etc. I'm using some ready-available libraries such as pandas, pandas-profiling and sklearn to automatically generate the things that I need. This may not be ideal for extremely large dataset, but for the purpose of this demo, it is ample. Don't spend too much time writing codes from scratch for a data science/analytic task. It is not productive because the focus is to draw hypothesis, present results and make conclusions. Use whatever tool that helps you get what you want fast.




