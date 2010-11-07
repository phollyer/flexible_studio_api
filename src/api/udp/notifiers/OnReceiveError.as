package api.udp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.udp.notifiers.OnReceiveErrorEvent;
	import api.udp.Udp;
	
	[Event(name="result", type="api.events.udp.onReceiveError.OnReceiveErrorEvent")]
	[Bindable]
	public class OnReceiveError extends Udp
	{		
		// Result
		public var errorMessage:String = null;
		
		public function OnReceiveError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Udp.setNotify( {event:"onReceiveError"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveErrorError", code:"44006"} );
		}
		override protected function sendResult( r:Object ):void
		{
			errorMessage = r.result;
			
			var e : OnReceiveErrorEvent = new OnReceiveErrorEvent( OnReceiveErrorEvent.RESULT );
			e.errorsMessage = errorMessage;
			dispatchEvent( e );
		}
	}
}