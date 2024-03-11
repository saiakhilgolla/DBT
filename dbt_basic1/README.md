<p align="center"><img src="https://github.com/saiakhilgolla/DBT/blob/main/assests/DBT%20logo.jpg" width="300px"></p>

<h3>Project Overview</h3>
<p align = "justify">This project focuses on understanding the basics of DBT. The scope of the project is limited to creating configuration files to set up the project and creating models using simple SQL queries. <p>

<img src = "https://img.shields.io/badge/-red?style=for-the-badge" width="1500px" height="1px">

### What can you learn?

- Set up DBT core for Big Query
- Creating a basic DBT project
- Understand project structure of a typical DBT project
- Define source / target datasets for your project
- Create a simple model and materialize it in Big Query database.

<img src = "https://img.shields.io/badge/-red?style=for-the-badge" width="1500px" height="1px">

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

<img src = "https://img.shields.io/badge/-red?style=for-the-badge" width="1500px" height="1px">

### Creating a DBT project
Before we create a project, it is a good practice to use version control so we can keep track of the code changes. This is also one of the advantages of using DBT.

To create a project from scratch:
- Create a new git repository and clone it to your local using git clone.
- `cd <git_repository>` and run `dbt init`

Once you run the dbt init command, it will start asking a series of questions that are required to set up the project. After you provide response to all the questions, it will create a profiles.yml file in ~/.dbt directory and a project folder with the name you specified in the git_repository you ran the command in.

NOTE: By default running dbt init will create a profiles.yml file in ~/.dbt folder. In case you need to use different target datasets or want to set up different profiles for different projects you can create profiles.yml inside your project. But in this case you have to add `--profiles-dir .` at the end of all dbt commands.

<img src = "https://img.shields.io/badge/-red?style=for-the-badge" width="1500px" height="1px">

### Creating Models
<p align = "justify">Creating models in DBT is as simple as writing a SELECT statement to query a table. Although, we can build much more complicated models using DBT. <p>

<p align = "justify">The 'simple_dbt_model.sql' creates a simple model by just querying a few fields from a sample ecommerce dataset in Big Query. <p>

<p align = "justify">To avoid having to use the exact paths when querying a table, I then created a *sources.yml* file where I can define my source database and tables. These defined tables can then be referred to using a Jinja function {{source(dataset, table)}}.<p>

<p align = "justify">The 'second_dbt_model.sql' creates another model with a simple SQL query, this time using the {{source(dataset, table)}} function to refer to the tables instead of using exact paths. <p>

<img src = "https://img.shields.io/badge/-red?style=for-the-badge" width="1500px" height="1px">

### Materializing models in a database

By default DBT creates views for all the models that you build. We will how to change this behavior in later projects. To run your DBT models, run the following command in the terminal.

`dbt run`

If you have profiles.yml file in the same project directory, then
```
dbt run --profiles-dir .
```
This command will run all your models in the models directory and create views for each model in the target dataset.

After you run the command you can see the views for your model files in your Big Query dataset.

