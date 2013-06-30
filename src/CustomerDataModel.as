package
{
	import dao.Setting;
	
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.filesystem.File;

	[Bindable]
	public class CustomerDataModel
	{
		private static var _instance:CustomerDataModel;
		public function CustomerDataModel()
		{
		}
		
		public static function getInstance():CustomerDataModel
		{
			if(_instance == null)
			{
				_instance = new CustomerDataModel();
			}
			
			return _instance;
		}
		
		public static var _sqlConnection:SQLConnection;
		
		public function get sqlConnection():SQLConnection
		{
			if (_sqlConnection) return _sqlConnection;
			var file:File = File.documentsDirectory.resolvePath("BalanceDB.db");
			var fileExists:Boolean = file.exists;
			_sqlConnection = new SQLConnection();
			_sqlConnection.open(file);
			if (!fileExists)
			{
				createDatabase();
				//populateDatabase();
			}
			return _sqlConnection;
		}
		
		
		public var setting:Setting = new Setting();
		protected function createCustomerTable():void
		{
			var sql:String = 
				"CREATE TABLE IF NOT EXISTS customer ( "+
				"customerId INTEGER PRIMARY KEY AUTOINCREMENT, " +
				"firstName VARCHAR(50), " +
				"lastName VARCHAR(50), " +
				"title VARCHAR(50), " +
				"email VARCHAR(150)," +
				"picture VARCHAR(200))";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
		}
		
		protected function createSettingTable():void
		{
			var sql:String = 
				"CREATE TABLE IF NOT EXISTS setting ( "+
				"dbDateFormat VARCHAR(500), " +
				"uiDisplayDateFormat VARCHAR(500), " +
				"currency VARCHAR(15))";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
		}
		
		protected function createAddressTable():void
		{
			var sql:String = 
				"CREATE TABLE IF NOT EXISTS Address ( "+
				"customerId VARCHAR(50),"+
				"addressType VARCHAR(20),"+
				"room_shop_no VARCHAR(20),"+
				"wing VARCHAR(10),"+
				"bldg VARCHAR(200),"+
				"sector VARCHAR(200),"+
				"street VARCHAR(200),"+
				"city  VARCHAR(200),"+
				"state  VARCHAR(200),"+
				"country  VARCHAR(200),"+
				"pincode  VARCHAR(10),"+
				"officephone1  VARCHAR(15),"+
				"officephone2  VARCHAR(15),"+
				"cellphone1  VARCHAR(15),"+
				"cellphone2  VARCHAR(15),"+
				"homephone1  VARCHAR(15),"+
				"homephone2  VARCHAR(15))" ;
			
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
		}
		
		protected function createCustBalanceTable():void
		{
			var sql:String = 
				"CREATE TABLE IF NOT EXISTS custBalance ( "+
				"customerId VARCHAR(50),"+
				"purchaseDate VARCHAR(20),"+
				"billAmt VARCHAR(20),"+
				"paidAmt VARCHAR(20),"+
				"balanceAmt VARCHAR(20)," +
				"orderId VARCHAR(50)," +
				"invoiceId VARCHAR(50))";
			
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.execute();
		}
		
		protected function createDatabase():void
		{
			createCustomerTable();	
			createAddressTable();
			createCustBalanceTable();
			createSettingTable();
		}
		
	}
}