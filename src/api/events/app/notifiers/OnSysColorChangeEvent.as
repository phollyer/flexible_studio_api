package api.events.app.notifiers
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class OnSysColorChangeEvent extends AppEvent
	{
		public static const CHANGE:String = "change";
		
		public function OnSysColorChangeEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : OnSysColorChangeEvent = new OnSysColorChangeEvent( type );
			return e;
		}
	}
}