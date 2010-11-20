package api.tcp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tcp.notifiers.OnDisconnectEvent;
	import api.tcp.Tcp;
	
	[Event(name="result", type="api.events.tcp.onDisconnect.OnDisconnectEvent")]
	[Bindable]
	public class OnDisconnect extends Tcp
	{		
		// Result
		public var message:String = null;
		
		public function OnDisconnect(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onDisconnect"}
							 	 ,{callback:actionComplete, errorSTR:"onDisconnectError", code:"40005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			message = r.result;
			
			var e : OnDisconnectEvent = new OnDisconnectEvent( OnDisconnectEvent.RESULT );
			e.message = message;
			dispatchEvent( e );
		}
	}
}