package dao
{
	import flash.data.SQLConnection;
	import flash.data.SQLStatement;
	import flash.filesystem.File;
	
	import mx.collections.ArrayCollection;
	
	public class CustomerDAO
	{
		/*public function getItem(id:int):Customer
		{
			var sql:String = "SELECT id, firstName, lastName, title, department, city, email, officePhone, cellPhone, managerId, picture FROM employee WHERE id=?";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = id;
			stmt.execute();
			var result:Array = stmt.getResult().data;
			if (result && result.length == 1)
				return processRow(result[0]);
			else
				return null;
				
		}

		public function findByManager(managerId:int):ArrayCollection
		{
			var sql:String = "SELECT * FROM employee WHERE managerId=? ORDER BY lastName, firstName";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = managerId;
			stmt.execute();
			var result:Array = stmt.getResult().data;
			if (result)
			{
				var list:ArrayCollection = new ArrayCollection();
				for (var i:int=0; i<result.length; i++)
				{
					list.addItem(processRow(result[i]));	
				}
				return list;
			}
			else
			{
				return null;
			}
		}

		

		public function create(employee:Employee):void
		{
			trace(employee.firstName);
			if (employee.manager) trace(employee.manager.id);
			var sql:String = 
				"INSERT INTO employee (id, firstName, lastName, title, department, managerId, city, officePhone, cellPhone, email, picture) " +
				"VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = employee.id;
			stmt.parameters[1] = employee.firstName;
			stmt.parameters[2] = employee.lastName;
			stmt.parameters[3] = employee.title;
			stmt.parameters[4] = employee.department;
			stmt.parameters[5] = employee.manager ? employee.manager.id : null;
			stmt.parameters[6] = employee.city;
			stmt.parameters[7] = employee.officePhone;
			stmt.parameters[8] = employee.cellPhone;
			stmt.parameters[9] = employee.email;
			stmt.parameters[10] = employee.picture;
			stmt.execute();
			employee.loaded = true;
		}
		
		
		*/
		
		
		/*protected function populateDatabase():void
		{
			var file:File = File.applicationDirectory.resolvePath("assets/employees.xml");
			var stream:FileStream = new FileStream();
			stream.open(file, FileMode.READ);
			var xml:XML = XML(stream.readUTFBytes(stream.bytesAvailable));
			stream.close();
			var employeeDAO:EmployeeDAO = new EmployeeDAO();
			for each (var emp:XML in xml.employee)
			{
				var employee:Employee = new Employee();
				employee.id = emp.id;
				employee.firstName = emp.firstName;
				employee.lastName = emp.lastName;
				employee.title = emp.title;
				employee.department = emp.department;
				employee.city = emp.city;
				employee.officePhone = emp.officePhone;
				employee.cellPhone = emp.cellPhone;
				employee.email = emp.email;
				employee.picture = emp.picture;
				if (emp.managerId>0)
				{
					employee.manager = new Employee();
					employee.manager.id = emp.managerId;
				}
				employeeDAO.create(employee);
			}
		}*/
		
		
		public function createCustomerRecord(customer:Customer):void
		{
			trace(customer.firstName);
			var sql:String = 
				"INSERT INTO customer (customerId, firstName, lastName, title, email, picture) " +
				"VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = customer.customerId;
			stmt.parameters[1] = customer.firstName;
			stmt.parameters[2] = customer.lastName;
			stmt.parameters[3] = customer.title;
			stmt.parameters[4] = customer.email;
			stmt.parameters[10] = customer.picture;
			stmt.execute();
			customer.loaded = true;
		}
		
		public function insertCustomerBalanceRecord(customerBalObj:CustomerBalanceVO):void
		{
			var sql:String = 
				"INSERT INTO custBalance (customerId, purchaseDate, billAmt, paidAmt, balanceAmt, orderId, invoiceId) " +
				"VALUES (?,?,?,?,?,?,?,?,?,?,?)";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = customerBalObj.customerId;
			stmt.parameters[1] = customerBalObj.purchaseDate;
			stmt.parameters[2] = customerBalObj.billAmt;
			stmt.parameters[3] = customerBalObj.paidAmt;
			stmt.parameters[4] = customerBalObj.balanceAmt;
			stmt.parameters[5] = customerBalObj.orderId;
			stmt.parameters[6] = customerBalObj.invoiceId;
			stmt.execute();
		}
		
		public function createAddressRecord(addressObj:AddressVO):void
		{
			var sql:String = "INSERT INTO Address (customerId, addressType, room_shop_no, wing, bldg, sector, street, city, state, country, pincode, officephone1, officephone2, cellphone1, cellphone2, homephone1, homephone2) "+
			"VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = addressObj.customerId
			stmt.parameters[1] = addressObj.addressType
			stmt.parameters[2] = addressObj.room_shop_no
			stmt.parameters[3] = addressObj.wing
			stmt.parameters[4] = addressObj.bldg
			stmt.parameters[5] = addressObj.sector
			stmt.parameters[6] = addressObj.street
			stmt.parameters[7] = addressObj.city
			stmt.parameters[8] = addressObj.state
			stmt.parameters[9] = addressObj.country
			stmt.parameters[10] = addressObj.pincode
			stmt.parameters[11] = addressObj.officephone1
			stmt.parameters[12] = addressObj.officephone2
			stmt.parameters[13] = addressObj.cellphone1
			stmt.parameters[14] = addressObj.cellphone2
			stmt.parameters[15] = addressObj.homephone1
			stmt.parameters[16] = addressObj.homephone2
				
			stmt.execute();
			
		}
		
		
		public function findByName(searchKey:String):ArrayCollection
		{
			var sql:String = "SELECT * FROM customer WHERE firstName || ' ' || lastName LIKE ? ORDER BY lastName, firstName";
			var stmt:SQLStatement = new SQLStatement();
			stmt.sqlConnection = sqlConnection;
			stmt.text = sql;
			stmt.parameters[0] = "%" + searchKey + "%";
			stmt.execute();
			var result:Array = stmt.getResult().data;
			if (result)
			{
				var list:ArrayCollection = new ArrayCollection();
				for (var i:int=0; i<result.length; i++)
				{
					list.addItem(processRow(result[i]));	
				}
				return list;
			}
			else
			{
				return null;
			}
		}
		
		protected function processRow(o:Object):Customer
		{
			var customer:Customer = new Customer();
			customer.customerId = o.customerId;
			customer.firstName = o.firstName == null ? "" : o.firstName;
			customer.lastName = o.lastName == null ? "" : o.lastName;
			customer.title = o.title == null ? "" : o.title;
			customer.balance = isNaN(o.balance)? 0 : parseFloat(o.balance);
			customer.billingAddress = o.billingAddress == null ? null : o.billingAddress as AddressVO;
			customer.email = o.email == null ? "" : o.email;
			customer.picture = o.picture == null ? "" : o.picture;
			customer.shippingAddress = o.shippingAddress == null ? null : o.shippingAddress as AddressVO;
			customer.loaded = true;
			return customer;
		}

		
	}
}