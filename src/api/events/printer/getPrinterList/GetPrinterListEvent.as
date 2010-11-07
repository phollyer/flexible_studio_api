package api.events.printer.getPrinterList
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class GetPrinterListEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
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