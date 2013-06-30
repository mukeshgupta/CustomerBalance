package dao
{
	[Bindable]
	public class Customer
	{
		public var loaded:Boolean = false;
		
		public var customerId:int;
		public var firstName:String;
		public var lastName:String;
		public var title:String;
		public var email:String;
		public var billingAddress:AddressVO;
		public var shippingAddress:AddressVO;
		public var picture:String;
		public var balance:Number = 0;
		
		
		/*private var _directReports:ArrayCollection;
		private var directReportsLoaded:Boolean = false;
		
		// Lazy loading of the list of contacts
		[Bindable(event="contactsChanged")]
		public function get directReports():ArrayCollection
		{
			if (!directReportsLoaded && id > 0)
			{
				var CustomerSrv:CustomerDAO = new CustomerDAO();
				_directReports = CustomerSrv.findByManager(id);
				directReportsLoaded = true;
			}
			return _directReports;
		}*/
		
	}
}