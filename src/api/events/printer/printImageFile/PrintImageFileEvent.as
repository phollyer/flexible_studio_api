package api.events.printer.printImageFile
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class PrintImageFileEvent extends PrinterEvent
	{
		
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