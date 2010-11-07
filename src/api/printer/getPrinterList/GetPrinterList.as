package api.printer.getPrinterList
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.getPrinterList.GetPrinterListEvent;
	import api.printer.Printer;
	
	[Event(name="result", type="api.events.printer.getPrinterList.GetPrinterListEvent")]
	[Bindable]
	public class GetPrinterList extends Printer
	{
		// Result
		public var printerList:Array = null;
		
		public function GetPrinterList(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getPrinterList():void
		{
			ssCore.Printer.getPrinterList( {}
										  ,{callback:actionComplete, errorSTR:"getPrinterListError", code:"32001"} );
		}
		override protected function sendResult( r:Object ):void
		{
			printerList = r.result.split( CR );
			
			var e : GetPrinterListEvent = new GetPrinterListEvent( GetPrinterListEvent.RESULT );
			e.printerList = printerList;
			dispatchEvent( e );
		}
	}
}