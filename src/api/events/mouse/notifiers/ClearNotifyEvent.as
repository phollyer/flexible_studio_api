package api.events.mouse.notifiers
{
	import flash.events.Event;
	
	import api.events.mouse.MouseEvent;

	public class ClearNotifyEvent extends MouseEvent
	{
		
		public function ClearNotifyEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		override public function clone():Event
		{
			var e : ClearNotifyEvent = new ClearNotifyEvent( type );
			return e;
		}
	}
}