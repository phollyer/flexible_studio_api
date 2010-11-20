package api.printer.getDefaultPrinter
{
	import api.events.printer.getDefaultPrinter.GetDefaultPrinterEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	/**
	* Dispatched when the Results are ready.
	*
	* @eventType api.events.printer.getDefaultPrinter.GetDefaultPrinterEvent.RESULT
	*/
	[Event(name="result", type="api.events.printer.getDefaultPrinter.GetDefaultPrinterEvent")]
	[Bindable]
	/**
	*
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getDefaultPrinter.html Northcode Help Documentation
	*/
	public class GetDefaultPrinter extends Printer
	{
		// Result
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var defaultPrinter:String = null;
		
		/**
		* Constructor for Printer.GetDefaultPrinter()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getDefaultPrinter.html Northcode Help Documentation
		*/
		public function GetDefaultPrinter(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		*
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_getDefaultPrinter.html Northcode Help Documentation
		*/
		public function getDefaultPrinter():void
		{
			ssCore.Printer.getDefaultPrinter( {}
											 ,{callback:actionComplete, errorSTR:"getDefaultPrinterError", code:"32000"} );
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
			defaultPrinter = r.result;
			
			var e : GetDefaultPrinterEvent = new GetDefaultPrinterEvent( GetDefaultPrinterEvent.RESULT );
			e.defaultPrinter = defaultPrinter;
			dispatchEvent( e );
		}
	}
}