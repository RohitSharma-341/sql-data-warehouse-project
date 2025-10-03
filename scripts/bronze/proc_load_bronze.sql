/*store procedure :load bronze layer 
bulk insert 
truncates actions 

*/

Create or alter procedure bronze.load_bronze as 
begin
	declare @start_time DATETIME,@end_time datetime
	begin try

	
	print '++++++++++++++++++++++++++++++++++++++++++'
	print 'loading bronze layer '
	print '++++++++++++++++++++++++++++++++++++++++++'


	print'======================================='
	print 'loading CRM tables'
	print'======================================='

	set @start_time = GETDATE();
	print '<<< trucating table :bronze.crm_cust_info'
	truncate table bronze.crm_cust_info;
	print '<<< inserting data into :bronze.crm_cust_info'

	BULK INSERT bronze.crm_cust_info
	from 'C:\Users\rshar\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
	with (
		Firstrow =2,
		fieldterminator=',',
		tablock
		);
		set @end_time = GETDATE();
		print '>> load duration : '+CAST(datediff(second , @start_time,@end_time )as NVARCHAR)+'SECONDS'

	
	
	set @start_time = GETDATE();
	print '<<< trucating table :bronze.crm_prd_info'
	truncate table bronze.crm_prd_info;
	print '<<< inserting data into :bronze.crm_prd_info'
	BULK INSERT bronze.crm_prd_info
	from 'C:\Users\rshar\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
	with (
		Firstrow =2,
		fieldterminator=',',
		tablock
		);
		set @end_time = GETDATE();
		print '>> load duration : '+CAST(datediff(second , @start_time,@end_time )as NVARCHAR)+'SECONDS'


	set @start_time = GETDATE();
	print '<<< trucating table :bronze.crm_sales_details'
	truncate table bronze.crm_sales_details;
	print '<<< inserting data into :bronze.crm_sales_details'
	BULK INSERT bronze.crm_sales_details
	from 'C:\Users\rshar\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
	with (
		Firstrow =2,
		fieldterminator=',',
		tablock
		);
		set @end_time = GETDATE();
		print '>> load duration : '+CAST(datediff(second , @start_time,@end_time )as NVARCHAR)+'SECONDS'
	 
	print'======================================='
	print 'loading erp tables'
	print'======================================='


	
	set @start_time = GETDATE();
	print '<<< trucating table :bronze.erp_loca101'
	truncate table bronze.erp_loc_a101;
	print '<<< inserting data into :bronze.erp_loca101'
	BULK INSERT bronze.erp_loc_a101
	from 'C:\Users\rshar\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
	with (
		Firstrow =2,
		fieldterminator=',',
		tablock
		);
		set @end_time = GETDATE();
		print '>> load duration : '+CAST(datediff(second , @start_time,@end_time )as NVARCHAR)+'SECONDS'


	
	set @start_time = GETDATE();
	print '<<< trucating table :bronze.erp_cust_az12'
	truncate table bronze.erp_cust_az12;
	print '<<< inserting data into :bronze.erp_cust_az12'

	BULK INSERT bronze.erp_cust_az12
	from 'C:\Users\rshar\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
	with (
		Firstrow =2,
		fieldterminator=',',
		tablock
		);
		set @end_time = GETDATE();
		print '>> load duration : '+CAST(datediff(second , @start_time,@end_time )as NVARCHAR)+'SECONDS'


	
	set @start_time = GETDATE();
	print '<<< trucating table :bronze.erp_px_cat_g1v2'
	truncate table bronze.erp_px_cat_g1v2;

	print '<<< inserting data into :bronze.crm_erp_px_cat_g1v2'
	BULK INSERT bronze.erp_px_cat_g1v2
	from 'C:\Users\rshar\Downloads\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
	with (
		Firstrow =2,
		fieldterminator=',',
		tablock
		);
		set @end_time = GETDATE();
		print '>> load duration : '+CAST(datediff(second , @start_time,@end_time )as NVARCHAR)+'SECONDS'
	end try
	begin catch 
		print '++++++++++++++++++++++'
		print 'Error occured during loading bronze layer'
		print '++++++++++++++++++++++'
	end catch 

end
