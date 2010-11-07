package api.events.printer.setDefaultPrinter
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class SetDefaultPrinterEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		
		public function SetDefaultPrinterEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetDefaultPrinterEvent = new SetDefaultPrinterEvent( type );
			return e;
		}
	}
}