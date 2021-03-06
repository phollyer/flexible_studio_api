package api.events.app.quit
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class QuitEvent extends AppEvent 
	{		
		public function QuitEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var newEvent:QuitEvent = new QuitEvent(type);
			return newEvent;
		}
	}
}