package api.events.printer.notifiers
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class OnCompleteEvent extends PrinterEvent
	{
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var data:String = null;
		
		public function OnCompleteEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnCompleteEvent = new OnCompleteEvent( type );
			e.data = data;
			return e;
		}
	}
}