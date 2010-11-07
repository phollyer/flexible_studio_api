package api.events.printer.showPrintDialog
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class ShowPrintDialogEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var button:String = null;
		
		public function ShowPrintDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowPrintDialogEvent = new ShowPrintDialogEvent( type );
			e.button = button;
			return e;
		}
	}
}