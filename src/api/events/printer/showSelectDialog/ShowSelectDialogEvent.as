package api.events.printer.showSelectDialog
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class ShowSelectDialogEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		public static const RESULT:String = "result";
		
		public var button:String = null;
		
		public function ShowSelectDialogEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowSelectDialogEvent = new ShowSelectDialogEvent( type );
			e.button = button;
			return e;
		}
	}
}