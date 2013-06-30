package dao
{
	import spark.components.calendarClasses.DateSelectorDisplayMode;

	public class Setting
	{
		public function Setting()
		{
		}

		public var selectedDateFormat:Object;
		/**
		 * date format selected by user in setting page
		 * and used to format all dates in ui
		 * */
		public var uiDisplayDateFormat:String =  DateSelectorDisplayMode.DATE_AND_TIME;
		
		/**
		 * date format set by system to handle date with local db
		 * * */
		public var dbDateFormat:String='yyyy-MM-dd HH:mm:ss';

		public var currency:String='$';
		/**
		 * currency precision
		 * */
		public var currencyPrecision:int=2;

		public static function mapToSetting(value:Object):Setting
		{
			if (value == null)
				return null;

			var tempSetting:Setting=new Setting();
			for (var prop:* in value)
			{
				if (tempSetting.hasOwnProperty(prop))
				{
					tempSetting[prop]=value[prop];
				}
			}
			return tempSetting;
		}
	}
}

