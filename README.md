# Exploring-BI-Tools
### A Data Analysis Project on Exploring two different Open Source BI Tools namely Apache Superset and Metabase.
## End-to-End Project Idea:
Building two fully **functional dashboards** created using the same dataset  — one using **Apache Superset** and the other using **Metabase**. The dashboards should showcase a range of **visualizations, filters**, and interactions.

Making a comprehensive comparison report detailing on the following:
   - Core features of both tools.
   
   - **Flexibility**, ease of use, and performance while creating dashboards.
  
   - Pros and cons of Apache Superset and Metabase.
   
   - Insights on their advanced capabilities (**scheduling, data filtering, access control**, etc.). (Optional, Exploratory). 
   
   - **Time Series** and **Trend Analysis**


# Tools Used
- Docker Desktop
- Git
- Apache Superset
- MySQL
- Metabase

# Data Source Used
The primary dataset in the project is a detailed record of the estimated production of varied Food grains, Cereals, Pulses, Oilseeds and Commercial crops across the varied harvesting seasons in India (Kharif, Rabi and Summer) from the year 2013 till 2024.
The Dataset is provided by the ___Department of Agriculture and Farmers Welfare___ under the ___Ministry of Agriculture and Farmers Welfare___, Government of India. The pdf file contains three tables in three different sheets with a combined total of __34 Rows__ and __13 Columns__ with all text data types in default. The source file is dated on 25.09.2024. 

Link for the website- [Directorate of Economics and Statistics (DES)](https://desagri.gov.in)

# Installation & Setup and other Guides:
>[!Note]
>**Hosted on Windows 11, 64 bit operating System, x64 based processor & WSL enabled, using Docker Desktop.**


## #1 Installing Superset using Docker Compose...
Step 1 - Install Docker Desktop from [here](https://www.docker.com/products/docker-desktop/)

Step 2 - Install Git from [here](https://git-scm.com/download/win)

Step 3 - Search for apache superset in docker -> Pull -> Image will be created -> Run it. 

Step 4 - Check that superset container is running in docker containers.

Step 5 - Go to command line and type `docker --version` to check if its functioning or not in local computer.

Step 6 - Now type-in the 4 commands as it is to set up apache superset making sure you have copied your latest tag from docker images. 
(you also can find your latest tag (will appear on top) and copy it from the [Docker Hub Website](https://hub.docker.com/r/apache/superset/tags) )

**Command lines to run in Command Prompt** -

`docker run -d -p 8080:8088 -e "SUPERSET_SECRET_KEY=mysuperset" --name superset apache/superset:<put your latest tag here>`

`docker exec -it superset superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin`

`docker exec -it superset superset db upgrade`

`docker exec -it superset superset load_examples`

`docker exec -it superset superset init`

Step 7 - Go to your web browser and type in the link `http://localhost:8080/superset/welcome/`

Step 8 - Pop up window for credentials, Username: `admin`, Password: `admin`

**SUPERSET INSTALLATION DONE.**
 >[!IMPORTANT]
 >**Make sure you have sample charts and dashboards visible in your superset UI. If not then look out for possible errors in your docker desktop while setting up superset, check the tag or restart the system.**

## #2 Connecting MySQL Database to Apache Superset...
Step 1 - Go to the right top corner of the superset window and click on the `+` drop-down-menu and click on `connect database`.

Step 2 - Click on the MySQL option and Connect using the **SQlalchmey uri** and type-in 

`mysql://<database_user>:<database_password>@host.docker.internal:3306/<your_schema>`

here add only the database_user, database_password, and your_schema keep the rest as it is.

**DATABASE CONNECTION DONE.**
>[!NOTE]
>**If test connection does not work check for necessary driver installation in the [documentation](https://superset.apache.org/docs/configuration/databases/)**



## #3 Installing Metabase using Docker Compose...
Step 1 - Install Docker Desktop from [here](https://www.docker.com/products/docker-desktop/)

Step 2 - Install Git from [here](https://git-scm.com/download/win)

Step 3 - Follow the command prompt lines to run in terminal

`docker pull metabase/metabase:latest` after which it is visible in your Docker images.
  
`docker run -d -p 3000:3000 --name metabase metabase/metabase` to run the Metabase container.
  
Step 4 - This will launch the Metabase server on port 3000 by default, you can access the port at `http://localhost:3000`.

**METABASE INTALLATION DONE.**
>[!TIP]
>**Follow the official documentaion of Metabase for further info [here](https://www.metabase.com/docs/latest/)**

## #4 Connecting MySQL Database to Metabase...
Step 1 - Under the setting options, scroll to the Admin Settings, click on the ___Add a database___.

Step 2 - Add all the needed credentials, to connect the desired schema to the metabase database.

Step 3 - We can also use the Advanced option to connect MySQL databases using **JDBC connection string**.

**DATABASE CONNECTION DONE.**
>[!NOTE]
>**MySQL is running locally and not inside a Docker container, so, we need to use ___host.docker.internal___ as the host name while connecting to Metabase (running inside a docker container). This basically refers to the host machine. As MySQL is not present inside the Docker container.**

# Description
The Code Snippets for sql queries are given in [my gist1](https://gist.github.com/Radiohead229/cd2922b81aaccbb71df986970cd12ec2)

The Code Snippets for the CSS Customizations made in the dashboards are provided in [my gist2](https://gist.github.com/Radiohead229/9916959d91b0444899c786dcc461d963)

The Code Snippets for the HTML file for embedding the two dashboard urls are given in [my gist3](https://gist.github.com/Radiohead229/977a347177fa784b301225ea858b2294)

The following link highlights the gist for the sql query that represents only the crops that grow in Rabi season. This is **not a general query**: this does not represent crops that grow in 1 season rather it dynamically shows the results for crops that grow **only** in Kharif/Rabi and **not in any other Season**.

_https://gist.github.com/Radiohead229/cd2922b81aaccbb71df986970cd12ec2#file-cond_func-sql_.






