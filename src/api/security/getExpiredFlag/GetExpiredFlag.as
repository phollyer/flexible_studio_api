package api.security.getExpiredFlag
{
	import api.events.security.getExpiredFlag.GetExpiredFlagEvent;

	import api.security.Security;

	import flash.events.IEventDispatcher;

	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.security.getExpiredFlag.GetExpiredFlagEvent.RESULT
	*/
	[Event(name="result", type="api.events.security.getExpiredFlag.GetExpiredFlagEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_getExpiredFlag.html Northcode Help Documentation
	*/
	public class GetExpiredFlag extends Security
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>true</code>
		*/
		public var expired:Boolean = true;
		
		/**
		* Constructor for Security.GetExpiredFlag()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_getExpiredFlag.html Northcode Help Documentation
		*/
		public function GetExpiredFlag(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Security_getExpiredFlag.html Northcode Help Documentation
		*/
		public function getExpiredFlag():void
		{
			ssCore.Security.getExpiredFlag( {}
										   ,{callback:actionComplete, errorSTR:"getExpiredFlagError", code:"36000"} );
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
			
			var e : GetExpiredFlagEvent = new GetExpiredFlagEvent( GetExpiredFlagEvent.RESULT );
			e.expired = expired;
			dispatchEvent( e );
		}
	}
}