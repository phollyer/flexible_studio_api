package api.events.tray.showBalloon
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class ShowBalloonEvent extends TrayEvent
	{
		
		public function ShowBalloonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ShowBalloonEvent = new ShowBalloonEvent( type );
			return e;
		}
	}
}