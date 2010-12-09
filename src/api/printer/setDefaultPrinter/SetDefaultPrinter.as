package api.printer.setDefaultPrinter
{
	import api.events.printer.setDefaultPrinter.SetDefaultPrinterEvent;

	import api.printer.Printer;

	import flash.events.IEventDispatcher;
	
	[Bindable]
	/**
	* Set the Windows default printer
	*
	* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_setDefaultPrinter.html Northcode Help Documentation
	*/
	public class SetDefaultPrinter extends Printer
	{
		// Optional
		/**
		* 
		*
		* @defaultValue <code>null</code>
		*/
		public var printerName:String = null;	
		
		/**
		* Constructor for Printer.SetDefaultPrinter()
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_setDefaultPrinter.html Northcode Help Documentation
		*/
		public function SetDefaultPrinter(target:IEventDispatcher=null)
		{
			super(target);
		}
		/**
		* Set the Windows default printer
		*
		*
		* @see http://www.northcode.com/v3/help/index.html?page=ssCore_Printer_setDefaultPrinter.html Northcode Help Documentation
		*/
		public function setDefaultPrinter():void
		{
			var __o:Object = new Object();
			switch( printerName != null )
			{
				case true:
					__o.printerName = printerName;
			}
			
			ssCore.Printer.setDefaultPrinter( __o
									  	    ,{callback:actionComplete, errorSTR:"setDefaultPrinterError", code:"32006"} );
		}
	}
}