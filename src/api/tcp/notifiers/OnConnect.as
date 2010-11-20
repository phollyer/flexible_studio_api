package api.tcp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tcp.notifiers.OnConnectEvent;
	import api.tcp.Tcp;
	
	[Event(name="result", type="api.events.tcp.onConnect.OnConnectEvent")]
	[Bindable]
	public class OnConnect extends Tcp
	{		
		// Result
		public var destinationAddress:String = null;
		
		public function OnConnect(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onConnect"}
							 	 ,{callback:actionComplete, errorSTR:"onConnectError", code:"40004"} );
		}
		override protected function sendResult( r:Object ):void
		{
			destinationAddress = r.result;
			
			var e : OnConnectEvent = new OnConnectEvent( OnConnectEvent.RESULT );
			e.destinationAddress = destinationAddress;
			dispatchEvent( e );
		}
	}
}