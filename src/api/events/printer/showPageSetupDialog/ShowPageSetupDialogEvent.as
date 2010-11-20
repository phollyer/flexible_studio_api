package api.events.printer.showPageSetupDialog
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class ShowPageSetupDialogEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var button:String = null;
		
		public function ShowPageSetupDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowPageSetupDialogEvent = new ShowPageSetupDialogEvent( type );
			e.button = button;
			return e;
		}
	}
}