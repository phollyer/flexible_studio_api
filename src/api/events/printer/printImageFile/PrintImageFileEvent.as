package api.events.printer.printImageFile
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class PrintImageFileEvent extends PrinterEvent
	{	
		public static const COMPLETE:String = "complete";
		public static const MISSING_PATH:String = "missingPath";
		
		public function PrintImageFileEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : PrintImageFileEvent = new PrintImageFileEvent( type );
			return e;
		}
	}
}