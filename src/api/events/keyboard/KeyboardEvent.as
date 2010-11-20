package api.events.keyboard
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class KeyboardEvent extends SWFStudioEvent
	{
		public function KeyboardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : KeyboardEvent = new KeyboardEvent( type );
			return e;
		}
	}
}