package api.events.printer.getDefaultPrinter
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class GetDefaultPrinterEvent extends PrinterEvent
	{
		
	/**
	* The GetDefaultPrinterEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>defaultPrinter</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
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