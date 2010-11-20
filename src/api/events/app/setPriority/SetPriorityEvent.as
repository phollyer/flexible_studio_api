package api.events.app.setPriority
{
	import flash.events.Event;
	
	import api.events.app.AppEvent;

	public class SetPriorityEvent extends AppEvent
	{		
		public function SetPriorityEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPriorityEvent = new SetPriorityEvent( type );
			return e;
		}
	}
}