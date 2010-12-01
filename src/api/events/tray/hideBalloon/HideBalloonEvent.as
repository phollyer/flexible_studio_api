package api.events.tray.hideBalloon
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class HideBalloonEvent extends TrayEvent
	{
		
		public function HideBalloonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : HideBalloonEvent = new HideBalloonEvent( type );
			return e;
		}
	}
}