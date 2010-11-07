package api.events.printer.getDefaultPrinter
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class GetDefaultPrinterEvent extends PrinterEvent
	{		
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var defaultPrinter:String = null;
		
		public function GetDefaultPrinterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetDefaultPrinterEvent = new GetDefaultPrinterEvent( type );
			e.defaultPrinter = defaultPrinter;
			return e;
		}
	}
}