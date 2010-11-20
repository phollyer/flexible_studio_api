package api.printer.notifiers
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.notifiers.OnCompleteEvent;
	import api.printer.Printer;

	public class OnComplete extends Printer
	{
		// Result
		public var data:String = null;
		
		public function OnComplete(target:IEventDispatcher=null)
		{
			super(target);
			ssCore.Printer.setNotify( {event:"onComplete"}
									 ,{callback:actionComplete, errorSTR:"onCompleteError", code:"32011"} );
		}
		override protected function sendResult( r:Object ):void
		{
			data = r.result;
			
			var e : OnCompleteEvent = new OnCompleteEvent( OnCompleteEvent.RESULT );
			e.data = data;
			dispatchEvent( e );
		}
	}
}