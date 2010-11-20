package api.events.tray.showBalloon
{
	import flash.events.Event;
	
	import api.events.tray.TrayEvent;

	public class ShowBalloonEvent extends TrayEvent
	{
		public static const COMPLETE:String = "complete";
		public static const MISSING_TEXT:String = "missingText";
		
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