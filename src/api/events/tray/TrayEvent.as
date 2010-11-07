package api.events.tray
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class TrayEvent extends KernelEvent
	{		
		public function TrayEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : TrayEvent = new TrayEvent( type );
			return e;
		}
	}
}