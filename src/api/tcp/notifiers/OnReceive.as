package api.tcp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tcp.notifiers.OnReceiveEvent;
	import api.tcp.Tcp;
	
	[Event(name="result", type="api.events.tcp.onReceive.OnReceiveEvent")]
	[Bindable]
	public class OnReceive extends Tcp
	{		
		// Result
		public var messageData:String = null;
		
		public function OnReceive(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onReceive"}
							 	 ,{callback:actionComplete, errorSTR:"onReceiveError", code:"40006"} );
		}
		override protected function sendResult( r:Object ):void
		{
			messageData = r.result;
			
			var e : OnReceiveEvent = new OnReceiveEvent( OnReceiveEvent.RESULT );
			e.messageData = messageData;
			dispatchEvent( e );
		}
	}
}