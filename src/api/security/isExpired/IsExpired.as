package api.security.isExpired
{
	import flash.events.IEventDispatcher;
	
	import api.errors.Security_Error;
	import api.events.security.isExpired.IsExpiredEvent;
	import api.security.Security;

	[Event(name="result", type="api.events.security.isExpired.IsExpiredEvent")]
	[Bindable]
	public class IsExpired extends Security
	{
		// Result
		public var expired:Boolean = true;
		
		public function IsExpired(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function isExpired():void
		{
			ssCore.Security.isExpired( {}
									  ,{callback:actionComplete, errorSTR:"isExpiredError", code:"36002"} );
		}
		override protected function sendResult( r:Object ):void
		{
			expired = checkBoolean( r.result );
			
			var e : IsExpiredEvent = new IsExpiredEvent( IsExpiredEvent.RESULT );
			e.expired = expired;
			dispatchEvent( e );
		}
	}
}