package api.security.getExpiryDate
{
	import api.events.security.getExpiryDate.GetExpiryDateEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.security.getExpiryDate.GetExpiryDateEvent.RESULT
	*/
	[Event(name="result", type="api.events.security.getExpiryDate.GetExpiryDateEvent")]
	[Bindable]
	/**
	* Determine when this application will expire using the settings from the Expiry tab, or just retrieve the value set by a previous call to Security.setExpiryDate. All returned date and time information is in local time.
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_getExpiryDate.html Northcode Help Documentation
	*/
	public class GetExpiryDate extends Security
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var dateString:String = null;
		/**
		* Expiry day in month (1..31).
		*
		* @defaultValue <code>0</code>
		*/
		public var day:int = 0;
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
		* @defaultValue <code>0</code>
		*/
		public var month:int = 0;
		/**
		* Expiry second (0..59).
		*
		* @defaultValue <code>0</code>
		*/
		public var second:int = 0;
		/**
		* Expiry year (2004..2099).
		*
		* @defaultValue <code>0</code>
		*/
		public var year:int = 0;
		
		/**
		* Constructor for Security.GetExpiryDate()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_getExpiryDate.html Northcode Help Documentation
		*/
		public function GetExpiryDate(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Determine when this application will expire using the settings from the Expiry tab, or just retrieve the value set by a previous call to Security.setExpiryDate. All returned date and time information is in local time.
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_getExpiryDate.html Northcode Help Documentation
		*/
		public function getExpiryDate():void
		{
			ssCore.Security.getExpiryDate( {}
										  ,{callback:actionComplete, errorSTR:"getExpiryDateError", code:"36001"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			dateString = r.result;
			day = Number( r.day );
			hour = Number( r.hour );
			minute = Number( r.minute );
			month = Number( r.month );
			second = Number( r.second );
			year = Number( r.year );
			
			var e : GetExpiryDateEvent = new GetExpiryDateEvent( GetExpiryDateEvent.RESULT );
			e.dateString = dateString;
			e.day = day;
			e.hour = hour;
			e.minute = minute;
			e.month = month;
			e.second = second;
			e.year = year;			
			dispatchEvent( e );
		}
	}
}