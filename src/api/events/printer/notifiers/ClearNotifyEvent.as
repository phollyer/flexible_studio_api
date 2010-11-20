package api.events.printer.notifiers
{
	import flash.events.Event;
	
	import api.events.printer.PrinterEvent;

	public class ClearNotifyEvent extends PrinterEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}	
	}
}