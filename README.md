# Exploring-BI-Tools
### A Visualization Project on Exploring different Open Source BI Tools namely Apache Superset and Metabase.
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


# Installation & Setup and other Guides:
>[!Note]
>Hosted on Windows 11, 64 bit operaing System, x64 based processor & WSL enabled, using Docker Desktop.


## #1 Installing Superset using Docker Compose...
Step 1 - Install Docker Desktop from [here](https://www.docker.com/products/docker-desktop/)

Step 2 - Install Git from [here](https://git-scm.com/download/win)

Step 3 - Search for apache superset in docker -> Pull -> Image will be created -> Run it. 

Step 4 - Check that superset container is running in docker containers.

Step 5 - Go to command line and type `docker --version` to check if its fucntioning or not in local computer.

Step 6 - Now type-in the 4 commands as it is to set up apache superset making sure you have copied your latest tag from docker conatiners. 
(also can find your latest tag (will appear on top) and copy it from the [Docker Hub Website](https://hub.docker.com/r/apache/superset/tags) )

**Command lines to run in Command Promt** -

`docker run -d -p 8080:8088 -e "SUPERSET_SECRET_KEY=mysuperset" --name superset apache/superset:<put your latest tag here>`

`docker exec -it superset superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin`

`docker exec -it superset superset db upgrade`

`docker exec -it superset superset load_examples`

`docker exec -it superset superset init`

Step 7 - Go to your web browser and type in the link <`http://localhost:8080/superset/welcome/`>

Step 8 -Pop up window for credentials, Username: `admin`, Password: `admin`

**SUPERSET INSTALLATION DONE**
 >[!IMPORTANT]
 >Make sure you have sample charts and dashboards visible in your superset UI. If not then look out for possible errors in your docker desktop while setting up superset, check the tag or restart the system.
>

## #2 Connecting MySQL Database to Apache Superset...
Step 1 - Go to the right top corner of the superset window and click on the `+` drop-down-menu and click on `connect database`.

Step 2 - Click on the MySQL option and Connect using the SQl alchmey uri and type-in 

<`mysql://<database_user>:<database_password>@host.docker.internal:3306/<your_schema`> 

where add only the database_user, database_password, and your_schema keep the rest as it is.

**DATABASE CONNECTION DONE**







