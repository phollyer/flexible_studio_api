package api.security.isExpired
{
	import api.events.security.isExpired.IsExpiredEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.security.isExpired.IsExpiredEvent.RESULT
	*/
	[Event(name="result", type="api.events.security.isExpired.IsExpiredEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_isExpired.html Northcode Help Documentation
	*/
	public class IsExpired extends Security
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var expired:Boolean = true;
		
		/**
		* Constructor for Security.IsExpired()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_isExpired.html Northcode Help Documentation
		*/
		public function IsExpired(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_isExpired.html Northcode Help Documentation
		*/
		public function isExpired():void
		{
			ssCore.Security.isExpired( {}
									  ,{callback:actionComplete, errorSTR:"isExpiredError", code:"36002"} );
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
			expired = checkBoolean( r.result );
			
			var e : IsExpiredEvent = new IsExpiredEvent( IsExpiredEvent.RESULT );
			e.expired = expired;
			dispatchEvent( e );
		}
	}
}