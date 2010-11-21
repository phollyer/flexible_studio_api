package api.events.printer.getPrinterList
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class GetPrinterListEvent extends PrinterEvent
	{
		/**
	* The GetPrinterListEvent.RESULT constant defines the value of the
	* <code>type</code> property of the event object
	* for a <code>result</code> event.
	*
	* <p>The properties of the event object have the following values:</p>
	* <table class=innertable>
	* <tr><th>Property</th><th>Value</th></tr>
	* 
	* <tr><td>printerList</td><td>null</td></tr>
	* 
	* </table>
	*
	* @eventType result
	*/
		public static const RESULT:String = "result";
		
		public var printerList:Array = null;
		
		public function GetPrinterListEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : GetPrinterListEvent = new GetPrinterListEvent( type );
			e.printerList = printerList;
			return e;
		}
	}
}