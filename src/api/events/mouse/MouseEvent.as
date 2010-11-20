package api.events.mouse
{
	import flash.events.Event;
	
	import api.events.SWFStudioEvent;

	public class MouseEvent extends SWFStudioEvent
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