## Overview

Included within this folder is a Structured Query Language (SQL) utility which queries the source relational database catalog, and returns the inventory of fields and associated properties to be used by the metadata-driven Data Ingestion framework in Azure Data Factory and Azure SQL Database.

## Usage

The reusable SQL statement should be executed against the data source, and the output should be saved for import into the corresponding Azure SQL Database table. Additional properties such as field sensitivity, classification should be appended as desired, and can later be applied as filtering conditions within an Azure Data Factory pipeline.
