package api.events.tray.removeIcon
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class RemoveIconEvent extends TrayEvent
	{
		
		public function RemoveIconEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : RemoveIconEvent = new RemoveIconEvent( type );
			return e;
		}
	}
}