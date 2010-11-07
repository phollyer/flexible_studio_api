package api.events.printer.printText
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class PrintTextEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		public static const MISSING_TEXT:String = "missingText";
		
		public function PrintTextEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PrintTextEvent = new PrintTextEvent( type );
			return e;
		}
	}
}