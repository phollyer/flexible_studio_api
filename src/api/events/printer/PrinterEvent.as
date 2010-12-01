package api.events.printer
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class PrinterEvent extends SWFStudioEvent
	{
		public function PrinterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PrinterEvent = new PrinterEvent( type );
			return e;
		}
	}
}