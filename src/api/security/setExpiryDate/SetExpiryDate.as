package api.security.setExpiryDate
{
	import api.events.security.setExpiryDate.SetExpiryDateEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	* Override the conditions on the Expiry tab and set a new time and date when the application should expire. You can use this command to extend the life of an expired application after it has expired (i.e. your own custom expiry system). The new expiry date will be checked the next time your application starts. The date and time settings should be specified in local time.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiryDate.html Northcode Help Documentation
	*/
	public class SetExpiryDate extends Security
	{
		// Optional
		/**
		* Expiry day in month (1..31).
		*
		* @defaultValue <code>1</code>
		*/
		public var day:int = 1;
		/**
		* Expiry hour (0.. 23).
		*
		* @defaultValue <code>0</code>
		*/
		public var hour:int = 0;
		/**
		* Expiry minute (0..59).
		*
		* @defaultValue <code>0</code>
		*/
		public var minute:int = 0;
		/**
		* Expiry month (Jan=1, Feb=2, ...
		*
		* @defaultValue <code>1</code>
		*/
		public var month:int = 1;
		/**
		* Expiry second (0..59).
		*
		* @defaultValue <code>0</code>
		*/
		public var second:int = 0;
		/**
		* Expiry year (2004..2099).
		*
		* @defaultValue <code>2010</code>
		*/
		public var year:int = 2010;
		
		/**
		* Constructor for Security.SetExpiryDate()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiryDate.html Northcode Help Documentation
		*/
		public function SetExpiryDate(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Override the conditions on the Expiry tab and set a new time and date when the application should expire. You can use this command to extend the life of an expired application after it has expired (i.e. your own custom expiry system). The new expiry date will be checked the next time your application starts. The date and time settings should be specified in local time.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiryDate.html Northcode Help Documentation
		*/
		public function setExpiryDate():void
		{
			ssCore.Security.setExpiryDate( {year:year , month:month , day:day , hour:hour , minute:minute , second:second}
										  ,{callback:actionComplete, errorSTR:"setExpiryDateError", code:"36005"} );
		}
	}
}