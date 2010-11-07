package api.udp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.udp.notifiers.OnReceiveEvent;
	import api.udp.Udp;
	
	[Event(name="result", type="api.events.udp.onReceive.OnReceiveEvent")]
	[Bindable]
	public class OnReceive extends Udp
	{		
		// Result
		public var ipAddress:String = null;
		public var messageData:String = null;
		
		public function OnReceive(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Udp.setNotify( {event:"onReceive"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveError", code:"44005"} );
		}
		override protected function sendResult( r:Object ):void
		{
			ipAddress = r.result.split( COMMA )[ 0 ];
			messageData = r.result.split( COMMA )[ 1 ];
			
			var e : OnReceiveEvent = new OnReceiveEvent( OnReceiveEvent.RESULT );
			e.messageData = messageData;
			e.ipAddress = ipAddress;
			dispatchEvent( e );
		}
	}
}