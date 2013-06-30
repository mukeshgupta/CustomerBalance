package dao
{
	public class CustomerBalanceVO
	{
		public var customerId:String;
		public var purchaseDate:String;
		public var billAmt:String;
		public var paidAmt:String;
		public var balanceAmt:String;
		//use in future reference
		public var orderId:String;
		public var invoiceId:String;
		
		public function CustomerBalanceVO()
		{
			paidAmt = "0";
		}
		
		
	}
}