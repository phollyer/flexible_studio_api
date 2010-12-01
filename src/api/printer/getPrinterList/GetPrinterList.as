package api.printer.getPrinterList
{
	import api.events.printer.getPrinterList.GetPrinterListEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.printer.getPrinterList.GetPrinterListEvent.RESULT
	*/
	[Event(name="result", type="api.events.printer.getPrinterList.GetPrinterListEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getPrinterList.html Northcode Help Documentation
	*/
	public class GetPrinterList extends Printer
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var printerList:Array = null;
		
		/**
		* Constructor for Printer.GetPrinterList()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getPrinterList.html Northcode Help Documentation
		*/
		public function GetPrinterList(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getPrinterList.html Northcode Help Documentation
		*/
		public function getPrinterList():void
		{
			ssCore.Printer.getPrinterList( {}
										  ,{callback:actionComplete, errorSTR:"getPrinterListError", code:"32001"} );
		}
		/**
		* A result has been received so dispatch it.
		*
		* @param r The result Object returned by SWF Studio.
		*
		* @private
		*/
		override protected function sendResult( r:Object ):void
		{
			printerList = r.result.split( CR );
			
			var e : GetPrinterListEvent = new GetPrinterListEvent( GetPrinterListEvent.RESULT );
			e.printerList = printerList;
			dispatchEvent( e );
		}
	}
}