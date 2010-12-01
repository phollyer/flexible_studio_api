package api.security.setExpiryDate
{
	import api.events.security.setExpiryDate.SetExpiryDateEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_setExpiryDate.html Northcode Help Documentation
	*/
	public class SetExpiryDate extends Security
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>1</code>
		*/
		public var day:int = 1;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var hour:int = 0;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var minute:int = 0;
		/**
		* 
		*
		* @defaultValue <code>1</code>
		*/
		public var month:int = 1;
		/**
		* 
		*
		* @defaultValue <code>0</code>
		*/
		public var second:int = 0;
		/**
		* 
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
		*
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