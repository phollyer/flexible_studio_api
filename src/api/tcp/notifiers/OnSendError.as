package api.tcp.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.tcp.notifiers.OnSendErrorEvent;
	import api.tcp.Tcp;
	
	[Event(name="result", type="api.events.tcp.onSendError.OnSendErrorEvent")]
	[Bindable]
	public class OnSendError extends Tcp
	{		
		// Result
		public var errorMessage:String = null;
		
		public function OnSendError(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Tcp.setNotify( {event:"onSendError"}
							 	 ,{callback:actionComplete, errorSTR:"onSendErrorError", code:"40008"} );
		}
		override protected function sendResult( r:Object ):void
		{
			errorMessage = r.result;
			
			var e : OnSendErrorEvent = new OnSendErrorEvent( OnSendErrorEvent.RESULT );
			e.errorsMessage = errorMessage;
			dispatchEvent( e );
		}
	}
}