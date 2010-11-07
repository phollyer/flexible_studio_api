package api.tcp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tcp.notifiers.OnReceiveErrorEvent;
	import api.tcp.Tcp;
	
	[Event(name="result", type="api.events.tcp.onReceiveError.OnReceiveErrorEvent")]
	[Bindable]
	public class OnReceiveError extends Tcp
	{		
		// Result
		public var errorMessage:String = null;
		
		public function OnReceiveError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onReceiveError"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveErrorError", code:"40007"} );
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