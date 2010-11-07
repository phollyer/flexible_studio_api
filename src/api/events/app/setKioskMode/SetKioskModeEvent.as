package api.events.app.setKioskMode
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class SetKioskModeEvent extends AppEvent
	{
		public static const COMPLETE:String = "complete";
		
		public function SetKioskModeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetKioskModeEvent = new SetKioskModeEvent( type );
			return e;
		}
	}
}