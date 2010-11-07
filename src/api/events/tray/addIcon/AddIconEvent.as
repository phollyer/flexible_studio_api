package api.events.tray.addIcon
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class AddIconEvent extends TrayEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function AddIconEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : AddIconEvent = new AddIconEvent( type );
			return e;
		}
	}
}