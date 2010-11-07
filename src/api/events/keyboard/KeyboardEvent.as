package api.events.keyboard
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class KeyboardEvent extends KernelEvent
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