/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script will let you know how i created the new database named 'datawarehouse' after checking if it already exists. 
    If the database exists, it is dropped and recreated. Additionally, this script creates a schema called gold
	
Step : 1 - I have created a new schema as below :


CREATE SCHEMA `datawarehouse` ;

Step : 2   - I have used Table data import wizard to get the final data files stored as csv files; which evolved after transforming through the data architecture for this project which follows Medallion Architecture Bronze, Silver, and Gold lay
Step : 3   - I have mentioned the file path and imported the data after selecting the clause "Drop table if exists".
Step : 4   - And i did the same with the rest of the data files and got my data imported properly.
