package api.security.getExpiredFlag
{
	import flash.events.IEventDispatcher;
	
	import api.errors.Security_Error;
	import api.events.security.getExpiredFlag.GetExpiredFlagEvent;
	import api.security.Security;

	[Event(name="result", type="api.events.security.getExpiredFlag.GetExpiredFlagEvent")]
	[Bindable]
	public class GetExpiredFlag extends Security
	{
		// Result
		public var expired:Boolean = true;
		
		public function GetExpiredFlag(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getExpiredFlag():void
		{
			ssCore.Security.getExpiredFlag( {}
										   ,{callback:actionComplete, errorSTR:"getExpiredFlagError", code:"36000"} );
		}
		override protected function sendResult( r:Object ):void
		{
			expired = checkBoolean( r.result );
			
			var e : GetExpiredFlagEvent = new GetExpiredFlagEvent( GetExpiredFlagEvent.RESULT );
			e.expired = expired;
			dispatchEvent( e );
		}
	}
}