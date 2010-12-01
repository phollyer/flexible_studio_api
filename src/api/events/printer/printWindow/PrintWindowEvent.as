package api.events.printer.printWindow
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class PrintWindowEvent extends PrinterEvent
	{
		
		public function PrintWindowEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PrintWindowEvent = new PrintWindowEvent( type );
			return e;
		}
	}
}