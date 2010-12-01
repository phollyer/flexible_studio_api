package api.events.win.setDraggable
{
	import flash.events.Event;
	
	import api.events.win.WinEvent;

	public class SetDraggableEvent extends WinEvent
	{
		
		public function SetDraggableEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : SetDraggableEvent = new SetDraggableEvent( type );
			return e;
		}
	}
}