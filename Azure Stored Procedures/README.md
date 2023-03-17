# Overview

The Stored Procedures located within the Azure Stored Procedures folder of this repository provide reusable procedural logic to be invoked and used by Azure Data Factory pipelines. Included are 3 stored procedures located within database schemas named "config" and "logging".

# Creation

These Stored Procedures are intended to be created within an Azure SQL Database that can be referenced by an Azure Data Factory Linked Service connection. Ideally, the Database should be hosted independently from source and target relational databases.
