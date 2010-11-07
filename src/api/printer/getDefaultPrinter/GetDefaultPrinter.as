package api.printer.getDefaultPrinter
{
	import flash.events.IEventDispatcher;
	
	
	import api.events.printer.getDefaultPrinter.GetDefaultPrinterEvent;
	import api.printer.Printer;
	
	[Event(name="result", type="api.events.printer.getDefaultPrinter.GetDefaultPrinterEvent")]
	[Bindable]
	public class GetDefaultPrinter extends Printer
	{
		// Result
		public var defaultPrinter:String = null;
		
		public function GetDefaultPrinter(target:IEventDispatcher=null)
		{
			super(target);
		}
		public function getDefaultPrinter():void
		{
			ssCore.Printer.getDefaultPrinter( {}
											 ,{callback:actionComplete, errorSTR:"getDefaultPrinterError", code:"32000"} );
		}
		override protected function sendResult( r:Object ):void
		{
			defaultPrinter = r.result;
			
			var e : GetDefaultPrinterEvent = new GetDefaultPrinterEvent( GetDefaultPrinterEvent.RESULT );
			e.defaultPrinter = defaultPrinter;
			dispatchEvent( e );
		}
	}
}