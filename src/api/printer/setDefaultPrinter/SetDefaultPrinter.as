package api.printer.setDefaultPrinter
{
	import flash.events.IEventDispatcher;
	import api.printer.Printer;
	
	[Bindable]
	public class SetDefaultPrinter extends Printer
	{
		// Optional
		public var printerName:String = null;	
		
		public function SetDefaultPrinter(target:IEventDispatcher=null)
		{
			super(target);
		}
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