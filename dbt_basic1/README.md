This is the most basic DBT project. This project focuses on the basic entities / files that you would see in a DBT project and create a simple model.

### What can you learn?

- Set up DBT core for Big Query
- Creating a basic DBT project
- Understand project structure of a typical DBT project
- Define source / target datasets for your project
- Create a simple model and materialize it in Big Query database.


### Setting up DBT for Big Query
DBT can be installed into a virtual environment to isolate the DBT environment and prevent any conflicts later on.

- Create a virtual environment using Python or Conda and install dbt-bigquery using the following commands. You can also refer to the [documentation](https://docs.getdbt.com/docs/core/connect-data-platform/bigquery-setup) for more details.

	``` bash
	conda create -n <myenv_name> python=3.10
	conda install dbt-bigquery==1.6.1
	```
	NOTE: The above mentioned commands assume that you have conda installed. If you don't want to use conda you can create a venv and pip install dbt-bigquery. More instructions on installation can be found [here](https://docs.getdbt.com/docs/core/installation-overview)

- Download and install Google Cloud CLI following all the steps from [here](https://cloud.google.com/sdk/docs/install)

    This installs all the google cloud commands such as `gcloud auth` in your command line or terminal.


### Creating a DBT project
Before we create a project, it is a good practice to use version control so we can keep track of the code changes. This is also one of the advantages of using DBT.

To create a project from scratch:
- Create a new git repository and clone it to your local using git clone.
- `cd <git_repository>` and run `dbt init`

Once you run the dbt init command, it will start asking a series of questions that are required to set up the project. After you provide response to all the questions, it will create a profiles.yml file in ~/.dbt directory and a project folder with the name you specified in the git_repository you ran the command in.

### Project Structure
In the project structure we will go over the files/folders that we are going to use in this project, we will discuss the others as we use them in subsequent projects.

The entire project structure looks similar to the image below:

<image>

#### Profiles.yml
This file contains the information required to connect to your target database in Big Query. The info in a sample profiles.yml file can be found in the image file.

The descriptions of the fields are as follows:
- **dataset** is the target database/schema in the bigquery where you create tables and add data.
- **method** refers to the method used for authentication to access your big query account. If you select oauth, it will take you to a webpage and ask you to sign in with your google account.
- **project** is the project id that your dataset is in in BigQuery
- **threads** means the number of parallel queries to run. If you opt for 1 thread, then it means bigquery will only run 1 sql query at a time. If you have 4 (which is usually recommended) it will run 4 sql queries in parallel which would speed up the run. This parallelization of queries also follows the DAG in the dbt model. We will learn more about this and what it means later on.
- **target** just means which profiles you want to use. Similar to Dev, we can also create a Prod section to save the target production dataset and project. We can change the target and make dbt load data/ create tables in the production database.

#### dbt_project.yml
This file contains different configurations that can be set up at a project level.


#### Models
This directory contains all the model files that we create as part of the project.


### Creating a model
A model in DBT is basically a SQL query saved in a .sql file. To create a simple model, we can create a .sql file and write a SQL query to query a few columns from a sample dataset in Big Query.
An example of a model is provided below:

<image>

To avoid using exact paths for the datasources, we can define them in a sources.yml file and use the {{source()}} function when ever we need to refer to our source datasets.

#### sources.yml
This file contains information regarding the source datasets/tables.

A simple sources.yml can be written as below: