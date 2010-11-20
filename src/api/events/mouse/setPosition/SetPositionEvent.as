package api.events.mouse.setPosition
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class SetPositionEvent extends MouseEvent
	{
		
		public function SetPositionEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetPositionEvent = new SetPositionEvent( type );
			return e;
		}
	}
}