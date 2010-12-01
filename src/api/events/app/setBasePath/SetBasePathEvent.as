package api.events.app.setBasePath
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class SetBasePathEvent extends AppEvent
	{		
		public function SetBasePathEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetBasePathEvent = new SetBasePathEvent( type );
			return e;
		}
	}
}