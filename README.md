## Overview

The purpose of this repository is to demonstrate a metadata-driven framework for performing Data Ingestion activities between source relational database management systems (RDBMS') such as SQL Server, and target Microsoft Azure-based data platforms such as Azure Data Lake Storage. Azure Data Factory is the service used to orchestration purposes, and invokes collection of stored procedures and control tables referenced in an Azure SQL Database. When using this framework, a single Azure Data Factory pipeline dynamically generates Structured Query Language (SQL) statements for a collection of source tables, applies relevant incremental filtering conditions by source table, executes a Copy activity between the specified Source and Sink, and records logging information during execution, including start times, end times, and pipeline run status.

![Azure Data Factory Control Flow](/images/pipelineControlFlow.png)

## Prerequisites

To use this framework, an **Azure Data Factory** service should be provisioned within an Azure subscription, connectivity should exist to the source relational database of interest, and an **Azure SQL Database** should be provisioned to store the configuration and logging objects referenced by the Azure Data Factory processes. Connectivity to on-premises enterprise data platforms is typically accomplished with at least 2 **Self-Hosted Integration Runtime** nodes, and via a Site-to-Site VPN or ExpressRoute connection. Additionally, the desired target data store should be provisioned, with an Azure Data Lake Storage (ADLS Gen2) account used within this repository's Azure Data Factory pipeline. Additionally, an **Azure Key Vault** instance can be provisioned to securely store credentials and authenticate to external data stores via Azure Data Factory.

