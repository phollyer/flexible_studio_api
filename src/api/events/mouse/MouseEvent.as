package api.events.mouse
{
	import flash.events.Event;
	
	import api.events.KernelEvent;

	public class MouseEvent extends KernelEvent
	{
		public function MouseEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : MouseEvent = new MouseEvent( type );
			return e;
		}
	}
}